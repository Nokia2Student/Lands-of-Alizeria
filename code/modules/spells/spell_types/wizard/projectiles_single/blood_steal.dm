// Lich / Vampire shared list only
/obj/effect/proc_holder/spell/invoked/projectile/bloodsteal
	name = "Кража крови"
	desc = ""
	clothes_req = FALSE
	overlay_state = "bloodsteal"
	sound = 'sound/magic/vlightning.ogg'
	range = 8
	projectile_type = /obj/projectile/magic/bloodsteal
	releasedrain = 30
	chargedrain = 1
	chargetime = 25
	recharge_time = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	spell_tier = 2
	invocation = "Sanguis Furtum!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_VAMPIRIC
	glow_intensity = GLOW_INTENSITY_MEDIUM
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/blood
	cost = 3

/obj/projectile/magic/bloodsteal
	name = "кража крови"
	tracer_type = /obj/effect/projectile/tracer/bloodsteal
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	damage = 25
	damage_type = BRUTE
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#e74141"
	light_outer_range = 7

/obj/projectile/magic/bloodsteal/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] шипит при контакте с [target]!"))
			playsound(target, 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			H.blood_volume = max(H.blood_volume-45, 0)
			H.handle_blood()
			H.visible_message(span_danger("Кровь [target] вырывают из тела!"), \
					span_userdanger("Моя кровь вырывается из тела!"), \
					span_hear("..."), COMBAT_MESSAGE_RANGE, target)
			new /obj/effect/decal/cleanable/blood/puddle(H.loc)

			if(!H.mind)
				to_chat(sender, span_warning("У него нет разума. Его кровь непригодна для меня."))
				return
			if(H.dna?.species && (NOBLOOD in H.dna.species.species_traits))
				to_chat(sender, span_warning("Вздох. Нет крови."))
				return
			if(H.blood_volume <= 0)
				to_chat(sender, span_warning("Вздох. Нет крови."))
				return
			if(H.mob_biotypes & MOB_UNDEAD)
				to_chat(sender, span_warning("Порченая кровь. Я ничего не получаю от неё."))
				return
			sender.adjust_bloodpool(400)
	qdel(src)
