#define ANGRYCABBIT_ATTACK_SPEED (CLICK_CD_MELEE * 0.4)  // В 3 раза быстрее (0.4 вместо 1.2) // Быстрые атаки
#define ANGRYCABBIT_MOVEMENT_SPEED 0.4 SECONDS  // Быстрое движение
#define ANGRYCABBIT_HEALTH 700

/datum/ai_controller/angrycabbit
	movement_delay = ANGRYCABBIT_MOVEMENT_SPEED

	ai_movement = /datum/ai_movement/astar

	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

	idle_behavior = /datum/idle_behavior/idle_random_walk

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/angrycabbit
	name = "angry cabbit"
	desc = "Этот кролик не выглядит добрым.."
	icon = 'icons/roguetown/mob/cabbit.dmi'
	icon_state = "cabbit_evil"
	icon_living = "cabbit_evil"
	icon_dead = "cabbit_dead"
	health = ANGRYCABBIT_HEALTH
	maxHealth = ANGRYCABBIT_HEALTH
	dodgetime = 10

	// ПАРАМЕТРЫ АГРЕССИИ
	aggressive = 1
	vision_range = 7
	aggro_vision_range = 9
	simple_detect_bonus = 20
	deaggroprob = 0

	// ПАРАМЕТРЫ АТАК
	melee_damage_lower = 15
	melee_damage_upper = 25
	retreat_distance = 0
	minimum_distance = 0

	// INTENT И ЗВУКИ
	base_intents = list(/datum/intent/simple/bite/angrycabbit)  // <-- ДОБАВЬТЕ ЭТО!

	remains_type = /obj/effect/decal/remains/cabbit
	speak = list("Meow!", "Chk!", "Purr!", "Chrr!")
	speak_emote = list("chirrups", "meows")
	faction = list("cabbits")
	emote_hear = list("meows.", "clucks.")
	emote_see = list("brings their ears alert.", "scratches their ear with a hindleg.")
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/rabbit = 2)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/rabbit = 3,
						/obj/item/alch/sinew = 1,
						/obj/item/alch/bone = 1,
						/obj/item/natural/fur/rabbit = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/rabbit = 4,
						/obj/item/alch/sinew = 1,
						/obj/item/alch/bone = 1,
						/obj/item/natural/fur/rabbit = 1,
						/obj/item/natural/rabbitsfoot = 1)
	var/examined_players = list()
	can_have_ai = FALSE
	AIStatus = AI_OFF
	ai_controller = /datum/ai_controller/angrycabbit
	melee_cooldown = ANGRYCABBIT_ATTACK_SPEED

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/angrycabbit/Initialize()
	. = ..()
	AddElement(/datum/element/ai_retaliate)
	ai_controller.set_blackboard_key(BB_BASIC_FOODS, list(/obj/item/reagent_containers/food/snacks))

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/angrycabbit/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/rabbit/rabbit_alert.ogg')
		if("pain")
			return pick('sound/vo/mobs/rabbit/rabbit_pain1.ogg', 'sound/vo/mobs/rabbit/rabbit_pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/rabbit/rabbit_death.ogg')

/datum/intent/simple/bite/angrycabbit
	clickcd = ANGRYCABBIT_ATTACK_SPEED
	hitsound = "smallslash"  // Используйте стандартный звук укуса



/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/angrycabbit/examine(mob/user)
	. = ..()
	. += "<br><span style='font-size: 1.5em; font-weight: bold; color: #00FF00;'>Пасхалка! Вам повезло это увидеть.</span>"

	if(!(user.ckey in examined_players))
		examined_players += user.ckey
		user.adjust_triumphs(1)

/obj/effect/spawner/lootdrop/roguetown/dungeon/alizeria/pashalkispawner/cabbitred
	icon_state = "cabbit_evil"
	loot = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/angrycabbit = 1,
		null = 2
	)
	lootcount = 1