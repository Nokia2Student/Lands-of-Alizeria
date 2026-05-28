// Global tracking for divine destruction state
// This is necessary for SOVL
GLOBAL_LIST_EMPTY(divine_destruction_mobs) // Tracks mobs undergoing divine destruction: list(mob) = list(timer_ids)

//============================================
// TIER 0 MIRACLES
//============================================

//T0. Removes cone vision for a dynamic duration.
/obj/effect/proc_holder/spell/self/astrata_gaze
	name = "Взор Астраты"
	desc = "Воззовите к своему покровителю, чтобы расширить обзор до 360 градусов."
	overlay_state = "astrata_gaze"
	releasedrain = 10
	chargedrain = 0
	chargetime = 0
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/astrata_choir.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	invocation = "Astrata show me true!"
	invocation_type = "shout"
	recharge_time = 120 SECONDS
	devotion_cost = 30
	miracle = TRUE

/obj/effect/proc_holder/spell/self/astrata_gaze/kazengun
	name = "Взор Айсаты"
	invocation = "Aisata show me true!"

/obj/effect/proc_holder/spell/self/astrata_gaze/cast(list/targets, mob/user)
	if(!ishuman(user))
		revert_cast()
		return FALSE
	var/mob/living/carbon/human/H = user
	var/skill_level = H.get_skill_level(associated_skill)
	H.apply_status_effect(/datum/status_effect/buff/astrata_gaze, skill_level)
	return TRUE

//T0. Ignites torches, ovens, undead, and candles.
/obj/effect/proc_holder/spell/invoked/ignition
	name = "Воспламенение"
	desc = "Поджигает горючий объект на расстоянии."
	overlay_state = "sacredflame"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/heal.ogg'
	invocation = null
	invocation_type = null
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 5 SECONDS
	miracle = TRUE
	devotion_cost = 10

/obj/effect/proc_holder/spell/invoked/ignition/cast(list/targets, mob/user = usr)
	. = ..()
	// Spell interaction with ignitable objects (burn wooden things, light torches up)
	if(isobj(targets[1]))
		var/obj/O = targets[1]
		if(O.fire_act())
			user.visible_message(span_astrata("[user] указывает на [O], воспламеняя его священным пламенем!"))
			return TRUE
		else
			to_chat(user, span_warning("Вы указываете на [O], но оно не загорается."))
			return FALSE
	// Check if target is an undead mob
	if(ismob(targets[1]))
		var/mob/living/M = targets[1]
		if(M.mob_biotypes & MOB_UNDEAD)
			M.adjust_fire_stacks(1, /datum/status_effect/fire_handler/fire_stacks/sunder)
			M.ignite_mob()
			user.visible_message(span_astratabig("[user] указывает на [M], воспламеняя его испепеляющим священным пламенем!"))
			return TRUE
	revert_cast()
	return FALSE

//============================================
// TIER 1 MIRACLES
//============================================

// Sacred Flame - Ranged holy fire beam that deals extra damage to undead
/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt/sacred_flame_rogue
	name = "Священное Пламя"
	desc = "Запускает луч святого огня в цель, поджигая её. Наносит повышенный урон нежити."
	overlay_state = "sacredflame"
	sound = 'sound/magic/bless.ogg'
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	invocation = null
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 20 SECONDS
	miracle = TRUE
	devotion_cost = 50
	projectile_type = /obj/projectile/magic/astratablast

/obj/projectile/magic/astratablast
	damage = 25
	name = "луч святого огня"
	nodamage = FALSE
	damage_type = BURN
	speed = 0.3
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	flag = "magic"
	light_color = "#a98107"
	light_outer_range = 7
	tracer_type = /obj/effect/projectile/tracer/solar_beam
	var/fuck_that_guy_multiplier = 2
	var/biotype_we_look_for = MOB_UNDEAD

/obj/projectile/magic/astratablast/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] шипит при контакте с [target]!"))
			playsound(target, 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		if(M.mob_biotypes & biotype_we_look_for || istype(M, /mob/living/simple_animal/hostile/rogue/skeleton))
			damage *= fuck_that_guy_multiplier
			// Apply sunder firestacks to undead instead of regular fire
			M.adjust_fire_stacks(5, /datum/status_effect/fire_handler/fire_stacks/sunder)
			visible_message(span_warning("[target] вспыхивает испепеляющим святым пламенем от удара [src]!"))
			M.ignite_mob()
		else
			M.adjust_fire_stacks(4) //2 pats to put it out
			visible_message(span_warning("[src] воспламеняет [target]!"))
			M.ignite_mob()
	return FALSE

//============================================
// TIER 2 MIRACLES
//============================================

// Scorch - T2 weapon enhancement that adds pain and stress
/obj/effect/proc_holder/spell/self/scorch
	name = "Опаление"
	desc = "Наполните своё оружие божественным огненным гневом. Ваш следующий удар причинит огромную боль и ужас врагу."
	overlay_state = "inflictpain"
	recharge_time = 1 MINUTES
	movement_interrupt = FALSE
	chargedrain = 0
	chargetime = 1 SECONDS
	charging_slowdown = 2
	chargedloop = null
	associated_skill = /datum/skill/magic/holy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/timestop.ogg'
	invocation = "Feel Astrata's fiery wrath!"
	invocation_type = "shout"
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/self/scorch/cast(mob/living/user)
	if(!isliving(user))
		return FALSE
	user.apply_status_effect(/datum/status_effect/scorch, user.get_active_held_item())
	return TRUE

//============================================
// TIER 3 MIRACLES  
//============================================

// Sun's Shield - Fire resistance ability granted by ritual
/obj/effect/proc_holder/spell/self/suns_shield
	name = "Щит Солнца"
	desc = "Призовите благословение Астраты, чтобы защитить себя и находящихся рядом последователей божественного пантеона от пламени."
	overlay_state = "burning"
	recharge_time = 4 MINUTES
	invocation = "By Her light, we are shielded!"
	invocation_type = "shout"
	sound = 'sound/magic/holyshield.ogg'

/obj/effect/proc_holder/spell/self/suns_shield/cast(list/targets, mob/living/user = usr)
	var/is_day = (GLOB.tod == "day")
	var/user_duration = is_day ? 2 MINUTES : 1 MINUTES
	var/ally_duration = user_duration / 2
	
	// Clear user's firestacks and extinguish them
	if(isliving(user))
		var/mob/living/L = user
		L.adjust_fire_stacks(-L.fire_stacks)
		var/datum/status_effect/fire_handler/fire_stacks/FS = L.has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
		if(FS)
			FS.extinguish()
		
		// Extinguish all equipped clothing items
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			for(var/obj/item/I in H.get_equipped_items())
				I.extinguish()
	
	// Apply to user
	user.apply_status_effect(/datum/status_effect/buff/suns_shield, user_duration)
	to_chat(user, span_astratabig("Сияние Астраты струится сквозь вас, защищая от пламени!"))
	
	// Apply to nearby divine pantheon followers
	for(var/mob/living/carbon/target in view(3, get_turf(user)))
		if(target == user)
			continue
		if(!istype(target.patron, /datum/patron/divine))
			continue
		if(!user.faction_check_mob(target))
			continue
		if(target.mob_biotypes & MOB_UNDEAD)
			continue
		
		target.apply_status_effect(/datum/status_effect/buff/suns_shield, ally_duration)
		to_chat(target, span_astrata("Благословение Астраты защищает вас от пламени!"))
	
	return TRUE

// Anastasis - Revive a dead target or obliterate undead
/obj/effect/proc_holder/spell/invoked/revive
	name = "Анастасис"
	desc = "Воззовите к Её величию, дабы вернуть жизнь мёртвому. Уничтожает нежить."
	overlay_state = "revive"
	releasedrain = 90
	chargedrain = 0
	chargetime = 160
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/revive.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 2 MINUTES
	miracle = TRUE
	devotion_cost = 80
	/// Amount of PQ gained for reviving people
	var/revive_pq = PQ_GAIN_REVIVE

/obj/effect/proc_holder/spell/invoked/revive/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		// Check for undead FIRST - obliterate them with holy light
		if((target.mob_biotypes & MOB_UNDEAD) && !HAS_TRAIT(target, TRAIT_HOLLOW_LIFE))
			// Range check - must be within 10 tiles and same z-level
			var/distance = get_dist(user, target)
			if(distance > 10)
				to_chat(user, span_danger("Нежить слишком далеко! Нужно подойти ближе, чтобы направить божественную силу для их уничтожения!"))
				revert_cast()
				return FALSE
			
			// Z-level check
			if(user.z != target.z)
				to_chat(user, span_danger("Я должен видеть нежить перед собой, а не сверху или снизу!"))
				revert_cast()
				return FALSE
			
			// Check for powerful undead immunity (Vampire Lords and Liches)
			var/is_powerful_undead = FALSE
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				// Check for Vampire Lord (Methuselah generation)
				if(H.get_vampire_generation() >= GENERATION_METHUSELAH)
					is_powerful_undead = TRUE
				// Check for Lich
				if(HAS_TRAIT(H, TRAIT_COUNTERCOUNTERSPELL))
					is_powerful_undead = TRUE
					
			// Powerful undead resist unless caster is a Priest
			if(is_powerful_undead && !HAS_TRAIT(user, TRAIT_CHOSEN))
				to_chat(user, span_danger("Нечестивая сила этого существа слишком велика! Только посвящённый Жрец может расправиться с таким!"))
				target.visible_message(span_astratabig("[target] сопротивляется обрушившемуся на него святому свету, его древняя сила отражает божественный гнев!"))
				revert_cast()
				return FALSE
			
						// Range check for powerful undead - must be within 6 tiles
			if(is_powerful_undead)
				if(distance > 6)
					to_chat(user, span_danger("Это древнее зло слишком далеко! Нужно подойти ближе, чтобы направить достаточно божественной силы для их уничтожения!"))
					revert_cast()
					return FALSE

			// Start cinematic destruction sequence
			if(is_powerful_undead)
				to_chat(user, span_danger("Вы направляете мощь Астраты! [target] начинает гореть святым светом!"))
				target.visible_message(span_astratabig("[target] поражён астрономическим святым светом, его форма начинает пылать божественным сиянием!"))
			else
				to_chat(user, span_danger("[target] охвачен святым светом!"))
				target.visible_message(span_astratabig("[target] начинает гореть святым светом!"))
			
			user.say("Die before the Tyrant's Light!")
			
			// Call the cinematic destruction proc
			divine_destruction(target, is_powerful_undead)
			return TRUE
		// Block if excommunicated and caster is divine pantheon
		if(istype(user, /mob/living)) {
			var/mob/living/LU = user
			var/excomm_found = FALSE
			for(var/excomm_name in GLOB.excommunicated_players)
				var/clean_excomm = lowertext(trim(excomm_name))
				var/clean_target = lowertext(trim(target.real_name))
				if(clean_excomm == clean_target)
					excomm_found = TRUE
					break
			if(ispath(LU.patron?.type, /datum/patron/divine) && excomm_found) {
				to_chat(user, span_danger("Боги отшатываются от [target]! Божественный огонь обжигает ваши руки, когда ваша мольба отвергается!"))
				target.visible_message(span_danger("[target] опалён божественным гневом! Боги ненавидят его!"))
				revert_cast()
				return FALSE
			}
		}
		var/mob/dead/observer/spirit = target.get_spirit()
		//GET OVER HERE!
		if(spirit)
			var/mob/dead/observer/ghost = spirit.ghostize()
			qdel(spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = FALSE)
		if(!target.check_revive(user))
			revert_cast()
			return FALSE
		if(GLOB.tod == "night")
			to_chat(user, span_astratabig("Да будет свет."))
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)
		target.adjustOxyLoss(-target.getOxyLoss()) //Ye Olde CPR
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("Ничего не происходит."))
			revert_cast()
			return FALSE
		testing("revived2")
		target.emote("breathgasp")
		target.Jitter(100)
		record_round_statistic(STATS_ASTRATA_REVIVALS)
		target.update_body()
		target.visible_message(span_astratabig("[target] воскрешён святым светом!"), span_green("Я пробуждаюсь из пустоты."))
		if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
			adjust_playerquality(revive_pq, user.ckey)
			ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
		target.mind.remove_antag_datum(/datum/antagonist/zombie)
		target.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it - Failsafe for it.
		target.apply_status_effect(/datum/status_effect/debuff/revived)	//Temp debuff on revive, your stats get hit temporarily. Doubly so if having rotted.
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/revive/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/fluff/psycross/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, span_warning("Мне нужен святой крест."))
		return FALSE
	return TRUE



//============================================
// TIER 4 MIRACLES
//============================================

// Invoked Reverence - T4 pain/stress check that forces kneeling
/obj/effect/proc_holder/spell/invoked/invoked_reverence
	name = "Призванное Благоговение"
	desc = "Направьте божественное величие, чтобы внушить трепет страждущим. Те, кто измучен болью и ужасом, будут вынуждены преклонить колени в Её присутствии."
	overlay_state = "createlight"
	releasedrain = 50
	chargedrain = 0
	chargetime = 2 SECONDS
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokeholy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/churn.ogg'
	invocation = "WITNESS HER DIVINE RADIANCE!!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 3 MINUTES
	miracle = TRUE
	devotion_cost = 100

/obj/effect/proc_holder/spell/invoked/invoked_reverence/cast(list/targets, mob/user = usr)
	if(!isliving(targets[1]))
		return FALSE
	
	var/mob/living/carbon/target = targets[1]
	
	// Get target's stress and pain
	var/target_stress = target.get_stress_amount()
	var/target_pain = 0
	
	if(iscarbon(target))
		// Get pain and convert to stress equivalent (100 pain = 1 stress)
		target_pain = target.get_complex_pain() / 100
	
	var/total_suffering = target_stress + target_pain
	
	// Visual effect
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/divine_overlay = mutable_appearance('icons/effects/clan.dmi', "presence", -MUTATIONS_LAYER)
	divine_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = divine_overlay
	target.apply_overlay(MUTATIONS_LAYER)
	
	// Check if target is not in combat mode and has low/no stress
	if(iscarbon(target) && total_suffering < 4)
		var/mob/living/carbon/C = target
		if(!C.cmode && target_stress <= 0)
			// Compare INT vs END
			var/caster_int = 0
			var/target_end = 0
			
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				caster_int = H.STAINT
			
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				target_end = H.STAEND
			
			var/stat_difference = caster_int - target_end
			
			if(stat_difference >= 4)
				// Stage 2 effect from stats
				to_chat(target, span_astratabig("Я не могу сопротивляться! Мои ноги подкашиваются!"))
				target.visible_message(span_astrata("[target] вынужден преклонить колени в благоговейном трепете перед божественным присутствием [user]!"))
				target.Immobilize(5 SECONDS)
				target.set_resting(TRUE, TRUE)
				target.add_stress(/datum/stressevent/scorch)
				addtimer(CALLBACK(src, PROC_REF(remove_divine_overlay), target), 3 SECONDS)
				return TRUE
			else if(stat_difference >= 2)
				// Stage 1 effect from stats
				to_chat(target, span_astrata("Тяжесть божественного величия давит на меня!"))
				target.visible_message(span_warning("Призванное благоговение [user] заставляет [target] пошатнуться!"))
				target.Immobilize(3 SECONDS)
				target.add_stress(/datum/stressevent/scorch)
				addtimer(CALLBACK(src, PROC_REF(remove_divine_overlay), target), 3 SECONDS)
				return TRUE
	
	// Determine effect based on suffering threshold
	if(total_suffering < 4)
		// Not enough suffering - minor effect
		to_chat(target, span_userdanger("Божественное присутствие омывает меня, но я стою твёрдо!"))
		target.visible_message(span_warning("[target] сопротивляется призванному благоговению!"))
		target.Immobilize(1 SECONDS)
	else if(total_suffering < 11)
		// Stage 1 - Hesitation and brief immobilization
		to_chat(target, span_astrata("Тяжесть божественного величия давит на меня!"))
		target.visible_message(span_warning("Призванное благоговение [user] заставляет [target] пошатнуться!"))
		target.Immobilize(3 SECONDS)
		target.add_stress(/datum/stressevent/scorch)  // Add more stress from being awed
	else if(total_suffering < 19)
		// Stage 2 - Forced to kneel
		to_chat(target, span_astratabig("Я не могу сопротивляться! Мои ноги подкашиваются!"))
		target.visible_message(span_astrata("[target] вынужден преклонить колени в благоговейном трепете перед божественным присутствием [user]!"))
		target.Immobilize(5 SECONDS)
		target.set_resting(TRUE, TRUE)
		target.add_stress(/datum/stressevent/scorch)
	else
		// Stage 3 - Severe kneeling with extended duration
		to_chat(target, span_astrataextreme("ВЕЛИЧИЕ АСТРАТЫ АБСОЛЮТНО! Я ДОЛЖЕН ПРЕКЛОНИТЬ КОЛЕНИ!"))
		target.visible_message(span_astratabig("[target] падает перед [user], переполненный божественным сиянием!"))
		target.Immobilize(8 SECONDS)
		target.set_resting(TRUE, TRUE)
		target.AdjustKnockdown(20)  // Extra knockdown time
		target.add_stress(/datum/stressevent/scorch)
	
	// Remove overlay after a delay
	addtimer(CALLBACK(src, PROC_REF(remove_divine_overlay), target), 3 SECONDS)
	
	return TRUE

//============================================
// PRIESTS ORBITAL LASER
//============================================

/obj/effect/proc_holder/spell/invoked/sunstrike
	name = "Кара"
	desc = "Ярость Солнечного Тирана, воплощённая в жизнь. Обрушьте солнечное опустошение на область после долгой концентрации."
	overlay_state = "sunstrike"
	base_icon_state = "regalyscroll"
	releasedrain = 200
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
	antimagic_allowed = FALSE
	recharge_time = 20 MINUTES //One per day
	miracle = TRUE
	devotion_cost = 200

/obj/effect/proc_holder/spell/invoked/sunstrike/cast(list/targets, mob/living/user)
	..()

	if(!isliving(user))
		revert_cast()
		return FALSE
	var/check = null
	var/turf/target = get_turf(targets[1])
	if(GLOB.tod != "night")
		check = TRUE
	else
		to_chat(user, span_astrata("Её ярость можно призвать лишь когда солнце в небе."))
	if(!check)
		revert_cast()
		return FALSE
	var/obj/effect/temp_visual/mark = new /obj/effect/temp_visual/firewave/sun_mark/pre_sunstrike(target)

	animate(mark, alpha = 255, time = 20, flags = ANIMATION_PARALLEL)

	var/obj/effect/temp_visual/mark_on_user = new /obj/effect/temp_visual/firewave/sun_mark(get_turf(user))
	animate(mark_on_user, alpha = 255, time = 20, flags = ANIMATION_PARALLEL)
	if(!do_after(user, 20 SECONDS, target = target))
		mark_on_user.alpha = 255
		to_chat(user, span_warning("Мощь Астраты требует непоколебимой концентрации!"))
		qdel(mark)
		qdel(mark_on_user)
		revert_cast()
		return FALSE
	qdel(mark_on_user)
	for(var/obj/structure/fluff/psycross/S in oview(5, user))
		S.AOE_flash(user, range = 8)
	new /obj/effect/temp_visual/firewave/sunstrike/primary(target)

//============================================
// STATUS EFFECTS & SUPPORTING CODE
//============================================

//T0. Astratan Gaze Support Code
/atom/movable/screen/alert/status_effect/buff/astrata_gaze
	name = "Взор Астраты"
	desc = "Она сияет сквозь меня, освещая всякую несправедливость."
	icon_state = "astrata_gaze"

/datum/status_effect/buff/astrata_gaze
	id = "astratagaze"
	alert_type = /atom/movable/screen/alert/status_effect/buff/astrata_gaze
	duration = 20 SECONDS
	var/skill_level = 0
	status_type = STATUS_EFFECT_REPLACE

/datum/status_effect/buff/astrata_gaze/on_creation(mob/living/new_owner, slevel)
    // Only store skill level here
    skill_level = slevel
    .=..()

/datum/status_effect/buff/astrata_gaze/on_apply()
	// Reset base values because the miracle can 
	// now actually be recast at high enough skill and during day time
	// This is a safeguard because buff code makes my head hurt
    var/per_bonus = 0
    duration = 20 SECONDS

    if(skill_level > SKILL_LEVEL_NOVICE)
        per_bonus++

    if(GLOB.tod == "day" || GLOB.tod == "dawn")
        per_bonus++
        duration *= 2

    duration *= skill_level

    if(per_bonus)
        effectedstats = list(STATKEY_PER = per_bonus)

    if(ishuman(owner))
        var/mob/living/carbon/human/H = owner
        H.viewcone_override = TRUE
        H.hide_cone()
        H.update_cone_show()

    to_chat(owner, span_astrata("Она сияет сквозь меня! Я вижу всё ясно как день!"))

    return ..()

/datum/status_effect/buff/astrata_gaze/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.viewcone_override = FALSE
		H.hide_cone()
		H.update_cone_show()

//T2. Scorch Support Code
/datum/status_effect/scorch
	id = "scorch"
	status_type = STATUS_EFFECT_UNIQUE
	duration = 15 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/buff/scorch
	on_remove_on_mob_delete = TRUE
	var/datum/weakref/buffed_item

/datum/status_effect/scorch/on_creation(mob/living/new_owner, obj/item/I)
	. = ..()
	if(!.)
		return
	if(istype(I) && !(I.item_flags & ABSTRACT))
		buffed_item = WEAKREF(I)
		if(!I.light_outer_range && I.light_system == STATIC_LIGHT)
			I.set_light(1)
		RegisterSignal(I, COMSIG_ITEM_AFTERATTACK, PROC_REF(item_afterattack))
	else
		RegisterSignal(owner, COMSIG_MOB_ATTACK_HAND, PROC_REF(hand_attack))

/datum/status_effect/scorch/on_remove()
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_ATTACK_HAND)
	if(buffed_item)
		var/obj/item/I = buffed_item.resolve()
		if(istype(I))
			I.set_light(0)
		UnregisterSignal(I, COMSIG_ITEM_AFTERATTACK)

/datum/status_effect/scorch/proc/item_afterattack(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(!isliving(target))
		return
	var/mob/living/living_target = target
	
	// Get the bodypart that was hit
	var/obj/item/bodypart/affecting = living_target.get_bodypart(ran_zone(user.zone_selected))
	if(!affecting)
		affecting = living_target.get_bodypart(BODY_ZONE_CHEST)
	
	// Apply the Scorch wound - this only adds pain, no bleeding
	var/datum/wound/scorch/W = new()
	affecting.add_wound(W)
	
	// Estimate damage from the weapon for wound upgrade (pain calculation only)
	var/estimated_damage = 20  // Default
	if(istype(source, /obj/item/rogueweapon))
		var/obj/item/rogueweapon/weapon = source
		estimated_damage = weapon.force
	
	W.upgrade(estimated_damage, 0)  // 0 armor for full pain effect
	
	// Add stress event
	living_target.add_stress(/datum/stressevent/scorch)
	
	living_target.visible_message(span_warning("Божественный свет извергается из удара [user] по [living_target]!"), \
		span_userdanger("Жгучая боль пронзает меня от удара [user]!"))
	
	qdel(src)

/datum/status_effect/scorch/proc/hand_attack(datum/source, mob/living/carbon/human/M, mob/living/carbon/human/H, datum/martial_art/attacker_style)
	if(!istype(M))
		return
	if(!istype(H))
		return
	if(!istype(M.used_intent, INTENT_HARM))
		return
	
	// Get the bodypart that was hit
	var/obj/item/bodypart/affecting = H.get_bodypart(ran_zone(M.zone_selected))
	if(!affecting)
		affecting = H.get_bodypart(BODY_ZONE_CHEST)
	
	// Apply the wound (pain only)
	var/datum/wound/scorch/W = new()
	affecting.add_wound(W)
	W.upgrade(10, 0)  // Unarmed strike - less damage, less pain
	
	// Add stress event
	H.add_stress(/datum/stressevent/scorch)
	
	H.visible_message(span_warning("Божественный свет извергается из удара [M] по [H]!"), \
		span_userdanger("Жгучая боль пронзает меня от удара [M]!"))
	
	qdel(src)

/atom/movable/screen/alert/status_effect/buff/scorch
	name = "Опаление"
	desc = "Моё оружие светится божественным гневом. Мой следующий удар принесёт боль и ужас."
	icon_state = "strike"

//T3. Sun's shield Support Code
/datum/status_effect/buff/suns_shield
	id = "suns_shield"
	alert_type = /atom/movable/screen/alert/status_effect/buff/suns_shield
	effectedstats = null

/datum/status_effect/buff/suns_shield/on_creation(mob/living/new_owner, set_duration)
	if(set_duration)
		duration = set_duration
	return ..()
	
/datum/status_effect/buff/suns_shield/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_NOFIRE, "[type]")
	to_chat(owner, span_astrata("Я защищён от пламени светом Астраты!"))

/datum/status_effect/buff/suns_shield/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_NOFIRE, "[type]")
	to_chat(owner, span_warning("Огненный щит Астраты угасает."))

/atom/movable/screen/alert/status_effect/buff/suns_shield
	name = "Щит Солнца"
	desc = "Благословение Астраты защищает меня от пламени."
	icon_state = "immolation"

//T3. Anastasis Support Code
/obj/effect/proc_holder/spell/invoked/revive/proc/divine_destruction(mob/living/target, is_powerful = FALSE)
	if(!target)
		return
	
	// Add increasingly bright glow filter
	target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 2, "color" = "#FFD70080"))
	
	// Prevent movement and actions - powerful undead get longer sequence
	var/destruction_time = is_powerful ? 90 SECONDS : 30 SECONDS
	target.Stun(destruction_time)
	
	// Make them immune to all damage during the destruction sequence
	target.status_flags |= GODMODE
	
	// Track timer IDs for potential calcification override in global list
	GLOB.divine_destruction_mobs[target] = list()
	
	// Register signal handler for calcification override
	RegisterSignal(target, COMSIG_LIVING_CALCIFICATION_OVERRIDE, PROC_REF(handle_calcification_override))
	
	// Message sequence - different timings based on power
	// 0 seconds - initial
	to_chat(target, span_astrataextreme("Свет Астраты вжигается в само моё существо, я уничтожаюсь!"))
	
	if(is_powerful)
		// Full 90 second sequence for powerful undead
		// 15 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 1), 15 SECONDS, TIMER_STOPPABLE)
		
		// 30 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 2), 30 SECONDS, TIMER_STOPPABLE)
		
		// 45 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 3), 45 SECONDS, TIMER_STOPPABLE)
		
		// 60 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 4), 60 SECONDS, TIMER_STOPPABLE)
		
		// 75 seconds - final goodbye
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 5), 75 SECONDS, TIMER_STOPPABLE)
		
		// 90 seconds - KABOOM
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_finale), target, is_powerful), 90 SECONDS, TIMER_STOPPABLE)
	else
		// 30 second sequence for normal undead
		// 10 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 1), 10 SECONDS, TIMER_STOPPABLE)
		
		// 20 seconds
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_message), target, 3), 20 SECONDS, TIMER_STOPPABLE)
		
		// 30 seconds - KABOOM
		GLOB.divine_destruction_mobs[target] += addtimer(CALLBACK(src, PROC_REF(divine_destruction_finale), target, is_powerful), 30 SECONDS, TIMER_STOPPABLE)

/obj/effect/proc_holder/spell/invoked/revive/proc/divine_destruction_message(mob/living/target, stage)
	if(!target || target.stat == DEAD)
		return
	
	// Check if calcification has overridden divine destruction
	if(!(target in GLOB.divine_destruction_mobs))
		return
	
	// Clean up old moblight if it exists
	var/obj/effect/dummy/lighting_obj/moblight/old_light = locate() in target
	if(old_light)
		qdel(old_light)
	
	switch(stage)
		if(1)
			to_chat(target, span_astrata("Свет становится ярче! Я чувствую, как он прожигает меня насквозь!"))
			target.visible_message(span_astrata("[target] сияет всё ярче святым светом, его форма начинает трескаться!"))
			target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 3, "color" = "#FFD700CC"))
			target.mob_light("#FFD700", 3, 1.5)
		if(2)
			to_chat(target, span_astrata("Сияние переполняет! Моя нечестивая сущность разрывается на части!"))
			target.visible_message(span_astrata("[target] пылает всё ярче, трещины золотого света расползаются по его телу!"))
			target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 4, "color" = "#FFD700FF"))
			target.mob_light("#FFD700", 4, 2)
		if(3)
			to_chat(target, span_astratabig("Я НЕ МОГУ СБЕЖАТЬ! СВЕТ — ЭТО ВСЁ!"))
			target.visible_message(span_astrata("[target] теперь пылает божественным сиянием, едва видимый сквозь золотое свечение!"))
			target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 6, "color" = "#FFFFFF"))
			target.mob_light("#FFFFFF", 6, 2.5)
		if(4)
			to_chat(target, span_astratabig("МОЯ ФОРМА РАЗЛАГАЕТСЯ! Я УНИЧТОЖАЮСЬ!"))
			target.visible_message(span_astrata("[target] теперь столп палящего золотого света!"))
			target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 8, "color" = "#FFFFFF"))
			target.mob_light("#FFFFFF", 8, 3)
		if(5)
			to_chat(target, span_astrataextreme("ГНЕВ АСТРАТЫ АБСОЛЮТЕН! Я ЕСТЬ—"))
			target.visible_message(span_astratabig("Форма [target] едва держится вместе, свет вырывается из каждой трещины!"))
			target.add_filter("divine_glow", 1, list("type" = "outline", "size" = 10, "color" = "#FFFFFF"))
			target.mob_light("#FFFFFF", 10, 4)

/obj/effect/proc_holder/spell/invoked/revive/proc/divine_destruction_finale(mob/living/target, is_powerful = FALSE)
	if(!target)
		return
	
	// Check if calcification has overridden divine destruction
	if(!(target in GLOB.divine_destruction_mobs))
		return
	
	if(is_powerful)
		target.visible_message(span_astrataextreme("[target] ВЗРЫВАЕТСЯ катастрофическим взрывом святого света!"))
	else
		target.visible_message(span_astratabig("[target] ВЗРЫВАЕТСЯ вспышкой божественного сияния!"))
	
	playsound(target, 'sound/misc/holyexplosion.ogg', 150, FALSE, 7)
	
	// Flash everyone nearby
	for(var/mob/M in viewers(target, 7))
		M.flash_fullscreen("whiteflash")
	
	// Remove filter and all moblights, then gib
	target.remove_filter("divine_glow")
	for(var/obj/effect/dummy/lighting_obj/moblight/L in target)
		qdel(L)
	
	// Clean up tracking variables
	GLOB.divine_destruction_mobs -= target
	
	// Unregister calcification signal
	UnregisterSignal(target, COMSIG_LIVING_CALCIFICATION_OVERRIDE)
	
	target.gib()

// Calcification Override for Divine Destruction
// FOR WHEN SKELETONS WANT TO BE EXTRA FUNNY
/obj/effect/proc_holder/spell/invoked/revive/proc/handle_calcification_override(mob/living/target)
	SIGNAL_HANDLER
	
	if(!target)
		return
	
	// Cancel all divine destruction timers
	if(target in GLOB.divine_destruction_mobs)
		for(var/timer_id in GLOB.divine_destruction_mobs[target])
			deltimer(timer_id)
		GLOB.divine_destruction_mobs -= target
	
	// Unregister the signal since we're handling it now
	UnregisterSignal(target, COMSIG_LIVING_CALCIFICATION_OVERRIDE)
	
	// Remove old filter and moblights
	target.remove_filter("divine_glow")
	for(var/obj/effect/dummy/lighting_obj/moblight/L in target)
		qdel(L)
	
	// Add RED calcification glow
	target.add_filter("calcification_glow", 1, list("type" = "outline", "size" = 8, "color" = "#FF0000"))
	target.mob_light("#FF0000", 10, 4)
	
	// Keep them stunned for the full 15 seconds
	target.Stun(15 SECONDS)
	
	// Give them booming voice (thaumaturgy effect) - max potency
	target.apply_status_effect(/datum/status_effect/thaumaturgy, 4)
	
	// Messages
	to_chat(target, span_big(span_userdanger("Я ОТКАЗЫВАЮСЬ БЫТЬ УНИЧТОЖЕННЫМ! МОИ КОСТИ СТАНУТ МОЕЙ МЕСТЬЮ!")))
	target.visible_message(span_big(span_danger("Святой свет [target] внезапно становится ПЫЛАЮЩИМ КРАСНЫМ, когда они начинают вибрировать ужасной энергией!")))
	
	// 15 second explosion sequence with messages
	// 5 seconds
	addtimer(CALLBACK(src, PROC_REF(calcification_message), target, 1), 5 SECONDS)
	
	// 10 seconds
	addtimer(CALLBACK(src, PROC_REF(calcification_message), target, 2), 10 SECONDS)
	
	// 14 seconds - cleanup
	addtimer(CALLBACK(src, PROC_REF(calcification_finale), target), 14 SECONDS)

/obj/effect/proc_holder/spell/invoked/revive/proc/calcification_message(mob/living/target, stage)
	if(!target || target.stat == DEAD)
		return
	
	switch(stage)
		if(1)
			to_chat(target, span_big(span_userdanger("КАЛЬЦИФИКАЦИЯ УСИЛИВАЕТСЯ! Я ЧУВСТВУЮ, КАК МОИ КОСТИ ТРЕЩАТ ОТ СИЛЫ!")))
			target.visible_message(span_big(span_danger("[target] сияет ещё ЯРЧЕ багровой энергией, трещины расползаются по их форме!")))
			target.add_filter("calcification_glow", 1, list("type" = "outline", "size" = 12, "color" = "#FF0000"))
		if(2)
			to_chat(target, span_big(span_userdanger("УЗРИТЕ СИЛУ НЕЖИТИ! Я СТАНОВЛЮСЬ СМЕРТЬЮ!")))
			target.visible_message(span_big(span_danger("[target] теперь ПЫЛАЮЩИЙ СТОЛП КРАСНОГО СВЕТА!")))
			target.add_filter("calcification_glow", 1, list("type" = "outline", "size" = 15, "color" = "#FF0000"))

/obj/effect/proc_holder/spell/invoked/revive/proc/calcification_finale(mob/living/target)
	if(!target)
		return
	
	// Epic explosion message
	target.visible_message(span_big(span_userdanger("[target] ВЗРЫВАЕТСЯ КАТАКЛИЗМИЧЕСКИМ ВЗРЫВОМ КОСТЕЙ И ЯРОСТИ!")))
	
	// Remove filter and moblights
	target.remove_filter("calcification_glow")
	for(var/obj/effect/dummy/lighting_obj/moblight/L in target)
		qdel(L)
	
	// Clean up state
	GLOB.divine_destruction_mobs -= target

//T4. Invoked Reverence Support Code
/obj/effect/proc_holder/spell/invoked/invoked_reverence/proc/remove_divine_overlay(mob/living/target)
	if(target)
		target.remove_overlay(MUTATIONS_LAYER)

//T4. Smite support code.
/obj/effect/proc_holder/spell/invoked/sunstrike/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/atom/holy_requirement
	for(var/obj/structure/fluff/psycross/cross in oview(5, user))
		holy_requirement = cross
	for(var/mob/living/carbon/human/priest in view(7, user))
		if(priest.mind?.assigned_role == "Priest")
			holy_requirement = priest
			break

	if(!holy_requirement)
		to_chat(user, span_warning("Я должен творить в присутствии Креста Пантеона или Жреца"))
		revert_cast()
		return FALSE
	return TRUE

/obj/effect/temp_visual/firewave/sun_mark
	icon = 'icons/effects/160x160.dmi'
	icon_state = "sun"
	alpha = 5
	duration = 1 MINUTES
	pixel_x = -64
	pixel_y = -64
	light_outer_range = 5
	light_color = "#ffb300ff"

/obj/effect/temp_visual/firewave/sun_mark/pre_sunstrike
	duration = 30 SECONDS

/obj/effect/temp_visual/firewave/sunstrike/primary
	alpha = 0
	duration = 11 SECONDS

/obj/effect/temp_visual/firewave/sunbeam
	icon = 'icons/effects/32x96.dmi'
	icon_state = "sunstrike"
	alpha = 5
	duration = 15.5

/obj/effect/temp_visual/firewave/sunstrike/primary/Initialize(mapload, mob/living/carbon/caster)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(pre_strike)), 1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(strike), caster), 10 SECONDS)

/obj/effect/temp_visual/firewave/sunstrike/primary/proc/pre_strike()
	var/turf/T = get_turf(src)
	playsound(T,'sound/magic/revive.ogg', 80, TRUE)
	loud_message("<font size = 5>[span_astrataextreme("НЕБЕСА ЗАЛИТЫ БЕЛЫМ ОГНЁМ!!")]</font><br>", hearing_distance = 21)

	for(var/turf/Target_turf in range(1, get_turf(src)))
		for(var/mob/living/L in Target_turf.contents)
			to_chat(L, span_astratabig("Давящий взор Тирана направлен на вас. Бегите или Погибните."))

/obj/effect/temp_visual/firewave/sunstrike/primary/proc/strike(mob/living/carbon/caster)
	var/turf/T = get_turf(src)
	playsound(T,'sound/magic/astrata_choir.ogg', 100, TRUE)
	explosion(T, -1, 0, 0, 0, 0, flame_range = 0, soundin = 'sound/misc/explode/incendiary (1).ogg')
	var/obj/effect/temp_visual/mark = new /obj/effect/temp_visual/firewave/sunbeam(T)

	animate(mark, alpha = 255, time = 10, flags = ANIMATION_PARALLEL)
	for(var/turf/turf as anything in RANGE_TURFS(6, T))
		if(prob(20))
			new /obj/effect/hotspot(get_turf(turf))
	for(var/turf/Target_turf in range(5, T))
		for(var/mob/living/victim in Target_turf.contents)
			to_chat(victim, span_astrataextreme("БОЖЕСТВЕННОЕ ПЛАМЯ ЛЬЁТСЯ С НЕБЕС!"))
			var/dist_to_epicenter = get_dist(T, victim)
			var/firedamage = 200 - (dist_to_epicenter*30)
			var/firestack = 10 - dist_to_epicenter
			victim.adjustFireLoss(firedamage)
			victim.adjust_fire_stacks(firestack)
			victim.ignite_mob()
			if(!victim.mind || istype(victim, /mob/living/simple_animal))
				victim.adjustFireLoss(500)
				if(dist_to_epicenter <= 3)
					victim.gib()
					continue
			if(dist_to_epicenter == 1) //pre-center
				victim.adjustFireLoss(100) //100 firedamage
				new /obj/effect/hotspot(get_turf(victim))
			if(dist_to_epicenter == 0) //center
				explosion(T, -1, 1, 1, 0, 0, flame_range = 1, soundin = 'sound/misc/explode/incendiary (1).ogg')
				new /obj/effect/hotspot(get_turf(victim))
				if(!istype(victim.patron, /datum/patron/divine))
					victim.gib()
					continue
				else
					victim.adjustFireLoss(500)
					victim.stat = DEAD
		for(var/obj/item/I in range(1, T))
			qdel(I)
		for (var/obj/structure/damaged in view(2, T))
			if(!istype(damaged, /obj/structure/flora/newbranch))
				damaged.take_damage(500,BRUTE,"blunt",1)
		for (var/turf/closed/wall/damagedwalls in view(1, T))
			damagedwalls.take_damage(1100,BRUTE,"blunt",1)
		for (var/turf/closed/mineral/aoemining in view(2, T))
			aoemining.lastminer = caster
			aoemining.take_damage(1100,BRUTE,"blunt",1)
	addtimer(CALLBACK(src, PROC_REF(fade_mark), mark), 1 SECONDS)

/obj/effect/temp_visual/firewave/sunstrike/primary/proc/fade_mark(obj/effect/temp_visual/mark)
    animate(mark, alpha = 5, time = 10, flags = ANIMATION_PARALLEL)
