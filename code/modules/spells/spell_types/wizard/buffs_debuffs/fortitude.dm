/obj/effect/proc_holder/spell/invoked/fortitude
	name = "Стойкость"
	desc = "Укрепляет силы цели против усталости. (-50% расхода выносливости)"
	cost = 3 // Halving stamina cost is INSANE so it cost the same as before adjustment to 3x spellpoint basis.
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	overlay_state = "fortitude"
	no_early_release = TRUE
	movement_interrupt = FALSE
	spell_tier = 2
	invocation = "Tenax"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/invoked/fortitude/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(spelltarget, 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] бормочет заклинание, и [spelltarget] ненадолго озаряется зелёным.")
		to_chat(user, span_notice("Используя другого человека как проводник, я удваиваю длительность заклинания."))
		spelltarget.apply_status_effect(/datum/status_effect/buff/fortitude/other)
	else
		user.visible_message("[user] бормочет заклинание и ненадолго озаряется зелёным.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/fortitude)

	return TRUE

/atom/movable/screen/alert/status_effect/buff/fortitude
	name = "Стойкость"
	desc = "Мои силы укреплены против усталости. (-50% расхода выносливости)"
	icon_state = "buff"

#define FORTITUDE_FILTER "fortitude_glow"
/datum/status_effect/buff/fortitude
	var/outline_colour ="#008000" // Forest green to avoid le sparkle mage
	id = "fortitude"
	alert_type = /atom/movable/screen/alert/status_effect/buff/fortitude
	duration = 1 MINUTES

/datum/status_effect/buff/fortitude/other
	duration = 2 MINUTES

/datum/status_effect/buff/fortitude/on_apply()
	. = ..()
	var/filter = owner.get_filter(FORTITUDE_FILTER)
	if (!filter)
		owner.add_filter(FORTITUDE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 50, "size" = 1))
	to_chat(owner, span_warning("Моё тело ощущается легче..."))
	ADD_TRAIT(owner, TRAIT_FORTITUDE, MAGIC_TRAIT)

/datum/status_effect/buff/fortitude/on_remove()
	. = ..()
	owner.remove_filter(FORTITUDE_FILTER)
	to_chat(owner, span_warning("Тяжесть мира снова ложится на мои плечи."))
	REMOVE_TRAIT(owner, TRAIT_FORTITUDE, MAGIC_TRAIT)
