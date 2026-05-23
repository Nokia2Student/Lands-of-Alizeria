/obj/effect/proc_holder/spell/invoked/giants_strength
	name = "Сила великана"
	overlay_state = "giantsstrength"
	desc = "Укрепляет цель. (+3 Силы)" // Design Note: +3 instead of +5 for direct damage stats
	cost = 4 // Direct DPS stats
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	overlay_state = "giants_strength"
	spell_tier = 2
	invocation = "Vis Gigantis." // Vis - Strength. Gigantis - Singular possessive form.
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 7

/obj/effect/proc_holder/spell/invoked/giants_strength/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(spelltarget, 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] бормочет заклинание, и мышцы [spelltarget] укрепляются и растут.")
		to_chat(user, span_notice("С другим человеком как проводником, длительность моего заклинания удваивается."))
		spelltarget.apply_status_effect(/datum/status_effect/buff/giants_strength/other)
	else
		user.visible_message("[user] бормочет заклинание, и его мышцы укрепляются и растут.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/giants_strength)

	return TRUE

#define GIANTSSTRENGTH_FILTER "giantsstrength_glow"
/atom/movable/screen/alert/status_effect/buff/giants_strength
	name = "Сила великана"
	desc = "Мои мышцы укреплены. (+3 Силы)"
	icon_state = "buff"

/datum/status_effect/buff/giants_strength
	var/outline_colour ="#8B0000" // Different from strength potion cuz red = strong
	id = "giantstrength"
	alert_type = /atom/movable/screen/alert/status_effect/buff/giants_strength
	effectedstats = list("strength" = 3)
	duration = 1 MINUTES

/datum/status_effect/buff/giants_strength/other
	duration = 2 MINUTES

/datum/status_effect/buff/giants_strength/on_apply()
	. = ..()
	var/filter = owner.get_filter(GIANTSSTRENGTH_FILTER)
	if (!filter)
		owner.add_filter(GIANTSSTRENGTH_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 50, "size" = 1))
		ADD_TRAIT(owner, TRAIT_STRENGTH_UNCAPPED, TRAIT_MIRACLE)
	to_chat(owner, span_warning("Мои мышцы укрепляются."))


/datum/status_effect/buff/giants_strength/on_remove()
	. = ..()
	to_chat(owner, span_warning("Моя сила угасает..."))
	owner.remove_filter(GIANTSSTRENGTH_FILTER)
	REMOVE_TRAIT(owner, TRAIT_STRENGTH_UNCAPPED, TRAIT_MIRACLE)

#undef GIANTSSTRENGTH_FILTER
