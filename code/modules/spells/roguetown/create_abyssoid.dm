/obj/effect/proc_holder/spell/self/create_abyssoid
	name = "Созвать абиссоида"
	overlay_state = "bloodsteal"
	chargedrain = 0
	chargetime = 0
	range = -1
	movement_interrupt = TRUE
	invocation_type = "none"
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/self/create_abyssoid/cast(mob/living/user)
	var/obj/item/natural/worms/leech/target
	var/list/hand_items = list(user.get_active_held_item(), user.get_inactive_held_item())

	for(var/obj/item/natural/worms/leech/leech in hand_items)
		target = leech
		break

	if(!target)
		to_chat(user, span_warning("Вы должны держать пиявку в руках, чтобы преобразить её!"))
		return FALSE

	if(istype(target, /obj/item/natural/worms/leech/abyssoid))
		to_chat(user, span_warning("Эта пиявка уже благословлена Абиссором!"))
		return FALSE

	if(user.blood_volume < BLOOD_VOLUME_BAD)
		to_chat(user, span_warning("У вас недостаточно крови для жертвоприношения!"))
		return FALSE

	user.visible_message(span_warning("[user] начинает странно бормотать над [target]..."), \
						span_notice("Вы начинаете ритуал преображения, поднося свою кровь Абиссору."))

	if(!do_after(user, 10 SECONDS, target = user))
		to_chat(user, span_warning("Ритуал был прерван!"))
		return FALSE

	if(!(target in hand_items))
		to_chat(user, span_warning("Вы должны продолжать держать пиявку во время ритуала!"))
		return FALSE

	if(user.blood_volume < BLOOD_VOLUME_BAD)
		to_chat(user, span_warning("У вас недостаточно крови для завершения ритуала!"))
		return FALSE

	user.blood_volume = max(user.blood_volume - 70, 0)
	var/obj/item/natural/worms/leech/abyssoid/new_leech = new(user.drop_location())
	qdel(target)
	user.put_in_hands(new_leech)

	user.visible_message(span_warning("[user] завершает ритуал, преображая пиявку!"), \
						span_red("Пиявка превращается в святую абиссоидную пиявку!"))
	SEND_SIGNAL(user, COMSIG_ABYSSOID_CREATED)

	return TRUE
