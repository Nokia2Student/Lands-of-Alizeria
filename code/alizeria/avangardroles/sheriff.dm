/datum/job/roguetown/commander
	title = "Commander"
	flag = COMMANDER
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE)
	allowed_races = ALIZ_ONLY_HUMAN
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	display_order = JDO_COMMANDER
	selection_color = JCOLOR_AVANGARD
	allowed_patrons = CODEX
	social_rank = SOCIAL_RANK_YEOMAN
	tutorial = " огда-то ты был обычным наeмником, но один стук в дверь изменил твою жизнь на до и после. »менно теб€ избрал король в качестве лидера исследовательской группы. ѕочему? ¬р€д ли ответ известен кому-нибудь кроме безумного корол€, да и это не столь важно, ведь отказатьс€ у теб€ выбора не было. “ы прин€л решение остановитьс€ вместе со своей группой в руинах бывшей крепости, что бы тебе в будующем было куда вернутьс€ и восстановить свои силы после похода на столицу. –ано или поздно этот смертоносный момент настанет, но пока ты лишь занимаешьс€ развитием своего поселени€.  то знает, может король когда-нибудь забудет о твоeм 'предназначении'?"
	whitelist_req = FALSE
	outfit = /datum/outfit/job/commander
	give_bank_account = 40
	noble_income = 20
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list(CTAG_COMMANDER = 1)
	job_traits = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED, TRAIT_PERFECT_TRACKER, TRAIT_TEMPO, TRAIT_JUSTICARSIGHT, TRAIT_SHARPER_BLADES)
	job_subclasses = list(
		/datum/advclass/commander/classic
	)

/datum/outfit/job/commander/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/proc/haltyell
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/living/carbon/human/proc/request_law, /mob/living/carbon/human/proc/request_law_removal, /mob/living/carbon/human/proc/fire_guard)

/datum/advclass/commander/classic
	name = "Commander"
	tutorial = " огда-то ты был обычным наeмником, но один стук в дверь изменил твою жизнь на до и после. »менно теб€ избрал король в качестве лидера исследовательской группы. ѕочему? ¬р€д ли ответ известен кому-нибудь кроме безумного корол€, да и это не столь важно, ведь отказатьс€ у теб€ выбора не было. “ы прин€л решение остановитьс€ вместе со своей группой в руинах бывшей крепости, что бы тебе в будующем было куда вернутьс€ и восстановить свои силы после похода на столицу. –ано или поздно этот смертоносный момент настанет, но пока ты лишь занимаешьс€ развитием своего поселени€.  то знает, может король когда-нибудь забудет о твоeм 'предназначении'?"
	outfit = /datum/outfit/job/commander/classic
	category_tags = list(CTAG_COMMANDER)
	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_LCK = -1,
		STATKEY_CON = 2,
		STATKEY_END = 2,
		STATKEY_SPD = -1,
		STATKEY_STR = 3,
	)
	subclass_skills = list(
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/guns = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_MASTER,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/commander/classic/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = new /datum/voicepack/male/tyrant()
	head = /obj/item/clothing/head/roguetown/helmet/blacksteel/modern/alizeria/sheriffhelmet
	cloak = /obj/item/clothing/cloak/thief_cloak/yoruku
	backl = /obj/item/storage/backpack/rogue/satchel/otavan
	backr = /obj/item/rogueweapon/shield/buckler
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/alizeria/sheriffchest
	neck = /obj/item/clothing/neck/roguetown/horus
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	id = /obj/item/scomstone
	belt = /obj/item/storage/belt/rogue/leather/steel
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/plate
	beltr = /obj/item/rogueweapon/mace/steel/morningstar
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/signal_horn = 1)

	if(H.mind)
		H.verbs |= list(/mob/living/carbon/human/proc/elder_announcement)
