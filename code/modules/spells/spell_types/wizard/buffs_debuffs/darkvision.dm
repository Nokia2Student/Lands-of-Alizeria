/obj/effect/proc_holder/spell/targeted/touch/darkvision
	name = "Ночное зрение"
	desc = "Улучшает ночное зрение цели, к которой вы прикасаетесь, на 15 минут."
	overlay_state = "darkvision"
	clothes_req = FALSE
	drawmessage = "Я готовлюсь даровать Ночное зрение."
	dropmessage = "Я отпускаю свой арканный фокус."
	school = "transmutation"
	recharge_time = 1 MINUTES
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	hand_path = /obj/item/melee/touch_attack/darkvision
	spell_tier = 1
	invocation = "Nox Oculus"
	invocation_type = "whisper"
	hide_charge_effect = TRUE
	xp_gain = TRUE
	cost = 2

/obj/effect/proc_holder/spell/targeted/touch/darkvision/miracle
	cost = 0
	spell_tier = 0
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE

/obj/item/melee/touch_attack/darkvision
	name = "Ночное зрение"
	desc = "Прикоснитесь к существу, чтобы даровать ему Ночное зрение на 15 минут."
	catchphrase = null
	possible_item_intents = list(INTENT_HELP)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "pulling"
	icon_state = "grabbing_greyscale"
	color = "#3FBAFD"

/obj/item/melee/touch_attack/darkvision/attack_self()
	attached_spell.remove_hand()

/obj/item/melee/touch_attack/darkvision/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(isliving(target))
		var/mob/living/spelltarget = target
		if(!do_after(user, 5 SECONDS, target = spelltarget))
			return
		spelltarget.apply_status_effect(/datum/status_effect/buff/darkvision, user.get_skill_level(associated_skill))
		user.stamina_add(80)
		if(spelltarget != user)
			user.visible_message("[user] чертит глиф в воздухе и касается [spelltarget] арканным фокусом.")
		else
			user.visible_message("[user] чертит глиф в воздухе и касается себя арканным фокусом.")
		attached_spell.remove_hand()
	return
