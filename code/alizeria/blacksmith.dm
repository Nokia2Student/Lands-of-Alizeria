/datum/job/roguetown/pblacksmith
	title = "Blacksmith"
	flag = PBLACKSMITH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = RACES_ALL_KINDS
	tutorial = " огда-то давно кузнецы ценились почти также, как и пленники-лорды. “еперь же их времена прошли. ћногие доспехи возможно пробить болтом или пулей, так что выбор многих стал уходить в кожанное снар€жение. Ѕывают и исключени€, например городска€ стража, что €вл€ютс€ твоими частыми клиентами."
	advclass_cat_rolls = list(CTAG_PBLACKSMITH = 20)
	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	display_order = JDO_PBLACKSMITH
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
		/datum/advclass/pblacksmith
	)

/datum/advclass/pblacksmith
	name = "Blacksmith"
	tutorial = "A skilled blacksmith, able to forge capable weapons for warriors in the bog, \
	only after building a forge for themselves of course"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/adventurer/pblacksmith
	subclass_social_rank = SOCIAL_RANK_PEASANT

	category_tags = list(CTAG_PBLACKSMITH)

	traits_applied = list(TRAIT_TRAINED_SMITH, TRAIT_MEDIUMARMOR, TRAIT_PEASANTMILITIA)
	maximum_possible_slots = 2
	subclass_stats = list(
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_STR = 1,
		STATKEY_LCK = 1,
		STATKEY_SPD = -1
	)

	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/axes = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN, // The strongest fists in the land.
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/engineering = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/blacksmithing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/armorsmithing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/weaponsmithing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/smelting = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/adventurer/pblacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/hammer/iron
	beltl = /obj/item/rogueweapon/tongs
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves/blacksmith
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	pants = /obj/item/clothing/under/roguetown/trou
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueore/coal=1,
						/obj/item/rogueore/iron=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/blacksmithing = 1,
						/obj/item/roguekey/alizeria/pblacksmith = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1,
						)
	if(H.pronouns == HE_HIM)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots