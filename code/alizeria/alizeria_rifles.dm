/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle
	name = "rifle"
	desc = "Роскошная винтовка, поставляемая независимой частной оружейной организацией Гриммшталя. Скорость полёта пули выше, шанс осечки минимален. Выбор профессионалов."
	icon = 'icons/roguetown/weapons/ranged64.dmi'
	icon_state = "rifle0"
	item_state = "rifle"
	experimental_onhip = TRUE
	experimental_onback = TRUE
	possible_item_intents = list(/datum/intent/shoot/aliz/rifle, /datum/intent/arc/aliz/rifle, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/mpyla
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	can_parry = TRUE
	var/chargingspeed = 50
	var/reloadtime = 50
	var/onehanded = FALSE
	var/movingreload = TRUE
	var/hasloadedsprite = FALSE
	force = 10
	var/cocked = FALSE
	cartridge_wording = "mpyla"
	load_sound = 'sound/alizeria/guns/clad_v_patronnik.ogg'
	fire_sound = 'sound/alizeria/guns/shotrifle.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	resistance_flags = FIRE_PROOF
	obj_flags = UNIQUE_RENAME
	damfactor = 2
	accfactor = 1.1
	hasloadedsprite = TRUE
	onehanded = FALSE
	equip_delay_self = 25
	unequip_delay_self = 25
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64


/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -4,"nx" = -5,"ny" = -3,"wx" = -8,"wy" = -2,"ex" = 8,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = -45,"sturn" = 45,"wturn" = -45,"eturn" = 45,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/datum/intent/shoot/aliz/rifle
	chargedrain = 0 //no drain to aim a crossbow
	var/basetime = 40

/datum/intent/shoot/aliz/rifle/can_charge()
	if(mastermob?.next_move > world.time)
		if(mastermob.client.last_cooldown_warn + 10 < world.time)
			to_chat(mastermob, span_warning("Ещё не готово!"))
			mastermob.client.last_cooldown_warn = world.time
			return FALSE
		if(mastermob && masteritem)
			var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/c_bow = masteritem
			if(mastermob.get_num_arms(FALSE) < 2 && !c_bow.onehanded || mastermob.get_inactive_held_item() && !c_bow.onehanded)
				to_chat(mastermob, span_warning("Мне нужна свободная рука для этого."))
				return FALSE
	return TRUE

/datum/intent/shoot/aliz/rifle/get_chargetime()
	if(mastermob && chargetime && masteritem)
		var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/c_bow = masteritem
		var/newtime = chargetime
		//skill block
		newtime += basetime
		newtime -= (mastermob.get_skill_level(/datum/skill/combat/guns) * 4.25) // minus 4.25 per skill point
		newtime -= ((mastermob.STAPER)) // minus 1 per perception

		if(c_bow.onehanded)
			if(mastermob.get_num_arms(FALSE) < 2 || mastermob.get_inactive_held_item())
				newtime *= 1.5 // more time if firing one-handed.
		if(newtime > 1)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/arc/aliz/rifle
	chargetime = 1
	var/basetime = 40
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/aliz/rifle/can_charge()
	if(mastermob?.next_move > world.time)
		if(mastermob.client.last_cooldown_warn + 10 < world.time)
			to_chat(mastermob, span_warning("Ещё не готово!"))
			mastermob.client.last_cooldown_warn = world.time
			return FALSE
		if(mastermob && masteritem)
			var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/c_bow = masteritem
			if(mastermob.get_num_arms(FALSE) < 2 && !c_bow.onehanded || mastermob.get_inactive_held_item() && !c_bow.onehanded)
				to_chat(mastermob, span_warning("Мне нужна свободная рука для этого."))
				return FALSE
	return TRUE


/datum/intent/arc/aliz/rifle/get_chargetime()
	if(mastermob && chargetime && masteritem)
		var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/c_bow = masteritem
		var/newtime = chargetime
		//skill block
		newtime += basetime
		newtime -= (mastermob.get_skill_level(/datum/skill/combat/guns) * 20)
		//per block
		newtime += 20
		newtime -= ((mastermob.STAPER)*1.5)

		if(c_bow.onehanded)
			if(mastermob.get_num_arms(FALSE) < 2 || mastermob.get_inactive_held_item())
				newtime *= 2 // more time if firing one-handed.

		if(newtime > 0)
			return newtime
		else
			return 10
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/alizeria/guns/shot_empty.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(user.get_skill_level(/datum/skill/combat/guns) <= 2)
			to_chat(user, span_warning("Мне нужны <u>неплохие</u> навыки что бы вообще этим пользоваться..."))
			return

		if(!cocked)
			to_chat(user, span_info("Я взвожу своё оружие..."))
			if(!movingreload)
				if(do_after(user, reloadtime - user.STASTR, target = user))
					playsound(user, 'sound/alizeria/guns/reload.ogg', 100, FALSE)
					cocked = TRUE
			else
				if(move_after(user, reloadtime - user.STASTR, target = user))
					playsound(user, 'sound/alizeria/guns/reload.ogg', 100, FALSE)
					cocked = TRUE
		else
			to_chat(user, span_warning("Я осторожно разряжаю оружие..."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("Мне нужно сперва перезарядить это."))


/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.get_num_arms(FALSE) < 2 && !onehanded)
		return FALSE
	if(user.get_inactive_held_item() && !onehanded)
		return FALSE
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0

	if(prob(3))
		spread += rand(30, 60) // add random deviation between 30-60 degrees

	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB

		BB.accuracy += accfactor * (user.STAPER - 8) * 3 // 8+ PER gives +3 per level. Exponential.
		BB.bonus_accuracy += (user.STAPER - 8) // 8+ PER gives +1 per level. Does not decrease over range.
		BB.bonus_accuracy += (user.get_skill_level(/datum/skill/combat/guns) * 5) // +5 per XBow level.
		BB.damage *= damfactor
	cocked = FALSE


	..()

	if(user.client)
		shake_camera(user, 2, 1)

	if(!onehanded)
		return
	var/obj/item/other_hand = user.get_inactive_held_item()
	var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/alt_cbow
	if(other_hand.type != type)
		return
	alt_cbow = other_hand
	if(!alt_cbow)
		return
	if(!alt_cbow.chambered)
		return
	if(HAS_TRAIT(user, TRAIT_DUALWIELDER) && alt_cbow.onehanded)
		alt_cbow.accfactor /= 2
		alt_cbow.process_fire(target, user, FALSE)
		alt_cbow.accfactor = initial(alt_cbow.accfactor)
		return

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle/update_icon()
	. = ..()
	cut_overlays()
	icon_state = "[item_state][cocked ? "1" : "0"]"

	if(chambered && !hasloadedsprite)
		var/mutable_appearance/ammo = mutable_appearance('icons/roguetown/weapons/ammo.dmi', chambered.icon_state)
		add_overlay(ammo)
	if(chambered && hasloadedsprite)
		icon_state = "[item_state][2]"

	if(!ismob(loc))
		return
	var/mob/M = loc
	M.update_inv_hands()

/obj/item/ammo_box/magazine/internal/shot/mpyla
	ammo_type = /obj/item/ammo_casing/caseless/rogue/mpyla
	caliber = "regmpyla"
	max_ammo = 1
	start_empty = TRUE

/obj/item/ammo_casing/caseless/rogue/mpyla
	name = "винтовочная пуля"
	desc = "Позолоченная пуля для элитных винтовок. Способна убить практически любую цель."
	projectile_type = /obj/projectile/bullet/reusable/mpyla
	caliber = "regmpyla"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "pyla"
	dropshrink = 0.6
	max_integrity = 1
	force = 1

/obj/projectile/bullet/reusable/mpyla
	name = "пуля"
	damage = 140
	damage_type = BRUTE
	armor_penetration = 100
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = null
	range = 25
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_PIERCE
	flag = "piercing"
	speed = 1
	npc_damage_mult = 4
	var/sway_chance = 20

/obj/projectile/bullet/reusable/mpyla/on_hit(target, armor)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(def_zone == BODY_ZONE_L_LEG || def_zone == BODY_ZONE_R_LEG)
			H.Knockdown(10)
			H.visible_message(span_danger("[H] падает на землю после попадания в ногу!"), span_userdanger("Ты падаешь на землю!"))
	return ..()

/obj/projectile/bullet/reusable/mpyla/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!isliving(target))
		return

	var/mob/living/victim = target
	var/head_bodypart = victim.get_bodypart(BODY_ZONE_HEAD)

	if(!head_bodypart)
		return

	// Проверяем, есть ли шлем на голове
	var/has_helmet = FALSE
	if(ishuman(victim))
		var/mob/living/carbon/human/H = victim
		if(H.head && istype(H.head, /obj/item/clothing/head/roguetown/helmet))
			has_helmet = TRUE

	// Определяем вероятность смерти в зависимости от наличия шлема
	var/death_chance = has_helmet ? 20 : 50

	// Если случайное число меньше вероятности смерти
	if(def_zone == BODY_ZONE_HEAD)
		if(prob(death_chance))
			victim.visible_message(span_userdanger("ПОПАДЕНИЕ В ГОЛОВУ! [victim] падает замертво..."))
			to_chat(victim, span_userdanger("ПОПАДЕНИЕ В ГОЛОВУ! [victim] падает замертво..."))
			victim.death()
		else
		// Иначе - критическое состояние на 60 секунд
			victim.visible_message(span_warning("ПОПАДАНИЕ В ГОЛОВУ! [victim] резко падает, но ещё двигается..."))
			to_chat(victim, span_warning("ПОПАДАНИЕ В ГОЛОВУ! [victim] резко падает, но ещё двигается..."))
			victim.Unconscious(15 SECONDS)

/////////////////////////////////////////

/obj/item/quiver/mpylipistol
	name = "сумка с винтовочными пулями"
	desc = "Качественная сумка для ношения пуль. Вмещает в себя пять снарядов."
	icon_state = "mpylisatchel0"
	item_state = "mpylisatchel"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	max_storage = 5

/obj/item/quiver/mpylipistol/Initialize()
	..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/mpyla/A = new()
		arrows += A
	update_icon()

/obj/item/quiver/mpylipistol/update_icon()
	if(arrows.len)
		icon_state = "mpylisatchel1"
	else
		icon_state = "mpylisatchel0"