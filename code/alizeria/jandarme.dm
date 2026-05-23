/datum/job/roguetown/ojandarme
	title = "Gendarme Officer"
	flag = OJAN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "“ы - офицер жандармов, боец элитного королевского войска.  огда-то ты прибыл на остров вместе со своим маршаллом и наместником, без лишних вопросов подавив вскоре вспыхнувший м€теж. “ы покл€лс€ защищать народ, однако пон€тие народа дл€ короны весьма своеобразно. «ащищай двор€н и взымай с них плату, ведь со штормами плат€т тебе теперь не из королевской казны, а из местной."
	display_order = JDO_OJAN
	always_show_on_latechoices = TRUE
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/ojandarme
	advclass_cat_rolls = list(CTAG_OJAN = 1)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_MINOR_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_NOBLE, TRAIT_JUSTICARSIGHT)
	job_subclasses = list(
		/datum/advclass/ojandarme
	)

/datum/job/roguetown/ojandarme/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/ojandarme
	name = "Gendarme Officer"
	tutorial = "“ы - офицер жандармов, боец элитного королевского войска.  огда-то ты прибыл на остров вместе со своим маршаллом и наместником, без лишних вопросов подавив вскоре вспыхнувший м€теж. “ы покл€лс€ защищать народ, однако пон€тие народа дл€ короны весьма своеобразно. «ащищай двор€н и взымай с них плату, ведь со штормами плат€т тебе теперь не из королевской казны, а из местной."
	category_tags = list(CTAG_OJAN)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
		STATKEY_END = 2,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/guns = SKILL_LEVEL_MASTER,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_MASTER,

	)
	subclass_languages = list(
		/datum/language/otavan
	)

/datum/outfit/job/ojandarme
	name = "Gendarme Officer"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/ojandarme

/datum/outfit/job/ojandarme/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/jandarms/jandarm
	cloak = /obj/item/clothing/cloak/jandarms/jandarm
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/quiver/pylipistol
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/alizeria/jandarms/jandarm
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/angle
	id = /obj/item/scomstone
	beltr = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/rogueweapon/sword/sabre
	pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	wrists = /obj/item/storage/keyring/alizeria/jano

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/haste)