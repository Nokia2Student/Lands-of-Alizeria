GLOBAL_LIST_INIT(bum_quotes, world.file2list("strings/rt/bumlines.txt"))
GLOBAL_LIST_INIT(bum_aggro, world.file2list("strings/rt/bumaggrolines.txt"))

/mob/living/carbon/human/species/human/northern/bum
	aggressive=1
	rude = TRUE
	mode = NPC_AI_IDLE
	faction = list("bums", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()

	wander = FALSE

/mob/living/carbon/human/species/human/northern/bum/ambush
	aggressive=1

	wander = TRUE

/mob/living/carbon/human/species/human/northern/bum/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(GLOB.bum_aggro))
			pointed(target)

/mob/living/carbon/human/species/human/northern/bum/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/bum/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/human/northern/bum/after_creation()
	..()
	job = "Beggar"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/vagrant)

/////////////////////////////////
	gender = pick(MALE, FEMALE)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
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


/mob/living/carbon/human/species/human/northern/bum/npc_idle()
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
	if(prob(3))
		say(pick(GLOB.bum_quotes))
	if(prob(3))
		emote(pick("laugh","burp","yawn","grumble","mumble","blink_r","clap"))