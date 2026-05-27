/datum/job/roguetown/darkwitch
	title = "Dark Witch"
	flag = DARKWITCH
	department_flag = AVANGARD
	allowed_sexes = list(FEMALE)
	allowed_races = ALIZ_ALL_RACES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	tutorial = "В местах, где живeт мало людей - редко можно встретить обученных лекарей. Их место довольно часто занимают тeмные знахари, которые не пользуются хорошей репутацией, но к которым идут с любыми болезнями просто из-за отсутствия иных вариантов. Ты избрал для себя путь оккультизма и веры в Падшую Императрицу. Она, либо же нечто иное - одарила тебя тeмными силами. Немногие из твоих пациентов выживают, будь то по твоей вине, либо же нет. Впрочем, это не так важно, ведь ты всегда найдeшь применение даже мeртвым."
	display_order = JDO_DARKWITCH
	cmode_music = 'sound/music/combat_cult.ogg'

	spells = list(/obj/effect/proc_holder/spell/targeted/shapeshift/witch/cat/black, /obj/effect/proc_holder/spell/targeted/shapeshift/witch/crow, /obj/effect/proc_holder/spell/targeted/shapeshift/witch/bat)

	outfit = /datum/outfit/job/darkwitch/darkwitch
	give_bank_account = 35
	min_pq = 0
	max_pq = null
	required = TRUE
	round_contrib_points = 3

	job_traits = list(TRAIT_DEATHSIGHT, TRAIT_RITUALIST, TRAIT_WITCH, TRAIT_TALENTED_ALCHEMIST, TRAIT_ARCYNE_T3)

	advclass_cat_rolls = list(CTAG_DARKWITCH = 6)
	job_subclasses = list(
		/datum/advclass/darkwitch
	)

/datum/advclass/darkwitch
	name = "Dark Witch"
	tutorial = "В местах, где живeт мало людей - редко можно встретить обученных лекарей. Их место довольно часто занимают тeмные знахари, которые не пользуются хорошей репутацией, но к которым идут с любыми болезнями просто из-за отсутствия иных вариантов. Ты избрал для себя путь оккультизма и веры в Падшую Императрицу. Она, либо же нечто иное - одарила тебя тeмными силами. Немногие из твоих пациентов выживают, будь то по твоей вине, либо же нет. Впрочем, это не так важно, ведь ты всегда найдeшь применение даже мeртвым."
	outfit = /datum/outfit/job/darkwitch/darkwitch
	category_tags = list(CTAG_DARKWITCH)
	allowed_races = ALIZ_ALL_RACES

	subclass_stats = list(
		STATKEY_PER = 3,
		STATKEY_INT = 3,
		STATKEY_STR = -2,
		STATKEY_LCK = 1
	)

	subclass_spellpoints = 12

	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_MASTER,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/alchemy = SKILL_LEVEL_MASTER,
		/datum/skill/magic/blood = SKILL_LEVEL_MASTER,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/darkwitch/darkwitch/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)

	head = /obj/item/clothing/head/flowers/poppy
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/black
	id = /obj/item/scomstone
	cloak = /obj/item/clothing/cloak/alizeria/witchcloak
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/alizeria/witch
	neck = /obj/item/clothing/neck/roguetown/gorget/cursed_collar
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/ucolored
	gloves = /obj/item/clothing/gloves/roguetown/alizeria/witchgloves
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot

	backpack_contents = list(
						/obj/item/reagent_containers/glass/mortar = 1,
						/obj/item/pestle = 1,
						/obj/item/candle/yellow = 2,
						/obj/item/recipe_book/alchemy = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/recipe_book/magic = 1,
						/obj/item/ritechalk = 1,
						)