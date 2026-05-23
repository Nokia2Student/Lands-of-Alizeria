// Diagnose
/obj/effect/proc_holder/spell/invoked/diagnose
	name = "Диагноз"
	desc = "Осмотрите цель, чтобы определить травмы, если они есть."
	overlay_state = "diagnose"
	releasedrain = 10
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/diagnose.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 5 SECONDS //very stupidly simple spell
	miracle = TRUE
	devotion_cost = 0 //come on, this is very basic

/obj/effect/proc_holder/spell/invoked/diagnose/cast(list/targets, mob/living/user)
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/human_target = targets[1]
		human_target.check_for_injuries(user)

		if (human_target.reagents.has_reagent(/datum/reagent/infection/major))
			to_chat(user, span_boldwarning("Чёрные и жёлтые полосы несомненно указывают на избыток меланхолической желчи."))
		else if (human_target.reagents.has_reagent(/datum/reagent/infection))
			to_chat(user, span_warning("Покрасневшая и воспалённая плоть, испачканный потом лоб. Возможно, избыток холерической желчи?"))
		else if (human_target.reagents.has_reagent(/datum/reagent/infection/minor))
			to_chat(user, span_warning("Лёгкая желтизна указывает на малейшее присутствие нарушенной холерической желчи."))

		//To tell thresholds of toxins in the system, here so people don't have info of their own toxins outside of diagnosis method
		switch(human_target.toxloss)
			if(0 to 1)
				to_chat(user, span_notice("Никаких признаков отравления в теле."))
			if(1 to 50)
				to_chat(user, span_notice("При тщательном осмотре обнаружены некоторые следы отравления."))
			if(50 to 100)
				to_chat(user, span_notice("Заметны значительные признаки отравления."))
			if(100 to 150)
				to_chat(user, span_warning("Тело страдает от отравления."))
			if(150 to INFINITY)
				to_chat(user, span_necrosis("Тело разрушено отравлением."))

		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/diagnose/secular
	name = "Светский диагноз"
	overlay_state = "diagnose"
	range = 1
	associated_skill = /datum/skill/misc/medicine
	miracle = FALSE
	devotion_cost = 0 //Doctors are not clerics

// Limb or organ attachment
/obj/effect/proc_holder/spell/invoked/attach_bodypart
	name = "Чудо конечности"
	desc = "Присоедините часть тела к цели."
	overlay_state = "limb_attach"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/gore/flesh_eat_03.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 60 SECONDS //attaching a limb is pretty intense
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/attach_bodypart/proc/get_organs(mob/living/target, mob/living/user)
	var/list/missing_organs = list(
		ORGAN_SLOT_EARS,
		ORGAN_SLOT_EYES,
		ORGAN_SLOT_TONGUE,
		ORGAN_SLOT_HEART,
		ORGAN_SLOT_LUNGS,
		ORGAN_SLOT_LIVER,
		ORGAN_SLOT_STOMACH,
		ORGAN_SLOT_APPENDIX,
	)
	for(var/missing_organ_slot in missing_organs)
		if(!target.getorganslot(missing_organ_slot))
			continue
		missing_organs -= missing_organ_slot
	if(!length(missing_organs))
		return
	var/list/organs = list()
	//try to get from user's hands first
	for(var/obj/item/organ/potential_organ in user?.held_items)
		if(potential_organ.owner || !(potential_organ.slot in missing_organs))
			continue
		organs += potential_organ
	//then target's hands
	for(var/obj/item/organ/dismembered in target.held_items)
		if(dismembered.owner || !(dismembered.slot in missing_organs))
			continue
		organs += dismembered
	//then finally, 1 tile range around target
	for(var/obj/item/organ/dismembered in range(1, target))
		if(dismembered.owner || !(dismembered.slot in missing_organs))
			continue
		organs += dismembered
	return organs

/obj/effect/proc_holder/spell/invoked/attach_bodypart/proc/get_limbs(mob/living/target, mob/living/user)
	var/list/missing_limbs = target.get_missing_limbs()
	if(!length(missing_limbs))
		return
	var/list/limbs = list()
	//try to get from user's hands first
	for(var/obj/item/bodypart/potential_limb in user?.held_items)
		if(potential_limb.owner || !(potential_limb.body_zone in missing_limbs))
			continue
		limbs += potential_limb
	//then target's hands
	for(var/obj/item/bodypart/dismembered in target.held_items)
		if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
			continue
		limbs += dismembered
	//then finally, 1 tile range around target
	for(var/obj/item/bodypart/dismembered in range(1, target))
		if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
			continue
		limbs += dismembered
	return limbs

// consider adding functionality to regrow one entire organ or limb per casting?
/obj/effect/proc_holder/spell/invoked/attach_bodypart/cast(list/targets, mob/living/user)
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/human_target = targets[1]
		var/same_owner = FALSE
		if(human_target.has_status_effect(/datum/status_effect/buff/necras_vow))
			same_owner = TRUE
			to_chat(user, span_warning("Это существо принесло обет Некре. Только его собственные конечности будут приняты."))
		for(var/obj/item/bodypart/limb as anything in get_limbs(human_target, user))
			if(!human_target.get_bodypart(limb.body_zone) && same_owner)
				if(limb.original_owner != human_target)
					continue
			if(human_target.get_bodypart(limb.body_zone) || !limb.attach_limb(human_target))
				continue
			human_target.visible_message(span_info("[limb] присоединяется к [human_target]!"), \
								span_notice("[limb] присоединяется ко мне!"))
		for(var/obj/item/organ/organ as anything in get_organs(human_target, user))
			if(human_target.getorganslot(organ.slot) || !organ.Insert(human_target))
				continue
			human_target.visible_message(span_info("[organ] присоединяется к [human_target]!"), \
								span_notice("[organ] присоединяется ко мне!"))
		if(!(human_target.mob_biotypes & MOB_UNDEAD))
			for(var/obj/item/bodypart/limb as anything in human_target.bodyparts)
				limb.rotted = FALSE
				limb.skeletonized = FALSE
		human_target.update_body()
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/infestation
	name = "Нашествие"
	desc = "Насылает рой насекомых, чтобы окружить цель, укусить её и вызвать болезнь."
	overlay_state = "null" //sprite later
	releasedrain = 50
	chargetime = 10
	recharge_time = 20 SECONDS
	range = 8
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	devotion_cost = 50 // attack miracle
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/fliesloop
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	miracle = TRUE

	invocation = "Rot, take them!"
	invocation_type = "shout" //can be none, whisper, emote and shout


/obj/effect/proc_holder/spell/invoked/infestation/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_warning("[target] окружён облаком заразных паразитов!"), span_notice("Вы окружаете [target] облаком заразных паразитов!"))
		target.apply_status_effect(/datum/status_effect/buff/infestation/) //apply debuff
		return TRUE
	return FALSE

/datum/status_effect/buff/infestation
	id = "infestation"
	alert_type = /atom/movable/screen/alert/status_effect/buff/infestation
	duration = 10 SECONDS
	effectedstats = list("constitution" = -2)
	var/static/mutable_appearance/rotten = mutable_appearance('icons/roguetown/mob/rotten.dmi', "rotten")

/datum/status_effect/buff/infestation/on_apply()
	. = ..()
	var/mob/living/target = owner
	to_chat(owner, span_danger("Я внезапно окружён облаком насекомых!"))
	target.Jitter(20)
	target.add_overlay(rotten)
	target.update_vision_cone()

/datum/status_effect/buff/infestation/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(rotten)
	target.update_vision_cone()
	. = ..()

/datum/status_effect/buff/infestation/tick()
	var/mob/living/target = owner
	var/mob/living/carbon/M = target
	target.adjustToxLoss(2)
	target.adjustBruteLoss(1)
	var/prompt = pick(1,2,3)
	var/message = pick(
		"Клещи на моей коже начинают набухать кровью!",
		"Мухи откладывают яйца в мои открытые раны!",
		"Что-то заползло мне в ухо!",
		"Жуков так много, что не сосчитать!",
		"Они пытаются забраться мне под кожу!",
		"Остановите это!",
		"Ножки многоножек щекочут заднюю часть моего уха!",
		"Огненные муравьи кусают мои ноги!",
		"Оса ужалила прямо в нос!",
		"Тараканы копошатся на моей шее!",
		"Личинки скользят по моему телу!",
		"Жуки ползают по моему рту!",
		"Блохи кусают мои лодыжки!",
		"Москиты жужжат вокруг моего лица!",
		"Вши сосут мою кровь!",
		"Сверчки стрекочут в моих ушах!",
		"Уховёртки заползают в мои уши!")
	if(prompt == 1 && iscarbon(M))
		M.add_nausea(pick(10,20))
		to_chat(target, span_warning(message))

/atom/movable/screen/alert/status_effect/buff/infestation
	name = "Нашествие"
	desc = "Заразные паразиты кусают и грызут мою кожу."
	icon_state = "debuff"

// Cure rot
/obj/effect/proc_holder/spell/invoked/cure_rot
	name = "Исцеление гнили"
	desc = "Призовите силу Пестры, чтобы удалить всю мертвячью гниль с цели."
	overlay_state = "cure_rot"
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/revive.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 3 MINUTES /// Scarlet edit. Original: 2 MINUTES
	miracle = TRUE
	devotion_cost = 200 /// Scarlet edit. Original 30
	/// Amount of PQ gained for curing zombos
	var/unzombification_pq = PQ_GAIN_UNZOMBIFY
	var/is_lethal = FALSE /// Scarlet edit. Original: TRUE

/obj/effect/proc_holder/spell/invoked/cure_rot/priest
	is_lethal = FALSE
	recharge_time = 2 MINUTES
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/cure_rot/cast(list/targets, mob/living/user)
	var/stinky = FALSE
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(ispath(user.patron?.type, /datum/patron/divine) && (target.real_name in GLOB.excommunicated_players))
			to_chat(user, span_warning("Их нельзя очистить от гнили."))
			revert_cast()
			return FALSE
		if(HAS_TRAIT(target, TRAIT_CURSE_NECRA))
			to_chat(user, span_warning("Их нельзя очистить от гнили."))
			revert_cast()
			return FALSE

		if(GLOB.tod == "night")
			to_chat(user, span_warning("Да будет свет."))
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)

		var/datum/antagonist/zombie/was_zombie = target.mind?.has_antag_datum(/datum/antagonist/zombie)
		if(target.stat == DEAD || was_zombie)	//Checks if the target is a dead rotted corpse.
			var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
			if(rot && rot.amount && rot.amount >= 5 MINUTES)	//Fail-safe to make sure the dead person has at least rotted for ~5 min.
				stinky = TRUE

		if(remove_rot(target = target, user = user, method = "prayer",
			success_message = "Гниль покидает тело [target]!",
			fail_message = "Ничего не происходит.", lethal = is_lethal))
			target.visible_message(span_notice("Гниль покидает тело [target]!"), span_green("Я чувствую, как гниль покидает моё тело!"))
			target.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it.
			if(stinky)
				target.apply_status_effect(/datum/status_effect/debuff/rotted)	//Perma debuff, needs cure
			return TRUE
		else //Attempt failed, no rot
			target.visible_message(span_warning("Гниль не покидает тело [target]!"), span_warning("Я не чувствую разницы..."))
			return FALSE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/cure_rot/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/fluff/psycross/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, span_warning("Мне нужен святой крест."))
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/invoked/pestra_leech
	name = "Пиявочное очищение"
	desc = "Заставьте цель исторгнуть пиявок, очищая её тело от токсинов."
	overlay_state = "leech_purge"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/gore/flesh_eat_03.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 60 SECONDS
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/pestra_leech/cast(list/targets, mob/living/user)
	if(iscarbon(targets[1]))
		var/mob/living/carbon/C = targets[1]
		if(C.cmode)
			to_chat(user, span_warning("Они слишком напряжены для столь тонкого искусства!"))
			revert_cast()
			return FALSE
		C.vomit()
		C.adjustToxLoss(-30)
		if(C.blood_volume < BLOOD_VOLUME_NORMAL)
			C.blood_volume = min(C.blood_volume+30, BLOOD_VOLUME_NORMAL)
		C.visible_message(span_warning("[C] исторгает из себя несколько пиявок!"), span_warning("Что-то бурлит внутри меня!"))
		new /obj/item/natural/worms/leech(get_turf(C))
		if(prob( (user.get_skill_level(/datum/skill/magic/holy) * 10) ))
			new /obj/item/natural/worms/leech(get_turf(C))
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/regrow_limbs
	name = "Регенерация конечности"
	desc = "Чудесным образом отрастите отсутствующие конечности цели без необходимости в отделённых частях."
	overlay_state = "regeneratelimb"
	clothes_req = FALSE
	releasedrain = 30
	chargedrain = 0
	chargetime = 100
	range = 1
	ignore_los = FALSE
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation = "Flesh, knit and return!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	devotion_cost = 100
	recharge_time = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/regrow_limbs/cast(list/targets, mob/living/user = usr)
	if(!ishuman(targets[1]))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = targets[1]
	if(H.anti_magic_check(TRUE, TRUE))
		return FALSE

	var/list/missing = H.get_missing_limbs()
	if(!length(missing))
		to_chat(user, span_info("У [H] нет отсутствующих конечностей для восстановления."))
		return TRUE
	H.visible_message(
		span_info("[user] поднимает руку - плоть срастается на [H]!"),
		span_notice("Тепло разливается по мне, когда конечности восстанавливаются!")
	)

	H.regenerate_limbs(0)
	if(!(H.mob_biotypes & MOB_UNDEAD))
		for(var/obj/item/bodypart/L as anything in H.bodyparts)
			L.rotted = FALSE
			L.skeletonized = FALSE

	H.update_body()
	return TRUE

/obj/effect/proc_holder/spell/invoked/pestratouch
	name = "Прикосновение Пестры"
	desc = "Устойчивое благословение, которое исцеляет внутренние органы и очищает от инфекций."
	overlay_state = "miracle"
	clothes_req = FALSE
	releasedrain = 0
	chargedrain = 0
	chargetime = 100
	range = 1
	ignore_los = FALSE
	movement_interrupt = FALSE
	sound = 'sound/magic/churn.ogg'
	spell_tier = 2
	invocation = "By grace within, be made whole."
	invocation_type = "whisper"
	associated_skill = /datum/skill/magic/holy
	devotion_cost = 100
	recharge_time = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/pestratouch/cast(list/targets, mob/living/user)
    if(!isliving(targets[1]))
        revert_cast()
        return FALSE
    var/mob/living/target = targets[1]
    if(target.anti_magic_check(TRUE, TRUE))
        return FALSE
    if(!ishuman(target))
        to_chat(user, span_warning("Эта молитва подходит только смертным телам."))
        return FALSE
    var/mob/living/carbon/human/M = target
    for(var/obj/item/organ/organny in M.internal_organs)
        M.adjustOrganLoss(organny.slot, -5)
    for(var/obj/item/bodypart/B in M.bodyparts)
        for(var/datum/wound/W in B.wounds)
            if(W.zombie_infection_timer)
                deltimer(W.zombie_infection_timer)
                W.zombie_infection_timer = null
                to_chat(M, span_warning("Обжигающая чистота выжигает гниль в вашей [B.name]."))
            if(W.werewolf_infection_timer)
                deltimer(W.werewolf_infection_timer)
                W.werewolf_infection_timer = null
                to_chat(M, span_warning("Обжигающая чистота выжигает скверну в вашей [B.name]."))

    M.update_damage_overlays()

    target.visible_message(
        span_info("[user] бормочет очищающее благословение над [target]."),
        span_notice("Устойчивое тепло исцеляет ваши внутренности и выжигает инфекцию.")
    )
    return TRUE

//TEST STUFF UPGRADEABLE

/obj/effect/proc_holder/spell/invoked/diagnose/greater
	name = "Великий диагноз"
	desc = "Точная божественная оценка: показывает реагенты, уровень крови, состояние органов и количественный урон."
	overlay_state = "diagnose"
	releasedrain = 15
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/diagnose.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 8 SECONDS
	miracle = TRUE
	devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/diagnose/greater/cast(list/targets, mob/living/user)
	if(!ishuman(targets[1]))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = targets[1]

	if(hascall(H, "check_for_injuries"))
		H.check_for_injuries(user)

	to_chat(user, span_notice("--- Божественный диагноз [H] ---"))

	if(H.reagents && H.reagents.reagent_list?.len)
		to_chat(user, span_info("Обнаружены реагенты:"))
		for(var/datum/reagent/R as anything in H.reagents.reagent_list)
			if(!R || R.volume <= 0) continue
			to_chat(user, "• [R.name]: [round(R.volume, 0.1)] ед.")
	else
		to_chat(user, span_notice("Обнаружены реагенты: нет."))

	to_chat(user, span_info("Объём крови: [round(((isnum(H.blood_volume) && H.blood_volume > 0) ? H.blood_volume : (H.reagents && hascall(H.reagents, "get_reagent_amount") ? H.reagents.get_reagent_amount(/datum/reagent/blood) : 0)), 0.1)] ед."))

	var/tox = _dg_safe_num(H, list("toxloss"))
	var/oxy = _dg_safe_num(H, list("oxyloss", "oxygen_loss"))
	to_chat(user, span_info("Урон токсинами: [tox]"))
	to_chat(user, span_info("Урон кислородом: [oxy]"))

	if(islist(H.bodyparts) && H.bodyparts.len)
		to_chat(user, span_info("Повреждения частей тела:"))
		for(var/obj/item/bodypart/B as anything in H.bodyparts)
			var/br = _dg_safe_num(B, list("brute_dam", "brute_damage", "brute"))
			var/bu = _dg_safe_num(B, list("burn_dam", "burn_damage", "burn"))
			if(br > 0 || bu > 0)
				to_chat(user, "• [B.name]: ушибы [br], ожоги [bu]")
	else
		to_chat(user, span_notice("Нет данных о повреждениях частей тела."))
	if(islist(H.internal_organs) && H.internal_organs.len)
		to_chat(user, span_info("Внутренние органы:"))
		for(var/obj/item/organ/O as anything in H.internal_organs)
			var/od = 0
			if(hascall(H, "get_organ_loss") && istext(O.slot) || isnum(O.slot))
				var/tmp_loss = call(H, "get_organ_loss")(O.slot)
				if(isnum(tmp_loss))
					od = tmp_loss
			if(!od)
				var/base = _dg_safe_num(O, list("damage", "organ_damage"))
				var/brorg = _dg_safe_num(O, list("brute_dam", "brute_damage"))
				var/buorg = _dg_safe_num(O, list("burn_dam", "burn_damage"))
				od = base + brorg + buorg
			to_chat(user, "• [O.name]: повреждение [od]")
	else
		to_chat(user, span_notice("Нет данных о внутренних органах."))

	return TRUE

/proc/_dg_safe_num(datum/D, list/keys)
	if(!D || !islist(keys)) return 0
	for(var/k in keys)
		if(k in D.vars)
			var/v = D.vars[k]
			if(isnum(v))
				return v
	return 0

/obj/effect/proc_holder/spell/invoked/regrow_limbs
	name = "Регенерация конечности"
	desc = "Чудесным образом отрастите отсутствующие конечности цели без необходимости в отделённых частях."
	overlay_state = "regeneratelimb"
	clothes_req = FALSE
	releasedrain = 30
	chargedrain = 0
	chargetime = 100
	range = 1
	ignore_los = FALSE
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation = "Flesh, knit and return!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	devotion_cost = 100
	recharge_time = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/regrow_limbs/cast(list/targets, mob/living/user = usr)
	if(!ishuman(targets[1]))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = targets[1]
	if(H.anti_magic_check(TRUE, TRUE))
		return FALSE

	var/list/missing = H.get_missing_limbs()
	if(!length(missing))
		to_chat(user, span_info("У [H] нет отсутствующих конечностей для восстановления."))
		return TRUE
	H.visible_message(
		span_info("[user] поднимает руку - плоть срастается на [H]!"),
		span_notice("Тепло разливается по мне, когда конечности восстанавливаются!")
	)

	H.regenerate_limbs(0)
	if(!(H.mob_biotypes & MOB_UNDEAD))
		for(var/obj/item/bodypart/L as anything in H.bodyparts)
			L.rotted = FALSE
			L.skeletonized = FALSE

	H.update_body()
	return TRUE

/obj/effect/proc_holder/spell/invoked/pestratouch
	name = "Прикосновение Пестры"
	desc = "Устойчивое благословение, которое исцеляет внутренние органы и очищает от инфекций."
	overlay_state = "miracle"
	clothes_req = FALSE
	releasedrain = 0
	chargedrain = 0
	chargetime = 100
	range = 1
	ignore_los = FALSE
	movement_interrupt = FALSE
	sound = 'sound/magic/churn.ogg'
	spell_tier = 2
	invocation = "By grace within, be made whole."
	invocation_type = "whisper"
	associated_skill = /datum/skill/magic/holy
	devotion_cost = 100
	recharge_time = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/pestratouch/cast(list/targets, mob/living/user)
    if(!isliving(targets[1]))
        revert_cast()
        return FALSE
    var/mob/living/target = targets[1]
    if(target.anti_magic_check(TRUE, TRUE))
        return FALSE
    if(!ishuman(target))
        to_chat(user, span_warning("Эта молитва подходит только смертным телам."))
        return FALSE
    var/mob/living/carbon/human/M = target
    for(var/obj/item/organ/organny in M.internal_organs)
        M.adjustOrganLoss(organny.slot, -5)
    for(var/obj/item/bodypart/B in M.bodyparts)
        for(var/datum/wound/W in B.wounds)
            if(W.zombie_infection_timer)
                deltimer(W.zombie_infection_timer)
                W.zombie_infection_timer = null
                to_chat(M, span_warning("Обжигающая чистота выжигает гниль в вашей [B.name]."))
            if(W.werewolf_infection_timer)
                deltimer(W.werewolf_infection_timer)
                W.werewolf_infection_timer = null
                to_chat(M, span_warning("Обжигающая чистота выжигает скверну в вашей [B.name]."))

    M.update_damage_overlays()

    target.visible_message(
        span_info("[user] бормочет очищающее благословение над [target]."),
        span_notice("Устойчивое тепло исцеляет ваши внутренности и выжигает инфекцию.")
    )
    return TRUE
