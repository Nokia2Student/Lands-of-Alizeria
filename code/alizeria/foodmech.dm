/mob/var
	last_eaten_food = null
	last_eaten_time = 0

/obj/item/reagent_containers/food/snacks/attack(mob/living/M, mob/living/user, def_zone)
	world << "DEBUG: attack() called on [src] by [user]"

	// Проверка на повторную еду
	if(M == user && M.last_eaten_food == src.type)
		var/time_elapsed = world.time - M.last_eaten_time
		if(time_elapsed < 600)
			var/time_remaining = 600 - time_elapsed
			var/seconds_remaining = time_remaining / 10
			to_chat(M, "<span class='warning'>Я только что ел это! Осталось ждать [seconds_remaining] секунд.</span>")
			world << "DEBUG: Food blocked! [src.type] was eaten [time_elapsed] ticks ago"
			return FALSE

	world << "DEBUG: Calling original attack code..."
	var/result = ..()
	world << "DEBUG: Original attack returned [result]"

	// Сохраняем еду после успешного съедания
	if(result && M == user)
		M.last_eaten_food = src.type
		M.last_eaten_time = world.time
		world << "DEBUG: Saved food [src.type] at time [world.time]"

	return result
