// Arcyne Prison, with warning
/obj/effect/proc_holder/spell/invoked/forcewall/arcyne_prison
	name = "Арканная тюрьма"
	desc = "Создаёт стену слабой арканной силы вокруг области 5x5 с небольшой задержкой, запирая всех внутри. Вы можете проходить сквозь неё."
	school = "transmutation"
	releasedrain = 50
	spell_tier = 4 // Trolling spell, CM only.
	invocation = "Mysticus Carcer!" // Magical Prison of Mysterious Magic.
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_HIGH
	wall_type = /obj/structure/forcefield_weak/arcyne_prison
	cost = 6

/obj/effect/proc_holder/spell/invoked/forcewall/arcyne_prison/cast(list/targets,mob/user = usr)
	var/turf/target = get_turf(targets[1])

	for(var/turf/affected_turf in view(2, target))
		if(!(affected_turf in view(target)))
			continue
		if(get_dist(target, affected_turf) != 2)
			continue
		new /obj/effect/temp_visual/trap_wall(affected_turf)
		addtimer(CALLBACK(src, PROC_REF(new_wall), affected_turf, user), wait = 1 SECONDS)

	user.visible_message("[user] бормочет заклинание, и из воздуха возникает тюрьма арканной силы!")
	return TRUE

/obj/structure/forcefield_weak/arcyne_prison
	desc = "Стена чистой арканной силы. Похоже, её легко разрушить."
	name = "Арканная тюрьма"
	max_integrity = 50 // Ultra 
