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
	tutorial = "Когда-то ты был обычным человеком среди таких же голодных и злых горожан. Пока знать пряталась за стенами, а жандармы ждали приказов, именно вы вышли на улицы с топорами, молотами и охотничьими ружьями. После революции толпа разошлась по домам, но оружие осталось у тех, кто сумел выжить. Теперь ты возглавляешь Народную Стражу от имени бургомистра. Для одних ты герой восстания, для других - узаконенный бандит. Следи за порядком, собирай людей в трудный час и помни: народ быстро ставит на пьедестал, но ещё быстрее тащит с него вниз, а страшнее народа только цепные псы короны со штыками. Они посадили на них столько повстанцев, что ты сбился со счёта. Помни, что выше тебя всё ещё кто-то есть. Бургомистр ждёт послушания, знать требует защиты, беднота требует справедливости, а жандармы только и ждут момента доказать, что без них город снова захлебнётся в крови. Держи улицы в кулаке, но не сжимай слишком сильно. Иначе однажды ночью в дверь постучат те, с кем ты когда-то стоял плечом к плечу."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/commander
	give_bank_account = 40
	noble_income = 20
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list(CTAG_COMMANDER = 20)
	job_traits = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED, TRAIT_PERFECT_TRACKER, TRAIT_TEMPO, TRAIT_JUSTICARSIGHT, TRAIT_SHARPER_BLADES)
	job_subclasses = list(
		/datum/advclass/commander/classic
	)

/datum/outfit/job/commander
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/commander/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/proc/haltyell
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/living/carbon/human/proc/request_law, /mob/living/carbon/human/proc/request_law_removal, /mob/living/carbon/human/proc/fire_guard)

/datum/advclass/commander/classic
	name = "Commander"
	tutorial = "Управляющий городской стражей. Когда-то давно ты служил лично короне, и именно тебе по справедливости должны были отдать земли Ализерии. Однако либо из-за твоей неверности, либо по какой-то иной прихоти короны - земли были отданы иному наместнику. Как к этому относиться - решать тебе. Морские штормы помогут тебе в случае проведения мятежа, однако жандармы будут явно против подобного действия. Впрочем, можно и отказаться от подобной идеи. Какое тебе дело до лорда, пока городом по факту всё ещё правишь ты?"
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
