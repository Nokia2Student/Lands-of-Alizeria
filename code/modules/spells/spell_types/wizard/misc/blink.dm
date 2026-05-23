/obj/effect/proc_holder/spell/invoked/blink
	name = "Телепортация"
	desc = "Телепортирует в выбранное место в пределах вашего поля зрения. Дальность ограничена 5 тайлами. Работает только на одной плоскости с заклинателем."
	school = "conjuration"
	cost = 3
	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	recharge_time = 10 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	gesture_required = TRUE // Mobility spell
	spell_tier = 2
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "rune6"
	xp_gain = TRUE
	invocation = "Nictare Teleporto!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW
	var/max_range = 5
	var/phase = /obj/effect/temp_visual/blink

/obj/effect/temp_visual/blink
	icon = 'icons/effects/effects.dmi'
	icon_state = "hierophant_blast"
	name = "магия телепортации"
	desc = "Прочь с дороги!"
	randomdir = FALSE
	duration = 4 SECONDS
	layer = MASSIVE_OBJ_LAYER
	light_outer_range = 2
	light_color = COLOR_PALE_PURPLE_GRAY

/obj/effect/temp_visual/blink/Initialize(mapload, new_caster)
	. = ..()
	var/turf/src_turf = get_turf(src)
	playsound(src_turf,'sound/magic/blink.ogg', 65, TRUE, -5)

/obj/effect/proc_holder/spell/invoked/blink/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
	var/turf/start = get_turf(user)
	
	if(!T)
		to_chat(user, span_warning("Неверная цель!"))
		revert_cast()
		return

	if(T.teleport_restricted == TRUE)
		to_chat(user, span_warning("Я не могу телепортироваться сюда!"))

	if(T.z != start.z)
		to_chat(user, span_warning("Я могу телепортироваться только на одной плоскости!"))

		revert_cast()
		return
	
	if(istransparentturf(T))
		to_chat(user, span_warning("Я не могу телепортироваться в открытое пространство!"))
		revert_cast()
		return

	if(T.density)
		to_chat(user, span_warning("Я не могу телепортироваться в стену!"))
		revert_cast()
		return

	// Check range limit
	var/distance = get_dist(start, T)
	if(distance > max_range)
		to_chat(user, span_warning("Это место слишком далеко! Я могу телепортироваться максимум на [max_range] тайлов."))
		revert_cast()
		return
	
	// Display a more obvious preparation message
	user.visible_message(span_warning("<b>Тело [user] начинает мерцать арканной энергией, готовясь к скачку!</b>"), 
						span_notice("<b>Я фокусирую арканную энергию, готовясь к телепортации сквозь пространство!</b>"))
		
	// Check if there's a wall in the way, but exclude the target turf
	var/list/turf_list = getline(start, T)
	// Remove the last turf (target location) from the check
	if(length(turf_list) > 0)
		turf_list.len--
	
	for(var/turf/turf in turf_list)
		if(turf.density)
			to_chat(user, span_warning("Я не могу телепортироваться сквозь стены!"))
			revert_cast()
			return
			
	// Check for doors and bars in the path
	for(var/turf/traversal_turf in turf_list)
		// Check for mineral doors
		for(var/obj/structure/mineral_door/door in (traversal_turf.contents + T.contents))
			if(door.density)
				to_chat(user, span_warning("Я не могу телепортироваться сквозь двери!"))
				revert_cast()
				return
				
		// Check for windows
		for(var/obj/structure/roguewindow/window in (traversal_turf.contents + T.contents))
			if(window.density && !window.climbable)
				to_chat(user, span_warning("Я не могу телепортироваться сквозь окна!"))
				revert_cast()
				return
				
		// Check for bars
		for(var/obj/structure/bars/bars in (traversal_turf.contents + T.contents))
			if(bars.density)
				to_chat(user, span_warning("Я не могу телепортироваться сквозь решётки!"))
				revert_cast()
				return

		// Check for gates
		for (var/obj/structure/gate/gate in (traversal_turf.contents + T.contents))
			if(gate.density)
				to_chat(user, span_warning("Я не могу телепортироваться сквозь ворота!"))
				revert_cast()
				return

	var/obj/spot_one = new phase(start, user.dir)
	var/obj/spot_two = new phase(T, user.dir)

	spot_one.Beam(spot_two, "purple_lightning", time = 1.5 SECONDS)
	playsound(T, 'sound/magic/blink.ogg', 25, TRUE)

	if(user.buckled) // don't stay remote-buckled to the guillotine/pillory
		user.buckled.unbuckle_mob(user, TRUE)
	do_teleport(user, T, channel = TELEPORT_CHANNEL_MAGIC)
	
	user.visible_message(span_danger("<b>[user] исчезает в загадочной фиолетовой вспышке!</b>"), span_notice("<b>Я телепортируюсь сквозь пространство в мгновение ока!</b>"))
	return TRUE
