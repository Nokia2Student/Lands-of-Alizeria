/datum/job/roguetown/ntailor
	title = "Noble Tailor"
	flag = NOBLETAILOR
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = ALIZ_NOBLE_RACES
	tutorial = "Изысканные шелка, качественные ремни и куртки... Всe, созданное тобой - предмет искусства. На континенте твой талант был по достоинству признан, причeм настолько, что количество покушений на тебя от твоих конкурентов превысило все допустимые границы. Вариантов у тебя оставалось не так много и ты принял решение отправиться туда, куда за тобой вряд ли кто-то пойдeт. Твои продажи значительно снизились, однако в этой снежной глуши ты наконец можешь удовлетворить потребности своей творческой натуры в тишине и спокойствии. А ещe ты по 'удачному' совпадению являешься единственным носителем голубой крови и хотя бы какого-нибудь дворянского титула среди всей экспедиционной группы. Это не так уж и сильно делает тебя лучше всех остальных, однако если к вам наведаются такие же дворяне - только ты сможешь найти с ними общий язык."
	display_order = JDO_NOBLETAILOR

	outfit = /datum/outfit/job/ntailor
	give_bank_account = 40
	noble_income = 10 // Guild Support - The sole Money Role outside of the keep, should help them keep pace a bit + pick up if they get completely knocked out of coin.
	min_pq = 0
	max_pq = null
	required = TRUE
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'
	social_rank = SOCIAL_RANK_YEOMAN

	job_traits = list(TRAIT_SEEPRICES, TRAIT_DYES, TRAIT_NOBLE)

	advclass_cat_rolls = list(CTAG_NTAIL = 6)
	job_subclasses = list(
		/datum/advclass/ntailor
	)

/datum/advclass/ntailor
	name = "Noble Tailor"
	tutorial = "Изысканные шелка, качественные ремни и куртки... Всe, созданное тобой - предмет искусства. На континенте твой талант был по достоинству признан, причeм настолько, что количество покушений на тебя от твоих конкурентов превысило все допустимые границы. Вариантов у тебя оставалось не так много и ты принял решение отправиться туда, куда за тобой вряд ли кто-то пойдeт. Твои продажи значительно снизились, однако в этой снежной глуши ты наконец можешь удовлетворить потребности своей творческой натуры в тишине и спокойствии. А ещe ты по 'удачному' совпадению являешься единственным носителем голубой крови и хотя бы какого-нибудь дворянского титула среди всей экспедиционной группы. Это не так уж и сильно делает тебя лучше всех остальных, однако если к вам наведаются такие же дворяне - только ты сможешь найти с ними общий язык."
	outfit = /datum/outfit/job/ntailor
	category_tags = list(CTAG_NTAIL)
	allowed_races = ALIZ_NOBLE_RACES

	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_INT = 1,
		STATKEY_CON = -2,
		STATKEY_STR = 1
	)

	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/guns = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/tanning = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/ntailor/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)

	head = /obj/item/clothing/head/roguetown/articap
	mask = /obj/item/clothing/mask/rogue/spectacles/black
	backl = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket
	id = /obj/item/scomstone
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather/aristocratic
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/huntingknife/combat
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	pants = /obj/item/clothing/under/roguetown/trou/artipants
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	backpack_contents = list(
		/obj/item/needle,
		/obj/item/storage/keyring/tailor,
		/obj/item/dye_brush,
		/obj/item/recipe_book/sewing,
		/obj/item/book/rogue/swatchbook,
		/obj/item/recipe_book/leatherworking
		)