/datum/job/roguetown/guardsman
	title = "Militiaman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES // same as town guard
	disallowed_races = list(
		/datum/species/lamia,
	)
	tutorial = "Ты не выпускник академии и не холёный жандарм в дорогом мундире. Ты один из тех, кто во время смуты взял в руки оружие и не побоялся пустить его в дело. Ты помнишь баррикады, дым, крики на площадях и тела тех, кто верил, что после победы всё станет честнее. После революции новым властям понадобились люди, умеющие держать строй, патрулировать улицы и ломать зубы тем, кто путает свободу с вседозволенностью. Так народное ополчение стало Народной Стражей. Теперь ты служишь городу за жалование, пайку и право носить оружие открыто. Жалование скромное, пайка унылая, а потому многие ищут доход там, где закон смотрит в сторону: с торговцев за спокойную улицу, с трактирщиков за тишину ночью, с лавочников за защиту от чужих проблем. Помни лишь одно: пока ты хозяин своего квартала, но если появятся жандармы, придётся вспомнить, кто здесь настоящая власть. Горожане зовут вас защитниками, пока не приходится платить."
	display_order = JDO_TOWNGUARD
	whitelist_req = FALSE

	outfit = /datum/outfit/job/guardsman
	advclass_cat_rolls = list(CTAG_WATCH = 20)

	virtue_restrictions = list(
		/datum/virtue/utility/noble,
		/datum/virtue/utility/blueblooded,
	)

	give_bank_account = 16
	min_pq = 0 //Introductory guard role, but still requires knowledge of escalation.
	max_pq = null
	round_contrib_points = 2
	job_traits = list(TRAIT_HEAVYARMOR, TRAIT_PEASANTMILITIA)
	cmode_music = 'sound/music/combat_guard.ogg'

/datum/outfit/job/guardsman
	job_bitflag = BITFLAG_GARRISON

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/tstabard/townguard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/outfit/job/guardsman
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	wrists = /obj/item/clothing/wrists/roguetown/bracers		//Would seperate to leather bracers for archer for dodge but - funnily, armor class doesn't exist on bracers.
	backpack_contents = list(/obj/item/signal_horn = 1)
	id = /obj/item/scomstone

/*Design philosophy: Men and women from various areas of life, from hunters to street-brawlers and more 'veteran' levy-men. Know less skills overall than Bog, but far more specialized.
Footsman is basically a regular foots-soldier with gear to combat criminals, specializes in maces, polearms, and decent flail/sword training.
Archer is basically a 'bounty-catcher' in function, less specialized at close-quarters, beyond knives, but very capable of downing a fleeing criminal.*/
/datum/advclass/watchman/footsman
	name = "Watch Footsman"
	tutorial = "You are a footsman of the Town Watch. Well versed in various close-quarters weapons and aprehending street-savy criminals."
	outfit = /datum/outfit/job/guardsman/footsman

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/guardsman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)

	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet
	cloak = /obj/item/clothing/cloak/stabard/townhood
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/ornate
	beltr = /obj/item/rogueweapon/sword
	backl = /obj/item/storage/backpack/rogue/satchel		//Maybe give a buckler? Gave wood because 40 coverage is better than 10 but dunno.
	backr = /obj/item/rogueweapon/eaglebeak/lucerne
	beltl = /obj/item/storage/belt/rogue/pouch/coins
	belt = /obj/item/storage/belt/rogue/leather/battleskirt/town
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/angle
	neck = /obj/item/clothing/neck/roguetown/chaincoif/full
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/alizeria/townguard)
	H.verbs |= /mob/proc/haltyell

/datum/advclass/watchman/archer
	name = "Watch Archer"
	tutorial = "You are an archer of the Town Watch. Once a hunter, now a man-hunter for your lord. Rooftops, bows, and daggers are your best friend."
	outfit = /datum/outfit/job/guardsman/archer

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 5, TRUE)		//Why master? Because all it does is effect draw time, which is strength x skill / 1.2. (Bow is just skill / 1.0). You get poor bonus strength, so you get skill to offset.
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)		//Maybe take away? Leaving for now just as a fall-back for non-lethal ability.
	H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)	//For basic crafting; you'll need it due to relegated support role.
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)	//Likely hunter background; very crappy basic skill.
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("perception", 2)
	H.change_stat("intelligence", 1)		//Gets some int for crafting + feinting, makes up for no medium armor training along with the speed.
	H.change_stat("constitution", 1)
	H.change_stat("speed", 2)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)		//You don't get medium armor training, instead you get a bonus to light armor usage.

	head = /obj/item/clothing/head/roguetown/roguehood/red		//To-do: Make a guard hood come in kingdom's colors.
	armor = /obj/item/clothing/suit/roguetown/armor/leather		//So they get default-dodge expert usage.
	beltr = /obj/item/quiver/bolts
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltl = /obj/item/storage/keyring/alizeria/townguard
	belt = /obj/item/storage/belt/rogue/leather/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	cloak = /obj/item/clothing/cloak/tstabard/townguard
	belt = /obj/item/storage/belt/rogue/leather/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1)
	H.verbs |= /mob/proc/haltyell
	neck = /obj/item/clothing/neck/roguetown/chaincoif

// Added to baliff under assumption townguard.dm will not be enabled.
// /mob/proc/haltyell()
//	set name = "HALT!"
//	set category = "Noises"
//	emote("haltyell")
