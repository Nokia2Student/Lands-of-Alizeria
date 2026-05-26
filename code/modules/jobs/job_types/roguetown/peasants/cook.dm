/datum/job/roguetown/cook
	title = "Cook"
	flag = COOK
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_races = ALIZ_ALL_RACES
	tutorial = "Ты - повар и по совместительству официант самой известной таверны в вольном городе. Помогай её владельцу на кухне, работай усердно и возможно когда-нибудь она достанется именно тебе."
	outfit = /datum/outfit/job/cook
	display_order = JDO_COOK
	give_bank_account = 25
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	social_rank = SOCIAL_RANK_PEASANT

	job_traits = list(TRAIT_CICERONE, TRAIT_PEASANTMILITIA)

	advclass_cat_rolls = list(CTAG_COOK = 2)
	job_subclasses = list(
		/datum/advclass/cook
	)

/datum/advclass/cook
	name = "Cook"
	tutorial = "В городе много ртов, которые нужно кормить, и большинство надеются на тебя. Ты работаешь под началом трактирщика и создаёшь такие кулинарные изыски, что даже корона время от времени заглядывает. При этом ты пытаешься обучить и остальной персонал, пока не надорвался у горячих очагов."
	outfit = /datum/outfit/job/cook/basic
	category_tags = list(CTAG_COOK)

	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_CON = 2,
		STATKEY_END = 1
	)

	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/cook/basic
	has_loadout = TRUE

/datum/outfit/job/cook/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/alizeria/innkeep
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/apron/cook
	head = /obj/item/clothing/head/roguetown/cookhat
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	else if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
	backpack_contents = list(
		/obj/item/recipe_book/survival,
	)

/datum/outfit/job/cook/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	if(H.age == AGE_MIDDLEAGED)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
