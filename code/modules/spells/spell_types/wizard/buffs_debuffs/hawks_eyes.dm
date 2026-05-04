/obj/effect/proc_holder/spell/invoked/hawks_eyes
	name = "Зоркий глаз"
	overlay_state = "hawks_eyes"
	desc = "Обостряет зрение цели. (+5 к Восприятию)"
	cost = 2
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	spell_tier = 2
	invocation = "Oculi Accipitris." // Oculi - Eyes. Accipitris - Hawk, singular.
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 7

/obj/effect/proc_holder/spell/invoked/hawks_eyes/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(spelltarget, 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] бормочет заклинание, и глаза [spelltarget] мерцают.")
		to_chat(user, span_notice("С другим человеком как проводником, длительность моего заклинания удваивается."))
		spelltarget.apply_status_effect(/datum/status_effect/buff/hawks_eyes/other)
	else
		user.visible_message("[user] бормочет заклинание, и его глаза мерцают.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/hawks_eyes)

	return TRUE

#define HAWKSEYES_FILTER "hawkseyes_glow"
/atom/movable/screen/alert/status_effect/buff/hawks_eyes
	name = "Зоркий глаз"
	desc = "Моё зрение обострено. (+5 к Восприятию)"
	icon_state = "buff"

/datum/status_effect/buff/hawks_eyes
	var/outline_colour ="#ffff00" // Same color as perception potion
	id = "hawkseyes"
	alert_type = /atom/movable/screen/alert/status_effect/buff/hawks_eyes
	effectedstats = list("perception" = 5)
	duration = 1 MINUTES

/datum/status_effect/buff/hawks_eyes/other
	duration = 2 MINUTES

/datum/status_effect/buff/hawks_eyes/on_apply()
	. = ..()
	var/filter = owner.get_filter(HAWKSEYES_FILTER)
	if (!filter)
		owner.add_filter(HAWKSEYES_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 25, "size" = 1))
	to_chat(owner, span_warning("Моё зрение обостряется, словно у сокола."))


/datum/status_effect/buff/hawks_eyes/on_remove()
	. = ..()
	to_chat(owner, span_warning("Моё зрение затуманивается, теряя неестественную остроту."))
	owner.remove_filter(HAWKSEYES_FILTER)

#undef HAWKSEYES_FILTER
