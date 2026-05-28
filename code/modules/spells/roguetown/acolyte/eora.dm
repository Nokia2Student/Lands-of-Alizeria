//Eora content from Stonekeep

/obj/item/clothing/head/peaceflower
	name = "бутон Эоры"
	desc = "Цветок с нежными лепестками, связанный с Эорой или Некрой. Обычно его носят как головной убор или кладут на могилы в знак любви и покоя."
	icon = 'icons/roguetown/items/produce.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head_items.dmi'
	icon_state = "peaceflower"
	item_state = "peaceflower"
	dropshrink = 0.9
	slot_flags = ITEM_SLOT_HEAD
	body_parts_covered = NONE
	dynamic_hair_suffix = ""
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3

/obj/item/clothing/head/peaceflower/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		ADD_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/dropped(mob/living/carbon/human/user)
	..()
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/proc/at_peace_check(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		if(src == carbon_user.head)
			to_chat(user, span_warning("Вы чувствуете умиротворение. <b style='color:pink'>Зачем вам что-то ещё?</b>"))
			return TRUE
	return FALSE

/obj/item/clothing/head/peaceflower/attack_hand(mob/user, list/modifiers)
	if(at_peace_check(user))
		return
	return ..()

/obj/item/clothing/head/peaceflower/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)
	if(at_peace_check(usr))
		return
	return ..()

/obj/effect/proc_holder/spell/invoked/bud
	name = "Цветение Эоры"
	desc = "Выращивает бутон Эоры на голове цели, усмиряя её."
	clothes_req = FALSE
	range = 7
	overlay_state = "love"
	sound = list('sound/magic/magnet.ogg')
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	recharge_time = 60 SECONDS
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/bud/kazengun
	name = "Цветение Эори"

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
	var/target = targets[1]
	if(istype(target, /mob/living/carbon/human)) //Putting flower on head check
		var/mob/living/carbon/human/C = target
		if(!C.get_item_by_slot(SLOT_HEAD))
			var/obj/item/clothing/head/peaceflower/F = new(get_turf(C))
			C.equip_to_slot_if_possible(F, SLOT_HEAD, TRUE, TRUE)
			to_chat(C, span_info("Цветок Эоры распускается на моей голове. Я чувствую умиротворение."))
			return TRUE
		else
			to_chat(user, span_warning("Голова цели занята. Цветам Эоры нужно открытое место, чтобы расцвести."))
			revert_cast()
			return FALSE
	var/turf/T = get_turf(targets[1])
	if(!isclosedturf(T))
		new /obj/item/clothing/head/peaceflower(T)
		return TRUE
	to_chat(user, span_warning("Указанное место заблокировано. Цветы Эоры отказываются расти."))
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse
	name = "Проклятие Эоры"
	desc = "Воззовите к Эоре, чтобы наложить на цель изменяющие восприятие эффекты."
	overlay_state = "curse2"
	releasedrain = 50
	chargetime = 30
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 SECONDS
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/eoracurse/kazengun
	name = "Проклятие Эори"

/obj/effect/proc_holder/spell/invoked/eoracurse/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/druqks)
		target.apply_status_effect(/datum/status_effect/buff/drunk)
		target.visible_message(span_info("Фиолетовая дымка окутывает [target]!"), span_notice("Я чувствую себя гораздо спокойнее."))
		target.blur_eyes(10)
		return TRUE
	revert_cast()
	return FALSE

// =====================
// Eora Bond Component
// =====================
/datum/component/eora_bond
	var/mob/living/carbon/partner
	var/mob/living/carbon/caster
	var/duration = 900 SECONDS
	var/max_distance = 7
	var/damage_share = 0.4
	var/heal_share = 0.4
	var/wound_chance = 15
	var/ispartner = FALSE
	can_transfer = TRUE

/datum/component/eora_bond/partner
	ispartner = TRUE

/datum/component/eora_bond/Initialize(mob/living/partner_mob, mob/living/caster_mob, var/holy_skill)
	if(!isliving(parent) || !isliving(partner_mob))
		return COMPONENT_INCOMPATIBLE

	// Prevent duplicate bonds
	var/datum/component/eora_bond/existing = parent.GetComponent(/datum/component/eora_bond)
	if(existing)
		return COMPONENT_INCOMPATIBLE

	partner = partner_mob
	caster = caster_mob

	var/bonus_mod = 0
	if(holy_skill >= 4)
		bonus_mod = 0.05
	damage_share = 0.1 + (0.05 * holy_skill) + bonus_mod
	heal_share = 0.1 + (0.05 * holy_skill) + bonus_mod
	wound_chance = 40 - (5 * holy_skill)

	// Correct signal name
	RegisterSignal(parent, COMSIG_MOB_APPLY_DAMGE, PROC_REF(on_damage))
	RegisterSignal(parent, COMSIG_LIVING_MIRACLE_HEAL_APPLY, PROC_REF(on_heal))
	RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(on_deletion))

	START_PROCESSING(SSprocessing, src)
	addtimer(CALLBACK(src, .proc/remove_bond), duration)

	var/mob/living/L = parent
	L.apply_status_effect(/datum/status_effect/eora_bond)
	return ..()

/datum/component/eora_bond/proc/on_damage(datum/source, damage, damagetype, def_zone)
	if( !isliving(partner) || !ispartner)
		return

	var/mob/living/carbon/L = caster
	var/shared_damage = damage * damage_share

	if(damagetype == BRUTE)
		//Heal our buddy <3
		var/list/wCount = partner.get_wounds()
		if(wCount.len > 0)
			partner.heal_wounds(shared_damage)
			partner.update_damage_overlays()
		partner.adjustBruteLoss(-shared_damage, 0)

		var/obj/item/bodypart/BP = null
		BP = L.get_bodypart(check_zone(def_zone))
		if(!BP)
			BP = L.get_bodypart(BODY_ZONE_CHEST)
		BP.receive_damage(shared_damage, 0)
		L.update_damage_overlays()
		//Potentially bite ourselves :(
		if(prob(wound_chance))
			L.visible_message(span_danger("Раны [L] обильно кровоточат!"))
			BP.add_wound(/datum/wound/bite/small)

/datum/component/eora_bond/proc/on_heal(datum/source, healing_on_tick, healing_datum)
	if( !isliving(parent) || source != parent || istype(healing_datum, /datum/status_effect/buff/healing/eora))
		return

	healing_on_tick = healing_on_tick * heal_share
	var/mob/living/target_to_heal
	if(parent == caster)
		target_to_heal = partner
	else
		target_to_heal = caster

	target_to_heal.apply_status_effect(/datum/status_effect/buff/healing/eora, healing_on_tick)

/datum/component/eora_bond/proc/on_deletion()
	remove_bond()

/datum/component/eora_bond/process()
	//If this turns out to be too costly, make this based on the movement signal instead.
	var/mob/living/M = parent
	if(!istype(M) || !istype(partner) || M.stat == DEAD || partner.stat == DEAD || get_dist(M, partner) > max_distance)
		remove_bond()

/datum/component/eora_bond/proc/remove_bond()
	var/mob/living/L = parent
	if(L)
		L.remove_status_effect(/datum/status_effect/eora_bond)
		UnregisterSignal(L, list(
			COMSIG_MOB_APPLY_DAMGE,
			COMSIG_LIVING_MIRACLE_HEAL_APPLY,
			COMSIG_PARENT_QDELETING
		))

	if(partner)
		partner.remove_status_effect(/datum/status_effect/eora_bond)
		var/datum/component/eora_bond/other = partner.GetComponent(/datum/component/eora_bond)
		if(other)
			other.partner = null
			qdel(other)

	partner = null
	STOP_PROCESSING(SSprocessing, src)
	qdel(src)

/datum/status_effect/buff/healing/eora

// =====================
// Heartweave Spell
// =====================
/obj/effect/proc_holder/spell/invoked/heartweave
	name = "Сердцевить"
	desc = "Создайте симбиотическую связь между двумя душами."
	overlay_state = "bliss"
	range = 2
	chargetime = 0.5 SECONDS
	invocation = "By Eora's grace, let our fates intertwine!"
	sound = 'sound/magic/magnet.ogg'
	recharge_time = 60 SECONDS
	miracle = TRUE
	devotion_cost = 75
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/heartweave/kazengun
	invocation = "By Eori's grace, let our fates intertwine!"

/obj/effect/proc_holder/spell/invoked/heartweave/cast(list/targets, mob/living/user)
	var/mob/living/target = targets[1]

	var/datum/component/eora_bond/existing = user.GetComponent(/datum/component/eora_bond)
	if(existing)
		to_chat(user, span_warning("Вы уже связаны!"))
		revert_cast()
		return FALSE

	if(!istype(target, /mob/living/carbon) || target == user)
		revert_cast()
		return FALSE

	if(!do_after(user, 8 SECONDS, target = target))
		to_chat(user, span_warning("Связь требует сосредоточенной концентрации!"))
		revert_cast()
		return FALSE

	if(HAS_TRAIT(target, TRAIT_PSYDONITE))
		target.visible_message(span_info("[target] на мгновение вздрагивает, чудо рассеивается."), span_notice("Тусклое тепло наполняет ваше сердце, лишь для того чтобы исчезнуть так же быстро, как появилось."))
		playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		return FALSE


	var/consent = alert(target, "[user] предлагает узы жизни. Принять?", "Сердцевить", "Да", "Нет")
	if(consent != "Да" || QDELETED(target))
		to_chat(user, span_warning("Узы были отвергнуты."))
		revert_cast()
		return FALSE

	var/holy_skill = user.get_skill_level(associated_skill)
	// Add component to both participants without mutual recursion
	user.AddComponent(/datum/component/eora_bond, target, user, holy_skill)
	target.AddComponent(/datum/component/eora_bond/partner, target, user, holy_skill)

	user.visible_message(
		span_notice("Золотая нить формируется между [user] и [target]!"),
		span_notice("Вы чувствуете, как жизненная сила [target] связана с вашей.")
	)
	return TRUE

// =====================
// Status Effect
// =====================

#define HEARTWEAVE_FILTER "heartweave"

/datum/status_effect/eora_bond
	id = "eora_bond"
	duration = -1
	alert_type = /atom/movable/screen/alert/status_effect/eora_bond
	var/outline_colour = "#FF69B4"

/atom/movable/screen/alert/status_effect/eora_bond
	name = "Узы Эоры"
	desc = "Ваша жизненная сила связана с другой душой."

/datum/status_effect/eora_bond/on_apply()
	var/filter = owner.get_filter(HEARTWEAVE_FILTER)
	if (!filter)
		owner.add_filter(HEARTWEAVE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 2))
	return TRUE

/datum/status_effect/eora_bond/on_remove()
	owner.remove_filter(HEARTWEAVE_FILTER)

#define BLESSED_FOOD_FILTER "blessedfood"

/datum/component/blessed_food
	dupe_mode = COMPONENT_DUPE_UNIQUE
	var/mob/living/caster
	var/quality
	var/skill
	var/bitesize_mod

/datum/component/blessed_food/Initialize(mob/living/_caster, var/holy_skill)
	if(!isitem(parent) || !istype(parent, /obj/item/reagent_containers/food/snacks))
		return COMPONENT_INCOMPATIBLE

	caster = _caster
	skill = holy_skill
	var/obj/item/reagent_containers/food/snacks/F = parent
	//Better food being blessed heals more
	quality = F.faretype
	bitesize_mod = 1 / F.bitesize
	F.faretype = clamp(skill, 1, 5)
	if(skill < 4)
		F.add_filter(BLESSED_FOOD_FILTER, 1, list("type" = "outline", "color" = "#ff00ff", "size" = 1))
	else
		F.add_filter(BLESSED_FOOD_FILTER, 1, list("type" = "outline", "color" = "#f0b000", "size" = 1))
	RegisterSignal(F, COMSIG_FOOD_EATEN, .proc/on_food_eaten)

/datum/component/blessed_food/proc/on_food_eaten(datum/source, mob/living/eater, mob/living/feeder)
	SIGNAL_HANDLER
	if(eater == caster)
		eater.visible_message(span_notice("Божественная энергия безвредно шипит вокруг [caster]."))
		return

	eater.apply_status_effect(/datum/status_effect/buff/healing, (quality + (skill / 5)) * bitesize_mod)
	if(skill > 3)
		eater.apply_status_effect(/datum/status_effect/buff/haste, 10 SECONDS)

/obj/effect/proc_holder/spell/invoked/bless_food
	name = "Благословение пищи"
	invocation = "Eora, nourish this offering!"
	desc = "Благословите предмет пищи. Блюда, которые дольше есть, исцеляют медленнее. Опытные священники могут благословлять пищу чаще. Лучшая еда исцеляет сильнее."
	sound = 'sound/magic/magnet.ogg'
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	devotion_cost = 25
	recharge_time = 90 SECONDS
	overlay_state = "bread"
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE
	var/base_recharge_time = 90 SECONDS

/obj/effect/proc_holder/spell/invoked/bless_food/kazengun
	invocation = "Eori, nourish this offering!"

/obj/effect/proc_holder/spell/invoked/bless_food/cast(list/targets, mob/living/user)
	var/obj/item/target = targets[1]
	if(!istype(target, /obj/item/reagent_containers/food/snacks))
		to_chat(user, span_warning("Вы можете благословить только пищу!"))
		revert_cast()
		return FALSE

	var/holy_skill = user.get_skill_level(associated_skill)
	target.AddComponent(/datum/component/blessed_food, user, holy_skill)
	to_chat(user, span_notice("Вы благословляете [target] любовью Эоры!"))
	return TRUE

/obj/effect/proc_holder/spell/invoked/bless_food/start_recharge()
	if(ranged_ability_user)
		var/holy_skill = ranged_ability_user.get_skill_level(associated_skill)
		// Reduce recharge by 6 seconds per skill level
		var/skill_reduction = (6 SECONDS) * holy_skill
		recharge_time = base_recharge_time - skill_reduction
		// Ensure recharge doesn't go below 0
		if(recharge_time < 0)
			recharge_time = 0
	else
		recharge_time = base_recharge_time

	START_PROCESSING(SSfastprocess, src)

/obj/effect/proc_holder/spell/invoked/pomegranate
	name = "Святилище Амаранта"
	invocation = "Eora, provide sanctuary for your beauty!"
	desc = "Вырастите прохладное дерево."
	sound = 'sound/magic/magnet.ogg'
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	devotion_cost = 500
	recharge_time = 5 SECONDS
	chargetime = 1 SECONDS
	overlay_state = "tree"
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE
	var/obj/structure/eoran_pomegranate_tree/my_little_tree = null

/obj/effect/proc_holder/spell/invoked/pomegranate/kazengun
	invocation = "Eori, provide sanctuary for your beauty!"

/obj/effect/proc_holder/spell/invoked/pomegranate/cast(list/targets, mob/living/user)
	. = ..()

	if(QDELETED(my_little_tree))
		my_little_tree = null

	if(my_little_tree)
		to_chat(user, span_warning("Я не могу поддерживать более одного дерева для Эоры. Нужно избавиться от прежнего, как бы больно это ни было."))
		revert_cast()
		return FALSE

	var/turf/T = get_turf(targets[1])
	if(!isopenturf(T))
		to_chat(user, span_warning("Указанное место заблокировано. Семя Эоры не может прорасти здесь."))
		revert_cast()
		return FALSE
	if(!(istype(T, /turf/open/floor/rogue/grass) || istype(T, /turf/open/floor/rogue/dirt)))
		to_chat(user, span_warning("Дерево не может расти здесь. Его нужно сажать на земле или траве!"))
		revert_cast()
		return FALSE

	to_chat(user, span_notice("Я начинаю выращивать священное дерево Эоры здесь. Стоит остановиться и передумать, если я не хочу, чтобы моё единственное дерево было здесь."))
	if(do_after(user, 30 SECONDS, FALSE))
		var/obj/structure/eoran_pomegranate_tree/tree = new /obj/structure/eoran_pomegranate_tree(T)
		my_little_tree = tree
		return TRUE

#define SPROUT 0
#define GROWING 1
#define MATURING 2
#define FRUITING 3
/obj/structure/eoran_pomegranate_tree
	name = "гранатовое дерево"
	desc = "Мистическое дерево, благословлённое Эорой."
	icon = 'modular_azurepeak/icons/obj/items/eora_tree.dmi'
	icon_state = "sprout"
	anchored = TRUE
	density = TRUE
	max_integrity = 200
	resistance_flags = FIRE_PROOF
	pixel_x = -8

	// Growth tracking
	var/growth_stage = SPROUT
	var/growth_progress = 0
	var/growth_threshold = 100
	var/time_to_mature = 10 MINUTES // Total time from sprout 0% to fully grown 100% through GROWING stage
	var/time_to_grow_fruit = 6 MINUTES //Fairly long but these fruits are potentially really good and there can be multiple acolytes
	var/fruit = FALSE
	var/fruit_ready = FALSE

	// Tree care system
	var/happiness = 0
	var/water_happiness = 0
	var/fertilizer_happiness = 0
	var/prune_count = 0
	var/list/tree_offerings = list()
	var/happiness_tier = 1

	/// Range of the aura
	var/aura_range = 7
	/// List of mobs currently affected by our aura
	var/list/mob/living/affected_mobs = list()

/obj/structure/eoran_pomegranate_tree/proc/get_farming_skill(mob/user)
	return user.get_skill_level(/datum/skill/labor/farming)

/obj/structure/eoran_pomegranate_tree/proc/update_happiness_tier()
	if(happiness >= 100)
		happiness_tier = 4
	else if(happiness >= 75)
		happiness_tier = 3
	else if(happiness >= 50)
		happiness_tier = 2
	else
		happiness_tier = 1

/obj/structure/eoran_pomegranate_tree/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/rogueweapon/huntingknife/scissors))
		if(prune_count >= 4)
			to_chat(user, span_warning("Дерево уже полностью обрезано!"))
			return TRUE
		var/skill = get_farming_skill(user)
		var/prune_time = 12 SECONDS - (skill * 1.3 SECONDS)

		to_chat(user, span_notice("Вы начинаете обрезать дерево..."))

		if(do_after(user, prune_time, target = src))
			prune_count++
			happiness = min(happiness + 5, 100)
			update_happiness_tier()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				add_sleep_experience(user, /datum/skill/labor/farming, C.STAINT * 0.5)

			to_chat(user, span_notice("Вы обрезаете несколько веток."))
			update_icon()
			return TRUE

	if(istype(I, /obj/item/reagent_containers) && !istype(I, /obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/container = I
		if(water_happiness >= 25)
			to_chat(user, span_warning("Дерево сейчас не может впитать больше воды!"))
			return TRUE

		var/has_water = FALSE
		if(container.reagents.has_reagent(/datum/reagent/water, 1))
			has_water = TRUE

		if(!has_water)
			to_chat(user, span_warning("Дерево принимает только свежую, чистую воду."))
			return

		var/remaining_cap = 25 - water_happiness
		var/skill = get_farming_skill(user)
		var/potential_gain = 5 + (skill * 4)  // 5 at skill 0, 25 at skill 5+
		var/actual_gain = min(potential_gain, remaining_cap)
		var/action_time = 5 SECONDS - (skill * 0.5 SECONDS)

		if(do_after(user, action_time, target = src))
			container.reagents.remove_reagent(/datum/reagent/water, 1)
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				add_sleep_experience(user, /datum/skill/labor/farming, C.STAINT * 0.5)

			water_happiness += actual_gain
			happiness = min(happiness + actual_gain, 100)
			update_happiness_tier()

			to_chat(user, span_notice("Вы поливаете дерево."))
			update_icon()
			return TRUE

	if(istype(I, /obj/item/compost) || istype(I, /obj/item/fertilizer))

		if(fertilizer_happiness >= 25)
			to_chat(user, span_warning("Дерево сейчас не может впитать больше удобрений!"))
			return TRUE

		var/remaining_cap = 25 - fertilizer_happiness
		var/skill = get_farming_skill(user)
		var/potential_gain = 5 + (skill * 4)
		var/actual_gain = min(potential_gain, remaining_cap)
		var/action_time = 5 SECONDS - (skill * 0.5 SECONDS)

		if(do_after(user, action_time, target = src))
			qdel(I)
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				add_sleep_experience(user, /datum/skill/labor/farming, C.STAINT * 0.5)

			fertilizer_happiness += actual_gain
			happiness = min(happiness + actual_gain, 100)
			update_happiness_tier()

			to_chat(user, span_notice("Вы удобряете дерево."))
			update_icon()
			return TRUE

	if(istype(I, /obj/item/roguegem/ruby) || istype(I, /obj/item/alch/transisdust) || istype(I, /obj/item/reagent_containers/food/snacks/eoran_aril/opalescent))

		if(I.type in tree_offerings)
			to_chat(user, span_warning("Этот предмет уже был поднесён дереву!"))
			return TRUE

		if(length(tree_offerings) >= 3)
			to_chat(user, span_warning("Дерево пока получило достаточно подношений!"))
			return TRUE

		qdel(I)
		tree_offerings += I.type

		happiness = min(happiness + 10, 100)
		update_happiness_tier()

		to_chat(user, span_notice("Дерево с благодарностью принимает ваше подношение, трепеща листвой."))
		update_icon()
		return TRUE

	var/was_destroyed = obj_destroyed
	. = ..()
	if(.)
		if(!was_destroyed && obj_destroyed)
			if(iscarbon(user))
				var/mob/living/carbon/c = user
				if(c.patron.type == /datum/patron/divine/eora)
					c.apply_status_effect(/datum/status_effect/debuff/eoran_wilting)
				else
					to_chat(c, span_warning("Божественное проклятие поражает вас за уничтожение священного дерева!"))
					c.adjustFireLoss(100)
					c.ignite_mob()
					c.add_stress(/datum/stressevent/psycurse)
			record_featured_stat(FEATURED_STATS_TREE_FELLERS, user)
			record_round_statistic(STATS_LUX_REVIVALS)

/obj/structure/eoran_pomegranate_tree/take_damage(damage_amount, damage_type = BRUTE, damage_flag = "", sound_effect = TRUE, attack_dir, armor_penetration = 0)
	visible_message(span_notice("Дерево содрогается от боли. Вы чувствуете исходящий от него ужас."))
	. = ..()

/obj/structure/eoran_pomegranate_tree/examine(mob/user)
	. = ..()

	if(happiness_tier == 1)
		. += span_warning("Дерево выглядит заброшенным. Ветви увяли.")
	else if(happiness_tier == 2)
		. += span_info("Дерево кажется довольным и здоровым.")
	else if(happiness_tier == 3)
		. += span_good("Дерево излучает живую энергию.")
	else if(happiness_tier == 4)
		. += span_good("Дерево переполнено сияющим светом. Вы чувствуете... совершенство.")

	if(water_happiness < 25)
		. += span_info("Ему бы не помешало больше воды.")
	else
		. += span_info("Оно полностью напоено.")

	if(fertilizer_happiness < 25)
		. += span_info("Корням нужно больше питательных веществ.")
	else
		. += span_info("Оно полностью насыщено.")

	if(prune_count < 4)
		. += span_info("Ветви выглядят неопрятно. Возможно, ножницы помогут исправить этот беспорядок.")
	else
		. += span_info("Ветви искусно обрезаны.")

	if(length(tree_offerings) < 3)
		. += span_info("Дерево жаждет подношения. В ваш разум проникает шёпот. Красный кристалл, который мерцает... То, что sculpts one's form... Сверкающее семя...")

/obj/structure/eoran_pomegranate_tree/proc/reset_care()
	//The benefit of rare offerings are kept through harvests.
	happiness = 0 + (10 * length(tree_offerings))
	water_happiness = 0
	fertilizer_happiness = 0
	prune_count = 0
	update_happiness_tier()
	update_icon()

/obj/structure/eoran_pomegranate_tree/Initialize(mapload)
	. = ..()
	update_icon()
	START_PROCESSING(SSobj, src)

/obj/structure/eoran_pomegranate_tree/process(delta_time)
	var/delta_seconds = delta_time / 10 // Convert delta_time (ticks) to seconds Delta time is the amount of time that has passed since the last time process was called.

	var/target_growth_rate_per_second = 0

	if(growth_progress >= 50)
		var/list/current_mobs = list()
		var/atom/A = src

	// Get all mobs in range
		var/list/mobs_in_range
		mobs_in_range = view(aura_range, A)

		for(var/mob/living/L in mobs_in_range)
			//Unconscious people can't harm others. Nor can they observe trees. Dead people are food.
			if(L.stat == UNCONSCIOUS)
				continue
			current_mobs += L

			// Apply effects if new mob
			if(!affected_mobs[L])
				apply_effects(L)
				affected_mobs[L] = TRUE

		// Remove effects from mobs that left range
		for(var/mob/living/L in affected_mobs - current_mobs)
			remove_effects(L)
			affected_mobs -= L

	if (growth_stage == FRUITING && !fruit)
		// We need to grow from 75% to 100% in time_to_grow_fruit
		var/progress_needed_in_fruiting = growth_threshold * 0.25

		if (time_to_grow_fruit > 0)
			target_growth_rate_per_second = progress_needed_in_fruiting / (time_to_grow_fruit / 10)
		else
			target_growth_rate_per_second = growth_threshold // Grow instantly if time is 0
	else
		if (time_to_mature > 0)
			target_growth_rate_per_second = growth_threshold / (time_to_mature / 10)
		else
			target_growth_rate_per_second = growth_threshold // Grow instantly if time is 0

	growth_progress = min(growth_progress + (target_growth_rate_per_second * delta_seconds), growth_threshold)

	check_growth_stage()

/obj/structure/eoran_pomegranate_tree/proc/apply_effects(mob/living/target)
	target.apply_status_effect(/datum/status_effect/debuff/pomegranate_aura, src)

/obj/structure/eoran_pomegranate_tree/proc/remove_effects(mob/living/target)
	target.remove_status_effect(/datum/status_effect/debuff/pomegranate_aura)

/obj/structure/eoran_pomegranate_tree/proc/check_growth_stage()
	switch(growth_stage)
		if(SPROUT)
			if(growth_progress >= 25)
				advance_stage(GROWING)
		if(GROWING)
			if(growth_progress >= 50)
				advance_stage(MATURING)
		if(MATURING)
			if(growth_progress >= 75)
				advance_stage(FRUITING)
		if(FRUITING)
			if(!fruit && growth_progress >= growth_threshold)
				spawn_fruit()

/obj/structure/eoran_pomegranate_tree/proc/advance_stage(new_stage)
	growth_stage = new_stage
	update_icon()
	visible_message(span_notice("[name] становится больше!"))

	if(new_stage == FRUITING)
		spawn_fruit()

/obj/structure/eoran_pomegranate_tree/proc/spawn_fruit()
	if(fruit)  // Already has fruit
		return

	fruit = TRUE
	fruit_ready = FALSE
	update_icon()
	addtimer(CALLBACK(src, .proc/ripen_fruit), rand(10 SECONDS, 15 SECONDS))

/obj/structure/eoran_pomegranate_tree/proc/ripen_fruit()
	fruit_ready = TRUE
	visible_message(span_notice("Плод на [src] светится тёплым светом!"))
	update_icon()

/obj/structure/eoran_pomegranate_tree/update_icon()
	// Base icon states
	switch(growth_stage)
		if(SPROUT)
			icon_state = "sprout"
		if(GROWING)
			icon_state = "growing"
		if(MATURING)
			icon_state = "mature"
		if(FRUITING)
			icon_state = "fruiting"

	cut_overlays()

	if(growth_stage == FRUITING && fruit_ready)
		var/image/fruit_image = image(icon = initial(icon), icon_state = "fruit[happiness_tier]", layer = 1)
		add_overlay(fruit_image)

	. = ..()

/datum/status_effect/pomegranate_fatigue
	id = "pom_fatigue"
	duration = 10 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/pomegranate_fatigue

/datum/status_effect/pomegranate_fatigue/on_apply()
	. = ..()
	owner.add_movespeed_modifier(MOVESPEED_ID_SANITY, update=TRUE, priority=100, override=FALSE, multiplicative_slowdown=0.5)

/datum/status_effect/pomegranate_fatigue/on_remove()
	owner.remove_movespeed_modifier(MOVESPEED_ID_SANITY)
	return ..()

/atom/movable/screen/alert/status_effect/pomegranate_fatigue
	name = "Божественная усталость"
	desc = "Священная энергия граната оставляет вас ослабленным."

/obj/structure/eoran_pomegranate_tree/attack_hand(mob/living/user)
	if(!fruit_ready || !fruit)
		return ..()

	if(!can_pick_fruit(user))
		return

	user.visible_message(
		span_notice("[user] аккуратно срывает плод."),
		span_notice("Вы осторожно срываете светящийся гранат.")
	)

	if(iscarbon(user))
		var/mob/living/carbon/C = user
		add_sleep_experience(user, /datum/skill/labor/farming, C.STAINT * 3)
	var/obj/item/fruit_of_eora/new_fruit = new(user.loc, happiness_tier)
	user.put_in_hands(new_fruit)

	// Apply picking debuff
	user.apply_status_effect(/datum/status_effect/pomegranate_fatigue)

	// Reset tree
	fruit = FALSE
	fruit_ready = FALSE
	growth_progress = 75 // Return to fruiting stage baseline
	reset_care()
	update_icon()

// Check if user can pick fruit
/obj/structure/eoran_pomegranate_tree/proc/can_pick_fruit(mob/living/user)
	if(!fruit_ready)
		to_chat(user, span_warning("Плод ещё не созрел!"))
		return FALSE

	// Eoran alignment check
	if(!(user.patron.type == /datum/patron/divine/eora))
		to_chat(user, span_warning("Плод исчезает, как только вы к нему тянетесь!"))
		return FALSE

	return TRUE

/obj/item/fruit_of_eora
	name = "гранат"
	desc = "Мистический гранат, светящийся внутренним светом. Он тёплый на ощупь."
	icon = 'modular_azurepeak/icons/obj/items/eora_pom.dmi'
	icon_state = "pom"
	var/fruit_tier = 1
	var/list/aril_types = list()
	var/opened = FALSE

/obj/item/fruit_of_eora/Initialize(mapload, tier = 1)
	. = ..()
	fruit_tier = tier
	generate_arils()
	update_pom()

/obj/item/fruit_of_eora/proc/update_pom()
	switch(fruit_tier)
		if(1)
			name = "гнилой гранат"
			desc = "Гнилой гранат."
			icon_state = "rotten"
		if(2)
			name = "испорченный гранат"
			desc = "Испорченный гранат, синий, как лазурь."
			icon_state = "blemished"
		if(3)
			desc = "Сочный гранат, пульсирующий внутренним светом. Он излучает тепло."
			icon_state = "pom"
		if(4)
			name = "золотой гранат"
			desc = "Безупречный золотой гранат, пылающий божественным светом. Он кажется живым, трепеща, как бьющееся сердце."
			icon_state = "golden"

/obj/item/fruit_of_eora/proc/generate_arils()
	aril_types = list()
	var/list/possible_arils

	// Define aril tables by tier
	switch(fruit_tier)
		if(1)
			return
		if(2)
			possible_arils = list(
				/obj/item/reagent_containers/food/snacks/eoran_aril/crimson = 50,
				/obj/item/reagent_containers/food/snacks/eoran_aril/roseate = 10,
				/obj/item/reagent_containers/food/snacks/eoran_aril/opalescent = 20
			)
		if(3)
			possible_arils = list(
				/obj/item/reagent_containers/food/snacks/eoran_aril/crimson = 30,
				/obj/item/reagent_containers/food/snacks/eoran_aril/roseate = 10,
				/obj/item/reagent_containers/food/snacks/eoran_aril/opalescent = 20,
				/obj/item/reagent_containers/food/snacks/eoran_aril/pearlescent = 20,
				/obj/item/reagent_containers/food/snacks/eoran_aril/cerulean = 20,
				/obj/item/reagent_containers/food/snacks/eoran_aril/fractal = 5
			)
		if(4)
			possible_arils = list(
				/obj/item/reagent_containers/food/snacks/eoran_aril/crimson = 15,
				/obj/item/reagent_containers/food/snacks/eoran_aril/roseate = 5,
				/obj/item/reagent_containers/food/snacks/eoran_aril/opalescent = 10,
				/obj/item/reagent_containers/food/snacks/eoran_aril/pearlescent = 10,
				/obj/item/reagent_containers/food/snacks/eoran_aril/cerulean = 15,
				/obj/item/reagent_containers/food/snacks/eoran_aril/fractal = 5,
				/obj/item/reagent_containers/food/snacks/eoran_aril/auric = 10,
				/obj/item/reagent_containers/food/snacks/eoran_aril/ashen = 3,
				/obj/item/reagent_containers/food/snacks/eoran_aril/ochre = 5,
				/obj/item/reagent_containers/lux/eoran_aril = 10
			)

    // Generate 4 arils +1 per tier.
	for(var/i in 1 to 4 + (floor(fruit_tier / 2)))
		var/aril_type = pickweight(possible_arils)
		aril_types += aril_type

/obj/item/fruit_of_eora/attackby(obj/item/I, mob/user)
	if(!opened && I.get_sharpness())
		if ( \
			!isturf(src.loc) || \
			!(locate(/obj/structure/table) in src.loc) && \
			!(locate(/obj/structure/table/optable) in src.loc) && \
			!(locate(/obj/item/storage/bag/tray) in src.loc) \
			)
			to_chat(user, span_warning("Мне нужно использовать стол."))
			return FALSE
		open_fruit(user)
		return TRUE
	return ..()

/obj/item/fruit_of_eora/proc/open_fruit(mob/user)
	if(opened)
		return

	to_chat(user, span_notice("Вы осторожно разрезаете гранат, обнажая светящиеся семена внутри."))
	playsound(src, 'modular/Neu_Food/sound/slicing.ogg', 60, TRUE, -1)
	opened = TRUE

	for(var/aril_type in aril_types)
		new aril_type(loc)

	qdel(src)

/obj/item/reagent_containers/food/snacks/eoran_aril
	name = "арил Эоры"
	desc = "Светящееся семя из плода Эоры. Оно пульсирует божественной энергией."
	icon = 'modular_azurepeak/icons/obj/items/eora_pom.dmi'
	dropshrink = 0.7
	icon_state = "auric"
	bitesize = 1
	faretype = FARE_NEUTRAL
	w_class = WEIGHT_CLASS_TINY
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/effect_desc = "Неизвестные эффекты."
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)

/obj/item/reagent_containers/food/snacks/eoran_aril/attack(mob/living/M, mob/living/user, def_zone)
	if(M != user)
		to_chat(user, span_info("Семя вспыхивает гневом Эоры, когда вы пытаетесь насильно скормить её дар другому."))
		return
	. = ..()

/obj/item/reagent_containers/food/snacks/eoran_aril/On_Consume(mob/living/eater)
	. = ..()
	if(iscarbon(eater))
		var/mob/living/carbon/c = eater
		apply_effects(c)

/obj/item/reagent_containers/food/snacks/eoran_aril/examine(mob/user)
	. = ..()
	if(iscarbon(user))
		var/mob/living/carbon/c = user
		if(c.patron.type == /datum/patron/divine/eora)
			. += span_info(effect_desc)

/obj/item/reagent_containers/food/snacks/eoran_aril/proc/apply_effects(mob/living/carbon/eater)
	return

//--TIER 1--
/obj/item/reagent_containers/food/snacks/eoran_aril/crimson
	name = "алый арил"
	desc = "Кроваво-красное семя, которое, кажется, пульсирует жизненной силой."
	icon_state = "crimson"
	effect_desc = "Этот плод исцеляет за кровавую цену."

	var/heal_amount = 45
	var/blood_loss = 225

/obj/item/reagent_containers/food/snacks/eoran_aril/crimson/apply_effects(mob/living/carbon/eater)
	//Instant heal, but you can only eat 2 before the next will make you pass out.
	var/list/wCount = eater.get_wounds()
	//No undead because they kinda don't have blood to give for this.
	if(!eater.construct && !(eater.mob_biotypes & MOB_UNDEAD))
		if(wCount.len > 0)
			eater.heal_wounds(heal_amount)
			eater.update_damage_overlays()
		eater.blood_volume = max(0, eater.blood_volume - blood_loss)
		eater.adjustBruteLoss(-heal_amount, 0)
		eater.adjustFireLoss(-heal_amount, 0)
		eater.adjustOxyLoss(-heal_amount, 0)
		eater.adjustToxLoss(-heal_amount, 0)
		eater.adjustOrganLoss(ORGAN_SLOT_BRAIN, -heal_amount)
		eater.adjustCloneLoss(-heal_amount, 0)

/obj/item/reagent_containers/food/snacks/eoran_aril/roseate
	name = "розовый арил"
	desc = "Розовое семя, излучающее красоту и грацию."
	icon_state = "roseate"
	effect_desc = "Дарует мимолётную красоту. Отвергает уродливых."

	var/beauty_duration = 10 MINUTES

/obj/item/reagent_containers/food/snacks/eoran_aril/roseate/apply_effects(mob/living/carbon/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(!HAS_TRAIT(H, TRAIT_UNSEEMLY) && !HAS_TRAIT(H, TRAIT_BEAUTIFUL))
			H.apply_status_effect(/datum/status_effect/buff/eora_grace)

/datum/status_effect/buff/eora_grace
	id = "eora_grace"
	duration = 10 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/eora_grace

/atom/movable/screen/alert/status_effect/eora_grace
	name = "Милость Эоры"
	desc = "Вы чувствуете себя прекрасно."

/datum/status_effect/buff/eora_grace/on_apply()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_VIRTUE)
	return TRUE

/datum/status_effect/buff/eora_grace/on_remove()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		REMOVE_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_VIRTUE)

/obj/item/reagent_containers/food/snacks/eoran_aril/opalescent
	name = "опаловый арил"
	desc = "Переливающееся семя, меняющее цвета на свету."
	icon_state = "opalescent"
	effect_desc = "Превращает удерживаемые драгоценные камни в ронц или создаёт пару розеллусков, если в руках нет камня."
    
/obj/item/reagent_containers/food/snacks/eoran_aril/opalescent/apply_effects(mob/living/eater)
	var/found_gem = FALSE
	for(var/obj/item/roguegem/G in eater.held_items)
		var/obj/item/roguegem/ruby/new_gem = new(eater.loc)
		qdel(G)
		eater.put_in_hands(new_gem)
		to_chat(eater, span_notice("[G] превращается в ронц в вашей руке!"))
		found_gem = TRUE
		//Probably best not to allow 2 at once...
		break
	
	if(!found_gem)
		var/obj/item/carvedgem/rose/rawrose/rosellusk1 = new(eater.loc)
		var/obj/item/carvedgem/rose/rawrose/rosellusk2 = new(eater.loc)
		eater.put_in_hands(rosellusk1)
		eater.put_in_hands(rosellusk2)
		to_chat(eater, span_notice("Пара розеллусков появляется в ваших руках!"))

// TIER 2
/obj/item/reagent_containers/food/snacks/eoran_aril/cerulean
	name = "лазурный арил"
	desc = "Глубоко синее семя, пахнущее океаном."
	icon_state = "cerulean"
	effect_desc = "Отличная рыболовная наживка, привлекающая сокровища."
	baitpenalty = 5
	isbait = TRUE
	freshfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 50,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 50,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 150,
		/obj/item/reagent_containers/food/snacks/fish/eel = 50,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 50,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 10,
		/obj/item/clothing/ring/gold = 15,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 15,	
	)
	seafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 50,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 75,
		/obj/item/reagent_containers/food/snacks/fish/sole = 50,
		/obj/item/reagent_containers/food/snacks/fish/angler = 100,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 50,
		/obj/item/reagent_containers/food/snacks/fish/bass = 50,
		/obj/item/reagent_containers/food/snacks/fish/clam = 50,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 200,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 75,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 25,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 10,
		/obj/item/clothing/ring/gold = 25,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 25,		
	)
	mudfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 200,
		/obj/item/natural/worms/leech = 50,
		/obj/item/clothing/ring/gold = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,				
	)
	// This is super trimmed down from the ratwood list to focus entirely on shellfishes
	// this is a waste but it's useable. So I'm just not going to encourage it.
	cageloot = list(
		/obj/item/reagent_containers/food/snacks/fish/oyster = 214,
		/obj/item/reagent_containers/food/snacks/fish/shrimp = 214,
		/obj/item/reagent_containers/food/snacks/fish/crab = 214,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 214,
	)

/obj/item/reagent_containers/food/snacks/eoran_aril/fractal
	name = "фрактальный арил"
	desc = "Геометрически совершенное семя, на которое больно смотреть."
	icon_state = "fractal"
	effect_desc = "Ценой телосложения милость Эоры избавит от уродства..."

/obj/item/reagent_containers/food/snacks/eoran_aril/fractal/apply_effects(mob/living/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(HAS_TRAIT(H, TRAIT_UNSEEMLY))
			REMOVE_TRAIT(H, TRAIT_UNSEEMLY, TRAIT_VIRTUE)
			H.change_stat("constitution", -1)
			to_chat(eater, span_good("Вы чувствуете, как ваши недостатки тают, но ваше тело становится более хрупким."))

// TIER 3
/obj/item/reagent_containers/food/snacks/eoran_aril/auric
	name = "золотой арил"
	desc = "Золотое семя, излучающее тепло и жизнь."
	icon_state = "auric"
	effect_desc = "Ключевой ингредиент зелий воскрешения."

/obj/item/reagent_containers/food/snacks/eoran_aril/ashen
	name = "пепельный арил"
	desc = "Серое семя, ледяное на ощупь. Один лишь взгляд на него вызывает НЕВЕРОЯТНОЕ чувство ужаса."
	icon_state = "ashen"
	effect_desc = "Запретный арил. Он не для вас."

/obj/item/reagent_containers/food/snacks/eoran_aril/ashen/apply_effects(mob/living/carbon/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater

		if(H.patron.type == /datum/patron/divine/eora)
			// Eora does not appreciate her followers ignoring her most sacred wishes.
			H.apply_status_effect(/datum/status_effect/debuff/eoran_wilting)
		else
			var/datum/status_effect/buff/ashen_aril/existing_effect = H.has_status_effect(/datum/status_effect/buff/ashen_aril)

			if(existing_effect)
				// Already burnt by an aril, simply stave off the ashing for 30 minutes.
				existing_effect.prevent_reapply = TRUE
				H.remove_status_effect(/datum/status_effect/buff/ashen_aril)
				H.remove_filter("ashen_filter")
				H.apply_status_effect(/datum/status_effect/buff/ashen_aril, 0, 30 MINUTES)
			else
				H.apply_status_effect(/datum/status_effect/buff/ashen_aril, 5, 6 MINUTES)

/obj/item/reagent_containers/food/snacks/eoran_aril/ochre
	name = "охряной арил"
	desc = "Пыльного цвета семя, которое, кажется, угрожающе пульсирует."
	icon_state = "ochre"
	effect_desc = "Верните два ближайших трупа из объятий Некры ценой собственной жизни."

/obj/item/reagent_containers/food/snacks/eoran_aril/ochre/apply_effects(mob/living/carbon/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(H.patron.type == /datum/patron/divine/eora)
			var/list/mob/living/carbon/human/target_mobs = list()

			for(var/mob/living/carbon/human/target in view(7, H))
				if(target_mobs.len >= 2)
					break
				if(target.stat != DEAD)
					continue
				if(!target.mind || !target.mind.active)
					continue
				if(HAS_TRAIT(target, TRAIT_NECRAS_VOW))
					continue
				if(HAS_TRAIT(target, TRAIT_DNR))
					continue
				if(target.mob_biotypes & MOB_UNDEAD)
					continue
				if(target.has_status_effect(/datum/status_effect/debuff/eoran_wilting))
					continue
				if(target.has_status_effect(/datum/status_effect/debuff/revived))
					continue
				target_mobs += target
				for(var/i in 1 to 4)
					var/obj/effect/temp_visual/heal/E = new /obj/effect/temp_visual/heal_rogue(get_turf(target))
					E.color = "#FF8CD9"
				target.visible_message(span_notice("Тело [target] окутывает розоватый свет!"))
				addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living/carbon/human, process_ochre_revival), TRUE), 1 SECONDS)

			if(target_mobs.len > 0)
				H.apply_status_effect(/datum/status_effect/debuff/eoran_wilting)

	return ..()

/mob/living/carbon/human/proc/process_ochre_revival()
	if(stat != DEAD)
		return
	if(QDELETED(src) || stat != DEAD)
		return FALSE

	var/mob/living/carbon/spirit/underworld_spirit = get_spirit()
	if (client)
		if (alert(src, "Вас зовут. Вы готовы?", "Воскрешение", "Мне нужно проснуться", "Не отпускай меня") != "Мне нужно проснуться")
			visible_message(span_notice("Ничего не происходит. Их не отпускают."))
			return FALSE
	else if (underworld_spirit && underworld_spirit.client)
		if (alert(underworld_spirit, "Вас зовут. Вы готовы?", "Воскрешение", "Мне нужно проснуться", "Не отпускай меня") != "Мне нужно проснуться")
			visible_message(span_notice("Ничего не происходит. Их не отпускают."))
			return FALSE
	else
		visible_message(span_notice("Тело содрогается, но некому ответить на зов."))
		return FALSE

	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, ochre_revival), TRUE), 5 SECONDS)

/mob/living/carbon/human/proc/ochre_revival()
	var/mob/living/carbon/spirit/underworld_spirit = get_spirit()
	// Perform revival
	adjustOxyLoss(-getOxyLoss())
	if(revive(full_heal = FALSE))
		mind.remove_antag_datum(/datum/antagonist/zombie)
		remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it - Failsafe for it.
		// Transfer ghost back to body (if they were ghosted)
		if(underworld_spirit && underworld_spirit.mind) // Ensure spirit exists and has a mind
			underworld_spirit.mind.transfer_to(target, TRUE) // Transfer mind back to the revived body
			qdel(underworld_spirit) // Delete the spirit mob
		else
			grab_ghost(force = TRUE) // This attempts to grab a ghost even if they committed suicide.

		emote("breathgasp")
		Jitter(100)
		update_body()
		visible_message(span_notice("[src] воскрешён божественной магией!"), span_green("Я пробуждаюсь из пустоты."))
		to_chat(src, span_userdanger("<b style='color:pink'>Истинная любовь может преодолеть даже смерть.</b>"))

		ADD_TRAIT(target, TRAIT_IWASREVIVED, "ochre_aril")
		apply_status_effect(/datum/status_effect/debuff/revived)
		return TRUE
	else
		visible_message(span_warning("Магия угасает, и ничего не происходит."))
		return FALSE


//For now this is just artifical lux. But this may make the user/receiver indebted to eora eventually.
//This is meant to be given guaranteed with T4 pommes for priests but given we don't have eoran priests yet I will implement this when we do.
/obj/item/reagent_containers/lux/eoran_aril
	name = "сияющий арил"
	desc = "Ослепительно яркое семя, излучающее чистую жизненную энергию. Оно имитирует люкс, сущность жизни."
	icon = 'modular_azurepeak/icons/obj/items/eora_pom.dmi'
	icon_state = "incandescent"
	dropshrink = 0.7

/obj/item/reagent_containers/food/snacks/eoran_aril/pearlescent
	name = "жемчужный арил"
	desc = "Молочно-белое семя, пульсирующее очищающей энергией."
	icon_state = "pearlescent"
	effect_desc = "Превращает яды в вашем теле в живую кровь, но разбавляет сильную кровь."

/obj/item/reagent_containers/food/snacks/eoran_aril/pearlescent/apply_effects(mob/living/carbon/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		H.apply_status_effect(/datum/status_effect/pearlescent_aril)

#undef SPROUT
#undef GROWING
#undef MATURING
#undef FRUITING

//Remove their ability to feel bad, restore a small amount of hunger / thirst if they're already starving.
/obj/effect/proc_holder/spell/invoked/eora_blessing
	name = "Благословение Эоры"
	invocation = "Eora, may their sorrows wither."
	desc = "Даруйте человеку покой Эоры, пусть даже ненадолго."
	sound = 'sound/magic/eora_bless.ogg'
	devotion_cost = 80
	recharge_time = 10 MINUTES
	miracle = TRUE
	invocation_type = "shout"
	invocation = "Let the beauty of lyfe fill you whole."
	overlay_state = "eora_bless"
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/eora_blessing/cast(list/targets, mob/living/user)
	if(ishuman(targets[1]))
		var/mob/living/L = targets[1]
		var/assocskill = L.get_skill_level(associated_skill)
		L.apply_status_effect(/datum/status_effect/eora_blessing, assocskill)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/eora_blessing
	id = "eora_bless"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/buff/eora_blessing

/datum/status_effect/eora_blessing/on_apply(assocskill)
	if(assocskill)
		duration *= assocskill	//+1 minute per skill level.
	var/mob/living/carbon/human/H = owner
	ADD_TRAIT(owner, TRAIT_EORAN_SERENE, TRAIT_GENERIC)	//Generic origin so other Eorans do not have their innate traits overridden (they use TRAIT_MIRACLE)
	var/hungercheck = H.nutrition
	var/hydrohomiecheck = H.hydration
	switch(hungercheck)
		if(0 to NUTRITION_LEVEL_STARVING)
			switch(assocskill)
				if(SKILL_LEVEL_NOVICE)
					H.nutrition = NUTRITION_LEVEL_STARVING + 50
				if(SKILL_LEVEL_APPRENTICE to SKILL_LEVEL_EXPERT)
					H.nutrition = NUTRITION_LEVEL_HUNGRY + 50
				else	//Acolyte w/ Devotee
					H.nutrition = NUTRITION_LEVEL_FED
	switch(hydrohomiecheck)
		if(0 to HYDRATION_LEVEL_DEHYDRATED)
			switch(assocskill)
				if(SKILL_LEVEL_NOVICE)
					H.nutrition = HYDRATION_LEVEL_DEHYDRATED + 50
				if(SKILL_LEVEL_APPRENTICE to SKILL_LEVEL_EXPERT)
					H.nutrition = HYDRATION_LEVEL_THIRSTY + 50
				else	//Acolyte w/ Devotee
					H.nutrition = HYDRATION_LEVEL_SMALLTHIRST
	if(assocskill > SKILL_LEVEL_APPRENTICE)
		H.add_stress(/datum/stressevent/eoran_blessing_greater)
	else
		H.add_stress(/datum/stressevent/eoran_blessing)
	H.update_stress()
	. = ..()

/datum/status_effect/eora_blessing/on_remove()
	REMOVE_TRAIT(owner, TRAIT_EORAN_SERENE, TRAIT_GENERIC)
	owner.update_stress()
	return ..()

/atom/movable/screen/alert/status_effect/buff/eora_blessing
	name = "Покой Эоры"
	desc = "Освежающее спокойствие. Все ваши тревоги смыты. Почему так не может быть всегда?"
	icon_state = "eora_bless"
