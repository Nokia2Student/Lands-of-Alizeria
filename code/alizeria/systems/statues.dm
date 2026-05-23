/// Prayer mechanics for ancient god statues
/// When a player prays at a statue, they have a 50% chance to receive a blessing trait
/// or a 50% chance to receive a stress event indicating their prayers went unheard

#define PRAYER_DURATION 5 SECONDS
#define PRAYER_CHANCE 50 // 50% chance for blessing, 50% for nothing

/// Prayer trait mapping for each god statue
/datum/prayer_blessing
	var/trait_name // The trait to grant
	var/trait_source = "statue_blessing" // Source identifier for trait system
	var/message_success = "I feel blessed..." // Message when blessing is received

/datum/prayer_blessing/astrata
	trait_name = TRAIT_DARKVISION
	message_success = "Астрата наполняет мои очи светом..."

/datum/prayer_blessing/abyssor
	trait_name = TRAIT_WATERBREATHING
	message_success = "Абиссор дарует мне способность дышать под водой..."

/datum/prayer_blessing/xylix
	trait_name = TRAIT_LIGHT_STEP
	message_success = "Ксиликс делает мои шаги легче, как перо..."

/datum/prayer_blessing/ravox
	trait_name = TRAIT_CIVILIZEDBARBARIAN
	message_success = "Равокс одаривает меня силой..."

/datum/prayer_blessing/malum
	trait_name = TRAIT_FORGEBLESSED
	message_success = "Малум наделяет меня благословением кузнеца..."

/datum/prayer_blessing/dendor
	trait_name = TRAIT_OUTDOORSMAN
	message_success = "Дендор дарует мне знания о природе..."

/datum/prayer_blessing/necra
	trait_name = TRAIT_SOUL_EXAMINE
	message_success = "Некра позволяет мне видеть через завесу смерти..."

/datum/prayer_blessing/noc
	trait_name = TRAIT_NOCINSPIRE
	message_success = "Нок наполняет меня вдохновением ночи..."

/datum/prayer_blessing/eora
	trait_name = TRAIT_EMPATH
	message_success = "Эора открывает мне понимание чувств других..."

/datum/prayer_blessing/pestra
	trait_name = TRAIT_CRITICAL_RESISTANCE
	message_success = "Пестра защищает мою жизненную силу от смертельных ударов..."

/// Extend statue objects to include prayer interaction
/obj/structure/fluff/statue/alizeria
	var/is_praying = FALSE
	var/prayer_type = null // Will be set by subtype
	var/statue_id = null // Unique identifier for this statue type

/obj/structure/fluff/statue/alizeria/astrata
	name = "astrata statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "astrata"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/astrata
	statue_id = "astrata"

/obj/structure/fluff/statue/alizeria/abyssor
	name = "abyssor statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "abyssoralt"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/abyssor
	statue_id = "abyssor"

/obj/structure/fluff/statue/alizeria/xylix
	name = "xylix statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "xylix"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/xylix
	statue_id = "xylix"

/obj/structure/fluff/statue/alizeria/ravox
	name = "ravox statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "ravox"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/ravox
	statue_id = "ravox"

/obj/structure/fluff/statue/alizeria/malum
	name = "malum statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "malum"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/malum
	statue_id = "malum"

/obj/structure/fluff/statue/alizeria/dendor
	name = "dendor statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "dendor"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/dendor
	statue_id = "dendor"

/obj/structure/fluff/statue/alizeria/necra
	name = "necra statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "necra"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/necra
	statue_id = "necra"

/obj/structure/fluff/statue/alizeria/noc
	name = "noc statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "noc"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/noc
	statue_id = "noc"

/obj/structure/fluff/statue/alizeria/eora
	name = "eora statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "eora"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/eora
	statue_id = "eora"

/obj/structure/fluff/statue/alizeria/pestra
	name = "pestra statue"
	desc = "Статуя одного из древних богов. Молитва ей - способна одарить силами, если верить слухам."
	icon_state = "pestra"
	icon = 'icons/roguetown/misc/tallandwide.dmi'
	pixel_x = -16
	prayer_type = /datum/prayer_blessing/pestra
	statue_id = "pestra"

/// Handle left-click (LMB) interaction on statues
/obj/structure/fluff/statue/alizeria/attack_hand(mob/user)
	. = ..()
	if(.)
		return

	if(is_praying)
		to_chat(user, span_warning("Статуя уже получает молитву..."))
		return

	if(!prayer_type || !statue_id)
		to_chat(user, span_warning("Эта статуя не имеет настроенного благословения молитвы."))
		return

	// Check if player has already prayed to THIS SPECIFIC statue
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/timer_key = "prayer_[statue_id]"

	// Check if player has already prayed to this specific statue this round
	if(H.mob_timers[timer_key])
		to_chat(user, span_warning("Я уже молился этой статуе..."))
		return

	// Start the prayer action
	start_prayer(user)

/// Start prayer ritual
/obj/structure/fluff/statue/alizeria/proc/start_prayer(mob/living/user)
	if(!isliving(user))
		return

	is_praying = TRUE

	// Notify all nearby players
	visible_message(span_notice("[user] начинает молиться [src]..."),
		range = 3)

	// Show action timer to the user
	to_chat(user, span_notice("Я молюсь [src]. Это займет 5 секунд..."))

	// Wait for prayer duration
	if(!do_after(user, PRAYER_DURATION, target = src))
		is_praying = FALSE
		to_chat(user, span_warning("Молитва прервана!"))
		return

	is_praying = FALSE

	// Execute prayer result
	execute_prayer(user)

/// Execute prayer outcome (blessing or nothing)
/obj/structure/fluff/statue/alizeria/proc/execute_prayer(mob/living/user)
	if(!prayer_type || !statue_id)
		return

	var/datum/prayer_blessing/blessing = new prayer_type()

	// 50/50 chance for blessing or stress event
	if(prob(PRAYER_CHANCE))
		// Prayer succeeds - grant blessing
		apply_blessing(user, blessing)
	else
		// Prayer fails - stress event
		apply_prayer_failure(user)

	// Mark that prayer was made to THIS SPECIFIC statue
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/timer_key = "prayer_[statue_id]"
		H.mob_timers[timer_key] = world.time

/// Apply blessing trait to player
/obj/structure/fluff/statue/alizeria/proc/apply_blessing(mob/living/user, datum/prayer_blessing/blessing)
	if(!istype(user, /mob/living))
		return

	// Check if player already has this trait
	if(HAS_TRAIT(user, blessing.trait_name))
		to_chat(user, span_notice("Я уже благословлен этой силой..."))
		visible_message(span_notice("[user] молитва была услышана, но благословение уже было с ними..."),
			range = 3)
		return

	// Add trait
	ADD_TRAIT(user, blessing.trait_name, blessing.trait_source)

	// Notify player with blessing message
	to_chat(user, span_notice(blessing.message_success))

	// Notify others
	visible_message(span_notice("[user] светится, когда [src] отвечает на молитву!"),
		range = 3)

	// Log the blessing for admin purposes
	log_game("[user] received blessing [blessing.trait_name] from statue prayer at [get_area(src)]")

/// Apply prayer failure - stress event
/obj/structure/fluff/statue/alizeria/proc/apply_prayer_failure(mob/living/user)
	to_chat(user, span_red("Мои молитвы не были услышаны..."))

	visible_message(span_notice("[user] выглядит разочарованным, молчание [src] говорит само за себя."),
		range = 3)

	// Apply stress event if user is human with stress system
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.add_stress(/datum/stressevent/prayer_rejected))
			log_game("[user] received stress event from failed prayer at [get_area(src)]")

/datum/stressevent/prayer_rejected
	desc = span_red("Мои молитвы не были услышаны...")
	stressadd = 2
	timer = 180 SECONDS

/// Spawner for random ancient god statue
/obj/effect/spawner/statue/alizeria/random
	name = "random alizeria statue spawner"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"

/obj/effect/spawner/statue/alizeria/random/Initialize()
	. = ..()
	var/list/statue_types = list(
		/obj/structure/fluff/statue/alizeria/astrata,
		/obj/structure/fluff/statue/alizeria/abyssor,
		/obj/structure/fluff/statue/alizeria/xylix,
		/obj/structure/fluff/statue/alizeria/ravox,
		/obj/structure/fluff/statue/alizeria/malum,
		/obj/structure/fluff/statue/alizeria/dendor,
		/obj/structure/fluff/statue/alizeria/necra,
		/obj/structure/fluff/statue/alizeria/noc,
		/obj/structure/fluff/statue/alizeria/eora,
		/obj/structure/fluff/statue/alizeria/pestra
	)

	var/statue_type = pick(statue_types)
	new statue_type(loc)
	qdel(src)

#undef PRAYER_DURATION
#undef PRAYER_CHANCE