/obj/effect/proc_holder/spell/invoked/mindlink
	name = "Связь разумов"
	desc = "Устанавливает телепатическую связь с союзником на пятнадцать минут. Используйте ,y перед сообщением, чтобы общаться телепатически."
	clothes_req = FALSE
	overlay_state = "mindlink"
	associated_skill = /datum/skill/magic/arcane
	cost = 4
	xp_gain = TRUE
	recharge_time = 5 MINUTES
	spell_tier = 3
	invocation = "Mens Nexu"
	invocation_type = "whisper"
	
	// Charged spell variables
	chargedloop = /datum/looping_sound/invokegen
	chargedrain = 1
	chargetime = 20
	releasedrain = 25
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	warnie = "spellwarning"
	ignore_los = TRUE

/obj/effect/proc_holder/spell/invoked/mindlink/cast(list/targets, mob/living/user)
	. = ..()
	if(!istype(user))
		return
	
	var/list/possible_targets = list()
	if(user.mind.known_people.len)
		for(var/people in user.mind.known_people)
			possible_targets += people
	else
		to_chat(user, span_warning("У вас нет знакомых, с которыми можно установить связь разумов!"))
		revert_cast()
		return FALSE

	possible_targets = sortList(possible_targets)

	if(user.client)
		possible_targets = list(user.real_name) + possible_targets // Oohhhhhh this looks bad. But this is supposed to append ourselves at the start of the ordered list.
	
	var/first_target_name = input(user, "Выберите первого человека для связи", "Связь разумов") as null|anything in possible_targets

	if(!first_target_name)
		revert_cast()
		return FALSE

	var/mob/living/first_target

	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == first_target_name)
			first_target = HL

	possible_targets -= first_target_name
	
	var/second_target_name = input(user, "Выберите второго человека для связи", "Связь разумов") as null|anything in possible_targets

	if(!second_target_name)
		revert_cast()
		return FALSE

	var/mob/living/second_target

	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == second_target_name)
			second_target = HL

	// Check if either target is a zad
	if(istype(first_target, /mob/living/simple_animal/hostile/retaliate/bat/crow) || istype(second_target, /mob/living/simple_animal/hostile/retaliate/bat/crow))
		to_chat(user, span_warning("Зады невосприимчивы к связи разумов!"))
		revert_cast()
		return FALSE

	user.visible_message(span_notice("[user] касается висков и сосредотачивается..."), span_notice("Я устанавливаю ментальную связь между [first_target] и [second_target]..."))
	
	// Create the mindlink
	var/datum/mindlink/link = new(first_target, second_target)
	GLOB.mindlinks += link
	
	to_chat(first_target, span_notice("Связь разумов с [second_target] установлена! Используйте ,y перед сообщением, чтобы общаться телепатически."))
	to_chat(second_target, span_notice("Связь разумов с [first_target] установлена! Используйте ,y перед сообщением, чтобы общаться телепатически."))
	
	// Register signals to break mindlink on zad transformation
	RegisterSignal(first_target, "pre_shapeshift", PROC_REF(break_mindlink_if_zad))
	RegisterSignal(second_target, "pre_shapeshift", PROC_REF(break_mindlink_if_zad))
	
	addtimer(CALLBACK(src, PROC_REF(break_link), link), 15 MINUTES)
	return TRUE

/obj/effect/proc_holder/spell/invoked/mindlink/proc/break_link(datum/mindlink/link)
	if(!link)
		return
	
	to_chat(link.owner, span_warning("Связь разумов с [link.target] угасает..."))
	to_chat(link.target, span_warning("Связь разумов с [link.owner] угасает..."))
	
	GLOB.mindlinks -= link
	qdel(link)

/obj/effect/proc_holder/spell/invoked/mindlink/proc/break_mindlink_if_zad(mob/living/shifter, new_type)
	if(new_type == /mob/living/simple_animal/hostile/retaliate/bat/crow)
		for(var/datum/mindlink/link in GLOB.mindlinks)
			if(shifter == link.owner || shifter == link.target)
				to_chat(link.owner, span_warning("Связь разумов разрывается, так как [shifter] превращается в зада!"))
				to_chat(link.target, span_warning("Связь разумов разрывается, так как [shifter] превращается в зада!"))
				GLOB.mindlinks -= link
				qdel(link)


