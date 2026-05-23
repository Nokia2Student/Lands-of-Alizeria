/obj/effect/proc_holder/spell/invoked/aerosolize
	name = "Распыление" //once again renamed to fit better :)
	desc = "Превращает ёмкость с жидкостью в дым, содержащий реагенты этой жидкости."
	overlay_state = "aerosolize"
	releasedrain = 50
	chargetime = 3
	recharge_time = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	spell_tier = 2
	invocation = "Converti in Nebulam!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW
	gesture_required = TRUE // Spell w/ offensive potential, but don't matter cuz you have no hands. Still, consistency
	cost = 3

	xp_gain = TRUE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout
	
/obj/effect/proc_holder/spell/invoked/aerosolize/cast(list/targets, mob/living/user)
	var/turf/T = get_turf(targets[1]) //check for turf
	if(T)
		var/obj/item/held_item = user.get_active_held_item() //get held item
		var/obj/item/reagent_containers/con = held_item //get held item
		if(con)
			if(con.spillable)
				if(con.reagents.total_volume > 0)
					var/datum/reagents/R = con.reagents
					var/datum/effect_system/smoke_spread/chem/smoke = new
					smoke.set_up(R, 1, T, FALSE)
					smoke.start()

					user.visible_message(span_warning("[user] распыляет содержимое [held_item], создавая облако!"), span_warning("Вы распыляете содержимое [held_item], создавая облако!"))
					con.reagents.clear_reagents() //empty the container
					playsound(user, 'sound/magic/webspin.ogg', 100)
				else
					to_chat(user, "<span class='warning'>[held_item] пуст!</span>")
					revert_cast()
			else
				to_chat(user, "<span class='warning'>Я не могу получить доступ к содержимому этого [held_item]!</span>")
				revert_cast()
		else
			to_chat(user, "<span class='warning'>Мне нужно держать ёмкость в руках, чтобы сотворить это!</span>")
			revert_cast()
	else
		to_chat(user, "<span class='warning'>Я не нашёл подходящего места для этого!</span>")
		revert_cast()
