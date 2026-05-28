/obj/effect/proc_holder/spell/invoked/wheel
	name = "Колесо"
	desc = "Призовите чистую случайность на цель, изменив её удачу."
	releasedrain = 10
	chargedrain = 0
	chargetime = 3
	range = 1
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/misc/letsgogambling.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 5 MINUTES
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/wheel/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.apply_status_effect(/datum/status_effect/wheel)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/mastersillusion
	name = "Поставить муляж"
	desc = "Создайте исчезающий муляж в вашем подобии."
	releasedrain = 10
	chargedrain = 0
	chargetime = 0
	range = 1
	no_early_release = TRUE
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokeholy
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 30 SECONDS
	miracle = TRUE
	var/firstcast = TRUE
	var/icon/clone_icon

/obj/effect/proc_holder/spell/invoked/mastersillusion/cast(list/targets, mob/living/carbon/human/user = usr)
	if(firstcast)
		to_chat(user, span_italics("...О, о, твой облик так великолепен! Давай подготовим его для трюков!"))
		clone_icon = get_flat_human_icon("[user.real_name] decoy", null, null, DUMMY_HUMAN_SLOT_MANIFEST, GLOB.cardinals, TRUE, user, TRUE) // We can only set our decoy icon once. This proc is sort of expensive on generation.
		firstcast = FALSE
		name = "Иллюзия Мастера"
		to_chat(user, "Ну вот... Идеально.")
		revert_cast()
		return
	var/turf/T = get_turf(user)
	new /mob/living/simple_animal/hostile/rogue/xylixdouble(T, user, clone_icon)
	animate(user, alpha = 0, time = 0 SECONDS, easing = EASE_IN)
	user.mob_timers[MT_INVISIBILITY] = world.time + 7 SECONDS
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living/carbon/human, update_sneak_invis), TRUE), 7 SECONDS)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[user] появляется снова из ниоткуда."), span_notice("Вы снова становитесь видимым.")), 7 SECONDS)
	return TRUE

/mob/living/simple_animal/hostile/rogue/xylixdouble
	name = "Ксиликсианский двойник — Вы не должны это видеть."
	desc = ""
	gender = NEUTER
	mob_biotypes = MOB_HUMANOID
	maxHealth = 20
	health = 20
	canparry = TRUE
	d_intent = INTENT_PARRY
	defprob = 50
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	del_on_death = TRUE
	loot = list(/obj/item/bomb/smoke/decoy)
	can_have_ai = FALSE
	AIStatus = AI_OFF
	ai_controller = /datum/ai_controller/mudcrab // doesnt really matter


/obj/item/bomb/smoke/decoy/Initialize()
	. = ..()
	playsound(loc, 'sound/magic/decoylaugh.ogg', 50)
	explode()

/mob/living/simple_animal/hostile/rogue/xylixdouble/Initialize(mapload, mob/living/carbon/human/copycat, icon/I)
	. = ..()
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/simple_animal, death), TRUE), 7 SECONDS)
	icon = I
	name = copycat.name


/obj/effect/proc_holder/spell/invoked/mockery
	name = "Злая насмешка"
	desc = "Высмеять цель. Как весело!"
	releasedrain = 50
	associated_skill = /datum/skill/misc/music
	recharge_time = 2 MINUTES
	range = 7
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/mockery/cast(list/targets, mob/user = usr)
	playsound(user, 'sound/magic/mockery.ogg', 40, FALSE)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		if(!target.can_hear()) // Vicious mockery requires people to be able to hear you.
			revert_cast()
			return FALSE
		target.apply_status_effect(/datum/status_effect/debuff/viciousmockery, miracle)
		SEND_SIGNAL(user, COMSIG_VICIOUSLY_MOCKED, target)
		record_round_statistic(STATS_PEOPLE_MOCKED)
		return TRUE
	revert_cast()
	return FALSE

// Non-miracle variant for bards and other non-devotion classes
/obj/effect/proc_holder/spell/invoked/mockery/bard
	miracle = FALSE

/obj/effect/proc_holder/spell/invoked/mockery/invocation(mob/user = usr)
	if(ishuman(user))
		switch(pick(1,2,3,4,5,6,7,8,9,10,11,12,13))
			if(1)
				user.say("Твоя мать была русалкой, а отец пахнул можжевельником!", forced = "spell")
			if(2)
				user.say("Что ты будешь делать с лицом, когда Архидьяволу понадобится его задница обратно?!", forced = "spell")
			if(3)
				user.say("Да устоят твои клинки, как и твои любовные части!", forced = "spell")
			if(4)
				user.say("Это лицо даже Эора не смогла бы полюбить!", forced = "spell")
			if(5)
				user.say("Твоё дыхание пахнет сырым маслом и дешёвым пивом!", forced = "spell")
			if(6)
				user.say("Я кусаю свой большой палец, сэр!", forced = "spell")
			if(7)
				user.say("Но довольно слов — защищайтесь!", forced = "spell")
			if(8)
				user.say("Моя бабушка дерётся лучше тебя!", forced = "spell")
			if(9)
				user.say("Не одолжить ли тебе мои очки? Иди и возьми!", forced = "spell")
			if(10)
				user.say("Сколько же спаррингов нужно было провести, чтобы стать настолько ужасным?!", forced = "spell")
			if(11)
				user.say("Тебе, возможно, нужен кузнец — ибо ты плохо снаряжён для битвы ума!", forced = "spell")
			if(12)
				user.say("Похоже, ты PSY-DONE! Нет? Слишком рано? Ладно.", forced = "spell")
			if(13)
				user.say("Да покарает Равокс твоего бесполезного наставника, сэр!", forced = "spell")

/datum/status_effect/debuff/viciousmockery
	id = "viciousmockery"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/viciousmockery
	duration = 600 // One minute
	effectedstats = list("strength" = -1, "speed" = -1,"endurance" = -1, "intelligence" = -3)

/datum/status_effect/debuff/viciousmockery/on_creation(mob/living/new_owner, is_miracle_cast = FALSE)
	if(is_miracle_cast)
		alert_type = /atom/movable/screen/alert/status_effect/debuff/viciousmockery/xylixian
	else
		alert_type = /atom/movable/screen/alert/status_effect/debuff/viciousmockery/bard
	return ..()

/atom/movable/screen/alert/status_effect/debuff/viciousmockery
	name = "Злая насмешка"
	icon_state = "muscles"

/atom/movable/screen/alert/status_effect/debuff/viciousmockery/bard
	desc = "<span class='warning'>ЭТОТ НАГЛЫЙ БАРД! АРГХ!</span>\n"

/atom/movable/screen/alert/status_effect/debuff/viciousmockery/xylixian
	desc = "<span class='warning'>ЭТОТ НАГЛЫЙ КСИЛИКСИАНЕЦ! АРГХ!</span>\n"

/obj/effect/proc_holder/spell/self/xylixslip
	name = "Ксиликсианский уход"
	desc = "Скользните вперёд на умеренное расстояние."
	overlay_state = "xylix_slip"
	releasedrain = 10
	chargedrain = 0
	chargetime = 0
	chargedloop = /datum/looping_sound/invokeholy
	sound = null
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 12 SECONDS
	devotion_cost = 30
	miracle = TRUE
	var/leap_dist = 4	//3 tiles (+1 to account for origin tile)
	var/static/list/sounds = list('sound/magic/xylix_slip1.ogg','sound/magic/xylix_slip2.ogg','sound/magic/xylix_slip3.ogg','sound/magic/xylix_slip4.ogg')

/obj/effect/proc_holder/spell/self/xylixslip/cast(list/targets, mob/user = usr)
	. = ..()
	if(!ishuman(user))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = user

	if(H.IsImmobilized() || !(H.mobility_flags & MOBILITY_STAND))
		revert_cast()
		return FALSE

	if(H.IsOffBalanced())
		H.visible_message(span_warning("[H] теряет равновесие!"))
		var/turnangle = (prob(50) ? 270 : 90)
		var/turndir = turn(dir, turnangle)
		var/dist = rand(1, 2)
		var/current_turf = get_turf(H)
		var/target_turf = get_ranged_target_turf(current_turf, turndir, dist)
		H.throw_at(target_turf, dist, 1, H, TRUE)
		playsound(H,'sound/magic/xylix_slip_fail.ogg', 100)
		H.Knockdown(10)
		return TRUE
	else
		var/current_turf = get_turf(H)
		var/turf/target_turf = get_ranged_target_turf(current_turf, H.dir, leap_dist)
		H.visible_message(span_warning("[H] ускользает!"))
		H.throw_at(target_turf, leap_dist, 1, H, TRUE)
		if(target_turf.landsound)
			playsound(target_turf, target_turf.landsound, 100, FALSE)
		H.emote("jump", forced = TRUE)
		H.OffBalance(8 SECONDS)
		if(prob(50))
			playsound(H, pick(sounds), 100, TRUE)
		return TRUE

/obj/effect/proc_holder/spell/self/xylixslip/kazengun
	name = "Ксиджианский уход"

/obj/effect/proc_holder/spell/invoked/projectile/fetch/miracle
	name = "Божественное притяжение"
	miracle = TRUE
	devotion_cost = 10
	invocation = null
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/projectile/repel/miracle
	name = "Божественный отпор"
	miracle = TRUE
	devotion_cost = 14
	invocation = null
	associated_skill = /datum/skill/magic/holy
