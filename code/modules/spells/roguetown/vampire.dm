/obj/effect/proc_holder/spell/targeted/shapeshift/vampire
	do_gibs = FALSE
	show_true_name = FALSE
	invocation_type = "shout"
	recharge_time = 30 SECONDS
	cooldown_min = 30 SECONDS
	die_with_shapeshifted_form = FALSE
	knockout_on_death = 0
	escape_grabs = TRUE  // Vampires can escape grabs when transforming

/obj/effect/proc_holder/spell/targeted/shapeshift/vampire/bat
	name = "Форма летучей мыши"
	desc = ""
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/bat

/obj/effect/proc_holder/spell/targeted/shapeshift/vampire/gaseousform
	name = "Форма тумана"
	desc = ""
	gesture_required = FALSE // can transform while chained because mist bro
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/gaseousform

/obj/effect/proc_holder/spell/targeted/shapeshift/vampire/crow
	name = "Форма зада"
	overlay_state = "zad"
	desc = ""
	gesture_required = TRUE
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/bat/crow
	sound = 'sound/vo/mobs/bird/birdfly.ogg'

/obj/effect/proc_holder/spell/targeted/shapeshift/vampire/rat
	name = "Форма крысы"
	desc = ""
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/smallrat

/obj/effect/proc_holder/spell/targeted/shapeshift/vampire/cabbit
	name = "Форма каббита"
	desc = ""
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/cabbit

/obj/effect/proc_holder/spell/self/disguise
	name = "Маскировка"
	desc = ""
	invocation = ""
	recharge_time = 30 SECONDS

/obj/effect/proc_holder/spell/self/disguise/cast(list/targets, mob/living/carbon/human/user)
	var/datum/component/vampire_disguise/disguise_comp = user.GetComponent(/datum/component/vampire_disguise)
	if(!disguise_comp)
		to_chat(user, span_warning("Я не могу замаскироваться."))
		return
	if(disguise_comp.disguised)
		disguise_comp.remove_disguise(user)
	else
		disguise_comp.apply_disguise(user)
