//Cold system status effects for areas with cold_system = TRUE

/datum/status_effect/debuff/cold_1
	id = "cold_1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cold_1
	effectedstats = list(STATKEY_SPD = -2)
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE

/datum/status_effect/debuff/cold_1/on_remove()
	. = ..()
	remove_cold_hud()

/atom/movable/screen/alert/status_effect/debuff/cold_1
	name = "Freezing"
	desc = "Мне холодно..."
	icon_state = "cold1"

/datum/status_effect/debuff/cold_2
	id = "cold_2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cold_2
	effectedstats = list(STATKEY_STR = -1, STATKEY_PER = -1, STATKEY_CON = -1, STATKEY_END = -1, STATKEY_SPD = -1)
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE

/datum/status_effect/debuff/cold_2/on_apply()
	. = ..()
	if(owner && owner.client)
		owner.add_stress(/datum/stressevent/cold_level_2)

/datum/status_effect/debuff/cold_2/on_remove()
	. = ..()
	remove_cold_hud()

/atom/movable/screen/alert/status_effect/debuff/cold_2
	name = "Severe Cold"
	desc = "Мне очень холодно..."
	icon_state = "cold2"

/datum/status_effect/debuff/cold_3
	id = "cold_3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cold_3
	effectedstats = list(STATKEY_STR = -2, STATKEY_PER = -2, STATKEY_CON = -2, STATKEY_END = -2, STATKEY_INT = -2, STATKEY_SPD = -2)
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE

/datum/status_effect/debuff/cold_3/on_apply()
	. = ..()
	if(owner && owner.client)
		owner.add_stress(/datum/stressevent/cold_level_3)

/datum/status_effect/debuff/cold_3/on_remove()
	. = ..()
	remove_cold_hud()

/datum/status_effect/debuff/cold_3/tick()
	. = ..()
	if(!owner || owner.stat == DEAD)
		return
	//Deal 2 damage per second to each body part
	owner.apply_damage(2, BRUTE, BODY_ZONE_HEAD)
	owner.apply_damage(2, BRUTE, BODY_ZONE_CHEST)
	owner.apply_damage(2, BRUTE, BODY_ZONE_L_ARM)
	owner.apply_damage(2, BRUTE, BODY_ZONE_R_ARM)
	owner.apply_damage(2, BRUTE, BODY_ZONE_L_LEG)
	owner.apply_damage(2, BRUTE, BODY_ZONE_R_LEG)

/atom/movable/screen/alert/status_effect/debuff/cold_3
	name = "Deadly Cold"
	desc = "Я умираю от холода..."
	icon_state = "cold3"

/datum/status_effect/proc/remove_cold_hud()
	if(!owner || !owner.client)
		return

	var/list/to_remove = list()
	for(var/atom/movable/screen/fullscreen/cold/hud in owner.client.screen)
		to_remove += hud

	for(var/hud in to_remove)
		qdel(hud)