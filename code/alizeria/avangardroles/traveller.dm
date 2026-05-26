/datum/job/roguetown/traveller
	title = "Traveller"
	flag = TRAVELLER
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	display_order = JDO_TRAVELLER
	social_rank = SOCIAL_RANK_PEASANT
	tutorial = "Удивительный мир магии, мифов, исторических трагедий и тайных знаний всегда побуждал людей ступить на тропы путешественников. Ты являешься одним из таких людей, что только начали свой путь и решили сразу же попасть в одно из самых опасных мест в мире, что бы заполучить быструю славу или богатства. Очевидно глупое решение, но кто знает - может именно ты станешь тем самым счастливчиком из сотни таких же глупцов? Так или иначе - постарайся найти себе верного союзника, ибо без него ты точно вряд ли выживешь в столь опасном месте."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/traveller
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list(CTAG_TRAVELLER = 2)
	job_subclasses = list(
		/datum/advclass/traveller/classic
	)

/datum/outfit/job/traveller/pre_equip(mob/living/carbon/human/H)
	..()

/datum/advclass/traveller/classic
	name = "Traveller"
	tutorial = "Удивительный мир магии, мифов, исторических трагедий и тайных знаний всегда побуждал людей ступить на тропы путешественников. Ты являешься одним из таких людей, что только начали свой путь и решили сразу же попасть в одно из самых опасных мест в мире, что бы заполучить быструю славу или богатства. Очевидно глупое решение, но кто знает - может именно ты станешь тем самым счастливчиком из сотни таких же глупцов? Так или иначе - постарайся найти себе верного союзника, ибо без него ты точно вряд ли выживешь в столь опасном месте."
	outfit = /datum/outfit/job/traveller/classic
	category_tags = list(CTAG_TRAVELLER)
	subclass_stats = list(
		STATKEY_PER = -1,
		STATKEY_LCK = -1,
		STATKEY_CON = -1,
		STATKEY_END = -1,
		STATKEY_SPD = -1,
		STATKEY_STR = -1,
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/traveller/classic/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood
	backl = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	gloves = /obj/item/clothing/gloves/roguetown/leather
	beltr = /obj/item/rogueweapon/sword/iron
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
