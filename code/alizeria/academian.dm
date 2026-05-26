/datum/job/roguetown/academian
	title = "Chevalier"
	flag = ACADEM
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "Шевалье - низшая ступень коронной службы и первый материал для будущей жандармерии. Чаще всего сюда попадают отпрыски богатых семей, от которых родители устали раньше, чем успели воспитать, а также юнцы, мечтающие о славе и красивой форме. Здесь из них делают солдат при помощи муштры, унижений, дисциплины и прочих любимых традиций Монфора. Если не сломаешься - станешь полезным. Если сломаешься - станешь примером для остальных."
	display_order = JDO_ACADEM
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/academian
	advclass_cat_rolls = list(CTAG_ACADEM = 1)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_MINOR_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_NOBLE)
	job_subclasses = list(
		/datum/advclass/academian
	)

/datum/job/roguetown/academian/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/academian
	name = "Chevalier"
	tutorial = "Академик - низшая ступень в жандармерии. Довольно часто богатые родители, дабы не заниматься вопросами воспитания в угоду проведения своего досуга - либо нанимают нянек, либо отдают своих детей в жандармерию. Там их легальными и несовсем легальными методами превращают в настоящих бойцов, готовых исполнить любой приказ короны."
	category_tags = list(CTAG_ACADEM)
	subclass_stats = list(
		STATKEY_STR = -2,
		STATKEY_INT = 1,
		STATKEY_CON = -1,
		STATKEY_PER = -1,
		STATKEY_END = -1,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/maces = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/traps = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/guns = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,

	)
	subclass_languages = list(
		/datum/language/otavan
	)

/datum/outfit/job/academian
	name = "Chevalier"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/academian

/datum/outfit/job/academian/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/studyone
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	id = /obj/item/scomstone
	belt = /obj/item/storage/belt/rogue/leather/black
	pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/studypants
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	wrists = /obj/item/storage/keyring/alizeria/janu
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/studytwo