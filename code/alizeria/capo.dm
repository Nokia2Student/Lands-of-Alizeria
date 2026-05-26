/datum/job/roguetown/capo
	title = "Caporegime"
	flag = CAPO
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = ALIZ_ALL_RACES
	tutorial = "Ты являешься правой рукой главаря криминального мира в вольном городе. Пока он занимается заработком денег, ведя свой 'бизнес' - ты занимаешься исполнением различных заказов и важных поручений. С твоих рук давно не стекала кровь, возможно настало время это исправить."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/capo
	display_order = JDO_CAPO
	give_bank_account = 70
	min_pq = 0
	max_pq = null
	bypass_lastclass = TRUE
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_PEASANT

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_NIGHT_OWL, TRAIT_LEAPER, TRAIT_DECEIVING_MEEKNESS, TRAIT_NOFALLDAMAGE1, TRAIT_BLACKBAGGER, TRAIT_DODGEEXPERT, TRAIT_NIGHT_VISION, TRAIT_LIGHT_STEP)

	advclass_cat_rolls = list(CTAG_CAPO = 2)
	job_subclasses = list(
		/datum/advclass/capo
	)

/datum/advclass/capo
	name = "Caporegime"
	tutorial = "You are renting out the bathhouse in a joint operation with the Innkeep. You provide security for the bathwenches and help them to find work--when you're not being a trouble-making rake that others suffer to tolerate."
	outfit = /datum/outfit/job/capo/basic
	category_tags = list(CTAG_CAPO)

	subclass_languages = list(
		/datum/language/thievescant,
	)

	subclass_stats = list(
		STATKEY_END = 3,
		STATKEY_STR = -2,
		STATKEY_CON = -3,
		STATKEY_FOR = 3,
		STATKEY_INT = 2
	)

	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/stealing = SKILL_LEVEL_MASTER,
		/datum/skill/combat/guns = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_MASTER,
		/datum/skill/misc/climbing = SKILL_LEVEL_MASTER,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/combat/knives = SKILL_LEVEL_LEGENDARY,
		/datum/skill/combat/bows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/guns = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/capo/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/roguehood/black
	cloak = /obj/item/clothing/cloak/half/shadowcloak
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	neck = /obj/item/clothing/neck/roguetown/bevor
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	beltl = /obj/item/rogueweapon/sword/sabre/mulyeog
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
	id = /obj/item/scomstone
	armor = /obj/item/clothing/suit/roguetown/armor/basiceast/crafteast/shrinekeeper
	backpack_contents = list(/obj/item/storage/keyring/alizeria/capo)

	backl = /obj/item/storage/backpack/rogue/satchel

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/message)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/summonweapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/haste)