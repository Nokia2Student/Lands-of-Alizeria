GLOBAL_LIST_EMPTY(alizeria_generators)

/obj/machinery/light/roguestreet
	var/initial_brightness
	var/initial_bulb_power
	var/initial_bulb_colour
	var/off_state_suffix = "0"

/obj/machinery/light/roguestreet/Initialize()
	initial_brightness = brightness
	initial_bulb_power = bulb_power
	initial_bulb_colour = bulb_colour
	. = ..()

/obj/machinery/light/roguestreet/midlamp
	off_state_suffix = "2"

/obj/machinery/light/rogue/alizeria/generator
	name = "generator"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Старенький, но верно работающий генератор. Снабжает энергией уличные фонари и множество иных устройств. Требует изолированный хладагент, либо же уголь для своей работы."
	icon_state = "gen1"
	base_state = "gen"
	density = FALSE
	layer = 2.8
	brightness = 5
	on = FALSE
	crossfire = TRUE
	fueluse = 30 MINUTES
	bulb_colour = "#6addec"
	cookonme = FALSE
	max_integrity = 30
	soundloop = /datum/looping_sound/fireloop
	var/list/linked_cold_lamps = list()
	var/gen_area_name = null

/obj/machinery/light/rogue/alizeria/generator/Initialize()
	. = ..()
	// Регистрируем генератор глобально
	GLOB.alizeria_generators += src
	gen_area_name = get_area_name(src)
	// Найти все холодные лампы roguestreet на всех Z-уровнях
	for(var/obj/machinery/light/roguestreet/cold/lamp in world)
		if(get_area_name(lamp) == gen_area_name)
			linked_cold_lamps += lamp

/obj/machinery/light/rogue/alizeria/generator/Destroy()
	GLOB.alizeria_generators -= src
	return ..()

/obj/machinery/light/rogue/alizeria/generator/process()
	..()
	if(isopenturf(loc))
		var/turf/open/O = loc
		if(IS_WET_OPEN_TURF(O))
			extinguish()

/obj/machinery/light/rogue/alizeria/generator/proc/toggle_linked_lamps(state)
	if(!linked_cold_lamps || !linked_cold_lamps.len)
		return
	for(var/obj/machinery/light/roguestreet/cold/lamp in linked_cold_lamps)
		if(lamp && !QDELETED(lamp))
			if(state) // Зажечь лампы
				lamp.on = TRUE
				lamp.brightness = lamp.initial_brightness
				lamp.bulb_power = lamp.initial_bulb_power
				lamp.bulb_colour = lamp.initial_bulb_colour
				lamp.set_light(l_on = TRUE)
				lamp.icon_state = "[lamp.base_state]1"
				lamp.update()
			else // Потушить лампы
				lamp.on = FALSE
				lamp.brightness = 0
				lamp.bulb_power = 0
				lamp.set_light(l_on = FALSE)
				lamp.icon_state = "[lamp.base_state][lamp.off_state_suffix]"
				lamp.update()

/obj/machinery/light/rogue/alizeria/generator/fire_act(added, maxstacks)
	if(!on && ((fueluse > 0) || (initial(fueluse) == 0)))
		on = TRUE
		update()
		set_light(l_on = TRUE)
		update_icon()
		toggle_linked_lamps(TRUE)
		if(soundloop)
			soundloop.start()
		addtimer(CALLBACK(src, PROC_REF(trigger_weather)), rand(5,20))
		return TRUE

/obj/machinery/light/rogue/alizeria/generator/extinguish(skip_sound = FALSE)
	if(on)
		toggle_linked_lamps(FALSE)
		burn_out(skip_sound)
		on = FALSE
		set_light(l_on = FALSE)
	..()

/obj/machinery/light/rogue/alizeria/generator/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1)
	. = ..()
	if(obj_integrity <= 0)
		toggle_linked_lamps(FALSE)

/obj/machinery/light/rogue/alizeria/generator/onkick(mob/user)
	if(isliving(user) && on)
		var/mob/living/L = user
		L.visible_message("<span class='info'>[L] snuffs [src].</span>")
		extinguish()

/obj/machinery/light/rogue/alizeria/generator/attack_hand(mob/user)
	. = ..()
	if(.)
		return

	if(on)
		var/mob/living/carbon/human/H = user

		if(istype(H))
			H.visible_message("<span class='info'>[H] warms [user.p_their()] hand near the fire.</span>")

			while(do_after(H, 105, target = src) && on)
				if(!H.construct && !H.has_status_effect(/datum/status_effect/buff/healing/campfire))
					H.apply_status_effect(/datum/status_effect/buff/healing/campfire, 1)
					to_chat(H, "<span class='info'>The warmth of the fire comforts me, affording me a short rest.</span>")
					H.add_stress(/datum/stressevent/campfire)
		return TRUE

/obj/machinery/light/roguestreet/cold
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "clamp1"
	base_state = "clamp"
	brightness = 10
	fueluse = 0
	bulb_colour = "#7ab4ff"
	bulb_power = 1
	max_integrity = 0
	pass_flags = LETPASSTHROW
	light_system = STATIC_LIGHT

/obj/machinery/light/roguestreet/cold/Initialize()
	initial_brightness = brightness
	initial_bulb_power = bulb_power
	initial_bulb_colour = bulb_colour
	. = ..()

// Проверка энергии генератора для зависимых устройств

// === ПРОВЕРКА ПИТАНИЯ ГЕНЕРАТОРА ДЛЯ УСТРОЙСТВ ===

/obj/structure/roguemachine/proc/check_generator_power()
	// Проверяем все активные генераторы
	for(var/obj/machinery/light/rogue/alizeria/generator/gen in GLOB.alizeria_generators)
		if(gen && !QDELETED(gen) && gen.on)
			// Если хотя бы один генератор включен, все устройства работают
			return TRUE
	return FALSE

/obj/structure/roguemachine/goldface/public/attack_hand(mob/living/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()

/obj/structure/roguemachine/atm/attack_hand(mob/living/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()

/obj/structure/roguemachine/mail/attack_hand(mob/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()

/obj/structure/roguemachine/stockpile/attack_hand(mob/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()

/obj/structure/roguemachine/headeater/attack_hand(mob/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()

/obj/structure/roguemachine/withdraw/attack_hand(mob/user)
	if(!check_generator_power())
		to_chat(user, span_warning("Без энергии генератора это не работает..."))
		return TRUE
	return ..()