/datum/job/roguetown/caffe
	title = "Caffettiere"
	flag = CAFE
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "“ы - один из немногих двор€нинов, что €вл€етс€ весьма ло€льным короне, при этом наход€сь в городе. “воЄ заведение - роскошно, а также твоими клиентами чаще всего €вл€етс€ знать. ќни считают таверну чем-то простым, дл€ смердов, и по сути так и есть. Ѕлаго у них есть альтернатива в виде твоего заведени€."
	display_order = JDO_CAFE

	outfit = /datum/outfit/job/caffe
	advclass_cat_rolls = list(CTAG_CAFE = 20)
	give_bank_account = 80
	noble_income = 15
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_MINOR_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_SEEPRICES_SHITTY, TRAIT_NOBLE, TRAIT_EMPATH)
	job_subclasses = list(
		/datum/advclass/caffe
	)

/datum/job/roguetown/caffe/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/caffe
	name = "Caffettiere"
	tutorial = "“ы - один из немногих двор€нинов, что €вл€етс€ весьма ло€льным короне, при этом наход€сь в городе. “воЄ заведение - роскошно, а также твоими клиентами чаще всего €вл€етс€ знать. ќни считают таверну чем-то простым, дл€ смердов, и по сути так и есть. Ѕлаго у них есть альтернатива в виде твоего заведени€."
	category_tags = list(CTAG_CAFE)
	subclass_stats = list(
		STATKEY_STR = -2,
		STATKEY_INT = 3,
		STATKEY_CON = -2,
		STATKEY_PER = 3,
		STATKEY_END = -1,
		STATKEY_FOR = 2,
	)

	subclass_skills = list(
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/music = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/caffe
	name = "Caffettiere"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/caffe

/datum/outfit/job/caffe/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/flowers/redpurple_rose
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/steward
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/keyring/alizeria/hcafe
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/topaz