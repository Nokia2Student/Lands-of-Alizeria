GLOBAL_LIST_INIT(highwayman_aggro, world.file2list("strings/rt/highwaymanaggrolines.txt"))

/mob/living/carbon/human/species/human/northern/highwayman
	aggressive=1
	rude = TRUE
	mode = NPC_AI_IDLE
	faction = list("viking", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()
	var/is_silent = FALSE /// Determines whether or not we will scream our funny lines at people.


/mob/living/carbon/human/species/human/northern/highwayman/ambush
	aggressive = 1
	mode = NPC_AI_IDLE
	wander = FALSE

/mob/living/carbon/human/species/human/northern/highwayman/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.highwayman_aggro))
			pointed(target)

/mob/living/carbon/human/species/human/northern/highwayman/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/highwayman/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	is_silent = TRUE


/mob/living/carbon/human/species/human/northern/highwayman/after_creation()
	..()
	job = "Highwayman"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/human/species/human/northern/highwayman)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 30 // 50% More than goblin

/////////////////////////////////
	gender = pick(MALE, FEMALE)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/longstraightponytail,
						/datum/sprite_accessory/hair/head/singlebraid,
						/datum/sprite_accessory/hair/head/shortmessy,
						/datum/sprite_accessory/hair/head/gloomy,
						/datum/sprite_accessory/hair/head/kepthair,
						/datum/sprite_accessory/hair/head/fatherless,
						/datum/sprite_accessory/hair/head/hime,
						/datum/sprite_accessory/hair/head/messy_rt,
						/datum/sprite_accessory/hair/head/inari,))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailyeager,
						/datum/sprite_accessory/hair/head/suave,
						/datum/sprite_accessory/hair/head/royalcurls,
						/datum/sprite_accessory/hair/head/strict,
						/datum/sprite_accessory/hair/head/rows2,
						/datum/sprite_accessory/hair/head/dreadlocks_long,
						/datum/sprite_accessory/hair/head/jay,
						/datum/sprite_accessory/hair/head/grenzelcut,
						/datum/sprite_accessory/hair/head/lowbraid))
	var/beard = pick(list(/datum/sprite_accessory/hair/facial/viking,
						/datum/sprite_accessory/hair/facial/manly,
						/datum/sprite_accessory/hair/facial/longbeard))

	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/datum/bodypart_feature/hair/facial/new_facial = new()

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
	else
		new_hair.set_accessory_type(hairm, null, src)
		new_facial.set_accessory_type(beard, null, src)

	if(prob(50))
		new_hair.accessory_colors = "#5d4d37"
		new_hair.hair_color = "#5d4d37"
		new_facial.accessory_colors = "#5d4d37"
		new_facial.hair_color = "#5d4d37"
		hair_color = "#5d4d37"
	else
		new_hair.accessory_colors = "#352b1c"
		new_hair.hair_color = "#352b1c"
		new_facial.accessory_colors = "#352b1c"
		new_facial.hair_color = "#352b1c"
		hair_color = "#352b1c"

	head.add_bodypart_feature(new_hair)
	head.add_bodypart_feature(new_facial)

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)

	if(organ_eyes)
		if(prob(50))
			organ_eyes.eye_color = "#466691"
			organ_eyes.accessory_colors = "#466691#466691"
		else
			organ_eyes.eye_color = "#38652f"
			organ_eyes.accessory_colors = "#38652f#38652f"

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

	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/human/humnorf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/human/humnorm.txt"))

	update_hair()
	update_body()
///////////////////////////////////////////////

/mob/living/carbon/human/species/human/northern/highwayman/npc_idle()
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

/mob/living/carbon/human/species/human/northern/highwayman/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(2)) // do not make this big or else they NEVER SHUT UP
			emote("laugh")
	. = ..()

/datum/outfit/job/human/species/human/northern/highwayman/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(50))
		mask = /obj/item/clothing/mask/rogue/ragmask/red
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/leather
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	if(prob(50))
		neck = /obj/item/clothing/neck/roguetown/coif
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/angle
	H.STASTR = rand(12,14) //GENDER EQUALITY!!
	H.STASPD = 11
	H.STACON = rand(10,12) //so their limbs no longer pop off like a skeleton
	H.STAEND = 13
	H.STAPER = 10
	H.STAINT = 10
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/iron/short
	else
		r_hand = /obj/item/rogueweapon/mace/cudgel
	if(prob(20))
		r_hand = /obj/item/rogueweapon/sword/falchion/militia
	if(prob(20))
		r_hand = /obj/item/rogueweapon/pick/militia
	if(prob(25))
		l_hand = /obj/item/rogueweapon/shield/wood
	if(prob(10))
		l_hand = /obj/item/rogueweapon/shield/buckler/palloy
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/leather
	H.eye_color = "27becc"
	H.hair_color = "61310f"
	H.facial_hair_color = H.hair_color
	if(H.gender == FEMALE)
		H.hairstyle =  "Messy (Rogue)"
	else
		H.hairstyle = "Messy"
		H.facial_hairstyle = "Beard (Manly)"
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE) // Trash mobs, untrained.
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
