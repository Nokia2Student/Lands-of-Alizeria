/turf/open/water/coldwater
	name = "cold water"
	desc = "Freezing cold water that chills you to the bone."
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "together"
	water_level = 2
	slowdown = 3
	wash_in = TRUE
	water_reagent = /datum/reagent/water
	color = "#87CEEB" // Светло-голубой цвет воды

/turf/open/water/coldwater/Entered(atom/movable/AM, atom/oldLoc)
	..()
	if(isliving(AM))
		var/mob/living/L = AM
		if(!istype(oldLoc, /turf/open/water/coldwater))
			L.apply_cold_damage(TRUE)

/turf/open/water/coldwater/Exited(atom/movable/AM, atom/newLoc)
	..()
	if(isliving(AM))
		var/mob/living/L = AM
		L.apply_cold_damage(FALSE)

/mob/living/var/in_cold_water = FALSE
/mob/living/var/cold_water_damage_loop = null
/mob/living/var/cold_water_message_counter = 0

/mob/living/proc/apply_cold_damage(state)
	if(state && !in_cold_water)
		in_cold_water = TRUE
		cold_water_message_counter = 0
		cold_water_damage_loop = addtimer(CALLBACK(src, PROC_REF(cold_damage_tick)), 10, TIMER_STOPPABLE | TIMER_LOOP)
	else if(!state && in_cold_water)
		in_cold_water = FALSE
		cold_water_message_counter = 0
		if(cold_water_damage_loop)
			deltimer(cold_water_damage_loop)
			cold_water_damage_loop = null

/mob/living/proc/cold_damage_tick()
	if(!in_cold_water)
		return

	adjustBruteLoss(15)

	cold_water_message_counter++
	if(cold_water_message_counter >= 3)
		to_chat(src, span_warning("Леденящий холод пронзает мою кожу, а мои ноздри пробивает запах хладагента... С этой водой явно что-то не так."))
		cold_water_message_counter = 0