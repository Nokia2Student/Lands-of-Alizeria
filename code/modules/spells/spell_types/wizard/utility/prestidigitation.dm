#define PRESTI_CLEAN "presti_clean"
#define PRESTI_SPARK "presti_spark"
#define PRESTI_MOTE "presti_mote"

/obj/effect/proc_holder/spell/targeted/touch/prestidigitation
	name = "Фокусы"
	desc = "Несколько простых трюков, которые многие ученики используют для тренировки управления арканой."
	clothes_req = FALSE
	drawmessage = "Я готовлюсь произнести малое арканное заклинание."
	dropmessage = "Я отпускаю свой малый арканный фокус."
	school = "transmutation"
	overlay_state = "prestidigitation"
	chargedrain = 0
	chargetime = 0
	releasedrain = 5 // this influences -every- cost involved in the spell's functionality, if you want to edit specific features, do so in handle_cost
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	hand_path = /obj/item/melee/touch_attack/prestidigitation

/obj/item/melee/touch_attack/prestidigitation
	name = "фокусы"
	desc = "Вы вспоминаете следующие заклинания:\n \
	<b>Помощь</b>: Используйте арканную силу, чтобы отчистить предмет, как мылом. Также известно как «Печаль Подмастерья».\n \
	<b>Толчок</b>: Создайте искру на выбранном предмете (или перед собой, если цель — земля), чтобы поджечь горючие предметы, факелы, фонари или костры.\n \
	<b>Использовать</b>: Призовите вращающийся магический огонёк для освещения пути."
	catchphrase = null
	possible_item_intents = list(INTENT_HELP, INTENT_DISARM, /datum/intent/use)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "pulling"
	icon_state = "grabbing_greyscale"
	color = "#3FBAFD" // this produces green because the icon base is yellow but someone else can fix that if they want
	var/obj/effect/wisp/prestidigitation/mote
	var/cleanspeed = 35 // adjust this down as low as 15 depending on magic skill
	var/motespeed = 20 // mote summoning speed
	var/sparkspeed = 30 // spark summoning speed
	var/spark_cd = 0
	var/gatherspeed = 35

/obj/item/melee/touch_attack/prestidigitation/Initialize()
	. = ..()
	mote = new(src)

/obj/item/melee/touch_attack/prestidigitation/Destroy()
	if(mote)
		QDEL_NULL(mote)
	return ..()

/obj/item/melee/touch_attack/prestidigitation/attack_self()
	qdel(src)

/obj/item/melee/touch_attack/prestidigitation/afterattack(atom/target, mob/living/carbon/user, proximity)
	switch (user.used_intent.type)
		if (INTENT_HELP) // Clean something like a bar of soap
			if(istype(target, /obj/structure/well/fountain/mana) || istype(target, /turf/open/lava))
				if(gather_thing(target, user))
					handle_cost(user, PRESTI_CLEAN)
			else if(clean_thing(target, user))
				handle_cost(user, PRESTI_CLEAN)
		if (INTENT_DISARM) // Snap your fingers and produce a spark
			if(create_spark(user, target))
				handle_cost(user, PRESTI_SPARK)
		if (/datum/intent/use) // Summon an orbiting arcane mote for light
			if(handle_mote(user))
				handle_cost(user, PRESTI_MOTE)

/obj/item/melee/touch_attack/prestidigitation/proc/handle_cost(mob/living/carbon/human/user, action)
	// handles fatigue/stamina deduction, this stuff isn't free - also returns the cost we took to use for xp calculations
	var/obj/effect/proc_holder/spell/targeted/touch/prestidigitation/base_spell = attached_spell
	var/fatigue_used = base_spell.get_fatigue_drain() //note that as our skills/stats increases, our fatigue drain DECREASES, so this means less xp, too. which is what we want since this is a basic spell, not a spam-for-xp-forever kinda beat
	var/extra_fatigue = 0 // extra fatigue isn't considered in xp calculation
	switch (action)
		if (PRESTI_CLEAN)
			fatigue_used *= 0.2 // going to be spamming a lot of this probably
		if (PRESTI_SPARK)
			extra_fatigue = 5 // just a bit of extra fatigue on this one
		if (PRESTI_MOTE)
			extra_fatigue = 15 // same deal here

	user.stamina_add(fatigue_used + extra_fatigue)

	var/skill_level = user.get_skill_level(attached_spell.associated_skill)
	if (skill_level >= SKILL_LEVEL_EXPERT)
		fatigue_used = 0 // we do this after we've actually changed fatigue because we're hard-capping the raises this gives to Expert

	return fatigue_used

/obj/item/melee/touch_attack/prestidigitation/proc/handle_mote(mob/living/carbon/human/user)
	// adjusted from /obj/item/wisp_lantern & /obj/item/wisp
	if (!mote)
		return // should really never happen

	//let's adjust the light power based on our skill, too
	var/skill_level = user.get_skill_level(attached_spell.associated_skill)
	var/mote_power = clamp(4 + (skill_level - 3), 4, 7) // every step above journeyman should get us 1 more tile of brightness
	mote.set_light_range(mote_power)
	if (mote.loc == src)
		user.visible_message(span_notice("[user] раскрывает ладонь и сосредотачивается..."), span_notice("Я раскрываю ладонь и сосредотачиваюсь на своей арканной силе..."))
		if (do_after(user, src.motespeed, target = user))
			mote.orbit(user, 1, TRUE, 0, 48, TRUE)
			return TRUE
		return FALSE
	else
		user.visible_message(	span_notice("[user] направляет [mote.name] обратно в ладонь и закрывает её, гася свет."), span_notice("Я направляю [mote.name] обратно в ладонь и закрываю её."))
		mote.forceMove(src)
		return TRUE

/obj/item/melee/touch_attack/prestidigitation/proc/create_spark(mob/living/carbon/human/user, atom/thing)
	// adjusted from /obj/item/flint
	if (world.time < spark_cd + sparkspeed)
		return FALSE
	spark_cd = world.time

	playsound(user, 'sound/foley/finger-snap.ogg', 100, FALSE)
	user.flash_fullscreen("whiteflash")
	flick("flintstrike", src)

	if (isturf(thing) || !user.Adjacent(thing))
		var/datum/effect_system/spark_spread/S = new()
		var/turf/front = get_step(user, user.dir)
		S.set_up(1, 1, front)
		S.start()
		user.visible_message(span_notice("[user] щёлкает пальцами, создавая искру!"), span_notice("Я вызываю крошечную искру щелчком пальцев."))
	else
		thing.spark_act()
		user.visible_message(span_notice("[user] щёлкает пальцами, и искра устремляется к [thing]!"), span_notice("Я вызываю крошечную искру и направляю её к [thing]."))

	return TRUE

/obj/item/melee/touch_attack/prestidigitation/proc/clean_thing(atom/target, mob/living/carbon/human/user)
	// adjusted from /obj/item/soap in clown_items.dm, some duplication unfortunately (needed for flavor)

	// let's adjust the clean speed based on our skill level
	var/skill_level = user.get_skill_level(attached_spell.associated_skill)
	cleanspeed = initial(cleanspeed) - (skill_level * 3) // 3 cleanspeed per skill level, from 35 down to a maximum of 17 (pretty quick)

	if (istype(target, /obj/structure/roguewindow))
		user.visible_message(span_notice("[user] жестикулирует в сторону [target.name]. Крошечные частицы арканной силы танцуют по его поверхности..."), span_notice("Я начинаю чистить [target.name] своей арканной силой..."))
		if (do_after(user, src.cleanspeed, target = target))
			wash_atom(target,CLEAN_MEDIUM)
			to_chat(user, span_notice("Я делаю [target.name] чистым."))
			return TRUE
		return FALSE
	else if (istype(target, /obj/effect/decal/cleanable))
		user.visible_message(span_notice("[user] жестикулирует в сторону [target.name]. Арканная сила медленно стирает его..."), span_notice("Я начинаю стирать [target.name] своей арканной силой..."))
		if (do_after(user, src.cleanspeed, target = target))
			wash_atom(get_turf(target),CLEAN_MEDIUM)
			to_chat(user, span_notice("Я устраняю [target.name] своей маной."))
			return TRUE
		return FALSE
	else
		user.visible_message(span_notice("[user] жестикулирует в сторону [target.name]. Крошечные частицы арканной силы омывают [target.p_them()]..."), span_notice("Я начинаю чистить [target.name] своей арканной силой..."))
		if (do_after(user, src.cleanspeed, target = target))
			wash_atom(target,CLEAN_MEDIUM)
			to_chat(user, span_notice("Я делаю [target.name] чистым."))
			return TRUE
		return FALSE

/obj/item/melee/touch_attack/prestidigitation/proc/gather_thing(atom/target, mob/living/carbon/human/user)

	var/skill_level = user.get_skill_level(attached_spell.associated_skill)
	gatherspeed = initial(gatherspeed) - (skill_level * 3) // 3 cleanspeed per skill level, from 35 down to a maximum of 17 (pretty quick)
	var/turf/Turf = get_turf(target)
	if (istype(target, /obj/structure/well/fountain/mana))
		if (do_after(user, src.gatherspeed, target = target))
			to_chat(user, span_notice("Я формирую жидкую ману в [target.name] своей арканной силой, кристаллизуя её!"))
			new /obj/item/magic/manacrystal(Turf)
			return TRUE
		return FALSE
	if (istype(target, /turf/open/lava))
		if (do_after(user, src.gatherspeed, target = target))
			to_chat(user, span_notice("Я формирую горсть жидкой лавы своей арканной силой, быстро затвердевая её!"))
			new /obj/item/magic/obsidian(user.loc)
			return TRUE
		return FALSE

// Intents for prestidigitation
// Intents for prestidigitation

/obj/effect/wisp/prestidigitation
	name = "малый магический огонёк"
	desc = "Крошечное проявление арканной силы, используемое для освещения."
	pixel_x = 20
	light_outer_range =  4
	light_color = "#3FBAFD"
	light_system = MOVABLE_LIGHT
	icon = 'icons/roguetown/items/lighting.dmi'
	icon_state = "wisp"

#undef PRESTI_CLEAN
#undef PRESTI_SPARK
#undef PRESTI_MOTE
