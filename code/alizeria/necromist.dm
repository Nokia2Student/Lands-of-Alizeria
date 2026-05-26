/datum/job/roguetown/necromist
	title = "Necromist"
	flag = NECROMIST
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_ONLY_HUMAN
	tutorial = "После того, как миру стали известны места, куда попадают людские души после смерти - появилась такая профессия как некромист. Они являются 'судьями' мeртвых, собирая и анализируя информацию о проведeнной жизни своих клиентов. После этого они подводят итоги, избирая способ захоронения. Именно от него зависит то, куда попадeт душа."
	display_order = JDO_NECROMIST

	outfit = /datum/outfit/job/necromist
	advclass_cat_rolls = list(CTAG_NECROMIST = 20)
	give_bank_account = 80
	noble_income = 10
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_MINOR_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_BAD_MOOD, TRAIT_NOBLE, TRAIT_TOXIMMUNE, TRAIT_DARKVISION, TRAIT_ZOMBIE_IMMUNE, TRAIT_EASYDISMEMBER, TRAIT_SOUL_EXAMINE)
	job_subclasses = list(
		/datum/advclass/necromist
	)

/datum/job/roguetown/necromist/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/necromist
	name = "Necromist"
	tutorial = "Tales speak of the Gatemaster's legendary ability to stand still at a gate and ask people questions."
	category_tags = list(CTAG_NECROMIST)
	subclass_stats = list(
		STATKEY_STR = -1,
		STATKEY_INT = 3,
		STATKEY_CON = -2,
		STATKEY_PER = 3,
		STATKEY_END = -1,
		STATKEY_FOR = 2,
	)

	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/necromist
	name = "Necromist"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/necromist

/datum/outfit/job/necromist/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/alizeria/necromist/coat
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	gloves = /obj/item/clothing/gloves/roguetown/alizeria/necrogloves
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/rogueweapon/huntingknife/idagger/silver
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	backpack_contents = list(
		/obj/item/roguekey/alizeria/necromist
	)

	if(should_wear_femme_clothes(H))
		head = /obj/item/clothing/head/flowers/poppy

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_lesser_undead)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/gravemark)