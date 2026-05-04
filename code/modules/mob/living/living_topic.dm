/mob/living/Topic(href, href_list)
	var/observer_privilege = isobserver(usr)
	if(href_list["check_hb"] && (observer_privilege || usr.canUseTopic(src, BE_CLOSE, NO_DEXTERITY)))
		if(!observer_privilege)
			usr.visible_message(span_info("[usr] пытается услышать сердцебиение [src]."))
			if(!do_after(usr, 30, needhand = TRUE, target = src))
				return
		var/list/following_my_heart = check_heartbeat(usr)
		if(following_my_heart)
			to_chat(usr, span_info("[following_my_heart.Join("\n")]"))

	return ..()

/mob/living/proc/check_heartbeat(mob/user)
	var/list/message = list()
	if(stat >= DEAD || HAS_TRAIT(src, TRAIT_FAKEDEATH) || HAS_TRAIT(src, TRAIT_ROTMAN) || HAS_TRAIT(src, TRAIT_HOLLOW_LIFE))
		message += "<B>Сердцебиения нет...</B>"
	else
		message += "<B>Сердце ещё бьётся.</B>"
	var/list/soul_message = soul_examine(user)
	if(length(soul_message))
		message += soul_message
	return message

/mob/living/proc/soul_examine(mob/user)
	var/list/message = list()
	if(stat >= DEAD || HAS_TRAIT(src, TRAIT_FAKEDEATH) || HAS_TRAIT(src, TRAIT_ROTMAN))
		if(suiciding)
			message += "<span class='deadsay'>[p_they(TRUE)] покончил с собой... Ничего уже не поделать..."
		if(HAS_TRAIT(src, TRAIT_DNR))
			message += "<span class='deadsay'>Сердце [p_their(TRUE)] больше никогда не забьётся...</span>"
		if(isobserver(user) || HAS_TRAIT(user, TRAIT_SOUL_EXAMINE))
			if(!key && !get_ghost(FALSE, TRUE))
				message += span_deadsay("Душа [p_their(TRUE)] улетела...")
			else
				message += span_deadsay("[p_they(TRUE)] [p_are()] всё ещё привязан к земле.")
	return message

//Vrell - Moved this here
/mob/living/proc/has_penis()
	return gender == MALE

/mob/living/proc/has_testicles()
	return gender == MALE

/mob/living/proc/has_vagina()
	return gender == FEMALE

/mob/living/proc/has_breasts()
	return gender == FEMALE
