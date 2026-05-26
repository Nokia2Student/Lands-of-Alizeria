/datum/job/roguetown/niteman
	title = "Caid"
	f_title = "Daronne"
	flag = NITEMASTER
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = ALIZ_NOBLE_RACES
	tutorial = "Даже на отдалённом острове, где всюду желают поставить свои законы - будет спрос на тех, кто готов этот закон нарушить. Ты являешься главой криминального мира острова Ализерии. Тебе принадлежит игорный клуб в вольном городе, который совмещает в себе общественные бани. У тебя есть 'доступ' к некоторым запрещённым товарам, которые могут заинтересовать некоторых людей. Однако помни - тебе дозволено творить почти что угодно лишь на своей территории. Всё, что вне её - должно оставаться в тени."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/niteman
	display_order = JDO_NITEMASTER
	give_bank_account = 150
	min_pq = 0
	max_pq = null
	bypass_lastclass = TRUE
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_YEOMAN

	job_traits = list(TRAIT_SEEPRICES_SHITTY, TRAIT_CICERONE, TRAIT_NUTCRACKER, TRAIT_GOODLOVER)

	advclass_cat_rolls = list(CTAG_BATHMOM = 2)
	job_subclasses = list(
		/datum/advclass/bathmaster
	)

/datum/advclass/bathmaster
	name = "Bathmaster"
	tutorial = "You are renting out the bathhouse in a joint operation with the Innkeep. You provide security for the bathwenches and help them to find work--when you're not being a trouble-making rake that others suffer to tolerate."
	outfit = /datum/outfit/job/niteman/basic
	category_tags = list(CTAG_BATHMOM)

	subclass_languages = list(
		/datum/language/thievescant,
	)

	subclass_stats = list(
		STATKEY_END = 2,
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_INT = -1
	)

	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/guns = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/stealing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/niteman/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/lockpick/goldpin/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/purple
	wrists = /obj/item/storage/keyring/alizeria/capo
	neck = /obj/item/clothing/neck/roguetown/psicross/eora
	pants = /obj/item/clothing/under/roguetown/trou/leather
	beltl = /obj/item/rogueweapon/whip
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	mask = /obj/item/clothing/mask/rogue/spectacles/black
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	id = /obj/item/scomstone

	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 2, /obj/item/reagent_containers/powder/moondust = 2, /obj/item/reagent_containers/powder/spice = 1)

	if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
	else if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/daronne

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/prostitute)

/obj/effect/proc_holder/spell/self/convertrole/prostitute
	name = "Hire Prostitute"
	new_role = "Nightswain"
	overlay_state = "recruit_servant"
	recruitment_faction = "Prostitute"
	recruitment_message = "Work for me, %RECRUIT."
	accept_message = "I will."
	refuse_message = "I refuse."
