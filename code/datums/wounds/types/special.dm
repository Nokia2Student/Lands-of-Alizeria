/datum/wound/facial
	name = "лицевая травма"
	sound_effect = 'sound/combat/crit.ogg'
	severity = WOUND_SEVERITY_SEVERE
	whp = null
	woundpain = 0
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE

/datum/wound/facial/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/facial/ears
	name = "разрыв барабанных перепонок"
	check_name = span_danger("EARS")
	crit_message = list(
		"Барабанные перепонки разорваны!",
		"Барабанные перепонки лопнули!",
	)
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE
	woundpain = 30 // it REALLY HURTS to have ruptured eardrums

/datum/wound/facial/ears/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EARS)

/datum/wound/facial/ears/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/ears/ears = affected.getorganslot(ORGAN_SLOT_EARS)
	if(ears)
		ears.Remove(affected)
		ears.forceMove(affected.drop_location())

/datum/wound/facial/eyes
	name = "эвисцерация глаза"
	check_name = span_warning("EYE")
	crit_message = list(
		"Глаз проткнут!",
		"Глаз выбит!",
		"Глаз уничтожен!",
	)
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE
	var/do_blinding = TRUE

/datum/wound/facial/eyes/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EYES)

/datum/wound/facial/eyes/on_mob_gain(mob/living/affected)
	. = ..()
	if(do_blinding)
		affected.Stun(10)
		affected.blind_eyes(5)

/datum/wound/facial/eyes/right
	name = "эвисцерация правого глаза"
	check_name = span_danger("RIGHT EYE")
	crit_message = list(
		"Правый глаз выколот!",
		"Правый глаз выбит!",
		"Правый глаз уничтожен!",
	)

/datum/wound/facial/eyes/right/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/right))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/right/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/right/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/right/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/eyes/left
	name = "эвисцерация левого глаза"
	check_name = span_danger("LEFT EYE")
	crit_message = list(
		"Левый глаз выколот!",
		"Левый глаз выбит!",
		"Левый глаз уничтожен!",
	)

/datum/wound/facial/eyes/left/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/left))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/left/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/left/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/left/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/tongue
	name = "глоссэктомия"
	check_name = span_danger("TONGUE")
	crit_message = list(
		"Язык отрезан!",
		"Язык отсечен!",
		"Язык вылетает по дуге!"
	)
	woundpain = 20
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/tongue/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_TONGUE)

/datum/wound/facial/tongue/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/tongue/tongue_up_my_asshole = affected.getorganslot(ORGAN_SLOT_TONGUE)
	if(tongue_up_my_asshole)
		tongue_up_my_asshole.Remove(affected)
		tongue_up_my_asshole.forceMove(affected.drop_location())

/datum/wound/facial/disfigurement
	name = "обезображивание"
	check_name = span_warning("FACE")
	severity = 0
	crit_message = "Лицо изуродовано до неузнаваемости!"
	whp = null
	woundpain = 20
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/disfigurement/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_DISFIGURED, "[type]")

/datum/wound/facial/disfigurement/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_DISFIGURED, "[type]")
	
/datum/wound/facial/disfigurement/nose
	name = "ринотомия"
	check_name = span_warning("NOSE")
	crit_message = list(
		"Нос изуродован до неузнаваемости!",
		"Нос уничтожен!",
	)
	mortal = TRUE
	woundpain = 10

/datum/wound/facial/disfigurement/nose/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")

/datum/wound/facial/disfigurement/nose/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")

/datum/wound/cbt
	name = "перекрут яичка"
	check_name = span_userdanger("<B>NUTCRACK</B>")
	crit_message = list(
		"Яички перекручены!",
		"Яички перекручены!",
	)
	whp = 50
	woundpain = 100
	mob_overlay = ""
	sewn_overlay = ""
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE
	mortal = TRUE

/datum/wound/cbt/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/cbt))
		return FALSE
	return TRUE

/datum/wound/cbt/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("groin", forced = TRUE)
	affected.Stun(20)
	to_chat(affected, span_userdanger("Что-то скручивается в моей промежности!"))
	if(affected.gender != MALE)
		name = "эвисцерация яичника"
		check_name = span_userdanger("<B>EGGCRACK</B>")
		crit_message = list(
			"Яичники перекручены!",
			"Яичники перекручены!",
		)
	else
		name = "перекрут яичка"
		check_name = span_userdanger("<B>NUTCRACK</B>")
		crit_message = list(
			"Яички перекручены!",
			"Яички перекручены!",
		)

/datum/wound/cbt/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(5))
		carbon_owner.vomit(1, stun = TRUE)

/datum/wound/cbt/permanent
	name = "перекрут яичка"
	crit_message = list(
		"Яички уничтожены!",
		"Яички выпотрошены!",
	)
	whp = null

/datum/wound/cbt/permanent/on_mob_gain(mob/living/affected)
	. = ..()
	if(affected.gender != MALE)
		name = "ovarian evisceration"
		check_name = span_userdanger("<B>EGGCRACK</B>")
		crit_message = list(
			"Яичники уничтожены!",
			"Яичники выпотрошены!",
		)
	else
		name = "testicular evisceration"
		check_name = span_userdanger("<B>NUTCRACK</B>")
		crit_message = list(
			"Яички уничтожены!",
			"Яички выпотрошены!",
		)

/datum/wound/scarring
	name = "неизлечимые шрамы"
	check_name = "<span class='userdanger'><B>SCARRED</B></span>"
	severity = WOUND_SEVERITY_SEVERE
	crit_message = list(
		"Глубокий разрез от удара!",
		"Ткани безвозвратно разорваны!",
		"%BODYPART полностью изуродована!",
	)
	sound_effect = 'sound/combat/crit.ogg'
	whp = 80
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE
	sleep_healing = 0
	var/gain_emote = "paincrit"

/datum/wound/scarring/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("scream", TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/scarring/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/scarring))
		return FALSE
	return TRUE

/datum/wound/sunder
	name = "расколотый"
	check_name = "<span class='userdanger'><B>SUNDERED</B></span>"
	crit_message = list(
		"%BODYPART охвачена благословенным огнем!",
	)
	sound_effect = 'sound/combat/crit.ogg'
	whp = 80
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	bypass_bloody_wound_check = FALSE

/datum/wound/sunder/chest
	name = "расколотый люкс"
	check_name = span_artery("<B>SUNDERED LUX</B>")
	crit_message = list(
		"Благословенное пламя вырывается из груди %VICTIM!",
		"Расплавленный люкс брызжет из разорванных ребер %VICTIM!",
	)
	severity = WOUND_SEVERITY_FATAL
	bypass_bloody_wound_check = TRUE
	whp = 100
	sewn_whp = 35
	bleed_rate = 50
	sewn_bleed_rate = 0.8
	woundpain = 100
	sewn_woundpain = 50

/datum/wound/sunder/chest/on_mob_gain(mob/living/affected)
	. = ..()
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.vomit(blood = TRUE)
	var/goodbye = list(\
		"ПСАЙДОН ХВАТАЕТ МОЙ... ЛЮКС?!",\
		"МОЙ ЛЮКС УГАСАЕТ В ЭТОМ ПРОНЗЕННОМ СЕРДЦЕ!",\
		"О, ЧЕРТ!"\
	)
	to_chat(affected, span_userdanger(pick(goodbye)))
	affected.apply_status_effect(/datum/status_effect/debuff/devitalised)
	if(HAS_TRAIT(owner, TRAIT_SILVER_WEAK) && !owner.has_status_effect(STATUS_EFFECT_ANTIMAGIC))
		affected.death()

/datum/wound/sunder/head
	name = "расколотая голова"
	check_name = span_artery("<B>SUNDERED HEAD</B>")
	crit_message = list(
		"Благословенное пламя вырывается из головы %VICTIM!",
		"Голова %VICTIM охвачена СВЯЩЕННЫМ ПЛАМЕНЕМ!",
	)
	severity = WOUND_SEVERITY_FATAL
	bypass_bloody_wound_check = TRUE
	whp = 100
	sewn_whp = 35
	bleed_rate = 50
	sewn_bleed_rate = 0.8
	woundpain = 100
	sewn_woundpain = 50

/datum/wound/sunder/head/on_mob_gain(mob/living/affected)
	. = ..()
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.vomit(blood = TRUE)
	var/goodbye = list(\
		"МОЯ ГОЛОВА, МОЯ ГОЛОВА! ОНА ГОРИТ!!!",\
		"МОЯ ГОЛОВА ОХВАЧЕНА ПЛАМЕНЕМ!!!",\
		"О, ЧЕРТ!"\
	)
	to_chat(affected, span_userdanger(pick(goodbye)))
	if(HAS_TRAIT(owner, TRAIT_SILVER_WEAK) && !owner.has_status_effect(STATUS_EFFECT_ANTIMAGIC))
		affected.death()

/// grievous wounds exist to provide a solution for "two-stage death" - aka where you want someone to DIE IMMEDIATELY upon dismemberment of a crucial bodypart, but not actually lose it.
/// the spiritual intent here is to provide a little bit of protection from accidental decaps
/datum/wound/grievous
	name = "тяжкая рана"
	check_name = span_danger("<B>grievous</B>")
	severity = WOUND_SEVERITY_FATAL
	whp = 150
	woundpain = 100
	sewn_whp = 25
	bleed_rate = 25 // equivalent to carotid artery tear
	sewn_bleed_rate = 0.5
	can_sew = TRUE
	can_cauterize = FALSE
	var/immunity_time = 12 SECONDS // how long the wound actively prevents further dismemberment attempts for

/datum/wound/grievous/on_bodypart_gain(obj/item/bodypart/affected)
	. = ..()
	// ostensibly, the entire point of grievous wounds is that you DIE when you get one, critical weakness or not.
	// this skips the mortal check and just kills you outright. we also give a short window of dismemberment immunity to increase the chances that the zerg pulls back
	if (affected && affected.two_stage_death && !affected.grievously_wounded)
		affected.grievously_wounded = TRUE
		affected.owner?.death()
		bodypart_owner?.dismemberable = FALSE
		addtimer(CALLBACK(src, PROC_REF(reset_dismemberment_immunity)), immunity_time)
		playsound(affected?.owner, 'sound/combat/dismemberment/grievous-behead.ogg', 250, FALSE, -1)
		
/datum/wound/grievous/proc/reset_dismemberment_immunity()
	if (!bodypart_owner || QDELETED(src))
		return
	bodypart_owner?.dismemberable = initial(bodypart_owner?.dismemberable)
	if (bodypart_owner?.skeletonized)
		owner?.visible_message(span_smallred("Delicate craze lines creep up along <b>[owner]</b>'s sundered skull..."))
	else
		owner?.visible_message(span_smallred("The musculature around <b>[owner]</b>'s [bodypart_owner.name] relaxes its agonal seizing..."))

/datum/wound/grievous/remove_from_bodypart()
	bodypart_owner?.grievously_wounded = FALSE
	. = ..()

/datum/wound/grievous/pre_decapitation
	name = "разрушенный позвоночник"

/datum/wound/grievous/pre_skullshatter
	name = "раздробленный череп"

/datum/wound/scorch
	name = "божественное наказание"
	whp = 60  // Lasts a reasonable duration
	woundpain = 0  // Set dynamically in upgrade()
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = FALSE
	critical = FALSE
	bleed_rate = 0
	clotting_rate = 0

/datum/wound/scorch/upgrade(dam, armor)
	// Only add pain based on damage dealt
	woundpain += (dam * 1.5)
	update_name()
	return ..()
