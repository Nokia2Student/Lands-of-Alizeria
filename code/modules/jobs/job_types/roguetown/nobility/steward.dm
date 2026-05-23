/datum/job/roguetown/steward
	title = "Burgomaster"
	flag = STEWARD
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = ALIZ_NOBLE_RACES
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_STEWARD
	tutorial = "Порой правителю крайне не хочется править и порой это происходит настолько часто, что тот нанимает Бургомистра. Будучи им - тебе предстоит следить за казной и фактически управлять городом от лица своего правителя. Это весьма неблагодарная работа, возможно тебе даже захочется самому сесть на трон, вопрос лишь в том, кто будет готов тебя в этом поддержать?"
	outfit = /datum/outfit/job/steward
	give_bank_account = 22
	noble_income = 40
	min_pq = 0 //Please don't give the vault keys to somebody that's going to lock themselves in on accident
	max_pq = null
	always_show_on_latechoices = TRUE
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'
	social_rank = SOCIAL_RANK_NOBLE

	advclass_cat_rolls = list(CTAG_STEWARD = 2)

	virtue_restrictions = list(/datum/virtue/utility/blacksmith)

	job_traits = list(TRAIT_SEEPRICES, TRAIT_NOBLE)
	job_subclasses = list(
		/datum/advclass/steward
	)

/datum/job/roguetown/steward/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()

/datum/advclass/steward
	name = "Steward"
	tutorial = "Порой правителю крайне не хочется править и порой это происходит настолько часто, что тот нанимает Бургомистра. Будучи им - тебе предстоит следить за казной и фактически управлять городом от лица своего правителя. Это весьма неблагодарная работа, возможно тебе даже захочется самому сесть на трон, вопрос лишь в том, кто будет готов тебя в этом поддержать?"
	outfit = /datum/outfit/job/steward/basic

	category_tags = list(CTAG_STEWARD)
	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 2,
		STATKEY_SPD = -1,
	)

	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/guns = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/steward
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/steward/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	cloak = /obj/item/clothing/cloak/half
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black
	wrists = /obj/item/storage/keyring/alizeria/sherifft
	beltl = /obj/item/rogueweapon/sword/sabre/dec
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather/aristocratic
	neck = /obj/item/clothing/neck/roguetown/horus

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular/pileappraisal)
	H.verbs |= /mob/living/carbon/human/proc/adjust_taxes

GLOBAL_VAR_INIT(steward_tax_cooldown, -50000) // Antispam
/mob/living/carbon/human/proc/adjust_taxes()
	set name = "Adjust Taxes"
	set category = "Stewardry"
	if(stat)
		return
	var/lord = find_lord()
	if(lord)
		to_chat(src, span_warning("You cannot adjust taxes while the [SSticker.rulertype] is present in the realm. Ask your liege."))
		return
	if(world.time < GLOB.steward_tax_cooldown + 600 SECONDS)
		to_chat(src, span_warning("You must wait [round((GLOB.steward_tax_cooldown + 600 SECONDS - world.time)/600, 0.1)] minutes before adjusting taxes again! Think of the realm."))
		return FALSE
	var/newtax = input(src, "Set a new tax percentage (1-99)", src, SStreasury.tax_value*100) as null|num
	if(newtax)
		if(findtext(num2text(newtax), "."))
			return
		newtax = CLAMP(newtax, 1, 99)
		if(stat)
			return
		SStreasury.tax_value = newtax / 100
		priority_announce("Новый налог отныне составляет [newtax]%.", "Burgomaster Speaks", pick('sound/misc/royal_decree.ogg', 'sound/misc/royal_decree2.ogg'), "Captain")
		GLOB.steward_tax_cooldown = world.time
