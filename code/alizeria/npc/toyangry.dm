/obj/structure/toy_doll_inactive
	name = "toy doll"
	desc = "Почти обычная кукла. Её одежда..- это часть её самой?..."
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "toy1"
	density = TRUE
	anchored = TRUE
	max_integrity = 100
	var/sprite_category = 1

/obj/structure/just_toy_doll
	name = "toy doll"
	desc = "Почти обычная кукла. Её одежда..- это часть её самой?..."
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "toy1"
	density = TRUE
	anchored = TRUE
	max_integrity = 100
	var/sprite_category = 1

/obj/structure/toy_doll_inactive/Initialize()
	. = ..()
	sprite_category = rand(1, 7)
	icon_state = "toy[sprite_category]"
	START_PROCESSING(SSobj, src)

/obj/structure/just_toy_doll/Initialize()
	. = ..()
	sprite_category = rand(1, 7)
	icon_state = "toy[sprite_category]"

/obj/structure/toy_doll_inactive/process()
	for(var/mob/living/carbon/human/player in view(1, src))
		if(player.stat == CONSCIOUS)
			Awaken(player)
			return

/obj/structure/toy_doll_inactive/proc/Awaken(mob/living/target)
	var/turf/doll_turf = get_turf(src)
	var/doll_type = rand(1, 3)
	var/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/angry_doll

	switch(doll_type)
		if(1)
			angry_doll = new /mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aggressive(doll_turf)
			angry_doll.GiveTarget(target)
		if(2)
			angry_doll = new /mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/stupid(doll_turf)
		if(3)
			angry_doll = new /mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving(doll_turf)
			angry_doll.GiveTarget(target)

	angry_doll.sprite_category = sprite_category
	angry_doll.icon_state = "toy[sprite_category]"
	angry_doll.icon_living = "toy[sprite_category]"
	angry_doll.icon_dead = "toy[sprite_category]_corpse"

	qdel(src)

/obj/structure/toy_doll_inactive/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll
	name = "angry toy"
	desc = "Агрессивная кукла! Лучше бежать!"
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "toy1"
	icon_living = "toy1"
	icon_dead = "toy1_corpse"

	mob_biotypes = MOB_ORGANIC
	health = 150
	maxHealth = 150
	melee_damage_lower = 12
	melee_damage_upper = 16

	base_intents = list(/datum/intent/unarmed/punch)
	faction = list("hostile")
	aggressive = 1

	vision_range = 9
	aggro_vision_range = 12

	speed = 12
	move_to_delay = 3
	turns_per_move = 2

	attack_verb_continuous = "pounds"
	attack_verb_simple = "pound"
	attack_sound = 'sound/combat/hits/punch/punch (1).ogg'

	rapid_melee = 3
	melee_queue_distance = 2
	dodgetime = 10
	retreat_distance = 0
	minimum_distance = 0

	STASTR = 12
	STAEND = 6
	STASPD = 14
	STACON = 5

	footstep_type = FOOTSTEP_MOB_BAREFOOT

	deathmessage = "shatters into wooden pieces."

	lose_patience_timeout = 600

	var/sprite_category = 1

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/Initialize()
	. = ..()
	deaggroprob = 0
	targets_from = src
	if(sprite_category == 1)
		sprite_category = rand(1, 7)

	icon_state = "toy[sprite_category]"
	icon_living = "toy[sprite_category]"
	icon_dead = "toy[sprite_category]_corpse"

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/death(gibbed)
	var/turf/death_spot = get_turf(src)
	var/obj/item/toy_doll_head/head = new(death_spot)
	head.sprite_category = sprite_category
	head.icon_state = "toy[sprite_category]_head"
	..()
/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aggressive
	name = "angry toy"
	desc = "Агрессивная кукла! Лучше бежать!"

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/stupid
	name = "strange toy"
	desc = "Странная кукла! Кажется ей вообще всё равно, что возле неё происходит..."
	aggressive = 0
	faction = list("neutral")

	move_to_delay = 100

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/stupid/MoveToTarget(list/possible_targets)
	stop_automated_movement = 1
	if(prob(5))
		var/random_dir = pick(NORTH, SOUTH, EAST, WEST)
		step(src, random_dir)
	return 1

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/stupid/FindTarget()
	return

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/stupid/CanAttack(atom/the_target)
	return FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving
	name = "kind toy"
	desc = "Добрая кукла! Она крайне тактильная."
	aggressive = 1
	faction = list("toy")
	attack_same = 0

	var/last_hug_time = 0
	var/hug_cooldown = 30

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving/CanAttack(atom/the_target)
	if(isturf(the_target) || !the_target)
		return FALSE

	if(!isliving(the_target))
		return FALSE

	var/mob/living/L = the_target
	if(L.stat > 0)
		return FALSE

	return TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving/FindTarget(list/possible_targets, HasTargetsList = 0)
	. = list()
	if(!HasTargetsList)
		possible_targets = ListTargets()
	for(var/pos_targ in possible_targets)
		var/atom/A = pos_targ
		if(CanAttack(A))
			. += A
	var/Target = PickTarget(.)
	if(Target)
		GiveTarget(Target)
	return Target

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving/AttackingTarget()
	if(SEND_SIGNAL(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, target) & COMPONENT_HOSTILE_NO_PREATTACK)
		return FALSE
	SEND_SIGNAL(src, COMSIG_HOSTILE_ATTACKINGTARGET, target)
	in_melee = TRUE

	if(!QDELETED(target))
		TryHug()
		GainPatience()

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/loving/proc/TryHug()
	if(world.time >= last_hug_time + hug_cooldown)
		visible_message(span_notice("[src] обнимает [target]!"))
		emote("me", 1, "обнимает [target]!")
		last_hug_time = world.time

/obj/item/toy_doll_head
	name = "toy doll head"
	desc = "Голова ожившей куклы. Выглядит жутко."
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "toy1_head"
	w_class = WEIGHT_CLASS_SMALL
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'

	var/sprite_category = 1

/obj/structure/toy_doll_spawner
	name = "toy doll spawner"
	desc = "Спавнер для кукол."
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "spawner"
	density = FALSE
	anchored = TRUE

/obj/structure/toy_doll_spawner/Initialize()
	. = ..()
	var/doll_choice = rand(1, 2)
	switch(doll_choice)
		if(1)
			new /obj/structure/toy_doll_inactive(get_turf(src))
		if(2)
			new /obj/structure/just_toy_doll(get_turf(src))
	qdel(src)

//// АЯ

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya
	name = "Aya"
	desc = "Обычная на вид девочка. Совершенно безобидная... наверное."
	icon = 'icons/roguetown/alizeria/toynpc.dmi'
	icon_state = "aya"
	icon_living = "aya"
	icon_dead = "aya_corpse"

	mob_biotypes = MOB_ORGANIC
	health = 5
	maxHealth = 5
	melee_damage_lower = 12
	melee_damage_upper = 16

	base_intents = list(/datum/intent/unarmed/punch)
	faction = list("neutral")
	aggressive = 0

	vision_range = 9
	aggro_vision_range = 12

	speed = 12
	move_to_delay = 100
	turns_per_move = 2

	attack_verb_continuous = "pounds"
	attack_verb_simple = "pound"
	attack_sound = 'sound/combat/hits/punch/punch (1).ogg'

	rapid_melee = 3
	melee_queue_distance = 2
	retreat_distance = 0
	minimum_distance = 0

	STASTR = 1
	STAEND = 6
	STASPD = 14
	STACON = 5

	footstep_type = FOOTSTEP_MOB_BAREFOOT

	deathmessage = "shatters into wooden pieces."

	lose_patience_timeout = 600

	var/examined_players = list()

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/Initialize()
	. = ..()
	deaggroprob = 0
	targets_from = src
	icon_state = "aya"
	icon_living = "aya"
	icon_dead = "aya_corpse"

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/examine(mob/user)
	. = ..()
	. += "<br><span style='font-size: 1.5em; font-weight: bold; color: #00FF00;'>Пасхалка! Вам повезло это увидеть.</span>"

	if(!(user.ckey in examined_players))
		examined_players += user.ckey
		user.adjust_triumphs(1)

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/MoveToTarget()
	stop_automated_movement = 1
	if(prob(5))
		var/random_dir = pick(NORTH, SOUTH, EAST, WEST)
		step(src, random_dir)
	return 1

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/FindTarget()
	return

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/CanAttack()
	return FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/toy_doll/aya/death()
	var/turf/death_spot = get_turf(src)
	new /obj/effect/decal/cleanable/chem_pile(death_spot)
	qdel(src)