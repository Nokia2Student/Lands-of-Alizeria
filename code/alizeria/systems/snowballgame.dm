/obj/item/snowball
	name = "снежок"
	desc = "Комок плотно упакованного снега. Готов к броску!"
	icon = 'icons/roguetown/alizeria/items.dmi'
	icon_state = "snowball"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON
	throw_speed = 3
	throw_range = 7
	force = 0

/obj/item/snowball/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback)
	if(!..())
		return

/obj/item/snowball/throw_impact(atom/hit_atom, datum/thrownthing/throwingdata)
	. = ..()
	var/mob/living/thrower = throwingdata.thrower

	if(ismob(hit_atom))
		var/mob/living/hit_mob = hit_atom

		// Проверяем, что попали в живого
		if(isliving(hit_mob) && isliving(thrower))
			// Звук попадания по игроку
			playsound(hit_mob, 'sound/alizeria/snowball_hit.ogg', 50, TRUE)

			// Визуальное сообщение кинувшему
			to_chat(thrower, span_notice("Снежок попал в [hit_mob]!"))

			// Визуальное сообщение попаданному
			to_chat(hit_mob, span_warning("В тебя попал снежок от [thrower]!"))

			// Добавляем стресс-событие кинувшему
			if(istype(thrower, /mob/living/carbon/human))
				var/mob/living/carbon/human/H_thrower = thrower
				H_thrower.add_stress(/datum/stressevent/snowball_hit_success)

			// Добавляем стресс-событие попаданному
			if(istype(hit_mob, /mob/living/carbon/human))
				var/mob/living/carbon/human/H_hit = hit_mob
				H_hit.add_stress(/datum/stressevent/snowball_hit_taken)

	// Разбиваем снежок в любом случае
	qdel(src)

/obj/item/snowball_handful
	name = "горсть снега"
	desc = "Простая горсть снега. Можно слепить из неё снежок."
	icon = 'icons/roguetown/alizeria/items.dmi'
	icon_state = "snow"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON

/obj/item/snowball_handful/attack_self(mob/user)
	if(user.stat != CONSCIOUS)
		return

	to_chat(user, span_notice("Я начинаю лепить снежок..."))
	user.visible_message(span_info("[user] начинает лепить снежок из снега."))
	playsound(user.loc, 'sound/alizeria/snowball_pack.ogg', 50, TRUE)

	if(do_after(user, 3 SECONDS, target = src))
		to_chat(user, span_notice("Я слепил снежок!"))
		user.visible_message(span_info("[user] слепил снежок."))

		// Заменяем горсть на снежок
		var/obj/item/snowball/snowball = new(user.loc)
		qdel(src)
		user.put_in_hands(snowball)

/turf/open/floor/rogue/snow/attack_right(mob/user)
	if(user.stat != CONSCIOUS)
		return

	// Проверяем, что у игрока есть свободная рука
	if(user.held_items.len && !isnull(user.held_items[user.active_hand_index]))
		to_chat(user, span_warning("Моя рука занята!"))
		return

	to_chat(user, span_notice("Я собираю горсть снега..."))

	// Создаём горсть снега
	var/obj/item/snowball_handful/handful = new(user.loc)
	user.put_in_hands(handful)
	to_chat(user, span_notice("Я взял горсть снега."))

/datum/stressevent/snowball_hit_success
	desc = "<span class='nicegreen'>Я попал снежком! Ура!</span>\n"
	stressadd = -3
	timer = 3 MINUTES

/datum/stressevent/snowball_hit_taken
	desc = "<span class='warning'>В меня попали снежком! Вот чёрт...</span>\n"
	stressadd = 3
	timer = 3 MINUTES