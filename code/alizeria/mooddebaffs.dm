/datum/mood_event/blood_rain
	description = "<span class='boldwarning'>Дождь из крови... Жуть.</span>\n"
	mood_change = -3


/proc/apply_blood_rain_mood(mob/living/L)
	if(!L || !L.client)
		return

	var/datum/component/mood/mood = L.GetComponent(/datum/component/mood)
	if(!mood)
		return

	// Не создаём дубликат, если уже наложено
	if(mood.mood_events["blood_rain"])
		return

	mood.add_event(null, "blood_rain", /datum/mood_event/blood_rain)


/proc/clear_blood_rain_mood(mob/living/L)
	if(!L || !L.client)
		return

	var/datum/component/mood/mood = L.GetComponent(/datum/component/mood)
	if(!mood)
		return

	mood.clear_event(null, "blood_rain")


/datum/particle_weather/blood_rain_gentle/weather_act(mob/living/L)
	. = ..()
	L.adjust_fire_stacks(-100)
	L.SoakMob(FULL_BODY)
	apply_blood_rain_mood(L)


/datum/particle_weather/blood_rain_gentle/end()
	. = ..()
	for(var/mob/living/player in GLOB.mob_living_list)
		clear_blood_rain_mood(player)


/datum/particle_weather/blood_rain_storm/weather_act(mob/living/L)
	. = ..()
	L.adjust_fire_stacks(-100)
	L.SoakMob(FULL_BODY)
	apply_blood_rain_mood(L)


/datum/particle_weather/blood_rain_storm/end()
	. = ..()
	for(var/mob/living/player in GLOB.mob_living_list)
		clear_blood_rain_mood(player)