/mob/living/carbon/human/species/human/northern/nkboss
	aggressive=1
	rude = TRUE
	mode = NPC_AI_IDLE
	faction = list("undead")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()
	var/is_silent = FALSE /// Determines whether or not we will scream our funny lines at people.


/mob/living/carbon/human/species/human/northern/nkboss/ambush
	aggressive=1

	wander = TRUE

/mob/living/carbon/human/species/human/northern/nkboss/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.searaider_aggro))
			pointed(target)

/mob/living/carbon/human/species/human/northern/nkboss/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/nkboss/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	is_silent = TRUE


/mob/living/carbon/human/species/human/northern/nkboss/after_creation()
	..()
	job = "Adventurer"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ANTIMAGIC, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BIGGUY, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/human/species/human/northern/nkboss)
	gender = pick(MALE, FEMALE)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/longstraightponytail,
						/datum/sprite_accessory/hair/head/singlebraid,
						/datum/sprite_accessory/hair/head/inari))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailyeager,
						/datum/sprite_accessory/hair/head/lowbraid))
	var/beard = pick(list(/datum/sprite_accessory/hair/facial/viking,
						/datum/sprite_accessory/hair/facial/manly,
						/datum/sprite_accessory/hair/facial/longbeard))
	head.sellprice = 300 // 50% More than gobbo

	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/datum/bodypart_feature/hair/facial/new_facial = new()

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
	else
		new_hair.set_accessory_type(hairm, null, src)
		new_facial.set_accessory_type(beard, null, src)

	if(prob(50))
		new_hair.accessory_colors = "#f2f2f2"
		new_hair.hair_color = "#f2f2f2"
		new_facial.accessory_colors = "#f2f2f2"
		new_facial.hair_color = "#f2f2f2"
		hair_color = "#f2f2f2"
	else
		new_hair.accessory_colors = "#f2f2f2"
		new_hair.hair_color = "#f2f2f2"
		new_facial.accessory_colors = "#f2f2f2"
		new_facial.hair_color = "#f2f2f2"
		hair_color = "#f2f2f2"

	if(gender == FEMALE)
		var/obj/item/organ/breasts/breasts = new()
		breasts.Insert(src, TRUE, FALSE)

		var/obj/item/organ/vagina/vagina = new()
		vagina.Insert(src, TRUE, FALSE)
	else
		var/obj/item/organ/penis/penis = new()
		penis.Insert(src, TRUE, FALSE)

		var/obj/item/organ/testicles/testicles = new()
		testicles.Insert(src, TRUE, FALSE)

	head.add_bodypart_feature(new_hair)
	head.add_bodypart_feature(new_facial)

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)

	if(organ_eyes)
		organ_eyes.eye_color = "#ff0000"
		organ_eyes.accessory_colors = "#ff0000#ff0000"

	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/human/vikingf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/human/vikingm.txt"))
	update_hair()
	update_body()

/mob/living/carbon/human/species/human/northern/nkboss/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))

/mob/living/carbon/human/species/human/northern/nkboss/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(20)) // ignores is_silent because they should at least still be able to scream at people!
			emote(pick("rage","warcry","laugh"))
	. = ..()

/datum/outfit/job/human/species/human/northern/nkboss/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers/nk
	head = /obj/item/clothing/head/roguetown/helmet/otavan/nk
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/ornate/nk
	neck = /obj/item/clothing/neck/roguetown/gorget
	gloves = /obj/item/clothing/gloves/roguetown/angle
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	pants = /obj/item/clothing/under/roguetown/platelegs/nk
	cloak = /obj/item/clothing/cloak/championt/nk
	if(prob(50))
		r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel/slayer
		l_hand = /obj/item/rogueweapon/shield/tower/metal
	else
		r_hand = /obj/item/rogueweapon/stoneaxe/battle/slayer
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	H.STASPD = 15
	H.STACON = 15 //so their limbs no longer pop off like a skeleton
	H.STAEND = 15
	H.STAPER = 15
	H.STAINT = 15
	H.STASTR = 20
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 6, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 6, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
