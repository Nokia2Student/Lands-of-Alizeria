/obj/effect/proc_holder/spell/invoked/psydonlux_tamper
	name = "ПЛАЧ"
	overlay_state = "psydonweeps"
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	desc = "Истекайте кровью за цель, забирая их раны и восполняя их уровень крови."
	movement_interrupt = FALSE
	sound = 'sound/magic/psydonbleeds.ogg'
	invocation = "I BLEED, SO THAT YOU MIGHT ENDURE!"
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 30 SECONDS
	miracle = TRUE
	devotion_cost = 80

/obj/effect/proc_holder/spell/invoked/psydonlux_tamper/cast(list/targets, mob/living/user)
	if(!ishuman(targets[1]))
		to_chat(user, span_warning("Их Люкс не нуждается в очищении."))
		revert_cast()
		return FALSE
	
	var/mob/living/carbon/human/H = targets[1]
	
	if(H == user)
		to_chat(user, span_warning("Мой собственный Люкс сохраняет чистоту."))
		revert_cast()
		return FALSE

	if(H.stat == DEAD)
		to_chat(user, span_warning("[H] Люкс исчез. Я больше ничего не могу сделать."))
		user.emote("cry")
		revert_cast()
		return FALSE	
	
	// Transfer wounds.
	if(ishuman(H) && ishuman(user))
		var/mob/living/carbon/human/C_target = H
		var/mob/living/carbon/human/C_caster = user
		var/list/datum/wound/tw_List = C_target.get_wounds()

		if(!tw_List.len)
			revert_cast()
			return FALSE

		//Transfer wounds from each bodypart.
		for(var/datum/wound/targetwound in tw_List)
			if (istype(targetwound, /datum/wound/dismemberment))
				continue				
			if (istype(targetwound, /datum/wound/facial))
				continue					
			if (istype(targetwound, /datum/wound/fracture/head))
				continue				
			if (istype(targetwound, /datum/wound/fracture/neck))
				continue
			if (istype(targetwound, /datum/wound/cbt/permanent))
				continue			
			var/obj/item/bodypart/c_BP = C_caster.get_bodypart(targetwound.bodypart_owner.body_zone)
			c_BP.add_wound(targetwound.type)
			var/obj/item/bodypart/t_BP = C_target.get_bodypart(targetwound.bodypart_owner.body_zone)
			t_BP.remove_wound(targetwound.type)

	// Transfer blood
	var/blood_transfer = 0
	if(H.blood_volume < BLOOD_VOLUME_NORMAL)
		blood_transfer = BLOOD_VOLUME_NORMAL - H.blood_volume
		H.blood_volume = BLOOD_VOLUME_NORMAL
		user.blood_volume -= blood_transfer
		to_chat(user, span_warning("Вы чувствуете, как ваша кровь перетекает в [H]!"))
		to_chat(H, span_notice("Вы чувствуете, как ваша кровь восполняется!"))

	// Visual effects
	user.visible_message(span_danger("[user] очищает раны [H]!"))
	playsound(user, 'sound/magic/psydonbleeds.ogg', 50, TRUE)
	
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	
	// Notify the user and target
	to_chat(user, span_notice("Вы очищаете их Люкс, сливая его со своим, ради искры."))
	to_chat(H, span_info("Вы чувствуете, как странное волнение охватывает ваш Люкс, забирая ваши раны."))
	return TRUE

/obj/effect/proc_holder/spell/self/psydonrespite
	name = "ПЕРЕДЫШКА"
	desc = "Стойте неподвижно, чтобы сосредоточиться на исцелении своих ран."
	overlay_state = "RESPITE"
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = null
	invocation = ". . ."
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 5 SECONDS
	miracle = TRUE
	devotion_cost = 0

/obj/effect/proc_holder/spell/self/psydonrespite/cast(mob/living/carbon/human/user) // It's a very tame self-heal. Nothing too special.
	. = ..()
	if(!ishuman(user))
		revert_cast()
		return FALSE
		
	var/mob/living/carbon/human/H = user
	var/brute = H.getBruteLoss()
	var/burn = H.getFireLoss()
	var/conditional_buff = FALSE
	var/zcross_trigger = FALSE
	var/sit_bonus1 = 0
	var/sit_bonus2 = 0
	var/psicross_bonus = 0

	for(var/obj/item/clothing/neck/current_item in H.get_equipped_items(TRUE))
		if(current_item.type in list(/obj/item/clothing/neck/roguetown/zcross/aalloy, /obj/item/clothing/neck/roguetown/psicross, /obj/item/clothing/neck/roguetown/psicross/wood, /obj/item/clothing/neck/roguetown/psicross/aalloy, /obj/item/clothing/neck/roguetown/psicross/silver, /obj/item/clothing/neck/roguetown/psicross/g))
			switch(current_item.type) // Worn Psicross Piety bonus. For fun.
				if(/obj/item/clothing/neck/roguetown/psicross/wood)
					psicross_bonus = -2				
				if(/obj/item/clothing/neck/roguetown/psicross/aalloy)
					psicross_bonus = -4
				if(/obj/item/clothing/neck/roguetown/psicross)
					psicross_bonus = -5
				if(/obj/item/clothing/neck/roguetown/psicross/silver)
					psicross_bonus = -7
				if(/obj/item/clothing/neck/roguetown/psicross/g) // PURITY AFLOAT.
					psicross_bonus = -7
				if(/obj/item/clothing/neck/roguetown/zcross/aalloy)
					zcross_trigger = TRUE		
	if(brute > 100)
		sit_bonus1 = -2
	if(brute > 150)
		sit_bonus1 = -4
	if(brute > 200)
		sit_bonus1 = -6	
	if(brute > 300)
		sit_bonus1 = -8		
	if(brute > 350)
		sit_bonus1 = -10
	if(brute > 400)
		sit_bonus1 = -14	
		
	if(burn > 100)
		sit_bonus2 = -2
	if(burn > 150)
		sit_bonus2 = -4
	if(burn > 200)
		sit_bonus2 = -6	
	if(burn > 300)
		sit_bonus2 = -8		
	if(burn > 350)
		sit_bonus2 = -10
	if(burn > 400)
		sit_bonus2 = -14									

	if(sit_bonus1 || sit_bonus2)				
		conditional_buff = TRUE

	var/bruthealval = -7 + psicross_bonus + sit_bonus1
	var/burnhealval = -7 + psicross_bonus + sit_bonus2

	to_chat(H, span_info("Я беру момент, чтобы собраться..."))
	if(zcross_trigger)
		user.visible_message(span_warning("[user] содрогнулся. Что-то очень неправильно."), span_userdanger("Холод пронзает мой позвоночник. Что-то смеётся над моей попыткой."))
		user.playsound_local(user, 'sound/misc/zizo.ogg', 25, FALSE)
		user.adjustBruteLoss(25)		
		return FALSE

	if(do_after(H, 50))
		playsound(H, 'sound/magic/psydonrespite.ogg', 100, TRUE)
		new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#e4e4e4") 
		new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#e4e4e4") 
		H.adjustBruteLoss(bruthealval)
		H.adjustFireLoss(burnhealval)
		if (conditional_buff)
			to_chat(user, span_info("Моя боль уступает место ощущению усиленной ясности, прежде чем вернуться снова, притуплённой."))
		user.devotion?.update_devotion(-20)
		to_chat(user, "<font color='purple'>Я теряю 20 преданности!</font>")
		cast(user)	
		return TRUE
	else
		to_chat(H, span_warning("Мои мысли и чувство покоя покидают меня."))	
		return FALSE					


/obj/effect/proc_holder/spell/self/psydonpersist
	name = "УПОРСТВО"
	desc = "Стойте неподвижно, чтобы сосредоточиться на исцелении своих ран. Вы будете УПОРСТВОВАТЬ."
	overlay_state = "PERSIST"
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = null
	invocation = ". . ."
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 5 SECONDS
	miracle = TRUE
	devotion_cost = 0

/obj/effect/proc_holder/spell/self/psydonpersist/cast(mob/living/carbon/human/user) // It's a very tame self-heal. Nothing too special.
	. = ..()
	if(!ishuman(user))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = user
	var/brute = H.getBruteLoss()
	var/burn = H.getFireLoss()
	var/conditional_buff = FALSE
	var/zcross_trigger = FALSE
	var/sit_bonus1 = 0
	var/sit_bonus2 = 0
	var/psicross_bonus = 0

	for(var/obj/item/clothing/neck/current_item in H.get_equipped_items(TRUE))
		if(current_item.type in list(/obj/item/clothing/neck/roguetown/zcross/aalloy, /obj/item/clothing/neck/roguetown/psicross, /obj/item/clothing/neck/roguetown/psicross/wood, /obj/item/clothing/neck/roguetown/psicross/aalloy, /obj/item/clothing/neck/roguetown/psicross/silver, /obj/item/clothing/neck/roguetown/psicross/g))
			switch(current_item.type) // Worn Psicross Piety bonus. For fun.
				if(/obj/item/clothing/neck/roguetown/psicross/wood)
					psicross_bonus = -2				
				if(/obj/item/clothing/neck/roguetown/psicross/aalloy)
					psicross_bonus = -4
				if(/obj/item/clothing/neck/roguetown/psicross)
					psicross_bonus = -5
				if(/obj/item/clothing/neck/roguetown/psicross/silver)
					psicross_bonus = -7
				if(/obj/item/clothing/neck/roguetown/psicross/g) // PURITY AFLOAT.
					psicross_bonus = -7
				if(/obj/item/clothing/neck/roguetown/zcross/aalloy)
					zcross_trigger = TRUE		
	if(brute > 100)
		sit_bonus1 = -2
	if(brute > 150)
		sit_bonus1 = -4
	if(brute > 200)
		sit_bonus1 = -6	
	if(brute > 300)
		sit_bonus1 = -8		
	if(brute > 350)
		sit_bonus1 = -10
	if(brute > 400)
		sit_bonus1 = -14	

	if(burn > 100)
		sit_bonus2 = -2
	if(burn > 150)
		sit_bonus2 = -4
	if(burn > 200)
		sit_bonus2 = -6	
	if(burn > 300)
		sit_bonus2 = -8		
	if(burn > 350)
		sit_bonus2 = -10
	if(burn > 400)
		sit_bonus2 = -14									

	if(sit_bonus1 || sit_bonus2)				
		conditional_buff = TRUE

	var/bruthealval = -14 + psicross_bonus + sit_bonus1
	var/burnhealval = -14 + psicross_bonus + sit_bonus2

	to_chat(H, span_info("Я беру момент, чтобы собраться..."))
	if(zcross_trigger)
		user.visible_message(span_warning("[user] содрогнулся. Что-то очень неправильно."), span_userdanger("Холод пронзает мой позвоночник. Что-то смеётся над моей попыткой."))
		user.playsound_local(user, 'sound/misc/zizo.ogg', 25, FALSE)
		user.adjustBruteLoss(25)		
		return FALSE

	if(do_after(H, 50))
		playsound(H, 'sound/magic/psydonrespite.ogg', 100, TRUE)
		new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#e4e4e4") 
		new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#e4e4e4") 
		H.adjustBruteLoss(bruthealval)
		H.adjustFireLoss(burnhealval)
		if (conditional_buff)
			to_chat(user, span_info("Моя боль уступает место ощущению усиленной ясности, прежде чем вернуться снова, притуплённой."))
		user.devotion?.update_devotion(-60)
		to_chat(user, "<font color='purple'>Я теряю 60 преданности!</font>")
		cast(user)	
		return TRUE
	else
		to_chat(H, span_warning("Мои мысли и чувство покоя покидают меня."))	
		return FALSE					

/obj/effect/proc_holder/spell/invoked/psydonabsolve	
	name = "ОТПУЩЕНИЕ"
	overlay_state = "ABSOLVE"
	desc = "Отпускает цель, беря их урон на себя, возможно, даже принимая их смерть ценой вашей Жизни."
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 1
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/psyabsolution.ogg'
	invocation = "BE ABSOLVED!"
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 30 SECONDS // 60 seconds cooldown
	miracle = TRUE
	devotion_cost = 80

/obj/effect/proc_holder/spell/invoked/psydonabsolve/cast(list/targets, mob/living/user)

	if(!ishuman(targets[1]))
		to_chat(user, span_warning("ОТПУЩЕНИЕ — для тех, кто ходит в ЕГО образе!"))
		revert_cast()
		return FALSE
	
	var/mob/living/carbon/human/H = targets[1]
	
	if(H == user)
		to_chat(user, span_warning("Вы не можете ОТПУСТИТЬ себя!"))
		revert_cast()
		return FALSE
	
	var/attempting_rez = TRUE
	// Special case for dead targets
	if(H.stat >= DEAD)
		// Check if the target has a head, brain, and heart
		var/obj/item/bodypart/head = H.get_bodypart("head")
		var/obj/item/organ/brain/brain = H.getorganslot(ORGAN_SLOT_BRAIN)
		var/obj/item/organ/heart/heart = H.getorganslot(ORGAN_SLOT_HEART)
		
		if(head && brain && heart)
			if(!H.mind)
				to_chat(user, span_warning("Вы не чувствуете искры дара ПСАЙДОНА, оставшейся в этом..."))
				attempting_rez = FALSE

			if(HAS_TRAIT(H, TRAIT_NECRAS_VOW))
				to_chat(user, "Этот отдался целиком. Здесь нечего ОТПУСКАТЬ.")
				attempting_rez = FALSE

			if(attempting_rez)
				if (alert(user, "ПРОТЯНУТЬ РУКУ И ВЫТАЩИТЬ?", "ТАМ НЕТ ЛЮКСА", "ДА", "НЕТ") != "ДА")	
					attempting_rez = FALSE
			
			if (attempting_rez)
				to_chat(user, span_warning("Вы пытаетесь воскресить [H], ОТПУСКАЯ их!"))
				// Dramatic effect
				user.visible_message(span_danger("[user] хватает [H] за запястья, пытаясь ОТПУСТИТЬ их!"))
				if(alert(H, "Они хотят ОТПУСТИТЬ вас. Вы позволите им?", "ОТПУЩЕНИЕ", "Я позволю это", "Я отказываюсь") != "Я позволю это")
					H.visible_message(span_notice("Ничего не происходит."))
					return FALSE
				// Create visual effects
				H.apply_status_effect(/datum/status_effect/buff/psyvived)
				// kill us if we're already devitalized, otherwise apply our special devitalization
				if (user.has_status_effect(/datum/status_effect/debuff/psydon_devitalized))
					user.say("MY LYFE FOR YOURS! LYVE, AS DOES HE!", forced = TRUE)
					user.death()
					user.visible_message(span_warning("Одинокая серебристая слеза скатывается с края безжизненных глаз [user], когда они оседают на землю."))
				else
					user.apply_status_effect(/datum/status_effect/debuff/psydon_devitalized)
					user.visible_message(span_warning("Вьющиеся серебристые пряди люкса змеятся от прикосновения [user] по руке [H], проникая и извиваясь под их кожей в судорожных всплесках!"))
					to_chat(user, span_boldwarning("Шёпот пустоты поселяется под вашим сердцем, пока ваш перенапряжённый люкс тревожно угасает..."))
				// Revive the target
				H.adjustOxyLoss(-H.getOxyLoss())
				H.revive(admin_revive = FALSE)
				H.grab_ghost(force = TRUE) // even suicides
				H.emote("breathgasp")
				H.Jitter(100)
				H.update_body()
				record_round_statistic(STATS_LUX_REVIVALS)
				ADD_TRAIT(H, TRAIT_IWASREVIVED, "[type]")
				H.apply_status_effect(/datum/status_effect/buff/psyvived)
				user.apply_status_effect(/datum/status_effect/buff/psyvived)
				H.visible_message(span_notice("[H] ОТПУЩЕН!"), span_green("Я пробуждаюсь из пустоты."))		
				H.mind.remove_antag_datum(/datum/antagonist/zombie)
				H.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it - Failsafe for it.
				H.apply_status_effect(/datum/status_effect/debuff/revived)	//Temp debuff on revive, your stats get hit temporarily. Doubly so if having rotted.
				return TRUE
		else
			to_chat(user, span_warning("[H] отсутствуют жизненно важные органы, и они не могут быть воскрешены!"))
			revert_cast(user)
			return FALSE
	
	// Transfer afflictions from the target to the caster
	
	// Transfer damage
	var/brute_transfer = H.getBruteLoss()
	var/burn_transfer = H.getFireLoss()
	var/tox_transfer = H.getToxLoss()
	var/oxy_transfer = H.getOxyLoss()
	var/clone_transfer = H.getCloneLoss()

	if (oxy_transfer >= 150)
		if (alert(user, "ОНИ ПЕПЕЛЬНЫ С ЗАМЕРШИМ ДЫХАНИЕМ. ОТПУЩЕНИЕ МОЖЕТ МГНОВЕННО УБИТЬ ТЕБЯ, АГНЕЦ. ПРОДОЛЖИТЬ?", "САМОСОХРАНЕНИЕ", "ДА", "НЕТ") != "ДА")
			revert_cast()
			return
	
	// Heal the target
	H.adjustBruteLoss(-brute_transfer)
	H.adjustFireLoss(-burn_transfer)
	H.adjustToxLoss(-tox_transfer)
	H.adjustOxyLoss(-oxy_transfer)
	H.adjustCloneLoss(-clone_transfer)
	
	// Apply damage to the caster
	user.adjustBruteLoss(brute_transfer)
	user.adjustFireLoss(burn_transfer)
	user.adjustToxLoss(tox_transfer)
	user.adjustOxyLoss(oxy_transfer)
	user.adjustCloneLoss(clone_transfer)

	// Visual effects
	user.visible_message(span_danger("[user] отпускает страдания [H]!"))
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717") 

	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#aa1717") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#aa1717") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#aa1717") 
	
	// Notify the user and target
	to_chat(user, span_warning("Вы отпускаете [H] от их ран!"))
	to_chat(H, span_notice("[user] отпускает вас от ваших ран!"))
	
	return TRUE

/datum/status_effect/debuff/psydon_devitalized
	id = "revived"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/psydon_devitalized
	effectedstats = list("constitution" = -5)
	duration = 10 MINUTES 

/atom/movable/screen/alert/status_effect/debuff/psydon_devitalized
	name = "ЦЕНА ОТПУЩЕНИЯ"
	desc = "Холодный озноб поселяется у вашего сердца. Напрягать люкс ещё до восстановления — верный путь к концу..."
	icon_state = "revived"
