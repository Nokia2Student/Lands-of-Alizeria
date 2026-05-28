/obj/effect/proc_holder/spell/invoked/leap
	name = "Прыжок"
	desc = "Вы наделяете ноги цели силой, позволяющей совершать огромные прыжки. Цель сможет запрыгивать на этажи выше, но это не спасёт от ран при падении."
	cost = 2
	releasedrain = 35
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 1 MINUTES
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	gesture_required = TRUE // Mobility spell
	spell_tier = 2
	invocation = "Saltus!"
	invocation_type = "whisper"
	hide_charge_effect = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/wind
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "rune5"
	range = 7

/obj/effect/proc_holder/spell/invoked/leap/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		if(HAS_TRAIT(target,TRAIT_ZJUMP))
			to_chat(user, "<span class='warning'>Они уже могут так высоко прыгать!</span>")
			revert_cast()
			return
		ADD_TRAIT(target, TRAIT_ZJUMP, MAGIC_TRAIT)
		to_chat(target, span_warning("Мои ноги чувствуют себя сильнее! Я чувствую, что могу высоко прыгнуть!"))
		addtimer(CALLBACK(src, PROC_REF(remove_buff), target), wait = 20 SECONDS)
		return TRUE
	

/obj/effect/proc_holder/spell/invoked/leap/proc/remove_buff(mob/living/carbon/target)
	REMOVE_TRAIT(target, TRAIT_ZJUMP, MAGIC_TRAIT)
	to_chat(target, span_warning("Мои ноги чувствуют себя заметно слабее."))
	target.Immobilize(5)
