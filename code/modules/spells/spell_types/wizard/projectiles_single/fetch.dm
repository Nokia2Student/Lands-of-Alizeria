/obj/effect/proc_holder/spell/invoked/projectile/fetch
	name = "Притяжение"
	desc = "Выпускает магическую руку, которая притягивает поражённую цель к заклинателю."
	clothes_req = FALSE
	range = 15
	projectile_type = /obj/projectile/magic/fetch
	sound = list('sound/magic/magnet.ogg')
	active = FALSE
	releasedrain = 5
	chargedrain = 0
	chargetime = 0
	warnie = "spellwarning"
	overlay_state = "fetch"
	no_early_release = TRUE
	charging_slowdown = 1
	spell_tier = 2
	invocation = "Recolligere"
	invocation_type = "whisper"
	hide_charge_effect = TRUE // essential for rogue mage
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 2 // Combat spell, but of slighlty less obvious use
	xp_gain = TRUE

/obj/projectile/magic/fetch/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[target] отражает притяжение!"))
			playsound(target, 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
