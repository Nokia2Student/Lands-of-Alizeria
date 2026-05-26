/datum/job/roguetown/expeditor
	title = "Expeditor"
	flag = EXPEDITOR
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	display_order = JDO_EXPEDITOR
	social_rank = SOCIAL_RANK_PEASANT
	tutorial = "Удивительный мир магии, мифов, исторических трагедий и тайных знаний всегда побуждал людей ступить на тропы путешественников. Ты являешься одним из таких людей, что только начали свой путь и решили сразу же попасть в одно из самых опасных мест в мире, что бы заполучить быструю славу или богатства. Очевидно глупое решение, но кто знает - может именно ты станешь тем самым счастливчиком из сотни таких же глупцов? Так или иначе - постарайся найти себе верного союзника, ибо без него ты точно вряд ли выживешь в столь опасном месте."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/expeditor
	min_pq = 0
	job_traits = list(TRAIT_MEDIUMARMOR)
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list(CTAG_EXPEDITOR = 2)
	job_subclasses = list(
		/datum/advclass/expeditor/classic
	)

/datum/outfit/job/expeditor/pre_equip(mob/living/carbon/human/H)
	..()

/datum/advclass/expeditor/classic
	name = "Traveller"
	tutorial = "Удивительный мир магии, мифов, исторических трагедий и тайных знаний всегда побуждал людей ступить на тропы путешественников. Ты являешься одним из таких людей, что только начали свой путь и решили сразу же попасть в одно из самых опасных мест в мире, что бы заполучить быструю славу или богатства. Очевидно глупое решение, но кто знает - может именно ты станешь тем самым счастливчиком из сотни таких же глупцов? Так или иначе - постарайся найти себе верного союзника, ибо без него ты точно вряд ли выживешь в столь опасном месте."
	outfit = /datum/outfit/job/expeditor/classic
	category_tags = list(CTAG_EXPEDITOR)
	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_LCK = 1,
		STATKEY_CON = 2,
		STATKEY_END = 3,
		STATKEY_SPD = -1,
		STATKEY_STR = 2,
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/masonry = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/traps = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/expeditor/classic/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet/warden
	cloak = /obj/item/clothing/cloak/half
	backl = /obj/item/rogueweapon/shield/heater
	backr = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/fluted
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	neck = /obj/item/clothing/neck/roguetown/chaincoif/full
	belt = /obj/item/storage/belt/rogue/leather/black
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/inq
	gloves = /obj/item/clothing/gloves/roguetown/angle
	beltr = /obj/item/rogueweapon/stoneaxe/battle
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	shoes = /obj/item/clothing/shoes/roguetown/boots/grenzelhoft
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/reagent_containers/food/snacks/rogue/ration = 1)
