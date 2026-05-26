/datum/job/roguetown/blackknight
	title = "Blackguard"
	flag = BLACKKNIGHT
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_ONLY_HUMAN
	tutorial = "Настоящий мерзавец среди всех живущих людей на острове. Когда-то ты был одним из легендарных наёмников, без каких-либо принципов и чести. Это привлекло правящую семью нанять тебя в качестве телохранителя для наследника. За хорошую плату ты обязался выполнять абсолютно ЛЮБОЙ приказ связанный с защитой или насилием, который тебе поступит от наследника или его родителей. У тебя есть отличное снаряжение, опыт, а также непреодолимое желание бить морды всем тем, кто называет тебя сиром. Ты не рыцарь, а всего лишь инструмент в богатеньких юных ручках."
	display_order = JDO_BLACKKNIGHT

	outfit = /datum/outfit/job/blackknight
	advclass_cat_rolls = list(CTAG_BLACKKNIGHT = 21)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_YEOMAN

	cmode_music = 'sound/music/combat_guard.ogg'

	virtue_restrictions = list(
		/datum/virtue/utility/noble,
		/datum/virtue/utility/blueblooded,
	)

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_HEAVYARMOR, TRAIT_BAD_MOOD, TRAIT_CRITICAL_RESISTANCE, TRAIT_BIGGUY, TRAIT_STRONGKICK)
	job_subclasses = list(
		/datum/advclass/blackkguard
	)

/datum/job/roguetown/blackknight/special_job_check(mob/dead/new_player/player)
	if(!player)
		return
	if(!player.ckey)
		return
	for(var/mob/dead/new_player/N in GLOB.player_list)
		if(N.mind.assigned_role == "Prince" || N.mind.assigned_role == "Princess")
			return TRUE
	return FALSE

/datum/job/roguetown/blackknight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/blackkguard
	name = "Blackguard"
	tutorial = "Tales speak of the Gatemaster's legendary ability to stand still at a gate and ask people questions."
	category_tags = list(CTAG_BLACKKNIGHT)
	subclass_stats = list(
		STATKEY_STR = 3,
		STATKEY_INT = -3,
		STATKEY_CON = 2,
		STATKEY_PER = -1,
		STATKEY_END = 3,
		STATKEY_FOR = -2,
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
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/blackknight
	name = "Blackguard"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/blackknight
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/blackknight/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/steel/blackknight
	cloak = /obj/item/clothing/cloak/half
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/blackkguard
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	gloves = /obj/item/clothing/gloves/roguetown/blacksteel/modern/plategloves
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	shoes = /obj/item/clothing/shoes/roguetown/boots/blacksteel/modern/plateboots
	belt = /obj/item/storage/belt/rogue/leather/battleskirt/blackkguard
	beltl = /obj/item/clothing/head/roguetown/helmet/blacksteel/modern/armet
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/sword/long/etruscan
	id = /obj/item/scomstone
	backpack_contents = list(/obj/item/storage/keyring/alizeria/blackguard = 1)

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)