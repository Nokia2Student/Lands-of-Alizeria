/datum/job/roguetown/merchant
	title = "Quartermaster"
	flag = MERCHANT
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = ALIZ_ALL_RACES
	tutorial = "Когда-то давно у тебя была собственная лавка, а также внушительные связи в торговой сфере. Почти всё из этого пропало, когда усилиями наместника в торговле появилась монополия. Из-за страха оказаться на улице в конечном итоге ты согласился работать на корону, помогая бургомистру вести мелкие торговые сделки. Кто знает, может когда-нибудь тебе удастся вернуть былое величие в городских стенах?"
	selection_color = JCOLOR_YEOMAN
	display_order = JDO_MERCHANT

	outfit = /datum/outfit/job/merchant
	give_bank_account = 22
	noble_income = 50 // Guild Support - The sole Money Role outside of the keep, should help them keep pace a bit + pick up if they get completely knocked out of coin.
	min_pq = 0
	max_pq = null
	required = TRUE
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'
	social_rank = SOCIAL_RANK_YEOMAN


	virtue_restrictions = list(/datum/virtue/utility/blacksmith)

	job_traits = list(TRAIT_SEEPRICES, TRAIT_CICERONE)

	advclass_cat_rolls = list(CTAG_MERCH = 2)
	job_subclasses = list(
		/datum/advclass/merchant
	)

/datum/advclass/merchant
	name = "Quartermaster"
	tutorial = "You were born into wealth, learning from before you could talk about the basics of mathematics. \
	Counting coins is a simple pleasure for any person, but you've made it an art form. \
	These people are addicted to your wares, and you are the literal beating heart of this economy: \
	Don't let these filth-covered troglodytes ever forget that."
	outfit = /datum/outfit/job/merchant/basic
	category_tags = list(CTAG_MERCH)
	allowed_races = ALIZ_ALL_RACES

	subclass_stats = list(
		STATKEY_PER = 3,
		STATKEY_INT = 2,
		STATKEY_STR = -1
	)

	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/stealing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/merchant/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)

	backpack_contents = /obj/item/rogueweapon/huntingknife/idagger/navaja
	neck = /obj/item/clothing/neck/roguetown/horus
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/merchant
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/keyring/merchant
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/gold
	backr = /obj/item/storage/backpack/rogue/satchel
	if(should_wear_masc_clothes(H))
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	else if(should_wear_femme_clothes(H))
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular/pileappraisal)
