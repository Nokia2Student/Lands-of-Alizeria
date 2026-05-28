/obj/effect/proc_holder/spell/invoked/haste
	name = "Ускорение"
	desc = "Магически ускоряет цель. (+5 к скорости, перезарядка действий x0.85)"
	cost = 4
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	overlay_state = "haste" // Temporary icon from RW
	spell_tier = 2
	invocation = "Festinatio!"
	invocation_type = "shout" // I mean, it is fast
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_MEDIUM
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/invoked/haste/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(spelltarget, 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] бормочет заклинание, и [spelltarget] ненадолго озаряется жёлтым.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/haste, 2 MINUTES)
		to_chat(user, span_notice("С другим человеком как проводником, длительность моего заклинания удваивается."))
	else
		user.visible_message("[user] бормочет заклинание и ненадолго озаряется жёлтым.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/haste, 1 MINUTES)

	return TRUE
	
/atom/movable/screen/alert/status_effect/buff/haste
	name = "Ускорение"
	desc = "Я магически ускорен."
	icon_state = "buff"

#define HASTE_FILTER "haste_glow"

/datum/status_effect/buff/haste
	var/outline_colour ="#F0E68C" // Hopefully not TOO yellow
	id = "haste"
	alert_type = /atom/movable/screen/alert/status_effect/buff/haste
	effectedstats = list("speed" = 5)
	duration = 1 MINUTES

/datum/status_effect/buff/haste/other
	duration = 2 MINUTES

/datum/status_effect/buff/haste/on_creation(mob/living/new_owner, var/new_duration = null)
	if(new_duration)
		duration = new_duration
	. = ..()

/datum/status_effect/buff/haste/on_apply()
	. = ..()
	var/filter = owner.get_filter(HASTE_FILTER)
	if (!filter)
		owner.add_filter(HASTE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 25, "size" = 1))
	to_chat(owner, span_warning("Мои конечности движутся с неестественной быстротой."))

/datum/status_effect/buff/haste/on_remove()
	. = ..()
	owner.remove_filter(HASTE_FILTER)
	to_chat(owner, span_warning("Моё тело снова двигается медленно..."))

#undef HASTE_FILTER

/datum/status_effect/buff/haste/nextmove_modifier()
	return 0.85
