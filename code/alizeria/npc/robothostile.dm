/mob/living/simple_animal/hostile/retaliate/rogue/robot
	icon = 'icons/roguetown/alizeria/robots.dmi'
	name = "blade robot"
	desc = "Древняя машина, которую империя часто использовала для защиты малозначимых объектов. По факту - обычный паук с прикриелённым лезвием для атак."
	icon_state = "blade_alive"
	icon_living = "blade_alive"
	icon_dead = "blade_die"
	gender = NEUTER
	emote_hear = null
	emote_see = list("издает механический звук", "гудит")
	speak_chance = 1
	turns_per_move = 2
	see_in_dark = 6
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/claw)
	attack_verb_continuous = "режет"
	attack_verb_simple = "режет"
	attack_sound = 'sound/blank.ogg'
	faction = list("robots")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 300
	maxHealth = 300
	melee_damage_lower = 15
	melee_damage_upper = 25
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	retreat_distance = 0
	minimum_distance = 0
	food_type = list()
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 8
	STASTR = 10
	STAEND = 10
	STASPD = 10
	defprob = 40
	del_on_deaggro = 44 SECONDS
	retreat_health = 0.3
	food = 0
	dodgetime = 10
	aggressive = 1

	del_on_death = FALSE // Робот оставляет труп для разбора
	rot_type = null // Отсутствие гниения

	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/volf

	var/loot_amount = 1 // Количество шестёрок при разборе
	var/disassembling = FALSE // Флаг процесса разбора
	var/flanking_cooldown = 0 // Кулдаун для маневра позади

/mob/living/simple_animal/hostile/retaliate/rogue/robot/Initialize()
	. = ..()
	AddElement(/datum/element/ai_retaliate)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ai_controller.set_blackboard_key(BB_BASIC_FOODS, food_type)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/bleed(amount = BLOOD_VOLUME_NORMAL)
	// Робот не кровоточит
	return 0

/mob/living/simple_animal/hostile/retaliate/rogue/robot/get_blood_id()
	// Переопределяем - робот не имеет крови вообще
	return null

/mob/living/simple_animal/hostile/retaliate/rogue/robot/death(gibbed)
	visible_message(span_danger("[src] издает пронзительный звук и разваливается на части!"))
	playsound(src, 'sound/alizeria/robots/die.ogg', 100, TRUE)

	..() // Вызываем parent death() из simple_animal

	// Робот остается на карте для разбора (del_on_death = FALSE)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/attack_hand(mob/living/user, params)
	// Если робот мертв и игрок пытается его разобрать
	if(stat == DEAD && !disassembling)
		// Проверяем, что игрок ничего не держит
		if(!user.get_active_held_item())
			// Начинаем процесс разбора
			disassembling = TRUE
			user.visible_message(
				span_notice("[user] начинает разбирать [src]..."),
				span_notice("Я начинаю разбирать [src]...")
			)

			// do_after на 5 секунд
			if(do_after(user, 5 SECONDS, src))
				if(QDELETED(src))
					return

				user.visible_message(
					span_notice("[user] успешно разобрал [src], доставая шестерёнки!"),
					span_notice("Я успешно разобрал [src], достав шестерёнки!")
				)

				// Спаун шестёрок при разборе (1-3 штуки)
				var/turf/disassemble_spot = get_turf(src)
				if(disassemble_spot)
					var/gear_count = rand(1, 2)
					for(var/i in 1 to gear_count)
						new /obj/item/roguegear(disassemble_spot)

				// Удаляем робота после успешного разбора
				qdel(src)
			else
				// Если прервали процесс
				user.visible_message(
					span_warning("[user] прекратил разбирать [src]."),
					span_warning("Я прекратил разбирать [src].")
				)
				disassembling = FALSE
			return
		else
			// Игрок держит что-то
			user.visible_message(
				span_warning("[user] пытается разобрать [src], но у него заняты руки!"),
				span_warning("Мне нужны свободные руки, чтобы разобрать [src]!")
			)
			return

	// Если робот живой - обычная атака
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/robot/UnarmedAttack(atom/A, proximity)
	// Проверяем возможность маневра позади
	if(isliving(A) && target && world.time > flanking_cooldown && prob(65))
		flanking_cooldown = world.time + 8 SECONDS // 8 секунд кулдаун между попытками
		var/mob/living/target_mob = A
		attempt_flank(target_mob)

	..() // Обычная атака

/mob/living/simple_animal/hostile/retaliate/rogue/robot/proc/attempt_flank(mob/living/target)
	var/turf/target_loc = get_turf(target)
	var/turf/my_loc = get_turf(src)

	if(!target_loc || !my_loc)
		return

	// Находим позицию позади цели (противоположная от её взгляда)
	var/flank_dir = turn(target.dir, 180) // Противоположное направление
	var/turf/flank_turf = get_step(target_loc, flank_dir)

	// Проверяем, пуста ли позиция позади
	if(flank_turf && !flank_turf.density && !locate(/mob/living) in flank_turf.contents)
		// Обмениваемся местами с помощью forceMove
		var/turf/temp_loc = my_loc

		src.forceMove(flank_turf)
		target.forceMove(temp_loc)

		// Эффект перемещения
		visible_message(span_danger("[src] издает громкий звук электричества и молниеносно заходит [target] за спину!"))
		playsound(src, 'sound/alizeria/robots/agro1.ogg', 75, TRUE)
	else
		// Если позиция занята, просто издаем звук попытки
		playsound(src, 'sound/alizeria/robots/just2.ogg', 50, TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/Life()
	. = ..()
	if(.)
		// Рандомные звуки робота в боевом режиме
		if(target && !stat)
			if(prob(5))
				playsound(src, 'sound/alizeria/robots/agro1.ogg', 50, TRUE) // Звук атаки
		else if(!stat)
			// Холостые звуки в режиме ожидания
			if(prob(3))
				switch(rand(1, 4))
					if(1)
						playsound(src, 'sound/alizeria/robots/just1.ogg', 50, TRUE) // Бип
					if(2)
						playsound(src, 'sound/alizeria/robots/just2.ogg', 50, TRUE) // Звук электричества
					if(3)
						playsound(src, 'sound/alizeria/robots/just3.ogg', 50, TRUE) // Пинг
					if(4)
						playsound(src, 'sound/alizeria/robots/just4.ogg', 50, TRUE) // Пинг

/mob/living/simple_animal/hostile/retaliate/rogue/robot/get_sound(input)
	switch(input)
		if("aggro")
			return 'sound/alizeria/robots/agro3.ogg' // Звук агрессии
		if("death")
			return 'sound/alizeria/robots/die.ogg' // Звук смерти
		if("idle")
			return 'sound/alizeria/robots/just1.ogg' // Холостой звук

/////////// ЭЛЕКТРО
/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider
	icon = 'icons/roguetown/alizeria/robots.dmi'
	name = "electro spider"
	desc = "Механический паук, созданный инженерами империи. Быстр, но хрупок. От него исходит характерное жужжание электричества."
	icon_state = "spider_alive"
	icon_living = "spider_alive"
	icon_dead = "spider_die"
	gender = NEUTER
	emote_hear = null
	emote_see = list("издает жужжание электричества", "позвякивает")
	speak_chance = 1
	turns_per_move = 0 // Быстрее, чем обычный робот (было 2)
	see_in_dark = 6
	move_to_delay = 1 // Быстрое передвижение
	base_intents = list(/datum/intent/simple/claw)
	attack_verb_continuous = "кусает"
	attack_verb_simple = "кусает"
	attack_sound = 'sound/blank.ogg'
	faction = list("robots")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 30 // Слабый паук (было 300 у обычного робота)
	maxHealth = 30
	melee_damage_lower = 3 // Слабая атака
	melee_damage_upper = 5
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE // Не ломает предметы
	retreat_distance = 0
	minimum_distance = 0
	food_type = list()
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 6
	STASTR = 6
	STAEND = 6
	STASPD = 14 // Высокая скорость
	defprob = 20 // Низкая защита
	del_on_deaggro = 44 SECONDS
	retreat_health = 0.2 // Отступает при 20% здоровья
	food = 0
	dodgetime = 5 // Быстрее уворачивается
	aggressive = 1

	del_on_death = FALSE // Паук исчезает при смерти (не оставляет труп)
	rot_type = null

	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/volf

	var/shock_cooldown = 0 // Кулдаун для электрической атаки
	var/shock_damage = 15 // Урон от удара шокером

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/Initialize()
	. = ..()
	AddElement(/datum/element/ai_retaliate)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ai_controller.set_blackboard_key(BB_BASIC_FOODS, food_type)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/bleed(amount = BLOOD_VOLUME_NORMAL)
	return 0

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/get_blood_id()
	return null

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/death(gibbed)
	visible_message(span_danger("[src] издает пронзительный пищащий звук и взрывается в искрах электричества!"))
	playsound(src, 'sound/alizeria/robots/die.ogg', 100, TRUE)
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/UnarmedAttack(atom/A, proximity)
	// Проверяем возможность электрической атаки
	if(isliving(A) && target && world.time > shock_cooldown && prob(15))
		shock_cooldown = world.time + 6 SECONDS // 6 секунд кулдаун
		var/mob/living/target_mob = A
		attempt_shock_attack(target_mob)

	..() // Обычная атака

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/proc/attempt_shock_attack(mob/living/target)
	visible_message(span_danger("[src] издает громкий звук электричества и наносит удар-шокер!"))
	playsound(src, 'sound/alizeria/robots/agro1.ogg', 75, TRUE)

	// Применяем электрический урон
	if(target.electrocute_act(shock_damage, src))
		// Эффект шока - оглушение и потеря равновесия
		target.emote("painscream")
		target.update_sneak_invis(TRUE)
		target.consider_ambush(always = TRUE)
		if(target.throwing)
			target.throwing.finalize(FALSE)

		// Небольшой throw для драматичности
		var/throwdir = get_dir(src, target)
		if(prob(40))
			target.throw_at(get_step(target, throwdir), 1, 1, src, spin = FALSE)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/Life()
	. = ..()
	if(.)
		// Рандомные звуки паука в боевом режиме
		if(target && !stat)
			if(prob(7))
				playsound(src, 'sound/alizeria/robots/agro1.ogg', 40, TRUE)
		else if(!stat)
			// Жужжание в режиме ожидания
			if(prob(4))
				switch(rand(1, 3))
					if(1)
						playsound(src, 'sound/alizeria/robots/just2.ogg', 40, TRUE)
					if(2)
						playsound(src, 'sound/alizeria/robots/just3.ogg', 40, TRUE)
					if(3)
						playsound(src, 'sound/alizeria/robots/just4.ogg', 40, TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/robot/spider/get_sound(input)
	switch(input)
		if("aggro")
			return 'sound/alizeria/robots/agro1.ogg'
		if("death")
			return 'sound/alizeria/robots/die.ogg'
		if("idle")
			return 'sound/alizeria/robots/just2.ogg'