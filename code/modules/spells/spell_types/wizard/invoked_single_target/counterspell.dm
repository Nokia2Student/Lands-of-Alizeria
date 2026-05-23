/obj/effect/proc_holder/spell/invoked/counterspell
	name = "Контрзаклинание"
	desc = "На короткое время подавляет арканную энергию вокруг цели. Либо мешает использовать магию, либо защищает цель от большинства магических воздействий."
	cost = 3
	releasedrain = 35
	chargedrain = 1
	chargetime = 15
	recharge_time = 80 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/wind
	associated_skill = /datum/skill/magic/arcane
	spell_tier = 3 // Full shut down of another mage should be a full mage privilege, imo
	invocation = "Respondeo!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_MEDIUM
	overlay_state = "rune2"

/obj/effect/proc_holder/spell/invoked/counterspell/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_COUNTERCOUNTERSPELL))
			to_chat(user, "<span class='warning'>Они мгновенно отразили моё контрзаклинание! Это на них не подействует!</span>")
			revert_cast()
			return
		ADD_TRAIT(target, TRAIT_SPELLCOCKBLOCK, MAGIC_TRAIT)
		ADD_TRAIT(target, TRAIT_ANTIMAGIC, MAGIC_TRAIT)
		to_chat(target, span_warning("Я чувствую, будто моя связь с Арканой полностью исчезает. Воздух кажется неподвижным..."))
		target.visible_message("Арканная аура [target] угасает.")
		addtimer(CALLBACK(src, PROC_REF(remove_buff), target), wait = 20 SECONDS)
		return TRUE
	

/obj/effect/proc_holder/spell/invoked/counterspell/proc/remove_buff(mob/living/carbon/target)
	REMOVE_TRAIT(target, TRAIT_SPELLCOCKBLOCK, MAGIC_TRAIT)
	REMOVE_TRAIT(target, TRAIT_ANTIMAGIC, MAGIC_TRAIT)
	to_chat(target, span_warning("Я снова чувствую, как арканная связь окутывает меня."))
	target.visible_message("Арканная аура [target], кажется, возвращается.")
