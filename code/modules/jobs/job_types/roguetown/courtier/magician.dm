/datum/job/roguetown/magician
	title = "Magician"
	flag = WIZARD
	department_flag = AVANGARD
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = ALIZ_ALL_RACES		//Nobility, no construct
	allowed_sexes = list(MALE, FEMALE)
	spells = list(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation, /obj/effect/proc_holder/spell/self/message)
	display_order = JDO_MAGICIAN
	tutorial = "Многие считают тебя умнейшим и светлейшим человеком в Авангарде, который продолжает сидеть в своей башне, в самой глуши этого мира, что бы докопаться до истины трагедии в столице. Но правда о тебе - менее прозаична. Ты был не самым лучшим учеником в коллегии магов и скорее всего вообще никогда не хотел им быть. Прямо после жарких ссор с вышестоящими магами настал момент твоего назначения на 'пост' и что бы ты перестал доставлять всем проблемы - тебя сослали следить за состоянием барьера, с которым ничего не происходило уже тысячу лет. Возможно тебя это огорчило, а возможно ты наконец обрадовался возможности покинуть общество заумных выскочек. Так или иначе - башня теперь твоя и ты практически не скован в изучении запретных знаний... Ну или можешь и дальше продолжать смотреть за жизнями людей через свой шар, скучающе сидя на кресле, как это делают остальные самые глупейшие и умнейшие маги."
	outfit = /datum/outfit/job/magician
	whitelist_req = FALSE
	give_bank_account = 120
	min_pq = 0 //High potential for abuse, lovepotion/killersice/greater fireball is not for the faint of heart
	max_pq = null
	round_contrib_points = 2
	cmode_music = 'sound/music/combat_bandit_mage.ogg'
	advclass_cat_rolls = list(CTAG_COURTMAGE = 2)
	social_rank = SOCIAL_RANK_YEOMAN // "as justicar and trusted advisor to their reign" to the duke, basically the duke's right hand guy after the Hand

	// Can't get very far as a magician if you can't chant spells now can you?
	vice_restrictions = list(/datum/charflaw/mute)
	job_traits = list(TRAIT_ARCYNE_T4, TRAIT_TALENTED_ALCHEMIST)

	job_subclasses = list(
		/datum/advclass/courtmage
	)

/datum/advclass/courtmage
	name = "Magician"
	tutorial = "Многие считают тебя умнейшим и светлейшим человеком в Авангарде, который продолжает сидеть в своей башне, в самой глуши этого мира, что бы докопаться до истины трагедии в столице. Но правда о тебе - менее прозаична. Ты был не самым лучшим учеником в коллегии магов и скорее всего вообще никогда не хотел им быть. Прямо после жарких ссор с вышестоящими магами настал момент твоего назначения на 'пост' и что бы ты перестал доставлять всем проблемы - тебя сослали следить за состоянием барьера, с которым ничего не происходило уже тысячу лет. Возможно тебя это огорчило, а возможно ты наконец обрадовался возможности покинуть общество заумных выскочек. Так или иначе - башня теперь твоя и ты практически не скован в изучении запретных знаний... Ну или можешь и дальше продолжать смотреть за жизнями людей через свой шар, скучающе сидя на кресле, как это делают остальные самые глупейшие и умнейшие маги."
	outfit = /datum/outfit/job/magician/basic
	category_tags = list(CTAG_COURTMAGE)

	subclass_stats = list(
		STATKEY_INT = 4,// Automatic advanced magic for most spells. (I.E summon weapon being upgraded to steel from iron/etc)
		STATKEY_STR = -1,
		STATKEY_CON = -1,
	)

	subclass_spellpoints = 36

	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_LEGENDARY,
		/datum/skill/craft/alchemy = SKILL_LEVEL_MASTER,
		/datum/skill/magic/arcane = SKILL_LEVEL_MASTER,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/magician
	job_bitflag = BITFLAG_ROYALTY
	has_loadout = TRUE

/datum/outfit/job/magician/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/magic/arcane, 6, TRUE)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
		H?.mind.adjust_spellpoints(6)
		H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo,
	  		/datum/patron/inhumen/matthios,
	   		/datum/patron/inhumen/graggar,
	   		/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_cult.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)

/datum/outfit/job/magician/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	neck = /obj/item/clothing/neck/roguetown/talkstone
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	beltr = /obj/item/storage/keyring/mage
	beltl = /obj/item/storage/magebag/starter
	id = /obj/item/scomstone
	r_hand = /obj/item/rogueweapon/woodstaff/riddle_of_steel/magos
	backl = /obj/item/storage/backpack/rogue/satchel
	. = ..()
	if(H.age == AGE_OLD)
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		head = /obj/item/clothing/head/roguetown/wizhat
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
		belt = /obj/item/storage/belt/rogue/leather/plaquesilver
		cloak = /obj/item/clothing/cloak/black_cloak

	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/poison,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/recipe_book/alchemy,
		/obj/item/recipe_book/magic,
		/obj/item/book/spellbook,
		/obj/item/rogueweapon/huntingknife/idagger/silver/arcyne
	)
