/obj/effect/proc_holder/spell/invoked/extract_heart
	name = "Извлечение сердца"
	desc = "Нечестивый ритуал получения сердец в дар Граггару. Работает только на свежих трупах."
	overlay_state = "curse"
	chargedrain = 0
	chargetime = 0
	range = 1
	movement_interrupt = TRUE
	invocation_type = "none"
	associated_skill = /datum/skill/labor/butchering
	miracle = FALSE
	devotion_cost = 0
	sound = 'sound/surgery/organ1.ogg'
	/// Base time, reduced by butchery skill
	var/extraction_time = 15 SECONDS

/obj/effect/proc_holder/spell/invoked/extract_heart/cast(list/targets, mob/living/user)
	var/mob/living/carbon/human/target = targets[1]

	if(!istype(target))
		to_chat(user, "<span class='warning'>Лишь настоящая плоть достойна внимания Граггара!</span>")
		return FALSE

	if(target.stat != DEAD)
		to_chat(user, "<span class='warning'>Слабачишка всё ещё пульсирует жизнью! Граггар требует сперва добить его как следует!</span>")
		return FALSE

	// Calculate actual time based on butchery skill
	var/skill_modifier = 1 - (user.get_skill_level(/datum/skill/labor/butchering) * 0.1) // 10% reduction per skill level
	var/actual_time = max(extraction_time * skill_modifier, 7.5 SECONDS) // Minimum 7.5 seconds

	user.visible_message("<span class='warning'>[user] тянется к груди [target], бессвязно напевая...</span>", \
						"<span class='notice'>Вы начинаете ритуальное извлечение сердца [target].</span>")

	if(!do_after(user, actual_time, target = target))
		to_chat(user, "<span class='warning'>Нечестивый ритуал был прерван! ПОЗОР!</span>")
		return FALSE

	if(target.stat != DEAD)
		to_chat(user, "<span class='warning'>Слабачишка всё ещё пульсирует жизнью! Граггар требует сперва добить его как следует!</span>")
		return FALSE

	var/obj/item/organ/heart/heart = target.getorganslot(ORGAN_SLOT_HEART)
	if(!heart)
		to_chat(user, "<span class='warning'>Только пустая грудь осталась!</span>")
		return FALSE

	heart.Remove(target)
	heart.forceMove(target.drop_location())
	user.put_in_hands(heart)

	target.add_splatter_floor()
	target.adjustBruteLoss(20)

	user.visible_message("<span class='warning'>[user] с рёвом вырывает сердце [target]!</span>", \
						"<span class='red'>Вы преподносите сердце Граггару! Бог посмеивается над этим подношением.</span>")
	user.emote("rage", forced = TRUE)

	return TRUE
