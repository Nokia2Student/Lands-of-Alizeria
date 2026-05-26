/datum/job/roguetown/master
	title = "Master"
	flag = MASTER
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_ALL_KINDS
	tutorial = " огда-то давно кузнецы ценились почти также, как и пленники-лорды. “еперь же их времена прошли. ћногие доспехи возможно пробить болтом или пулей, так что выбор многих стал уходить в кожанное снар€жение. Ѕывают и исключени€, например городска€ стража, что €вл€ютс€ твоими частыми клиентами."
	advclass_cat_rolls = list(CTAG_MASTER = 4)
	outfit = /datum/outfit/job/adventurer/master
	outfit_female = /datum/outfit/job/adventurer/master
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	display_order = JDO_MASTER
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	wanderer_examine = FALSE
	advjob_examine = TRUE
	same_job_respawn_delay = 0
	class_setup_examine = TRUE
	cmode_music = 'sound/music/combat_towner.ogg'
	social_rank = SOCIAL_RANK_PEASANT

	job_subclasses = list(
		/datum/advclass/master
	)

/datum/advclass/master
	name = "Master"
	tutorial = "A skilled blacksmith, able to forge capable weapons for warriors in the bog, \
	only after building a forge for themselves of course"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/adventurer/master
	subclass_social_rank = SOCIAL_RANK_PEASANT

	category_tags = list(CTAG_MASTER)

	traits_applied = list(TRAIT_TRAINED_SMITH, TRAIT_HEAVYARMOR, TRAIT_SEEPRICES)
	maximum_possible_slots = 1
	subclass_stats = list(
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_STR = 4,
		STATKEY_INT = 2,
		STATKEY_LCK = -2,
		STATKEY_SPD = -1
	)

	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN, // The strongest fists in the land.
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_MASTER,
		/datum/skill/craft/engineering = SKILL_LEVEL_MASTER,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/craft/blacksmithing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/armorsmithing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/weaponsmithing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/smelting = SKILL_LEVEL_MASTER,
		/datum/skill/craft/traps = SKILL_LEVEL_MASTER,
		/datum/skill/craft/masonry = SKILL_LEVEL_MASTER,
	)

/datum/outfit/job/adventurer/master/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	gloves = /obj/item/clothing/gloves/roguetown/chain/vampire
	belt = /obj/item/storage/belt/rogue/leather/steel/tasset
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	beltr = /obj/item/rogueweapon/mace/warhammer
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/scomstone
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves/blacksmith
	cloak = /obj/item/clothing/cloak/templar/malumite
	pants = /obj/item/clothing/under/roguetown/tights/explorerpants
	backl = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/boots/blacksteel/modern/plateboots
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueore/coal=1,
						/obj/item/rogueore/iron=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/blacksmithing = 1,
						/obj/item/roguekey/alizeria/pblacksmith = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1,
						)