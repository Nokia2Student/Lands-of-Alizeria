/datum/stressevent/bloodrain
	timer = 180 SECONDS
	stressadd = 3
	desc = span_red("Дождь из крови... Жуть.")

/particles/weather/blood_rain
	icon_state             = "drop"
	color                  = "#ff0000"
	position               = generator("box", list(-500,-256,0), list(400,500,0))
	grow			       = list(-0.01,-0.01)
	gravity                = list(0, -10, 0.5)
	drift                  = generator("circle", 0, 1) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // Rain is directional - so don't make it "3D"
	//Weather effects, max values
	maxSpawning            = 250
	minSpawning            = 50
	wind                   = 2
	spin                   = 0 // explicitly set spin to 0 - there is a bug that seems to carry generators over from old particle effects


/datum/particle_weather/blood_rain_gentle
	name = "Rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/blood_rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/rain)
	indoor_weather_sounds = list(/datum/looping_sound/indoor_rain)

	minSeverity = 1
	maxSeverity = 15
	maxSeverityChange = 2
	severitySteps = 5
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_BLOODRAIN
	/// Сохраняем оригинальный цвет для восстановления
	var/old_picked_color

/datum/particle_weather/blood_rain_gentle/start()
	. = ..()
	// Сохраняем текущий цвет и плавно устанавливаем красный
	if(SSoutdoor_effects)
		old_picked_color = SSoutdoor_effects.picked_color
		// Плавно обновляем цвет для всех игроков
		for(var/atom/movable/screen/fullscreen/lighting_backdrop/sunlight/SP in SSoutdoor_effects.sunlighting_planes)
			animate(SP, color = "#cc0000", time = 30, easing = EASE_IN)

/datum/particle_weather/blood_rain_gentle/end()
	. = ..()
	// Восстанавливаем оригинальный цвет
	if(SSoutdoor_effects && old_picked_color)
		for(var/atom/movable/screen/fullscreen/lighting_backdrop/sunlight/SP in SSoutdoor_effects.sunlighting_planes)
			animate(SP, color = old_picked_color, time = 30, easing = EASE_IN)

/datum/particle_weather/blood_rain_gentle/weather_act(mob/living/L)
	L.adjust_fire_stacks(-100)
	L.SoakMob(FULL_BODY)
	// Добавляем стресс-эвент для персонажей на улице
	if(isliving(L) && L.client)
		var/area/A = get_area(L)
		if(A && A.outdoors)
			L.add_stress(/datum/stressevent/bloodrain)

/datum/particle_weather/blood_rain_storm
	name = "Rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/blood_rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/storm)
	indoor_weather_sounds = list(/datum/looping_sound/indoor_rain)

	minSeverity = 4
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_BLOODRAIN
	/// Сохраняем оригинальный цвет для восстановления
	var/old_picked_color

/datum/particle_weather/blood_rain_storm/start()
	. = ..()
	// Сохраняем текущий цвет и плавно устанавливаем красный
	if(SSoutdoor_effects)
		old_picked_color = SSoutdoor_effects.picked_color
		// Плавно обновляем цвет для всех игроков
		for(var/atom/movable/screen/fullscreen/lighting_backdrop/sunlight/SP in SSoutdoor_effects.sunlighting_planes)
			animate(SP, color = "#cc0000", time = 30, easing = EASE_IN)

/datum/particle_weather/blood_rain_storm/end()
	. = ..()
	// Восстанавливаем оригинальный цвет
	if(SSoutdoor_effects && old_picked_color)
		for(var/atom/movable/screen/fullscreen/lighting_backdrop/sunlight/SP in SSoutdoor_effects.sunlighting_planes)
			animate(SP, color = old_picked_color, time = 30, easing = EASE_IN)

//Makes you a bit chilly
/datum/particle_weather/blood_rain_storm/weather_act(mob/living/L)
	L.adjust_fire_stacks(-100)
	L.SoakMob(FULL_BODY)
	// Добавляем стресс-эвент для персонажей на улице
	if(isliving(L) && L.client)
		var/area/A = get_area(L)
		if(A && A.outdoors)
			L.add_stress(/datum/stressevent/bloodrain)
