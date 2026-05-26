/datum/job/roguetown/tavernier
	title = "Tavernier"
	flag = TAVERNIER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	social_rank = SOCIAL_RANK_YEOMAN

	allowed_races = ALIZ_ALL_RACES

	tutorial = "Твоя таверна - самое большое здание в вольном городе. Возможно оно будет даже больше дворца. Сдавай комнаты уставшим путникам, веди с ними беседы и готовь лучшие блюда. Вместе с тобой также проживает журналист и мастер гильдии. Возможно, вам вместе удастся сделать таверну более знаменитой."

	outfit = /datum/outfit/job/tavernier
	display_order = JDO_TAVERNIER
	give_bank_account = 43
	min_pq = 0
	max_pq = null
	round_contrib_points = 3

	job_traits = list(TRAIT_MEDIUMARMOR, TRAIT_TAVERN_FIGHTER, TRAIT_EMPATH, TRAIT_DODGEEXPERT, TRAIT_CICERONE)

	advclass_cat_rolls = list(CTAG_TAVERNIER = 3)
	job_subclasses = list(
		/datum/advclass/tavernier
	)

/datum/advclass/tavernier
	name = "Innkeeper"
	tutorial = "Adventurers and warriors alike have two exit plans; the early grave or even earlier retirement. As the proud owner of this fine establishment, you took the latter: The Azurian Pint, tavern, inn, and bathhouse! You even have an assortment of staff to help you, and plenty of business from the famished townsfolk looking to eat, weary travelers looking to rest, and characters of dubious repute seeking their own sort of success. Your bladework has gotten a little rusty, and the church across the street gives you the odd evil eye for the extra 'delights' of the bathhouse--but, well...you can't win 'em all!"
	outfit = /datum/outfit/job/tavernier/basic
	category_tags = list(CTAG_TAVERNIER)
	subclass_stats = list(
		STATKEY_STR = 3,
		STATKEY_INT = -1,
		STATKEY_SPD = -1,
		STATKEY_PER = 2,
		STATKEY_LCK = 1,
		STATKEY_CON = 3,
		STATKEY_END = 3,
	)

	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_EXPERT,
		/datum/skill/labor/farming = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE, //apprentice to do some basic repairs around the inn if need be
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/tavernier/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel/otavan
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather/aristocratic
	id = /obj/item/scomstone
	belt = /obj/item/storage/belt/rogue/leather/black
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/huntingknife/throwingknife/steel
	beltr = /obj/item/rogueweapon/huntingknife/cleaver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
		cloak = /obj/item/clothing/cloak/apron/cook
	else if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/confessor
	backpack_contents = list(
		/obj/item/recipe_book/survival,
		/obj/item/roguekey/tavern,
		/obj/item/bottle_kit
	)
