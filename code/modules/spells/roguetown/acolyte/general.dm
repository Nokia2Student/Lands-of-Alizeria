// Lesser miracle
/obj/effect/proc_holder/spell/invoked/lesser_heal
	name = "Чудо"
	desc = "Воззовите к своему покровителю, дабы исцелить цель."
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 SECONDS
	miracle = TRUE
	devotion_cost = 10
	var/base_healing = 2.5 // how much we heal per tick

/obj/effect/proc_holder/spell/invoked/lesser_heal/free //using this for a simplemob spell
	releasedrain = 0
	devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/get_most_damaged_limb(mob/living/carbon/C)
	var/obj/item/bodypart/most_damaged_limb = null
	var/highest_damage = 0
	var/obj/item/bodypart/bleeding_limb = null
	var/highest_bleed_rate = 0

	// First check for bleeding limbs
	for(var/obj/item/bodypart/BP in C.bodyparts)
		var/bleed_rate = BP.get_bleed_rate()
		if(bleed_rate > highest_bleed_rate)
			highest_bleed_rate = bleed_rate
			bleeding_limb = BP

	// If we found a bleeding limb, return it
	if(bleeding_limb)
		return bleeding_limb

	// If no bleeding limbs, find the most damaged limb
	for(var/obj/item/bodypart/BP in C.bodyparts)
		var/total_damage = BP.get_damage()
		if(total_damage > highest_damage)
			highest_damage = total_damage
			most_damaged_limb = BP

	return most_damaged_limb

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/range_check(mob/living/carbon/human/user, mob/living/target)
	// we can only miracle someone if we're adjacent to them, unless we're a t4 cleric
	if (target == user) // we can always lay hands on ourself
		return TRUE

	if (user.devotion?.level == CLERIC_T4)
		if (get_dist(user, target) >= range)
			to_chat(user, span_warning("Мне нужно быть ближе к ним, чтобы воззвать к чуду исцеления!"))
			return FALSE
		return TRUE
	
	if (!user.Adjacent(target))
		to_chat(user, span_warning("Мне нужно быть рядом с ними, чтобы совершить чудесное исцеление!"))
		return FALSE
	
	return TRUE	

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/can_heal(mob/living/user, mob/living/target)
	if (!range_check(user, target))
		revert_cast()
		return FALSE

	if(HAS_TRAIT(target, TRAIT_PSYDONITE))
		target.visible_message(span_info("[target] на мгновение вздрагивает, чудо рассеивается."), span_notice("Тусклое тепло наполняет ваше сердце, лишь для того чтобы исчезнуть так же быстро, как появилось."))
		user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		return FALSE

	if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //positive energy harms the undead
		target.visible_message(span_danger("[target] обожжён святым светом!"), span_userdanger("Я обожжён святым светом!"))
		target.adjustFireLoss(10)
		target.fire_act(1,10)
		return FALSE

	if(target.has_status_effect(/datum/status_effect/buff/healing))
		to_chat(user, span_warning("Они уже находятся под действием исцеляющей ауры!"))
		revert_cast()
		return FALSE

	var/is_divine = ispath(user.patron?.type, /datum/patron/divine)
	if(is_divine && (target.real_name in GLOB.excommunicated_players))
		to_chat(user, span_danger("Боги отшатываются от [target]! Божественный огонь обжигает ваши руки, когда ваша мольба отвергается!"))
		target.visible_message(span_danger("[target] опалён божественным гневом! Боги ненавидят его!"), span_userdanger("Я опалён божественным гневом! Боги ненавидят меня!"))
		revert_cast()
		return FALSE

	return TRUE

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/check_embeds(mob/living/target, mob/living/user)
	var/no_embeds = TRUE
	var/list/embeds = target.get_embedded_objects()
	if(length(embeds))
		for(var/object in embeds)
			if(!istype(object, /obj/item/natural/worms/leech))	//Leeches and surgical cheeles are made an exception.
				no_embeds = FALSE
	else
		no_embeds = TRUE

	return no_embeds

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/apply_healing(mob/living/target, mob/living/user, amount)
	if (ishuman(target))
		var/no_embeds = check_embeds(target, user)
		if(no_embeds)
			// Always apply the status effect for visual effects
			target.apply_status_effect(/datum/status_effect/buff/healing, amount)

			// Find and heal the most damaged limb
			var/obj/item/bodypart/most_damaged_limb = get_most_damaged_limb(target)
			if(most_damaged_limb && most_damaged_limb.get_damage() > 0)
				most_damaged_limb.heal_damage(amount * 2, amount * 2, amount * 2)
				target.update_damage_overlays()
				to_chat(target, span_notice("Чудо исцеляет мою [most_damaged_limb.name]!"))
		else
			target.visible_message(span_warning("Раны рвутся и лопаются вокруг застрявших предметов!"), span_warning("Мучительная боль пронзает ваше тело, когда магия пытается сшить ткани вокруг застрявших предметов!"))
			target.adjustBruteLoss(20)
			playsound(target, 'sound/combat/dismemberment/dismem (2).ogg', 100)
			target.emote("agony")
	else
		target.apply_status_effect(/datum/status_effect/buff/healing, amount)

	charge_counter = 0
	if(action)
		action.UpdateButtonIcon()

	var/the_line = pick(user.patron.miracle_healing_lines)
	the_line = replacetext(the_line, "%TARGET", "[target]")
	target.visible_message(span_info(the_line))

/obj/effect/proc_holder/spell/invoked/lesser_heal/proc/get_situational_bonus(mob/living/user, mob/living/target)
	var/situational_info = user.patron.situational_bonus(user, target)
	var/conditional_buff = situational_info[1] ? TRUE : FALSE
	var/situational_bonus = situational_info[2] ? situational_info[2] : 0

	var/healing = base_healing
	if (conditional_buff)
		to_chat(user, span_info("Направлять силу моего покровителя легче в этих условиях!"))
		healing += situational_bonus
	
	return healing

/obj/effect/proc_holder/spell/invoked/lesser_heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/mob/living/carbon/human/H = user

		if (!user.patron || !H)
			return FALSE
		
		// perform all of our pre-heal checks inside can_heal, including revert_casts, if needed
		if (!can_heal(user, target))
			return FALSE
		
		if (target != user)
			if (H.devotion?.level == CLERIC_T4)
				user.visible_message(span_notice("[user] жестом указывает на [target] с тихой молитвой!"))
			else
				user.visible_message(span_notice("[user] возлагает руки на [target], желая плоти и костям исцелиться..."))

			var/datum/beam/healing_beam = user.Beam(target, icon_state="medbeam", time=5 MINUTES)
			apply_healing(target, user, get_situational_bonus(user, target))
			playsound(target, 'sound/magic/heal.ogg', 100)
			while (do_after(user, 10.5 SECONDS, target = target))
				if (H.devotion?.check_devotion(src))
					if (can_heal(user, target))
						playsound(target, 'sound/magic/heal.ogg', 100)
						apply_healing(target, user, get_situational_bonus(user, target))
						H.devotion?.update_devotion(-devotion_cost)
						to_chat(user, "<font color='purple'>Я теряю [devotion_cost] преданности!</font>")
					else
						healing_beam.End()
						return TRUE
				else
					to_chat(user, span_warning("Моя преданность иссякает — я больше не могу взывать к [user.patron.name]!"))
					healing_beam.End()
					return TRUE

			healing_beam.End()
			return TRUE
		else
			user.visible_message(span_info("[user] быстро возлагает руки на себя!"))
			apply_healing(target, user, get_situational_bonus(user, target))
			return TRUE
	
	revert_cast()
	return FALSE

// Miracle
/obj/effect/proc_holder/spell/invoked/heal
	name = "Укрепление"
	desc = "Увеличивает количество исцеления, получаемого вашей целью, на некоторое время."
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 20 SECONDS
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_PSYDONITE))
			target.visible_message(span_info("[target] на мгновение вздрагивает, чудо рассеивается."), span_notice("Тусклое тепло наполняет ваше сердце, лишь для того чтобы исчезнуть так же быстро, как появилось."))
			user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			return FALSE
		if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //positive energy harms the undead
			target.visible_message(span_danger("[target] обожжён святым светом!"), span_userdanger("Я обожжён святым светом!"))
			target.adjustFireLoss(25)
			target.fire_act(1,10)
			return TRUE
		// Block if excommunicated and caster is divine pantheon
		var/is_divine = ispath(user.patron?.type, /datum/patron/divine)
		if(is_divine && (target.real_name in GLOB.excommunicated_players))
			to_chat(user, span_danger("Боги отшатываются от [target]! Божественный огонь обжигает ваши руки, когда ваша мольба отвергается!"))
			target.visible_message(span_danger("[target] опалён божественным гневом! Боги ненавидят его!"), span_userdanger("Я опалён божественным гневом! Боги ненавидят меня!"))
			revert_cast()
			return FALSE
		target.visible_message(span_info("Венок мягкого света окутывает [target]!"), span_notice("Я омыт святым светом!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			C.apply_status_effect(/datum/status_effect/buff/fortify)
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/regression
	name = "Регресс"
	overlay_state = "regression"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = list('sound/magic/regression1.ogg','sound/magic/regression2.ogg','sound/magic/regression3.ogg','sound/magic/regression4.ogg')
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 SECONDS
	miracle = TRUE
	devotion_cost = 10
	req_items = list(/obj/item/clothing/mask/rogue)

/obj/effect/proc_holder/spell/invoked/regression/proc/get_most_damaged_limb(mob/living/carbon/C)
	var/obj/item/bodypart/most_damaged_limb = null
	var/highest_damage = 0
	var/obj/item/bodypart/bleeding_limb = null
	var/highest_bleed_rate = 0

	// First check for bleeding limbs
	for(var/obj/item/bodypart/BP in C.bodyparts)
		var/bleed_rate = BP.get_bleed_rate()
		if(bleed_rate > highest_bleed_rate)
			highest_bleed_rate = bleed_rate
			bleeding_limb = BP

	// If we found a bleeding limb, return it
	if(bleeding_limb)
		return bleeding_limb

	// If no bleeding limbs, find the most damaged limb
	for(var/obj/item/bodypart/BP in C.bodyparts)
		var/total_damage = BP.get_damage()
		if(total_damage > highest_damage)
			highest_damage = total_damage
			most_damaged_limb = BP

	return most_damaged_limb

/obj/effect/proc_holder/spell/invoked/regression/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		target.visible_message(span_info("Магия порядка отматывает раны [target]!"), span_notice("Мои раны исчезли!"))
		var/healing = 2.5
		if(target.has_status_effect(/datum/status_effect/buff/stasis))
			healing += 2.5
		target.apply_status_effect(/datum/status_effect/buff/healing, healing)
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			var/obj/item/bodypart/target_limb = get_most_damaged_limb(H)
			if(target_limb)
				// Heal the most damaged/bleeding limb
				target_limb.heal_damage(healing * 10, healing * 10) // Convert healing to damage values
				H.update_damage_overlays()
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/convergence
	name = "Схождение"
	overlay_state = "convergence"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross, /obj/item/clothing/mask/rogue)
	sound = list('sound/magic/convergence1.ogg','sound/magic/convergence2.ogg','sound/magic/convergence3.ogg','sound/magic/convergence4.ogg')
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 20 SECONDS
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/convergence/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		target.visible_message(span_info("Схождение судеб окружает [target]!"), span_notice("Моё прошлое и настоящее сливаются воедино!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			C.apply_status_effect(/datum/status_effect/buff/convergence)
			C.apply_status_effect(/datum/status_effect/buff/fortify)
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		return TRUE
	revert_cast()
	return FALSE


/obj/effect/proc_holder/spell/invoked/stasis
	name = "Стазис"
	desc = "Вы запечатлеваете текущее состояние цели во времени, возвращая её в это состояние несколько секунд спустя."
	releasedrain = 35
	chargedrain = 1
	chargetime = 30
	recharge_time = 60 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	sound = 'sound/magic/timeforward.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	overlay_state = "sands_of_time"
	var/brute = 0
	var/burn = 0
	var/oxy = 0
	var/toxin = 0
	var/turf/origin
	var/firestacks = 0
	var/divinefirestacks = 0
	var/sunderfirestacks = 0
	var/blood = 0
	miracle = TRUE
	devotion_cost = 30
	req_items = list(/obj/item/clothing/mask/rogue)

/obj/effect/proc_holder/spell/invoked/stasis/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/mob/living/carbon/C = target
		C.apply_status_effect(/datum/status_effect/buff/stasis)
		brute = target.getBruteLoss()
		burn = target.getFireLoss()
		oxy = target.getOxyLoss()
		toxin = target.getToxLoss()
		origin = get_turf(target)
		blood = target.blood_volume
		var/datum/status_effect/fire_handler/fire_stacks/fire_status = target.has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
		firestacks = fire_status?.stacks
		var/datum/status_effect/fire_handler/fire_stacks/sunder/sunder_status = target.has_status_effect(/datum/status_effect/fire_handler/fire_stacks/sunder)
		sunderfirestacks = sunder_status?.stacks
		var/datum/status_effect/fire_handler/fire_stacks/divine/divine_status = target.has_status_effect(/datum/status_effect/fire_handler/fire_stacks/divine)
		divinefirestacks = divine_status?.stacks
		to_chat(target, span_warning("Я чувствую, что часть меня осталась позади..."))
		play_indicator(target,'icons/mob/overhead_effects.dmi', "timestop", 100, OBJ_LAYER)
		addtimer(CALLBACK(src, PROC_REF(remove_buff), target), wait = 10 SECONDS)
		return TRUE


/obj/effect/proc_holder/spell/invoked/stasis/proc/remove_buff(mob/living/carbon/target)
	do_teleport(target, origin, no_effects=TRUE)
	var/brutenew = target.getBruteLoss()
	var/burnnew = target.getFireLoss()
	var/oxynew = target.getOxyLoss()
	var/toxinnew = target.getToxLoss()
	target.adjust_fire_stacks(firestacks)
	target.adjust_fire_stacks(sunderfirestacks, /datum/status_effect/fire_handler/fire_stacks/sunder)
	target.adjust_fire_stacks(divinefirestacks, /datum/status_effect/fire_handler/fire_stacks/divine)
	if(target.has_status_effect(/datum/status_effect/buff/convergence))
		if(brutenew>brute)
			target.adjustBruteLoss(brutenew*-1 + brute)
		if(burnnew>burn)
			target.adjustFireLoss(burnnew*-1 + burn)
		if(oxynew>oxy)
			target.adjustOxyLoss(oxynew*-1 + oxy)
		if(toxinnew>toxin)
			target.adjustToxLoss(target.getToxLoss()*-1 + toxin)
		if(target.blood_volume<blood)
			target.blood_volume = blood
	else
		target.adjustBruteLoss(brutenew*-1 + brute)
		target.adjustFireLoss(burnnew*-1 + burn)
		target.adjustOxyLoss(oxynew*-1 + oxy)
		target.adjustToxLoss(target.getToxLoss()*-1 + toxin)
		target.blood_volume = blood
	playsound(target, 'sound/magic/timereverse.ogg', 100, FALSE)

/obj/effect/proc_holder/spell/invoked/stasis/proc/play_indicator(mob/living/carbon/target, icon_path, overlay_name, clear_time, overlay_layer)
	if(!ishuman(target))
		return
	if(target.stat != DEAD)
		var/mob/living/carbon/humie = target
		var/datum/species/species =	humie.dna.species
		var/list/offset_list
		if(humie.gender == FEMALE)
			offset_list = species.offset_features[OFFSET_HEAD_F]
		else
			offset_list = species.offset_features[OFFSET_HEAD]
			var/mutable_appearance/appearance = mutable_appearance(icon_path, overlay_name, overlay_layer)
			if(offset_list)
				appearance.pixel_x += (offset_list[1])
				appearance.pixel_y += (offset_list[2]+12)
			appearance.appearance_flags = RESET_COLOR
			target.overlays_standing[OBJ_LAYER] = appearance
			target.apply_overlay(OBJ_LAYER)
			update_icon()
			addtimer(CALLBACK(humie, PROC_REF(clear_overhead_indicator), appearance, target), clear_time)

/obj/effect/proc_holder/spell/invoked/stasis/proc/clear_overhead_indicator(appearance,mob/living/carbon/target)
	target.remove_overlay(OBJ_LAYER)
	cut_overlay(appearance, TRUE)
	qdel(appearance)
	update_icon()
	return


//Universal miracle T3 miracle.
//Instantly heals all wounds & damage on a selected limb.
//Long CD (so a Medical class would still outpace this if there's more than one patient to heal)
/obj/effect/proc_holder/spell/invoked/wound_heal
	name = "Чудо Ран"
	desc = "Исцеляет все раны на выбранной конечности."
	overlay_icon = 'icons/mob/actions/genericmiracles.dmi'
	overlay_state = "woundheal"
	action_icon_state = "woundheal"
	action_icon = 'icons/mob/actions/genericmiracles.dmi'
	releasedrain = 15
	chargedrain = 0
	chargetime = 3
	range = 1
	ignore_los = FALSE
	warnie = "sydwarning"
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/woundheal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 2 MINUTES
	miracle = TRUE
	is_cdr_exempt = TRUE
	var/delay = 4.5 SECONDS	//Reduced to 1.5 seconds with Legendary
	devotion_cost = 100

/obj/effect/proc_holder/spell/invoked/wound_heal/cast(list/targets, mob/user = usr)
	if(ishuman(targets[1]))

		var/mob/living/carbon/human/target = targets[1]
		var/mob/living/carbon/human/HU = user
		var/def_zone = check_zone(user.zone_selected)
		var/obj/item/bodypart/affecting = target.get_bodypart(def_zone)

		if(HAS_TRAIT(target, TRAIT_PSYDONITE))
			target.visible_message(span_info("[target] на мгновение вздрагивает, чудо рассеивается."), span_notice("Тусклое тепло наполняет ваше сердце, лишь для того чтобы исчезнуть так же быстро, как появилось."))
			user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			return FALSE

		if(!affecting)
			revert_cast()
			return FALSE
		if(length(affecting.embedded_objects))
			var/no_embeds = TRUE
			for(var/object in affecting.embedded_objects)
				if(!istype(object, /obj/item/natural/worms/leech))	//Leeches and surgical cheeles are made an exception.
					no_embeds = FALSE
			if(!no_embeds)
				to_chat(user, span_warning("Мы не можем запечатать раны с предметами внутри этой конечности!"))
				revert_cast()
				return FALSE
		if(!do_after(user, (delay - (0.5 SECONDS * HU.get_skill_level(associated_skill)))))
			revert_cast()
			to_chat(user, span_warning("Нас прервали!"))
			return FALSE
		var/foundwound = FALSE
		if(length(affecting.wounds))
			for(var/datum/wound/wound in affecting.wounds)
				if(!isnull(wound) && wound.healable_by_miracles)
					wound.heal_wound(wound.whp)
					foundwound = TRUE
					user.visible_message(("<font color = '#488f33'>[wound.name] источает чистую жидкость и закрывается, превращаясь в болезненный синяк!</font>"))
					affecting.add_wound(/datum/wound/bruise/woundheal)
			if(foundwound)
				playsound(target, 'sound/magic/woundheal_crunch.ogg', 100, TRUE)
			affecting.change_bodypart_status(BODYPART_ORGANIC, heal_limb = TRUE)
			affecting.update_disabled()
			target.update_damage_hud()
			return TRUE
		else
			to_chat(user, span_warning("Конечность не имеет ран."))
			revert_cast()
			return FALSE
	revert_cast()
	return FALSE


/obj/effect/proc_holder/spell/invoked/blood_heal
	name = "Кровная связь"
	desc = "Передаёт часть моей жизненной крови нуждающейся цели."
	overlay_icon = 'icons/mob/actions/genericmiracles.dmi'
	overlay_state = "bloodheal"
	action_icon_state = "bloodheal"
	action_icon = 'icons/mob/actions/genericmiracles.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	ignore_los = FALSE
	warnie = "sydwarning"
	movement_interrupt = TRUE
	sound = 'sound/magic/bloodheal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 15 SECONDS
	miracle = TRUE
	devotion_cost = 50
	var/blood_price_coefficient = 1.25
	var/blood_vol_restore = 7.5 // base value
	var/vol_per_skill = 3.75 // double at apprentice, triple at expert, quadruple at legendary
	var/delay = 1.5 SECONDS

/obj/effect/proc_holder/spell/invoked/blood_heal/proc/bond_check(mob/living/carbon/human/user, mob/living/target, revert = TRUE)
	if (!istype(user, /mob/living/carbon/human) || !istype(target, /mob/living/carbon/human))
		to_chat(user, span_warning("Я могу установить кровную связь только с другими гуманоидами!"))
		if (revert)
			revert_cast()
		return FALSE
	if (target == user)
		to_chat(user, span_warning("Я не могу начать кровную связь с собой! Она должна быть с кем-то другим!"))
		if (revert)
			revert_cast()
		return
	if (!user.Adjacent(target))
		to_chat(user, span_warning("Мне нужно быть рядом с целью, чтобы поддерживать кровную связь!"))
		if (revert)
			revert_cast()
		return FALSE
	if(NOBLOOD in user.dna?.species?.species_traits)
		to_chat(user, span_warning("У меня нет крови."))
		if (revert)
			revert_cast()
		return FALSE
	if(target.blood_volume >= BLOOD_VOLUME_NORMAL)
		to_chat(user, span_warning("Их жизненная кровь в порядке. В этом нет нужды."))
		if (revert)
			revert_cast()
		return FALSE
	if(HAS_TRAIT(target, TRAIT_PSYDONITE))
		target.visible_message(span_info("[target] на мгновение вздрагивает, чудо рассеивается."), span_notice("Тусклое тепло наполняет ваше сердце, лишь для того чтобы исчезнуть так же быстро, как появилось."))
		user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		return FALSE

	return TRUE

/obj/effect/proc_holder/spell/invoked/blood_heal/cast(list/targets, mob/user = usr)
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/target = targets[1]
		// Check if user is human before accessing dna
		if(!ishuman(user))
			to_chat(user, span_warning("Я не могу передавать кровь в этой форме!"))
			revert_cast()
			return FALSE
		var/mob/living/carbon/human/UH = user

		if (!bond_check(UH, target, revert = TRUE))
			return FALSE

		UH.visible_message(span_warning("Крошечные красные нити связывают [UH] и [target], и капли крови бегут по ним!"))
		playsound(UH, 'sound/magic/bloodheal_start.ogg', 100, TRUE)
		var/user_skill = UH.get_skill_level(associated_skill)
		
		// higher miracle skills let us transfer more of our blood at once, but don't really affect the efficiency all that much.
		var/actual_blood_vol_restore = blood_vol_restore
		actual_blood_vol_restore += (vol_per_skill * user_skill)

		// a cheele restores 300% of the original blood volume over a LONG period of time
		// we want bloodbond to be about 125% since it doesn't require an external item, is much faster, and uses two renewable resources (blood & devotion)
		var/actual_blood_price = actual_blood_vol_restore / blood_price_coefficient

		var/max_loops = max(round(UH.blood_volume / actual_blood_price, 1), 1)
		var/datum/beam/bloodbeam = user.Beam(target,icon_state="blood",time=(max_loops * 5))

		for(var/i in 1 to max_loops)
			if(UH.blood_volume > (BLOOD_VOLUME_SURVIVE / 2))
				if(do_after(UH, delay) && bond_check(UH, target, revert = FALSE) && UH.devotion?.check_devotion(src))
					target.blood_volume = min((target.blood_volume + actual_blood_vol_restore), BLOOD_VOLUME_NORMAL)
					UH.blood_volume = max((UH.blood_volume - actual_blood_price), 0)
					var/devo_cost = round(0 - (devotion_cost / max_loops), 1)
					UH.devotion?.update_devotion(devo_cost)
				else
					UH.visible_message(span_warning("Кровная связь между [UH] и [target] разрывается!"))
					bloodbeam.End()
					return TRUE
			else
				UH.visible_message(span_warning("Кровная связь между [UH] и [target] разрывается!"))
				bloodbeam.End()
				return TRUE
		bloodbeam.End()
		return TRUE
	revert_cast()
	return FALSE
