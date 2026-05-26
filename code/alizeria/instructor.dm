/datum/job/roguetown/ins
	title = "Inspector"
	flag = INS
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "Никакое войско не держится на одних мундирах и угрозах. Будучи Инспектором, ты являешься правой рукой Прево и надзираешь за порядком в рядах жандармов. Тебе поручено обучать новобранцев, карать ленивых, продвигать полезных и скрывать неудобных. Для тебя происхождение солдата не имеет значения: дворянский сын и уличный сирота одинаково кричат под твоим давлением. Главное не метод, а результат. Хотя жестокость почему-то всегда оказывается самым популярным методом."
	display_order = JDO_INS
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/ins
	advclass_cat_rolls = list(CTAG_INS = 1)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_HEAVYARMOR, TRAIT_NOBLE, TRAIT_INTELLECTUAL, TRAIT_GOODWRITER,)
	job_subclasses = list(
		/datum/advclass/ins
	)

/datum/job/roguetown/ins/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/ins
	name = "Inspector"
	tutorial = "Никакая элитная армия не может называться элитной без должного обучения своего состава. Будучи инструктором тебе предстоит заниматься воспитанием и обучением юного поколения жандармов. Многие из них могут являться снобами из богатых семей, однако для тебя - они все равны. Избивай, унижай, либо же хвали и воодушевляй - способ воспитания не так важен, как его эффективность."
	category_tags = list(CTAG_INS)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 3,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
		STATKEY_END = 2,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/guns = SKILL_LEVEL_MASTER,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/traps = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/riding = SKILL_LEVEL_MASTER,

	)

	subclass_languages = list(
		/datum/language/otavan,
		/datum/language/grenzelhoftian,
		/datum/language/hellspeak,
		/datum/language/etruscan,
		/datum/language/gronnic,
	)

/datum/outfit/job/ins
	name = "Inspector"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/ins

/datum/outfit/job/ins/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/instructor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/angle
	id = /obj/item/scomstone
	beltr = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/rogueweapon/sword/sabre
	backl = /obj/item/quiver/pylipistol
	pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
	shoes = /obj/item/clothing/shoes/roguetown/boots
	wrists = /obj/item/storage/keyring/alizeria/ins
	backpack_contents = list(
		/obj/item/recipe_book/alchemy,
		/obj/item/skillbook/unfinished, //give the book man a starter book, enough paper for 3 pages, and a writing instrument to get him started
		/obj/item/natural/feather,
		/obj/item/paper,
		/obj/item/paper,
		/obj/item/paper

	)

	if (H && H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/teach)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/learn)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/haste)