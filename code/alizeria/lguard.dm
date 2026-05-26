/datum/job/roguetown/lguard
	title = "Garde du corps"
	flag = KNIGHT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_ONLY_HUMAN
	tutorial = "Ты - член королевской гвардии. Пускай твой лорд и не является даже герцогом, твой долг - защищать его жизнь, ибо таков был указ твоего короля. Пускай он и является безумным - предать клятву данную ему, тебе не позволяет честь. Любой ценой защищай жизнь своего лорда и его семьи."
	display_order = JDO_LGUARD
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/lguard
	advclass_cat_rolls = list(CTAG_LGUARD = 21)
	give_bank_account = 220
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	virtue_restrictions = list(
		/datum/virtue/utility/noble,
		/datum/virtue/utility/blueblooded,
	)

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_HEAVYARMOR, TRAIT_JUSTICARSIGHT, TRAIT_CRITICAL_RESISTANCE, TRAIT_BIGGUY)
	job_subclasses = list(
		/datum/advclass/lguard
	)

/datum/job/roguetown/lguard/special_job_check(mob/dead/new_player/player)
	if(!player)
		return
	if(!player.ckey)
		return
	for(var/mob/dead/new_player/N in GLOB.player_list)
		if(N.mind.assigned_role == "Prince" || N.mind.assigned_role == "Princess" || N.mind.assigned_role == "Landowner" || N.mind.assigned_role == "Lady of Crown")
			return TRUE
	return FALSE

/datum/job/roguetown/lguard/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/lguard
	name = "Garde du corps"
	tutorial = "Ты - член королевской гвардии. Пускай твой лорд и не является даже герцогом, твой долг - защищать его жизнь, ибо таков был указ твоего короля. Пускай он и является безумным - предать клятву данную ему, тебе не позволяет честь. Любой ценой защищай жизнь своего лорда и его семьи."
	category_tags = list(CTAG_LGUARD)
	subclass_stats = list(
		STATKEY_STR = 4,
		STATKEY_INT = 2,
		STATKEY_CON = 2,
		STATKEY_PER = 1,
		STATKEY_END = 2,
		STATKEY_FOR = -3,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_MASTER,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/slings = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/guns = SKILL_LEVEL_MASTER,
	)

/datum/outfit/job/lguard
	name = "Garde du corps"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/lguard
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/lguard/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/ordinatorhelm/plume
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	cloak = /obj/item/clothing/cloak/ordinatorcape
	armor = /obj/item/clothing/suit/roguetown/armor/alizeria/lord/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/alizeria/guardalt
	pants = /obj/item/clothing/under/roguetown/platelegs/blacksteel/modern
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather/aristocratic
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltl = /obj/item/rogueweapon/sword/championsabre
	beltr = /obj/item/quiver/mpylipistol
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle
	id = /obj/item/scomstone
	backpack_contents = list(/obj/item/storage/keyring/alizeria/knight = 1, /obj/item/storage/belt/rogue/pouch/coins/mid = 1)