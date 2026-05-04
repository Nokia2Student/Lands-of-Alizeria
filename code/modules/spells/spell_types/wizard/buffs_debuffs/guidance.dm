/obj/effect/proc_holder/spell/invoked/guidance
	name = "Наставление"
	overlay_state = "guidance"
	desc = "Направляет руку верным путём, благословляя арканной удачей в бою. (+20% к обходу парирования/уклонения, +20% к парированию/уклонению)"
	cost = 2
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	spell_tier = 2
	invocation = "Ducere"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/invoked/guidance/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(spelltarget, 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] бормочет заклинание, и [spelltarget] ненадолго озаряется оранжевым.")
		to_chat(user, span_notice("С другим человеком как проводником, длительность моего заклинания удваивается."))
		spelltarget.apply_status_effect(/datum/status_effect/buff/guidance/other)
	else
		user.visible_message("[user] бормочет заклинание и ненадолго озаряется оранжевым.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/guidance)

	return TRUE

#define GUIDANCE_FILTER "guidance_glow"
/atom/movable/screen/alert/status_effect/buff/guidance
	name = "Наставление"
	desc = "Арканная помощь направляет мои руки. (+20% к обходу парирования/уклонения, +20% к парированию/уклонению)"
	icon_state = "buff"

/datum/status_effect/buff/guidance
	var/outline_colour ="#f58e2d"
	id = "guidance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/guidance
	duration = 1 MINUTES

/datum/status_effect/buff/guidance/other
	duration = 2 MINUTES

/datum/status_effect/buff/guidance/on_apply()
	. = ..()
	var/filter = owner.get_filter(GUIDANCE_FILTER)
	if (!filter)
		owner.add_filter(GUIDANCE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 50, "size" = 1))
	to_chat(owner, span_warning("Аркана помогает мне в битве."))
	ADD_TRAIT(owner, TRAIT_GUIDANCE, MAGIC_TRAIT)

/datum/status_effect/buff/guidance/on_remove()
	. = ..()
	to_chat(owner, span_warning("Мой слабый разум снова затуманивает моё боевое искусство."))
	owner.remove_filter(GUIDANCE_FILTER)
	REMOVE_TRAIT(owner, TRAIT_GUIDANCE, MAGIC_TRAIT)

#undef GUIDANCE_FILTER
