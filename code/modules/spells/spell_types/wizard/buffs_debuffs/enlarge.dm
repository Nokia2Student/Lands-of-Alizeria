/obj/effect/proc_holder/spell/invoked/enlarge
	name = "Увеличение"
	desc = "На время увеличивает вашу цель до огромной версии себя, способной выламывать двери. Не работает на тех, кто уже большой."
	cost = 2
	releasedrain = 35
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	spell_tier = 2
	invocation = "Dilatare!"
	invocation_type = "shout"
	chargedloop = /datum/looping_sound/wind
	associated_skill = /datum/skill/magic/arcane
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	overlay_state = "enlarge"
	range = 7

/obj/effect/proc_holder/spell/invoked/enlarge/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		if(HAS_TRAIT(target,TRAIT_BIGGUY))
			to_chat(user, "<span class='warning'>Они слишком большие, чтобы их увеличить!</span>")
			revert_cast()
			return
		ADD_TRAIT(target, TRAIT_BIGGUY, MAGIC_TRAIT)
		ADD_TRAIT(target, TRAIT_GIANT_WEAPON_WIELDER, MAGIC_TRAIT)
		target.transform = target.transform.Scale(1.25, 1.25)
		target.transform = target.transform.Translate(0, (0.25 * 16))
		target.update_transform()
		to_chat(target, span_warning("Я чувствую себя выше обычного и могу пробежать сквозь дверь!"))
		target.visible_message("Тело [target] увеличивается в размерах!")
		addtimer(CALLBACK(src, PROC_REF(remove_buff), target), wait = 60 SECONDS)
		return TRUE
	

/obj/effect/proc_holder/spell/invoked/enlarge/proc/remove_buff(mob/living/carbon/target)
	REMOVE_TRAIT(target, TRAIT_BIGGUY, MAGIC_TRAIT)
	REMOVE_TRAIT(target, TRAIT_GIANT_WEAPON_WIELDER, MAGIC_TRAIT)
	target.transform = target.transform.Scale(1/1.25, 1/1.25)
	target.transform = target.transform.Translate(0, -(0.25 * 16))
	target.update_transform()
	to_chat(target, span_warning("Внезапно я чувствую себя меньше."))
	target.visible_message("Тело [target] быстро сжимается!")
