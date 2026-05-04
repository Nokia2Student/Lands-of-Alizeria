// Druid
/obj/effect/proc_holder/spell/targeted/blesscrop
	name = "Благословение посевов"
	desc = "Благословляет до 5 ближайших посевов, воскрешая их и давая питание и воду, если нужно."
	range = 5
	overlay_state = "blesscrop"
	releasedrain = 30
	recharge_time = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "The Treefather commands thee, be fruitful!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/targeted/blesscrop/cast(list/targets,mob/user = usr)
	. = ..()
	var/growed = FALSE
	var/amount_blessed = 0
	for(var/obj/structure/soil/soil in view(4))
		soil.bless_soil()
		growed = TRUE
		amount_blessed++
		// Blessed only up to 5 crops
		if(amount_blessed >= 5)
			break
	if(growed)
		visible_message(span_green("[usr] благословляет ближайшие посевы Милостью Отца Древ!"))
	return growed

//At some point, this spell should Awaken beasts, allowing a ghost to possess them. Not for this PR though.
/obj/effect/proc_holder/spell/targeted/beasttame
	name = "Усмирение зверя"
	desc = "Успокоить зверя, уняв его ярость."
	range = 5
	overlay_state = "tamebeast"
	releasedrain = 30
	recharge_time = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Be still and calm, brotherbeast."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 20
	var/beast_tameable_factions = list("saiga", "chickens", "cows", "goats", "wolfs", "spiders")

/obj/effect/proc_holder/spell/targeted/beasttame/cast(list/targets,mob/user = usr)
	. = ..()
	visible_message(span_green("[usr] успокаивает звериную кровь шёпотом Отца Древ."))
	var/tamed = FALSE
	for(var/mob/living/simple_animal/hostile/retaliate/animal in get_hearers_in_view(2, usr))
		if((animal.mob_biotypes & MOB_UNDEAD))
			continue
		if(faction_check(animal.faction, beast_tameable_factions))
			animal.tamed(TRUE)
			animal.aggressive = FALSE
			if(animal.ai_controller)
				animal.ai_controller.clear_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET)
				animal.ai_controller.clear_blackboard_key(BB_BASIC_MOB_RETALIATE_LIST)
				animal.ai_controller.set_blackboard_key(BB_BASIC_MOB_TAMED, TRUE)
			to_chat(usr, "С помощью Отца Древ вы унимаете гнев [animal].")
	return tamed

/obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	name = "Призыв Жалоносцев"
	desc = "Призывает жалоносцев, чтобы поразить электричеством тех, кто не верен Дендору."
	range = 1
	overlay_state = "blesscrop"
	releasedrain = 30
	recharge_time = 30 SECONDS
	chargetime = 2 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/items/dig_shovel.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Treefather light the way!"
	invocation_type = "shout"
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/targeted/conjure_glowshroom/cast(list/targets, mob/user = usr)
	// Prevent wildshape forms from casting
	if(istype(user, /mob/living/carbon/human/species/wildshape))
		to_chat(user, span_warning("Я не могу применить это в звериной форме!"))
		revert_cast()
		return FALSE
	. = ..()
	var/turf/target_turf = get_step(user, user.dir)
	var/turf/target_turf_two = get_step(target_turf, turn(user.dir, 90))
	var/turf/target_turf_three = get_step(target_turf, turn(user.dir, -90))

	if(!locate(/obj/structure/glowshroom) in target_turf)
		new /obj/structure/glowshroom/dendorite(target_turf)

	if(!locate(/obj/structure/glowshroom) in target_turf_two)
		new /obj/structure/glowshroom/dendorite(target_turf_two)

	if(!locate(/obj/structure/glowshroom) in target_turf_three)
		new /obj/structure/glowshroom/dendorite(target_turf_three)
	return TRUE


/obj/effect/proc_holder/spell/targeted/conjure_vines
	name = "Росток лозы"
	desc = "Вырастить лозы поблизости."
	overlay_state = "blesscrop"
	releasedrain = 90
	invocation = "Treefather, bring forth vines."
	invocation_type = "shout"
	devotion_cost = 90
	range = 1
	recharge_time = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/items/dig_shovel.ogg'
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE

/obj/effect/proc_holder/spell/targeted/conjure_vines/cast(list/targets, mob/user = usr)
	. = ..()
	var/turf/target_turf = get_step(user, user.dir)
	var/turf/target_turf_two = get_step(target_turf, turn(user.dir, 90))
	var/turf/target_turf_three = get_step(target_turf, turn(user.dir, -90))
	if(!locate(/obj/structure/vine) in target_turf)
		new /obj/structure/vine/dendor(target_turf)
	if(!locate(/obj/structure/vine) in target_turf_two)
		new /obj/structure/vine/dendor(target_turf_two)
	if(!locate(/obj/structure/vine) in target_turf_three)
		new /obj/structure/vine/dendor(target_turf_three)

	return TRUE


/obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	name = "Зов Луны"
	desc = "Воззвать к тайнам скрытой тверди, чтобы говорить с проклятыми луной."
	overlay_state = "howl"
	antimagic_allowed = FALSE
	recharge_time = 600
	ignore_cockblock = TRUE
	use_language = TRUE
	miracle = TRUE
	var/first_cast = FALSE

/obj/effect/proc_holder/spell/self/howl/call_of_the_moon/cast(mob/living/carbon/human/user)
	// only usable at night
	if (!GLOB.tod == "night")
		to_chat(user, span_warning("Я должен дождаться восхода скрытой луны, чтобы воззвать к ней."))
		revert_cast()
		return
	// if they don't have beast language somehow, give it to them
	if (!user.has_language(/datum/language/beast))
		user.grant_language(/datum/language/beast)
		to_chat(user, span_boldnotice("Остаток скрытой луны высоко в небе открывает Его истину: знание звериного языка всегда было во мне."))

	if (!first_cast)
		to_chat(user, span_boldwarning("Так шепчут Земля и Воздух: Зов Луны священен, и делиться знаниями, полученными от него, с теми, кто не от Него, — ГРЕХ."))
		to_chat(user, span_boldwarning("Берегись, дитя Отца Древ."))
		first_cast = TRUE
	. = ..()

/obj/effect/proc_holder/spell/invoked/spiderspeak
	name = "Речь пауков"
	desc = "Позволяет цели говорить с пауками, избегая их атак."
	overlay_state = "tamebeast"
	releasedrain = 15
	chargedrain = 0
	chargetime = 1 SECONDS
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/churn.ogg'
	invocation = "Spiders of psydonia, allow me to pass safely!"
	invocation_type = "shout"
	miracle = TRUE
	associated_skill = /datum/skill/magic/holy
	recharge_time = 4 SECONDS
	miracle = TRUE
	devotion_cost = 25

/obj/effect/proc_holder/spell/invoked/spiderspeak/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		user.visible_message("<font color='yellow'>[user] наполняет [target] вьющимися прядями спектральной паутины!</font>")
		target.visible_message("<font color='yellow'>Вы чувствуете, как ваш язык странно меняется, издавая необычные щёлкающие звуки.</font>")
		target.apply_status_effect(/datum/status_effect/buff/spider_speak)
		return TRUE
	revert_cast()
	return FALSE
