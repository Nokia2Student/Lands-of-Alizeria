/datum/job/roguetown/tavernier
	title = "Tavernier"
	flag = TAVERNIER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	social_rank = SOCIAL_RANK_YEOMAN

	allowed_races = ALIZ_ALL_RACES

	tutorial = "≈сть один товар, который будет абсолютно всегда иметь спрос у обычных людей, а именно еда, вода и кров. ¬сe это у теб€ есть, а также только ты на этих холодных земл€х способен приготовить что-то, что хот€ бы кому-нибудь придeтс€ по вкусу. ќднако продукты быстро порт€тс€, поэтому цены на них сильно кусаютс€. ¬прочем, тебе практически ничего не мешает использовать продукты собственного производства, ведь у теб€ есть собственна€ теплица и необходимые навыки дл€ охоты. "

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
	tutorial = "≈сть один товар, который будет абсолютно всегда иметь спрос у обычных людей, а именно еда, вода и кров. ¬сe это у теб€ есть, а также только ты на этих холодных земл€х способен приготовить что-то, что хот€ бы кому-нибудь придeтс€ по вкусу. ќднако продукты быстро порт€тс€, поэтому цены на них сильно кусаютс€. ¬прочем, тебе практически ничего не мешает использовать продукты собственного производства, ведь у теб€ есть собственна€ теплица и необходимые навыки дл€ охоты. "
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
	backpack_contents = list(
		/obj/item/recipe_book/survival,
		/obj/item/roguekey/tavern,
		/obj/item/bottle_kit
	)
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
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