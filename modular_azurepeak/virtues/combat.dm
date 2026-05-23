// Arcyne Potential now gives 3 Spellpoints instead of 6 spellpoints so it is less of a "must take" for caster.
/datum/virtue/combat/magical_potential
	name = "Магический потенциал"
	desc = "Я талантлив в магическом деле, что расширяет мои способности к её изучению. Благодаря этому я стал умнее."
	custom_text = "Классы, обладающие боевым навыком (ношение средней / тяжёлой брони, эксперт по уклонению или устойчивость к критическим ударам), получают только 'престидижитацию'. Все остальные получают +3 очка заклинаний и потенциал к Магии Т1."
	added_skills = list(list(/datum/skill/magic/arcane, 1, 6))

/datum/virtue/combat/magical_potential/apply_to_human(mob/living/carbon/human/recipient)
	// Always grant prestidigitation if they don't have it, don't care about the skill level
	if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
		recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

	// Check for combat traits
	if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT) && !HAS_TRAIT(recipient, TRAIT_CRITICAL_RESISTANCE))
		// No combat traits: grant spellpoints and arcane tier
		recipient.mind?.adjust_spellpoints(3)
		ADD_TRAIT(recipient, TRAIT_ARCYNE_T1, TRAIT_GENERIC)

/datum/virtue/combat/devotee/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind)
		return
	if (!recipient.devotion)
		// Only give non-devotionists orison... and T0 for some reason (Bad ideas are fun!)
		var/datum/devotion/new_faith = new /datum/devotion(recipient, recipient.patron)
		new_faith.grant_miracles(recipient, cleric_tier = CLERIC_T0, passive_gain = FALSE, devotion_limit = (CLERIC_REQ_1 - 20))	//Capped to T0 miracles.
	else
		// for devotionists, give them an amount of passive devo gain.
		var/datum/devotion/our_faith = recipient.devotion
		our_faith.passive_devotion_gain += CLERIC_REGEN_DEVOTEE
		START_PROCESSING(SSobj, our_faith)
	switch(recipient.patron?.type)
		if(/datum/patron/divine/astrata)
			recipient.mind?.special_items["Astrata Psycross"] = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/divine/abyssor)
			recipient.mind?.special_items["Abyssor Psycross"] = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			recipient.mind?.special_items["Dendor Psycross"] = /obj/item/clothing/neck/roguetown/psicross/dendor
		if(/datum/patron/divine/necra)
			recipient.mind?.special_items["Necra Psycross"] = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/pestra)
			recipient.mind?.special_items["Pestra Psycross"] = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/eora)
			recipient.mind?.special_items["Eora Psycross"] = /obj/item/clothing/neck/roguetown/psicross/eora
		if(/datum/patron/divine/xylix)
			recipient.mind?.special_items["Xylix Psycross"] = /obj/item/clothing/neck/roguetown/psicross/xylix
		if(/datum/patron/divine/noc)
			recipient.mind?.special_items["Noc Psycross"] = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/ravox)
			recipient.mind?.special_items["Ravox Psycross"] =/obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			recipient.mind?.special_items["Malum Psycross"] = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/old_god)
			ADD_TRAIT(recipient, TRAIT_PSYDONITE, TRAIT_GENERIC)
			recipient.mind?.special_items["Psydon Psycross"] = /obj/item/clothing/neck/roguetown/psicross

/datum/virtue/combat/duelist
	name = "Ученик дуэлянта"
	desc = "Я тренировался под руководством весьма искусного дуэлянта. С тех времён у меня осталась рапира."
	custom_text = "+1 к мечам и ножам, повышение уровня до подмастерья, минимум ученика."
	added_stashed_items = list("Duelist's Rapier" = /obj/item/rogueweapon/sword/rapier)

/datum/virtue/combat/duelist/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.get_skill_level(/datum/skill/combat/swords) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)
	if(recipient.get_skill_level(/datum/skill/combat/knives) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)

/datum/virtue/combat/executioner
	name = "Ученик тюремщика"
	desc = "Некоторое время назад я собирался стать тюремщиком, и один из них научил меня этому ремеслу. На случай необходимости у меня припрятан топор."
	custom_text = "+1 к топорам и хлыстам/цепам, повышение уровня до подмастерья, минимум ученика."
	added_stashed_items = list("Iron Axe" = /obj/item/rogueweapon/stoneaxe/woodcut)

/datum/virtue/combat/executioner/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.get_skill_level(/datum/skill/combat/whipsflails) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)
	if(recipient.get_skill_level(/datum/skill/combat/axes) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)

/datum/virtue/combat/militia
	name = "Ополченец"
	desc = "Я проходил подготовку в местном гарнизоне на случай, если меня когда-нибудь призовут сражаться за моего лорда. У меня припрятаны копье и праща на случай, если меня призовут к оружию."
	custom_text = "+1 к булавам, пращам и древковому оружию, повышение уровня до подмастерья, минимум ученика."
	added_stashed_items = list("Spear" = /obj/item/rogueweapon/spear, "Sling" = /obj/item/gun/ballistic/revolver/grenadelauncher/sling, "Bullet Pouch" = /obj/item/quiver/sling)

/datum/virtue/combat/militia/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.get_skill_level(/datum/skill/combat/polearms) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)
	if(recipient.get_skill_level(/datum/skill/combat/maces) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)
	if(recipient.get_skill_level(/datum/skill/combat/slings) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/slings, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/slings, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)

/datum/virtue/combat/brawler
	name = "Ученик бойца"
	desc = "Я тренировался под руководством опытного бойца, и у меня есть некоторый опыт борьбы на кулаках."
	custom_text = "+1 к рукопашному бою и борьбе, повышение уровня до подмастерья, минимум ученика."
	added_stashed_items = list("Katar" = /obj/item/rogueweapon/katar)

/datum/virtue/combat/brawler/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.get_skill_level(/datum/skill/combat/unarmed) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)
	if(recipient.get_skill_level(/datum/skill/combat/wrestling) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		recipient.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, silent = TRUE)


/datum/virtue/combat/bowman
	name = "Стрелок"
	desc = "Я с юных лет увлекаюсь стрельбой из лука и всегда держу при себе запасной лук и колчан."
	custom_text = "+1 к лукам, повышение уровня до подмастерья, минимум ученика."
	added_stashed_items = list("Recurve Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
								"Quiver (Arrows)" = /obj/item/quiver/arrows
	)

/datum/virtue/combat/bowman/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.get_skill_level(/datum/skill/combat/bows) < SKILL_LEVEL_APPRENTICE)
		recipient.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/bows, 1, 3))
/*/datum/virtue/combat/tavern_brawler
	name = "Tavern Brawler"
	desc = "I've never met a problem my fists couldn't solve."
	added_traits = list(TRAIT_CIVILIZEDBARBARIAN)*/

/datum/virtue/combat/guarded
	name = "Бережённый"
	desc = "Я долго держал в секрете свои истинные способности и пороки. Иногда обманчивая слабость может спасти жизнь."
	added_traits = list(TRAIT_DECEIVING_MEEKNESS)

/*/datum/virtue/combat/impervious
	name = "Impervious"
	desc = "I've spent years shoring up my weakspots, and have become difficult to wound with critical blows."
	added_traits = list(TRAIT_CRITICAL_RESISTANCE)*/

/datum/virtue/combat/rotcured
	name = "Живой мертвец"
	desc = "Когда-то я умер в ледяных землях и стал очередным живым мертвецом. Однако мне повезло и по какой-то причине мой разум остался нетронутым."
	custom_text = "Окрашивает ваше тело в отчетливый белый цвет."
	// below is functionally equivalent to dying and being resurrected via astrata T4 - yep, this is what it gives you.
	added_traits = list(TRAIT_EASYDISMEMBER, TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE, TRAIT_ZOMBIE_IMMUNE, TRAIT_ROTMAN, TRAIT_SILVER_WEAK)

/datum/virtue/combat/rotcured/apply_to_human(mob/living/carbon/human/recipient)
	recipient.update_body() // applies the rot skin tone stuff
	recipient.dna.species.soundpack_m = new /datum/voicepack/male/rotman()
	recipient.dna.species.soundpack_f = new /datum/voicepack/female/rotman()

/datum/virtue/combat/dualwielder
	name = "Владелец двух рук"
	desc = "Я был удостоен знания о том, как владеть двумя видами оружия одновременно."
	added_traits = list(TRAIT_DUALWIELDER)

/datum/virtue/combat/sharp
	name = "Страж разума"
	desc = "То ли из-за того, что у меня был надоедливый брат, который постоянно тыкал в меня палкой, то ли из-за долгих лет учебы и наблюдений, я стал искусным в парировании и уклонении от более сильных противников, изучая их движения."
	added_traits = list(TRAIT_SENTINELOFWITS)

/datum/virtue/combat/combat_aware
	name = "На стороже"
	desc = "Движение запястья противника. Звук рвущейся кольчуги. Отчаянный вздох, когда выносливость противника иссякает. Все это становится более понятным благодаря моей интуиции или опыту."
	custom_text = "Отображает гораздо больше информации о боевых действиях с помощью плавающего текста. Есть переключатель."
	added_traits = list(TRAIT_COMBAT_AWARE)

/datum/virtue/combat/combat_aware/apply_to_human(mob/living/carbon/human/recipient)
	recipient.verbs += /mob/living/carbon/human/proc/togglecombatawareness

/datum/virtue/combat/hollow_life
	name = "Бродячая душа"
	desc = "Из-за событий прошлого я чувствую себя опустошенным, практически лишенным какой-либо жизни. Мое сердце не бьется, и я не дышу. На данный момент я ближе к мертвым, чем к живым."
	added_traits = list(TRAIT_HOLLOW_LIFE, TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE, TRAIT_ZOMBIE_IMMUNE, TRAIT_NOHUNGER)
	custom_text = span_bloody("CON IS ADJUSTED BY -2, SILVER WEAKNESS AND TENNITE MIRACLES SET YOU ON FIRE")

/datum/virtue/combat/hollow_life/apply_to_human(mob/living/carbon/human/recipient)
	recipient.change_stat(STATKEY_CON, -2)
	recipient.dna.species.soundpack_m = new /datum/voicepack/hollow()
	recipient.dna.species.soundpack_f = new /datum/voicepack/hollow_fem()
	if(recipient.charflaw)
		if(recipient.charflaw.type == /datum/charflaw/damned)
			to_chat(recipient, "Your body is plagued by curses!")
			ADD_TRAIT(recipient, TRAIT_NORUN, TRAIT_GENERIC)
		else
			recipient.mob_biotypes |= MOB_UNDEAD //Undead biotype is already applied by damned vice.

/datum/virtue/combat/crimson_curse
	name = "Багровое проклятие"
	desc = "Вы страдаете от Багрового проклятия, слабой формы вампиризма, приобретенной в результате темных обрядов или особо жестокого колдовства. В отличие от 'истинного' вампира, вы не способны обращать других или совершать дьявольщину."

/datum/virtue/combat/crimson_curse/apply_to_human(mob/living/carbon/human/recipient)
	//Hacky but we need to do this, otherwise the CC trait isn't applied before vampire checks for the trait and stops us from being Clan Leader
	ADD_TRAIT(recipient, TRAIT_CRIMSON_CURSE, TRAIT_GENERIC)
	addtimer(CALLBACK(src, .proc/crimson_apply, recipient), 30)

/datum/virtue/combat/crimson_curse/proc/crimson_apply(mob/living/carbon/human/recipient)
	var/datum/antagonist/vampire/stray/new_antag = new /datum/antagonist/vampire/stray(incoming_clan = /datum/clan/strays, generation = GENERATION_THINBLOOD)
	recipient.mind.add_antag_datum(new_antag)
