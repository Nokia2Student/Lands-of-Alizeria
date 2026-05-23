//Cold system tracking for human mobs

/mob/living/carbon/human
	var/datum/cold_tracker/cold_tracker

/mob/living/carbon/human/Initialize()
	. = ..()
	cold_tracker = new(src)

/mob/living/carbon/human/proc/is_in_water()
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	return T.type == /turf/open/water

/mob/living/carbon/human/Destroy()
	if(cold_tracker)
		qdel(cold_tracker)
	. = ..()

//Cold tracker datum
/datum/cold_tracker
	var/mob/living/carbon/human/owner
	var/cold_counter = 0
	var/in_cold_zone = FALSE
	var/current_cold_level = 0
	var/list/equipped_warming_items = list()
	var/last_processed = 0

/datum/cold_tracker/New(mob/living/carbon/human/H)
	owner = H
	last_processed = world.time
	START_PROCESSING(SSfastprocess, src)

/datum/cold_tracker/process()
	if(!owner || QDELETED(owner))
		return qdel(src)

	var/area/current_area = get_area(owner)
	if(!current_area)
		return

	//Рассчитываем прошедшее время в секундах (1 мировая единица времени = 0.1 секунды)
	var/time_delta = (world.time - last_processed) / 10
	last_processed = world.time

	if(current_area.cold_system)
		process_cold_accumulation(time_delta)
	else
		process_cold_recovery(time_delta)

	//Check for all heat sources and apply warming
	var/heat_reduction = check_all_heat_sources()
	if(heat_reduction > 0)
		cold_counter = max(0, cold_counter - (heat_reduction * time_delta))

	update_cold_status()

/datum/cold_tracker/proc/process_cold_accumulation(time_delta)
	//Без одежды: 300 очков за 10 минут (600 секунд) = 0.5 очка/сек
	//С полной одеждой (90% защиты): 0.5 * (1 - 0.9 * 0.333) = 0.5 * 0.7 = 0.35 очка/сек
	//Нужна 30 минут с полной защитой = 0.1666 очка/сек
	//Коэффициент: 0.1666 / 0.35 ≈ 0.476, используем 0.333 для более мягкого эффекта

	var/accumulation_rate = 0.5  //очков в секунду

	//Double in water
	if(owner.is_in_water())
		accumulation_rate *= 2

	//Clothing protection (10% per item, max 90%)
	var/protection = calculate_clothing_protection()
	accumulation_rate = accumulation_rate * (1 - protection * 0.333)

	//Heat source nearby reduces by 50%
	if(check_heat_sources())
		accumulation_rate *= 0.5

	cold_counter += accumulation_rate * time_delta

/datum/cold_tracker/proc/process_cold_recovery(time_delta)
	//Без источника тепла: снижение на 1 очко в секунду
	if(cold_counter > 0)
		cold_counter = max(0, cold_counter - (1 * time_delta))

/datum/cold_tracker/proc/calculate_clothing_protection()
	var/mob/living/carbon/human/H = owner
	if(!H)
		return 0

	var/protection = 0
	var/list/clothing_slots = list(
		"head" = H.head,
		"mask" = H.wear_mask,
		"cloak" = H.cloak,
		"armor" = H.wear_armor,
		"wrists" = H.wear_wrists,
		"shirt" = H.wear_shirt,
		"gloves" = H.gloves,
		"pants" = H.wear_pants,
		"shoes" = H.shoes
	)

	var/list/excluded_items = list(
		/obj/item/storage/keyring,
		/obj/item/rope,
		/obj/item/rope/chain
	)

	for(var/slot_name in clothing_slots)
		var/item = clothing_slots[slot_name]
		if(item)
			//Skip excluded items
			var/is_excluded = FALSE
			for(var/excluded_type in excluded_items)
				if(istype(item, excluded_type))
					is_excluded = TRUE
					break

			if(is_excluded)
				continue

			//Check if item is new (not previously equipped)
			if(!(item in equipped_warming_items))
				equipped_warming_items += item
				//Show message to player
				var/item_name = item:name ? item:name : "Предмет"
				to_chat(H, span_notice("[item_name] начинает меня немного согревать..."))
			protection += 0.1

	//Remove items that are no longer equipped
	for(var/item in equipped_warming_items)
		var/is_still_equipped = FALSE
		for(var/slot_name in clothing_slots)
			if(clothing_slots[slot_name] == item)
				is_still_equipped = TRUE
				break
		if(!is_still_equipped)
			equipped_warming_items -= item
			var/item_name = item:name ? item:name : "Предмет"
			to_chat(H, span_warning("[item_name] больше не согревает меня..."))

	return min(protection, 0.9)

/datum/cold_tracker/proc/check_heat_sources()
	var/turf/T = get_turf(owner)
	if(!T)
		return FALSE

	for(var/turf/adjacent in RANGE_TURFS(1, T))
		if(locate(/obj/machinery/light/rogue/campfire) in adjacent)
			return TRUE
		if(locate(/obj/machinery/light/rogue) in adjacent)
			return TRUE

	return FALSE

/datum/cold_tracker/proc/check_all_heat_sources()
	if(!owner)
		return 0

	var/turf/T = get_turf(owner)
	if(!T)
		return 0

	//Снижение с 300 до 100 очков (200 очков) за 1,5 минут (90 секунд) = 2.22 очка за сек
	var/total_heat_reduction = 0

	//Check if inside building (indoors)
	var/area/current_area = get_area(owner)
	if(current_area && istype(current_area, /area/rogue/indoors))
		total_heat_reduction += 2.22

	//Radius 1 - campfires and small heat sources
	for(var/turf/adjacent in RANGE_TURFS(1, T))
		for(var/obj/machinery/light/heat_obj in adjacent)
			if(is_heat_source_lit(heat_obj))
				if(istype(heat_obj, /obj/machinery/light/rogue/campfire/densefire) || \
				   istype(heat_obj, /obj/machinery/light/rogue/campfire/longlived) || \
				   istype(heat_obj, /obj/machinery/light/rogue/campfire) || \
				   istype(heat_obj, /obj/machinery/light/rogue/hearth) || \
				   istype(heat_obj, /obj/machinery/light/rogue/torchholder) || \
				   istype(heat_obj, /obj/machinery/light/rogue/wallfire/candle))
					total_heat_reduction += 1.5

	//Radius 2 - fire bowls and hearths
	for(var/turf/adjacent in RANGE_TURFS(2, T))
		for(var/obj/machinery/light/heat_obj in adjacent)
			if(is_heat_source_lit(heat_obj))
				if(istype(heat_obj, /obj/machinery/light/rogue/firebowl) || \
				   istype(heat_obj, /obj/machinery/light/rogue/hearth))
					//Avoid double counting radius 1 hearths
					if(!get_dist(T, get_turf(heat_obj)) <= 1)
						total_heat_reduction += 0.74

	//Radius 5 - ovens and wall fires
	for(var/turf/adjacent in RANGE_TURFS(5, T))
		for(var/obj/machinery/light/heat_obj in adjacent)
			if(is_heat_source_lit(heat_obj))
				if(istype(heat_obj, /obj/machinery/light/rogue/oven) || \
				   istype(heat_obj, /obj/machinery/light/rogue/wallfire))
					//Avoid double counting closer sources
					if(!get_dist(T, get_turf(heat_obj)) <= 2)
						total_heat_reduction += 0.22

	return total_heat_reduction  //возвращаем очков в СЕКУНДУ

/datum/cold_tracker/proc/is_heat_source_lit(obj/machinery/light/heat_obj)
	if(!heat_obj)
		return FALSE

	//Check if the light source is on (lit)
	if(heat_obj.on)
		return TRUE

	return FALSE

/datum/cold_tracker/proc/update_cold_status()
	if(!owner)
		return

	var/new_cold_level = 0

	//Determine cold level based on counter
	if(cold_counter >= 300)
		new_cold_level = 3
	else if(cold_counter >= 200)
		new_cold_level = 2
	else if(cold_counter >= 100)
		new_cold_level = 1

	//Only apply effects if cold level changed
	if(new_cold_level == current_cold_level)
		return

	//Clear old effects
	owner.remove_status_effect(/datum/status_effect/debuff/cold_1)
	owner.remove_status_effect(/datum/status_effect/debuff/cold_2)
	owner.remove_status_effect(/datum/status_effect/debuff/cold_3)

	//Remove all cold HUD overlays
	if(owner.client)
		owner.client.screen -= /atom/movable/screen/fullscreen/cold

	current_cold_level = new_cold_level

	//Apply new effect and HUD based on level
	switch(new_cold_level)
		if(1)
			owner.apply_status_effect(/datum/status_effect/debuff/cold_1)
			add_cold_hud(/atom/movable/screen/fullscreen/cold/level_1)
		if(2)
			owner.apply_status_effect(/datum/status_effect/debuff/cold_2)
			add_cold_hud(/atom/movable/screen/fullscreen/cold/level_2)
		if(3)
			owner.apply_status_effect(/datum/status_effect/debuff/cold_3)
			add_cold_hud(/atom/movable/screen/fullscreen/cold/level_3)

/datum/cold_tracker/proc/add_cold_hud(hud_type)
	if(!owner || !owner.client)
		return

	//Remove old cold HUD
	owner.client.screen -= /atom/movable/screen/fullscreen/cold

	if(hud_type)
		var/atom/movable/screen/fullscreen/cold/hud = new hud_type(owner.client)
		owner.client.screen += hud

/atom/movable/screen/fullscreen/cold
	icon = 'icons/mob/screen_full.dmi'
	screen_loc = "CENTER-7,CENTER-7"
	layer = FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	view = 7

/atom/movable/screen/fullscreen/cold/New(client/C)
	. = ..()
	animate(src, alpha = 255, time = 30)

/atom/movable/screen/fullscreen/cold/level_1
	icon_state = "coldhud1"
	layer = CRIT_LAYER

/atom/movable/screen/fullscreen/cold/level_2
	icon_state = "coldhud2"
	layer = CRIT_LAYER

/atom/movable/screen/fullscreen/cold/level_3
	icon_state = "coldhud3"
	layer = CRIT_LAYER