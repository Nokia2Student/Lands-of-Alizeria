/datum/job/roguetown/jandarme
	title = "Gendarme"
	flag = JAN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "Обычный боец жандармерии. Ты прошёл далеко не столько битв, что бы называться бывалым воином, но подготовкой тебя не обделили. Всего месяц или неделю назад ты смог успешно закончить академию, вместе с этим принеся клятву представителю королевской семьи. Теперь ты стоишь на страже народа, который готов платить тебе за твою службу."
	display_order = JDO_JAN
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/jandarme
	advclass_cat_rolls = list(CTAG_JAN = 1)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_MINOR_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_NOBLE, TRAIT_JUSTICARSIGHT)
	job_subclasses = list(
		/datum/advclass/jandarme
	)

/datum/job/roguetown/jandarme/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/jandarme
	name = "Gendarme"
	tutorial = "Обычный боец жандармерии. Ты прошёл далеко не столько битв, что бы называться бывалым воином, но подготовкой тебя не обделили. Всего месяц или неделю назад ты смог успешно закончить академию, вместе с этим принеся клятву представителю королевской семьи. Теперь ты стоишь на страже народа, который готов платить тебе за твою службу."
	category_tags = list(CTAG_JAN)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_PER = 1,
		STATKEY_END = 1,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/guns = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,

	)
	subclass_languages = list(
		/datum/language/otavan
	)

/datum/outfit/job/jandarme
	name = "Gendarme"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/jandarme

/datum/outfit/job/jandarme/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/quiver/pylipistol
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/alizeria/jandarms/jandarm
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/angle
	id = /obj/item/scomstone
	beltr = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/rogueweapon/sword/sabre
	pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	wrists = /obj/item/storage/keyring/alizeria/janu
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/patrol/armor

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/haste)