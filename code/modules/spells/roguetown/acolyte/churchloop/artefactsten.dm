//chat gpt 5 narrator mode explain in 5 paragraphs why should anime protagonist sparkle dog with blue custom fart cloud role spawn with it
//you cannot get it why cant they have it my John Sniffa my fursona must have it
#define MALUM_ALLOWED_INGOTS list( \
	/obj/item/ingot/steel, \
	/obj/item/ingot/iron, \
	/obj/item/ingot/aalloy, \
	/obj/item/ingot/purifiedaalloy \
)

var/global/list/EORA_PARTNERS_BY_ID = list()
var/global/list/EORA_ID_NAME = list()

GLOBAL_LIST_INIT(generated_reliquary_codes, list())

#define RELIQUARY_CODE_LEN 4

/proc/generate_reliquary_code()
	var/tries = 0
	while(tries < 200)
		var/code = ""
		for(var/i = 1, i <= RELIQUARY_CODE_LEN, i++)
			code += "[rand(0,9)]"
		if(!(code in GLOB.generated_reliquary_codes))
			GLOB.generated_reliquary_codes += code
			return code
		tries++

	for(var/n = 0, n < 10000, n++)
		var/code2 = "[n]"
		while(length(code2) < RELIQUARY_CODE_LEN)
			code2 = "0[code2]"
		if(!(code2 in GLOB.generated_reliquary_codes))
			GLOB.generated_reliquary_codes += code2
			return code2

	return "0000"

/*============
Malum's tool
============*/
/*
- A universal hammer-tool that can do everything. Blacksmiths will kill you for this.
*/

/obj/item/rogueweapon/hammer/artefact/malum
	force = 21
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/forge,  /datum/intent/smelt)
	name = "Инструмент Малума"
	desc = "Благословенный молот, кующий судьбу по своему усмотрению."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "malumartefact"
	sharpness = IS_BLUNT
	//dropshrink = 0.8
	wlength = 10
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ash
	grid_width = 32
	grid_height = 64


/datum/intent/forge //FUCK AUTISTIC ANVIL SMASH allows you to create 1 bar items on the spot
    name = "forge"
    icon_state = "inforge"
    chargetime = 0
    noaa = TRUE
    candodge = FALSE
    canparry = FALSE
    misscost = 0
    no_attack = TRUE
    releasedrain = 0
    blade_class = BCLASS_PUNCH


/datum/intent/smelt // Malum's tool intent ok allows you to smelt items on the spot if they made of IRON STEEL and that shitty metal from skeletons
	name = "smelt"
	icon_state = "insmelt"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	canparry = FALSE
	misscost = 0
	no_attack = TRUE
	releasedrain = 0
	blade_class = BCLASS_PUNCH


//shit made helper

/proc/_malum_recipe_requires_extras(datum/anvil_recipe/R)
	if(!R) return FALSE
	if(ispath(R:needed_item)) return TRUE
	var/ai = R:additional_items
	if(ispath(ai)) return TRUE
	if(islist(ai) && length(ai) > 0) return TRUE
	return FALSE

/obj/item/rogueweapon/hammer/artefact/malum/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag || !user || !user.used_intent)
		return

//only one bar items you retard
	if(istype(user.used_intent, /datum/intent/forge))
		if(istype(target, /obj/machinery/anvil))
			var/obj/machinery/anvil/A = target
			if(A.hingot && istype(A.hingot, /obj/item/ingot))
				var/obj/item/ingot/ing_on_anvil = A.hingot
				A.hingot = null
				A.update_icon()
				ing_on_anvil.forceMove(src)
				forge_open_category_menu(user, ing_on_anvil)
				return
			to_chat(user, span_warning("Поместите слиток на наковальню или кликните по нему напрямую."))
			return

		if(!isitem(target))
			to_chat(user, span_warning("Мне нужно кликнуть по слитку для ковки."))
			return
		var/obj/item/ingot/ing = target
		if(!istype(ing, /obj/item/ingot))
			to_chat(user, span_warning("[target] не является слитком."))
			return

		ing.forceMove(src)
		forge_open_category_menu(user, ing)
		return

	if(istype(user.used_intent, /datum/intent/smelt))
		if(!isitem(target))
			to_chat(user, span_warning("Мне нужен предмет для переплавки."))
			return

		var/obj/item/I2 = target
		var/ok_surface = isturf(I2.loc) || istype(I2.loc, /obj/machinery/anvil)
		if(!ok_surface)
			to_chat(user, span_warning("Сначала положите [I2] на землю или наковальню."))
			return

		var/smeltpath = I2.smeltresult
		if(!ispath(smeltpath))
			to_chat(user, span_warning("[I2] невозможно переплавить."))
			return

		var/list/allowed = list(
			/obj/item/ingot/steel,
			/obj/item/ingot/iron,
			/obj/item/ingot/aalloy,
			/obj/item/ingot/purifiedaalloy
		)
		if(!(smeltpath in allowed))
			to_chat(user, span_warning("[I2] не подходит для переплавки этим молотом."))
			return

		var/yield = 1

		user.visible_message(
			span_info("[user] начинает переплавлять [I2] с помощью [src]."),
			span_info("Я начинаю переплавлять [I2]...")
		)
		playsound(I2, 'sound/items/bsmith3.ogg', 70, FALSE)

		if(!do_after(user, 10 SECONDS, target = I2))
			to_chat(user, span_warning("Переплавка прервана!"))
			return
		if(QDELETED(I2) || (!isturf(I2.loc) && !istype(I2.loc, /obj/machinery/anvil)))
			to_chat(user, span_warning("Переплавка не может быть завершена."))
			return

		var/turf/T = get_turf(I2)
		qdel(I2)

		var/obj/item/last_ingot = null
		for(var/i = 1, i <= yield, i++)
			last_ingot = new smeltpath(T)

		user.visible_message(
			span_notice("[user] завершает переплавку, получая [yield] [last_ingot ? last_ingot.name : "слиток"](ов)."),
			span_notice("Переплавка завершена.")
		)
		playsound(T, 'sound/items/bsmith4.ogg', 70, FALSE)
		user.changeNext_move(CLICK_CD_INTENTCAP)
		return

// CRAFT STARTTS HERE //

/obj/item/rogueweapon/hammer/artefact/malum/proc/forge_open_category_menu(mob/user, obj/item/ingot/ing)
	var/list/by_cat = list(
		"Броня"    = list(),
		"Оружие"   = list(),
		"Инструменты" = list(),
		"Ценности" = list()
	)

	for(var/datum/anvil_recipe/R in GLOB.anvil_recipes)
		if(!ispath(R.req_bar) || !istype(ing, R.req_bar))
			continue

		if(_malum_recipe_requires_extras(R))
			continue

		if(!ispath(R.created_item))
			continue

		var/name = R.name ? R.name : "[R.created_item]"
		if(istype(R, /datum/anvil_recipe/armor))
			by_cat["Броня"][name] = R.type
		else if(istype(R, /datum/anvil_recipe/weapons))
			by_cat["Оружие"][name] = R.type
		else if(istype(R, /datum/anvil_recipe/tools))
			by_cat["Инструменты"][name] = R.type
		else if(istype(R, /datum/anvil_recipe/valuables))
			by_cat["Ценности"][name] = R.type

	var/total = 0
	for(var/k in by_cat)
		total += length(by_cat[k])

	if(total <= 0)
		ing.forceMove(get_turf(src))
		to_chat(user, span_warning("Нет однослитковых рецептов для [ing.name]."))
		return

	var/contents = "<center><b>Инструмент Малума ——— Мгновенная ковка</b><br>Расходуется: [ing.name]</center><hr>"

	for(var/section in list("Броня","Оружие","Инструменты","Ценности"))
		var/list/map = by_cat[section]
		if(!length(map))
			continue

		contents += "<b>[section]</b><br>"

		var/list/names = list()
		for(var/n in map)
			names += n
		names = sortList(names)

		for(var/n in names)
			var/rec_type = map[n]
			var/href_make = "?src=[REF(src)];forgemake=[rec_type];ing=[REF(ing)]"
			contents += "<a href='[href_make]'>[n]</a><br>"

		contents += "<br>"

	var/datum/browser/popup = new(user, "MALUMFORGE", "", 460, 560)
	popup.set_content(contents)
	popup.open()

/obj/item/rogueweapon/hammer/artefact/malum/proc/forge_do_craft(mob/user, obj/item/ingot/ing, rec_type)
	if(!istype(ing) || QDELETED(ing))
		to_chat(user, span_warning("Куда делся слиток?"))
		return
	if(!ispath(rec_type, /datum/anvil_recipe))
		to_chat(user, span_warning("Этот рецепт сломан."))
		return

	var/datum/anvil_recipe/R = new rec_type

	if(!ispath(R.req_bar) || !istype(ing, R.req_bar) || _malum_recipe_requires_extras(R) || !ispath(R.created_item))
		qdel(R)
		to_chat(user, span_warning("Этот рецепт нельзя сделать из [ing]."))
		return

	user.visible_message(
		span_info("[user] начинает придавать форму [ing] с помощью [src]."),
		span_info("Я начинаю ковать из [ing]...")
	)
	playsound(ing, 'sound/items/bsmith3.ogg', 70, FALSE)

	if(!do_after(user, 10 SECONDS, target = ing))
		to_chat(user, span_warning("Ковка прервана!"))
		qdel(R)
		return
	if(QDELETED(ing) || !ing.loc)
		to_chat(user, span_warning("Слиток больше не пригоден."))
		qdel(R)
		return

	var/turf/T = get_turf(ing)
	qdel(ing)
	var/obj/item/product = new R.created_item(T)

	user.visible_message(
		span_notice("[user] завершает ковку, создавая [product]."),
		span_notice("Я заканчиваю ковку.")
	)
	playsound(T, 'sound/items/bsmith4.ogg', 70, FALSE)
	user.changeNext_move(CLICK_CD_INTENTCAP)
	qdel(R)

/obj/item/rogueweapon/hammer/artefact/malum/Topic(href, href_list)
	. = ..()
	if(!usr || !usr.canUseTopic(src, BE_CLOSE))
		return


	if(href_list["forgemake"])
		var/obj/item/ingot/ing = locate(href_list["ing"])
		var/rec_type = text2path(href_list["forgemake"])
		if(ing && ispath(rec_type, /datum/anvil_recipe))
			forge_do_craft(usr, ing, rec_type)
		return

/*============
Necra's Censer (by ARefrigerator)
============*/
/*
- Cleans in an area around the person after
  a do_after call, infinite uses. Should aid
  the morticians with cleaning the town.
*/
/obj/item/artefact/necra_censer
	name = "Кадило Некры"
	desc = "Маленькое бронзовое кадило, испускающее потусторонний туман."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "necraartefact"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	item_state = "necra_censer"
	throw_speed = 3
	throw_range = 7
	throwforce = 4
	//hitsound = 'sound/blank.ogg'
	sellprice = 10 // Shouldn't be worth a lot in world
	dropshrink = 0.6
	grid_width = 32
	grid_height = 64

/obj/item/artefact/necra_censer/attack_self(mob/user)
	if(do_after(user, 3 SECONDS))
		playsound(user,  'sound/items/censer_use.ogg', 100)
		user.visible_message(span_info("[user.name] поднимает руку и слегка раскачивает цепочку [name]."))
		var/datum/effect_system/smoke_spread/smoke/necra_censer/S = new
		S.set_up(3, user.loc)
		S.start()

/*=========================================
  Dendor's Endless Hose - additive mode
  Click soil to add ±100 water/nutrition,
  optional bless, and growth modes incl. KILL
=========================================*/

/obj/item/artefact/dendor_hose //bless your tree with its piss
	name = "Бесконечный шланг Дендора"
	desc = "Живое деревянное приспособление, подчиняющее почву воле Отца Древ. Кликните по почве, чтобы добавить ±100 воды/питания, благословить или повлиять на рост."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "dendorartefact"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	grid_width = 32
	grid_height = 64

	//  -1 = -100, 0 = off, 1 = +100
	var/water_step_state = 1
	var/nutri_step_state = 1

	var/auto_bless = TRUE

	// its "none" | "mature" | "produce" | "kill", retard (produce is hidden)
	var/growth_mode = "none"

/obj/item/artefact/dendor_hose/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'><b>Настройки добавления</b></span><br>"
	. += "Вода: <b>[hose_state_text(water_step_state)]</b> за клик<br>"
	. += "Питание: <b>[hose_state_text(nutri_step_state)]</b> за клик<br>"
	. += "Благословение: <b>[auto_bless ? "ВКЛ" : "ВЫКЛ"]</b><br>"
	. += "Рост: <b>[uppertext(growth_mode)]</b><br>"
	. += "<span class='info'>Используйте в руке для настройки.</span>"

/obj/item/artefact/dendor_hose/proc/hose_state_text(state)
	if(state == 1)  return "+100"
	if(state == -1) return "-100"
	return "ВЫКЛ"

/obj/item/artefact/dendor_hose/attack_self(mob/user)
	open_config_ui(user)

/obj/item/artefact/dendor_hose/proc/open_config_ui(mob/user)
	var/contents = "<center><b> — Настройки Бесконечного шланга Дендора — </b></center><hr>"

	contents += "<b>Изменение воды за клик</b><br>"
	contents += "<a href='?src=[REF(src)];cyclestep=water'>[hose_state_text(water_step_state)]</a><br><br>"

	contents += "<b>Изменение питания за клик</b><br>"
	contents += "<a href='?src=[REF(src)];cyclestep=nutri'>[hose_state_text(nutri_step_state)]</a><br><br>"

	contents += "<b>Благословение</b>: <a href='?src=[REF(src)];toggle=bless'>[auto_bless ? "ВКЛ" : "ВЫКЛ"]</a><br><br>"

	contents += "<b>Рост</b><br>"
	contents += "Режим: "
	var/list/modes = list("none","mature","kill") //produce is hidden, sorry my man
	for(var/m in modes)
		if(m == growth_mode)
			contents += " <b>[uppertext(m)]</b> "
		else
			contents += " <a href='?src=[REF(src)];mode=[m]'>[uppertext(m)]</a> "
	contents += "<hr><center><i>Кликните по почве для применения.</i></center>"

	var/datum/browser/popup = new(user, "DENDOR_HOSE", "", 420, 340)
	popup.set_content(contents)
	popup.open()

/obj/item/artefact/dendor_hose/Topic(href, href_list)
	. = ..()
	if(!usr || !usr.canUseTopic(src, BE_CLOSE))
		return

	// im going to keep a comment here because i know some of you stupid retards that going to numberfuck everything +1 -> 0 -> -1 -> +1
	if(href_list["cyclestep"])
		var/what = href_list["cyclestep"]
		if(what == "water")
			if(water_step_state == 1) water_step_state = 0
			else if(water_step_state == 0) water_step_state = -1
			else water_step_state = 1
		else if(what == "nutri")
			if(nutri_step_state == 1) nutri_step_state = 0
			else if(nutri_step_state == 0) nutri_step_state = -1
			else nutri_step_state = 1
		open_config_ui(usr)
		return

	if(href_list["toggle"] == "bless")
		auto_bless = !auto_bless
		open_config_ui(usr)
		return

	if(href_list["mode"])
		var/m = lowertext(href_list["mode"])
		if(m in list("none","mature","produce","kill"))
			growth_mode = m
		open_config_ui(usr)
		return

/obj/item/artefact/dendor_hose/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag || !istype(target, /obj/structure/soil))
		return
	var/obj/structure/soil/S = target
	apply_additives_to_soil(S, user)

/obj/item/artefact/dendor_hose/proc/apply_additives_to_soil(obj/structure/soil/S, mob/user)
	var/w_delta = water_step_state * 100
	if(w_delta)
		S.adjust_water(w_delta)

	var/n_delta = nutri_step_state * 100
	if(n_delta)
		S.adjust_nutrition(n_delta)

	if(auto_bless)
		S.bless_soil()

	if(S.plant)
		switch(growth_mode)
			if("mature")
				if(!S.plant_dead && !S.matured)
					var/miss = max(S.plant.maturation_time - S.growth_time, 0)
					if(miss > 0)
						S.add_growth(miss)
			if("produce") //mayhaps too op will see so its hidden you will be punished for html
				if(!S.plant_dead)
					if(!S.matured)
						var/miss2 = max(S.plant.maturation_time - S.growth_time, 0)
						if(miss2 > 0)
							S.add_growth(miss2)
					if(!S.produce_ready)
						var/miss_prod = max(S.plant.produce_time - S.produce_time, 0)
						if(miss_prod > 0)
							S.add_growth(miss_prod)
			if("kill")
				S.plant_dead = TRUE
				S.plant_health = 0
				S.produce_ready = FALSE
				S.update_icon()
				user.visible_message(
					span_warning("[user] иссушает урожай мрачным указом."),
					span_warning("Жизнь угасает.")
				)

	if(growth_mode != "kill")
		user.visible_message(
			span_green("[user] ухаживает за почвой Бесконечным шлангом."),
			span_good("Почва подчиняется моей воле.")
		)
	playsound(S, 'sound/foley/waterwash (1).ogg', 80, FALSE)

/*==============================
  Noc's Phylactery
  - Binds to a target by sampling blood (30s) but honestly its just scan_process
  - Use in hand: shows target & your XYZ + distance
==============================*/

/obj/item/artefact/noc_phylactery
	name = "Филактерия Нок"
	desc = "Лунная филактерия Нок: хрустальный сосуд, связывающий каплю крови с путём под взором луны. В древние ночи маги использовали такие сосуды, чтобы выслеживать отступников, злоупотребивших или укравших арканное знание."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "nocartefact"
	w_class = WEIGHT_CLASS_TINY
	var/bound = FALSE
	var/target_ref = null
	var/target_name = null
	var/bound_time = 0
	var/binding = FALSE
	var/pending_target_name = null

/obj/item/artefact/noc_phylactery/examine(mob/user)
	. = ..()
	if(bound)
		. += "<hr><span class='notice'>Она мягко гудит — внутри связана чья-то кровь.</span><br>"
		. += "Привязана к: <b>[target_name ? target_name : "неизвестный"]</b><br>"
	else if(binding)
		. += "<hr><span class='warning'>Стекло теплеет в вашей руке — идёт настройка...</span><br>"
	else
		. += "<hr><span class='info'>Используйте на живом существе, чтобы настроить по крови (30 секунд).</span><br>"


/obj/item/artefact/noc_phylactery/attack_self(mob/user)
	if(!bound)
		to_chat(user, span_info("Филактерия инертна. Сначала привяжите её к кому-нибудь."))
		return

	var/mob/living/T = get_target_mob()
	var/turf/ut = get_turf(user)
	if(!ut)
		to_chat(user, span_warning("Я не чувствую собственной опоры."))
		return

	var/tx = "?"
	var/ty = "?"
	var/tz = "?"
	var/distance_tiles = -1

	if(T && !QDELETED(T))
		var/turf/tt = get_turf(T)
		if(tt)
			tx = "[tt.x]"
			ty = "[tt.y]"
			tz = "[tt.z]"
			distance_tiles = get_dist(ut, tt)
		else
			to_chat(user, span_warning("Филактерия находит кровь, но не землю под ними..."))
	else
		to_chat(user, span_warning("Образец крови кажется тусклым — возможно, сосуд исчез."))

	to_chat(user, span_notice("— Филактерия Нок —"))
	to_chat(user, span_info("Цель [target_name ? target_name : "неизвестный"]: X=[tx], Y=[ty], Z=[tz]"))
	to_chat(user, span_info("Вы: X=[ut.x], Y=[ut.y], Z=[ut.z]"))
	if(distance_tiles >= 0)
		to_chat(user, span_info("Примерное расстояние: [distance_tiles] тайлов"))
	playsound(user, 'sound/magic/churn.ogg', 50, FALSE)

/obj/item/artefact/noc_phylactery/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(binding)
		to_chat(user, span_warning("Она уже берёт образец..."))
		return
	if(!isliving(target))
		to_chat(user, span_warning("Для привязки нужна живая кровь."))
		return

	var/mob/living/L = target
	start_binding(L, user)

/obj/item/artefact/noc_phylactery/proc/start_binding(mob/living/L, mob/user)
	if(binding)
		return
	binding = TRUE

	pending_target_name = get_true_name(L) //John Unknown Unknown

	user.visible_message(
		span_info("[user] прижимает филактерию к [pending_target_name]; тусклые руны загораются на филиграни."),
		span_notice("Я начинаю настройку, беря образец крови у [pending_target_name]...")
	)
	playsound(user, 'sound/magic/churn.ogg', 60, FALSE)

	if(!do_after(user, 30 SECONDS, target = L))
		to_chat(user, span_warning("Настройка прервана. Стекло остывает."))
		binding = FALSE
		pending_target_name = null
		return

	if(QDELETED(src) || QDELETED(L) || QDELETED(user))
		binding = FALSE
		pending_target_name = null
		return
	if(get_dist(user, L) > 1) // yes im aware but no Adjacent()
		to_chat(user, span_warning("Субъект ускользнул в последний момент."))
		binding = FALSE
		pending_target_name = null
		return

	var/success = bind_to_target(L, pending_target_name)
	if(success)
		user.visible_message(
			span_notice("Алая нить вьётся в кристалл; филактерия мягко гудит."),
			span_good("Свершилось. Кровь помнит.")
		)
		playsound(user, 'sound/magic/whiteflame.ogg', 60, FALSE)
	else
		to_chat(user, span_warning("Чары шипят и не могут удержаться."))
	binding = FALSE
	pending_target_name = null

/obj/item/artefact/noc_phylactery/proc/bind_to_target(mob/living/L, cached_name = null)
	target_ref = REF(L)
	target_name = cached_name ? cached_name : get_true_name(L)
	bound_time = world.time
	bound = TRUE
	return TRUE

/obj/item/artefact/noc_phylactery/proc/get_target_mob()
	if(!target_ref)
		return null
	var/mob/living/L = locate(target_ref)
	return L

/obj/item/artefact/noc_phylactery/proc/get_true_name(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		return H.real_name ? H.real_name : (H.name ? H.name : "кто-то")
	return L.name ? L.name : "кто-то"

/obj/item/artefact/noc_phylactery/attack(mob/living/M, mob/user)
	if(isliving(M))
		start_binding(M, user)
	return


/*========================================
  Eora's Heart
  -----------------------------------------
  • Use on self: shows your unique partners (names) this week
  • Use on target: shows their unique partners (names) this week
========================================*/

/obj/item/artefact/eora_heart
	name = "Сердце Эоры"
	desc = "Бархатное сердце, посвящённое Эоре. Оно помнит имена возникших уз."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "eoraartefact"
	w_class = WEIGHT_CLASS_TINY

/obj/item/artefact/eora_heart/examine(mob/user)
	. = ..()
	. += "<hr><span class='info'>Используйте в руке: показывает ваших сексуальных партнёров за этот раунд.</span><br>"
	. += "<span class='info'>Используйте на игроке: показывает их уникальных сексуальных партнёров за этот раунд.</span><br>"

/obj/item/artefact/eora_heart/attack_self(mob/user)
	if(world.time + 300)
		to_chat(user, span_warning("Сердце молчит. Дайте ему мгновение."))
		return
	last_used = world.time

	if(!ishuman(user) || !user.client)
		to_chat(user, span_warning("Сердцу нужен живой игрок для ответа."))
		return

	var/mob/living/carbon/human/H = user
	var/cnt = eora_get_partner_count(H)
	var/list/names = eora_get_partner_names(H)

	to_chat(user, span_notice("Шёпот Эоры: У вас <b>[cnt]</b> уникальных партнёров в этом раунде."))
	if(names && names.len)
		to_chat(user, "<span class='info'>Имена:</span>")
		for(var/N in names)
			to_chat(user, " • [html_encode(N)]")
	else
		to_chat(user, "<span class='info'>Нет имён для отображения.</span>")

	playsound(user, 'sound/magic/whiteflame.ogg', 50, FALSE)

/obj/item/artefact/eora_heart/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag) return

	if(world.time < last_used + 300)
		to_chat(user, span_warning("Сердце молчит. Дайте ему мгновение."))
		return
	last_used = world.time

	if(!isliving(target))
		to_chat(user, span_warning("Сердце отвечает только живым."))
		return
	if(!ishuman(target) || !target:client)
		to_chat(user, span_warning("Сердце считает только игроков."))
		return

	var/mob/living/carbon/human/H = target
	var/cnt = eora_get_partner_count(H)
	var/list/names = eora_get_partner_names(H)

	to_chat(user, span_notice("Шёпот Эоры: [html_encode(H.name)] имеет <b>[cnt]</b> уникальных партнёров в этом раунде."))
	if(names && names.len)
		to_chat(user, "<span class='info'>Имена:</span>")
		for(var/N in names)
			to_chat(user, " • [html_encode(N)]")
	else
		to_chat(user, "<span class='info'>Нет имён для отображения.</span>")

	playsound(user, 'sound/magic/whiteflame.ogg', 50, FALSE)


/proc/eora_get_round_id(mob/living/carbon/human/H)
	if(!H) return null
	if(H.mind) return REF(H.mind)
	return REF(H)

/proc/eora_update_name(mob/living/carbon/human/H)
	if(!H) return
	var/id = eora_get_round_id(H)
	if(!id) return
	var/display = H.real_name ? H.real_name : H.name
	if(display && length(display))
		EORA_ID_NAME[id] = "[display]"

/proc/eora_lookup_name_by_id(id)
	if(!id) return "Неизвестный"

	if(islist(GLOB?.human_list))
		for(var/mob/living/carbon/human/H in GLOB.human_list)
			if(eora_get_round_id(H) == id)
				return H.real_name ? H.real_name : H.name
	else
		for(var/mob/living/carbon/human/H in world)
			if(eora_get_round_id(H) == id)
				return H.real_name ? H.real_name : H.name

	if(EORA_ID_NAME[id])
		return "[EORA_ID_NAME[id]]"

	return "Неизвестный"

/proc/eora_register_consensual_pair(mob/living/carbon/human/A, mob/living/carbon/human/B)
	if(!A || !B) return
	if(!A.client || !B.client) return
	if(A == B) return

	var/idA = eora_get_round_id(A)
	var/idB = eora_get_round_id(B)
	if(!idA || !idB) return

	if(!EORA_PARTNERS_BY_ID[idA]) EORA_PARTNERS_BY_ID[idA] = list()
	if(!EORA_PARTNERS_BY_ID[idB]) EORA_PARTNERS_BY_ID[idB] = list()

	var/list/LA = EORA_PARTNERS_BY_ID[idA]
	var/list/LB = EORA_PARTNERS_BY_ID[idB]

	LA[idB] = TRUE
	LB[idA] = TRUE

	eora_update_name(A)
	eora_update_name(B)

/proc/eora_get_partner_count(mob/living/carbon/human/H)
	if(!H || !H.client) return 0
	var/id = eora_get_round_id(H)
	if(!id) return 0
	var/list/L = EORA_PARTNERS_BY_ID[id]
	if(!islist(L)) return 0
	var/c = 0
	for(var/_ in L) c++
	return c

/proc/eora_get_partner_names(mob/living/carbon/human/H)
	var/list/names = list()
	if(!H || !H.client) return names
	var/id = eora_get_round_id(H)
	if(!id) return names

	var/list/L = EORA_PARTNERS_BY_ID[id]
	if(!islist(L)) return names

	for(var/pid in L)
		var/n = eora_lookup_name_by_id(pid)
		if(n && !names.Find(n))
			names += n

	return sortList(names)

/*=================================
  PESTRA PERSTRA
======================================*/

// STAPLES

/obj/item/surgery_staple
	name = "хирургическая скоба"
	desc = "Крошечная хирургическая скоба, удерживающая ткани."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "staples"
	item_flags = ABSTRACT
	sharpness = IS_BLUNT
	anchored = TRUE
	var/tmp/_pending_delete = FALSE

/obj/item/surgery_staple/Moved(oldloc, dir, forced = FALSE)
	. = ..()
	if(_pending_delete)
		return
	if(isnull(loc))
		return
	if(!istype(loc, /obj/item/bodypart))
		_pending_delete = TRUE
		qdel(src)

/obj/item/surgery_staple/attack_hand(mob/living/user)
	if(!_pending_delete)
		_pending_delete = TRUE
		qdel(src)
	return

/obj/item/surgery_staple/hemostat
	name = "гемостатическая скоба"
	tool_behaviour = TOOL_HEMOSTAT

/obj/item/surgery_staple/retractor
	name = "расширительная скоба"
	tool_behaviour = TOOL_RETRACTOR


// multitool

/obj/item/rogueweapon/surgery/multitool
	name = "хирургический мультитул"
	desc = "Компактное благословенное устройство, раскладывающееся во всё, что нужно хирургу."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "scapelpestra"
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	force = 10
	throwforce = 10
	wdefense = 2
	wbalance = WBALANCE_SWIFT
	max_blade_int = 100
	max_integrity = 200
	thrown_bclass = BCLASS_CUT
	associated_skill = /datum/skill/misc/medicine
	item_flags = SURGICAL_TOOL
	grid_width = 32
	grid_height = 64

	var/current_mode = "scalpel"

	var/list/_modes_order = list("scalpel","saw","hemostat","retractor","bonesetter","suture","cautery")

	var/list/_mode_params = list(
		"scalpel" = list(
			"tool_behaviour" = TOOL_SCALPEL,
			"sharpness" = IS_SHARP,
			"damtype" = BRUTE,
			"force" = 12,
			"intents" = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust),
			"icon_state" = "scalpelpestra"
		),
		"saw" = list(
			"tool_behaviour" = TOOL_SAW,
			"sharpness" = IS_SHARP,
			"damtype" = BRUTE,
			"force" = 16,
			"intents" = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver),
			"icon_state" = "sawpestra"
		),
		"hemostat" = list(
			"tool_behaviour" = TOOL_HEMOSTAT,
			"sharpness" = IS_BLUNT,
			"damtype" = BRUTE,
			"force" = 6,
			"intents" = list(/datum/intent/use),
			"icon_state" = "hemostatpestra"
		),
		"retractor" = list(
			"tool_behaviour" = TOOL_RETRACTOR,
			"sharpness" = IS_BLUNT,
			"damtype" = BRUTE,
			"force" = 6,
			"intents" = list(/datum/intent/use),
			"icon_state" = "retractorpestra"
		),
		"bonesetter" = list(
			"tool_behaviour" = TOOL_BONESETTER,
			"sharpness" = IS_BLUNT,
			"damtype" = BRUTE,
			"force" = 8,
			"intents" = list(/datum/intent/use),
			"icon_state" = "retractorpestra"
		),
		"suture" = list(
			"tool_behaviour" = TOOL_SUTURE,
			"sharpness" = IS_BLUNT,
			"damtype" = BRUTE,
			"force" = 6,
			"intents" = list(/datum/intent/use),
			"icon_state" = "needlepestra"
		),
		"cautery" = list(
			"tool_behaviour" = TOOL_CAUTERY,
			"sharpness" = IS_BLUNT,
			"damtype" = BURN,
			"force" = 8,
			"intents" = list(/datum/intent/use, /datum/intent/mace/strike, /datum/intent/mace/smash),
			"icon_state" = "cauterypestra"
		)
	)


/proc/_is_use_intent(mob/living/user)
	return istype(user?.a_intent, /datum/intent/use)

/proc/_get_target_bodypart(mob/living/carbon/human/H, mob/living/user)
	if(!H || !user) return null
	return H.get_bodypart(check_zone(user.zone_selected))


/obj/item/rogueweapon/surgery/multitool/Initialize()
	. = ..()
	_apply_mode(current_mode, TRUE)

/obj/item/rogueweapon/surgery/multitool/attack_self(mob/user)
	_cycle_mode(user)
	return TRUE

/obj/item/rogueweapon/surgery/multitool/AltClick(mob/living/user)
	_cycle_mode(user)

/obj/item/rogueweapon/surgery/multitool/proc/_apply_mode(mode as text, silent = FALSE)
	if(!(mode in _modes_order)) return
	current_mode = mode

	var/list/P = _mode_params[mode]
	if(!islist(P)) return

	force = P["force"]
	sharpness = P["sharpness"]
	damtype = P["damtype"]
	possible_item_intents = P["intents"]
	icon_state = P["icon_state"]
	tool_behaviour = P["tool_behaviour"]

	update_icon()
	if(!silent)
		playsound(src, 'sound/foley/equip/swordsmall2.ogg', 50, FALSE)

/obj/item/rogueweapon/surgery/multitool/proc/_cycle_mode(mob/user)
	var/i = _modes_order.Find(current_mode) || 0
	i++
	if(i > _modes_order.len) i = 1
	_apply_mode(_modes_order[i])
	if(user) to_chat(user, span_notice("Режим мультитула: [uppertext(current_mode)]."))

/obj/item/rogueweapon/surgery/multitool/get_temperature()
	if(current_mode == "cautery")
		return FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	return ..()

/obj/item/rogueweapon/surgery/multitool/pre_attack(atom/A, mob/living/user, params)
	if(!_is_use_intent(user) || !ishuman(A))
		return ..()

	var/mob/living/carbon/human/H = A
	var/obj/item/bodypart/part = _get_target_bodypart(H, user)
	if(!part) return TRUE

	if(current_mode == "hemostat" || current_mode == "retractor")
		if(!(part.get_surgery_flags() & SURGERY_INCISED))
			to_chat(user, span_warning("Сначала нужен разрез."))
			return TRUE

		if(_zone_has_same_staple(part))
			to_chat(user, span_info("Скобы уже установлены здесь."))
			return TRUE

		var/obj/item/surgery_staple/S
		if(current_mode == "hemostat")
			S = new /obj/item/surgery_staple/hemostat(get_turf(H))
		else
			S = new /obj/item/surgery_staple/retractor(get_turf(H))

		if(part.add_embedded_object(S, TRUE))
			if(current_mode == "hemostat")
				user.visible_message(
					span_info("[user] устанавливает гемостатические скобы в [part.name] [H]."),
					span_info("Я устанавливаю гемостатические скобы в [part.name] [H].")
				)
			else
				user.visible_message(
					span_info("[user] устанавливает расширительные скобы в [part.name] [H]."),
					span_info("Я устанавливаю расширительные скобы в [part.name] [H].")
				)
			playsound(H, 'sound/foley/equip/swordsmall2.ogg', 50, FALSE)
		else
			qdel(S)
		return TRUE

	return ..()

/obj/item/rogueweapon/surgery/multitool/proc/_zone_has_same_staple(obj/item/bodypart/part)
	if(!part) return FALSE
	for(var/obj/item/embedded as anything in part.embedded_objects)
		if(!istype(embedded, /obj/item/surgery_staple)) continue
		if(current_mode == "hemostat" && embedded.tool_behaviour == TOOL_HEMOSTAT)
			return TRUE
		if(current_mode == "retractor" && embedded.tool_behaviour == TOOL_RETRACTOR)
			return TRUE
	return FALSE



/*=========================================================
  RAVOX TRACE LENS
=========================================================*/

#define SAY_INFO(msg)  to_chat(user, span_info(msg))
#define SAY_WARN(msg)  to_chat(user, span_warning(msg))

/obj/item/artifact/ravox_lens
	name = "Линза следа Равокса"
	desc = "Линза бесстрашного бога, раскрывающая правду."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "ravoxartefact"
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	var/range = 8
	var/view_check = TRUE

/obj/item/artifact/ravox_lens/Initialize()
	. = ..()

/obj/item/artifact/ravox_lens/afterattack(atom/target, mob/living/user, params)
	. = ..()
	if(!target || !user)
		return FALSE
	if((get_dist(target, user) > range) || (!(target in view(range, user)) && view_check) || (loc != user))
		return FALSE

	playsound(src, 'sound/foley/equip/swordsmall2.ogg', 50, FALSE)
	_ravox_scan_and_report(target, user)
	return TRUE

/proc/_ravox_scan_and_report(atom/target, mob/living/user)
	var/list/species_counts = list()
	var/found = FALSE

	found |= _ravox_collect_from_atom(target, species_counts)

	if(isturf(target))
		for(var/obj/O in target)
			found |= _ravox_collect_from_atom(O, species_counts)

	if(!found || !length(species_counts))
		SAY_WARN("Взор Равокса не находит читаемых следов на [target].")
		return

	var/list/parts = list()
	for(var/race_name in species_counts)
		var/num = max(1, species_counts[race_name])
		parts += (num > 1) ? "[race_name] ([num])" : "[race_name]"
	SAY_INFO("Взор Равокса открывает: [english_list(parts)].")

/proc/_ravox_collect_from_atom(atom/A, list/species_counts)
	if(!A) return FALSE
	var/found = FALSE

	var/list/blood = A.return_blood_DNA()
	if(length(blood))
		found |= _ravox_add_from_dna_map(blood, species_counts)

	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		if(!H.gloves && H?.dna?.uni_identity)
			var/hash = md5(H.dna.uni_identity)
			var/r = _ravox_guess_species_by_hash(hash)
			_ravox_bump_species(species_counts, r); found = TRUE
	else if(!ismob(A))
		var/list/fps = A.return_fingerprints()
		if(length(fps))
			found |= _ravox_add_from_prints(fps, species_counts)

		if(A.reagents && A.reagents.reagent_list.len)
			for(var/datum/reagent/R in A.reagents.reagent_list)
				if(istype(R, /datum/reagent/blood))
					var/bdna = R.data["blood_DNA"]
					if(bdna)
						var/list/tmp = list(); tmp[bdna] = TRUE
						found |= _ravox_add_from_dna_map(tmp, species_counts)

	return found

/proc/_ravox_add_from_dna_map(list/dna_map, list/species_counts)
	if(!islist(dna_map) || !dna_map.len) return FALSE
	var/added = FALSE
	for(var/hash in dna_map)
		var/r = _ravox_guess_species_by_hash("[hash]")
		_ravox_bump_species(species_counts, r); added = TRUE
	return added

/proc/_ravox_add_from_prints(list/prints, list/species_counts)
	if(!islist(prints) || !prints.len) return FALSE
	var/added = FALSE
	for(var/thing in prints)
		var/hash = "[thing]"
		if(!length(hash)) continue
		var/r = _ravox_guess_species_by_hash(hash)
		_ravox_bump_species(species_counts, r); added = TRUE
	return added

/proc/_ravox_bump_species(list/species_counts, race_name)
	if(!race_name || !length(race_name)) race_name = "Неизвестный"
	species_counts[race_name] = (species_counts[race_name] || 0) + 1


/proc/_ravox_guess_species_by_hash(hash as text)
	if(!length(hash)) return "Неизвестный"
	for(var/mob/living/carbon/human/H in world)
		if(H?.dna?.uni_identity)
			var/fp = md5(H.dna.uni_identity)
			if(fp == hash)
				return _ravox_species_name(H)
	return "Неизвестный"


/proc/_ravox_species_name(mob/living/carbon/human/H)
	if(!H) return "Неизвестный"
	var/name = H.dna?.species?.name
	if(!name) name = H.dna?.species?.id
	if(!name) name = "Гуманоид"
	return "[name]"


/************************
/obj/item/artifact/fishingrod/abyssoid
 * Дроп только рыбы + не нужен bait.
 **************************************************/

/obj/item/fishingrod/abyssoid
    name = "Жезл Абиссора"
    desc = "Жезл, благословенный Абиссором. Ему не нужна наживка."
    icon = 'icons/roguetown/items/artefactsten.dmi'
    icon_state = "abyssorartefact"

    var/static/list/_abyssor_loot = list(
        /obj/item/reagent_containers/food/snacks/fish/cod       = 230,
        /obj/item/reagent_containers/food/snacks/fish/plaice    = 180,
        /obj/item/reagent_containers/food/snacks/fish/sole      = 250,
        /obj/item/reagent_containers/food/snacks/fish/angler    = 170,
        /obj/item/reagent_containers/food/snacks/fish/lobster   = 180,
        /obj/item/reagent_containers/food/snacks/fish/bass      = 230,
        /obj/item/reagent_containers/food/snacks/fish/clam      = 50,
        /obj/item/reagent_containers/food/snacks/fish/clownfish = 40,
    )

/obj/item/fishingrod/abyssoid/attackby(obj/item/I, mob/user, params)
    to_chat(user, span_notice("Этому жезлу не нужна наживка."))
    return

/obj/item/fishingrod/abyssoid/afterattack(obj/target, mob/user, proximity)
	if(user?.used_intent?.type == SPEAR_BASH)
		return ..()

	if(!check_allowed_items(target, target_self = 1))
		return ..()

	if(!proximity || !(target in range(user, 5)))
		return

	if(user.used_intent.type != ROD_CAST)
		return

	if(user.doing)
		to_chat(user, "<span class='warning'>Я должен стоять неподвижно, чтобы рыбачить.</span>")
		return

	var/sl = user.get_skill_level(/datum/skill/labor/fishing)
	var/ft = 120
	ft -= (sl * 20)
	ft = max(20, ft)

	user.visible_message("<span class='warning'>[user] забрасывает удочку!</span>",
	                     "<span class='notice'>Я забрасываю удочку.</span>")
	playsound(src.loc, 'sound/items/fishing_plouf.ogg', 100, TRUE)

	if(!do_after(user, ft, target = target))
		to_chat(user, "<span class='warning'>Я должен стоять неподвижно, чтобы рыбачить.</span>")
		update_icon()
		return

	var/mob/living/fisherman = user
	var/A = pickweight(_abyssor_loot)

	var/ow = 30 + (sl * 10)
	to_chat(user, "<span class='notice'>Что-то потянуло леску!</span>")
	playsound(src.loc, 'sound/items/fishing_plouf.ogg', 100, TRUE)

	do_after(user, ow, target = target)

	if(ismob(A))
		var/mob/M = A
		if(M.type in subtypesof(/mob/living/simple_animal/hostile))
			new M(target)
		else
			new M(user.loc)
		if(user?.mind)
			user.mind.add_sleep_experience(/datum/skill/labor/fishing, fisherman.STAINT*2)
	else
		new A(user.loc)
		to_chat(user, "<span class='notice'>Вываживай!</span>")
		if(user?.mind)
			user.mind.add_sleep_experience(/datum/skill/labor/fishing, round(fisherman.STAINT, 2), FALSE)
		record_featured_stat(FEATURED_STATS_FISHERS, fisherman)
		GLOB.scarlet_round_stats[STATS_FISH_CAUGHT]++

	playsound(src.loc, 'sound/items/Fish_out.ogg', 100, TRUE)

	user.changeNext_move(CLICK_CD_INTENTCAP)
	update_icon()
	return

/*******************************************
 * XYLIXSOID STUFF
 ***************************************************/

/datum/element/xylix_theft_mods
    var/chance_bonus_pct = 25
    var/range_bonus_tiles = 1
    var/xp_multiplier = 1.5

/datum/element/xylix_theft_mods/Attach(datum/target, chance_b = 15, range_b = 1, xp_mult_b = 1.5)
    . = ..()
    if(!ismob(target))
        return ELEMENT_INCOMPATIBLE
    chance_bonus_pct = chance_b
    range_bonus_tiles = range_b
    xp_multiplier = xp_mult_b
    RegisterSignal(target, "steal_mods_query", PROC_REF(_on_mods_query))
    RegisterSignal(target, "steal_xp_query",   PROC_REF(_on_xp_query))

/datum/element/xylix_theft_mods/Detach(datum/target)
    UnregisterSignal(target, list("steal_mods_query", "steal_xp_query"))
    return ..()

/datum/element/xylix_theft_mods/proc/_on_mods_query(datum/source, list/mods)
    SIGNAL_HANDLER
    if(!islist(mods)) return
    mods["chance_add"] = (mods["chance_add"] || 0) + chance_bonus_pct
    mods["range_add"]  = (mods["range_add"]  || 0) + range_bonus_tiles

/datum/element/xylix_theft_mods/proc/_on_xp_query(datum/source, list/xpmods, skill)
    SIGNAL_HANDLER
    if(!islist(xpmods)) return
    if(!ispath(skill)) return
    if(skill == /datum/skill/misc/stealing)
        var/m = xpmods["xp_mult"]
        if(!isnum(m)) m = 1
        xpmods["xp_mult"] = m * xp_multiplier


/************************
 * Gloves
 **************************************************/

/obj/item/clothing/gloves/xylix
    name = "Перчатки Ксиликса"
    desc = "Перчатки, предпочитаемые послушниками Ксиликса. Пальцы кажутся легче, досягаемость — дальше."
    icon = 'icons/roguetown/items/artefactsten.dmi'
    icon_state = "xylixartefact"
    slot_flags = ITEM_SLOT_GLOVES
    w_class = WEIGHT_CLASS_SMALL
    body_parts_covered = HANDS
    body_parts_inherent = HANDS
    sleeved = 'icons/roguetown/clothing/onmob/gloves.dmi'
    mob_overlay_icon = 'icons/roguetown/clothing/onmob/gloves.dmi'
    bloody_icon_state = "bloodyhands"
    sleevetype = "shirt"
    resistance_flags = FIRE_PROOF
    blocksound = SOFTHIT
    max_integrity = 300
    sellprice = 12
    blade_dulling = DULLING_BASHCHOP
    break_sound = 'sound/foley/cloth_rip.ogg'
    drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
    anvilrepair = null
    sewrepair = TRUE
    salvage_result = /obj/item/natural/fur
    var/mob/living/_buff_owner

/obj/item/clothing/gloves/xylix/equipped(mob/living/user, slot)
    . = ..()
    if(!isliving(user))
        return

    if(slot == SLOT_GLOVES)
        _buff_apply(user)
    else
        if(_buff_owner)
            _buff_remove(_buff_owner)

/obj/item/clothing/gloves/xylix/dropped(mob/user)
    . = ..()
    if(_buff_owner)
        _buff_remove(_buff_owner)

/obj/item/clothing/gloves/xylix/Destroy()
    if(_buff_owner)
        _buff_remove(_buff_owner)
    _buff_owner = null
    return ..()

/obj/item/clothing/gloves/xylix/proc/_buff_apply(mob/living/user)
    if(_buff_owner == user)
        return
    if(_buff_owner)
        _buff_remove(_buff_owner)
    _buff_owner = user
    user.AddElement(/datum/element/xylix_theft_mods, 15, 1, 1.5)

/obj/item/clothing/gloves/xylix/proc/_buff_remove(mob/living/user)
    if(!isliving(user))
        return
    user.RemoveElement(/datum/element/xylix_theft_mods)
    if(_buff_owner == user)
        _buff_owner = null

// ASS TRATA

/obj/item/artifact/astrata_star
	name = "Звезда Астраты"
	desc = "Артефакт, помогающий заблудшим найти истинный свет."
	icon = 'icons/roguetown/items/artefactsten.dmi'
	icon_state = "astrataartefact"
	force = 0

/obj/item/artifact/astrata_star/attack(mob/living/target, mob/user)
	if(!istype(target, /mob/living/carbon/human))
		return

	if(!user || !user.client)
		return

	if(!istype(user, /mob/living/carbon/human))
		to_chat(user, span_warning("Звезда отвергает недостойного носителя."))
		return
	if(!target.client)
		to_chat(user, span_warning("[target.name] не может принять обряд без души, способной ответить (нет клиента)."))
		return

	var/mob/living/carbon/human/C = user

	var/cost = HAS_TRAIT(target, TRAIT_CLERGY) ? 1000 : 0

	if(cost > 0 && C.church_favor < cost)
		to_chat(C, span_warning("Вашей вере не хватает силы. (Требуется [cost] Милости, у вас [C.church_favor].)"))
		return

	user.visible_message(
		span_notice("[user] держит Звезду Астраты перед [target.name]."),
		span_notice("Я держу Звезду Астраты перед [target.name], позволяя её свету наполнить их душу.")
	)

	if(!do_after(user, 300, target = target))
		user.visible_message(
			span_warning("[user] останавливает ритуал со Звездой Астраты для [target.name]."),
			span_warning("Я прерываю ритуал раньше времени.")
		)
		to_chat(target, span_notice("Свет угасает, когда ритуал прерван."))
		return

	var/list/divine_options = list()
	for(var/path in ALL_DIVINE_PATRONS)
		var/datum/patron/divine/instance = new path
		if(instance && instance.name)
			divine_options[instance.name] = path
		qdel(instance)

	if(!divine_options || !divine_options.len)
		to_chat(user, span_warning("Нет доступных божественных покровителей."))
		return

	var/choice = input(target, "Звезда открывает вашу душу. Выберите покровителя или откажитесь.", "Десять") as null|anything in divine_options
	if(!choice)
		to_chat(target, span_danger("Вы отворачиваетесь от света."))
		to_chat(user, span_danger("[target.name] отвергает предложенный путь."))
		return

	if(cost > 0 && C.church_favor < cost)
		to_chat(C, span_warning("В этот миг откровения ваша Милость иссякла. Обряд затухает."))
		to_chat(target, span_warning("Свет мерцает и гаснет, прежде чем клятва успеет закрепиться."))
		return

	var/patron_path = divine_options[choice]
	if(patron_path)
		if(hascall(target, "set_patron"))
			call(target, "set_patron")(patron_path)
		else
			to_chat(user, span_warning("Эту душу невозможно отметить (set_patron не найден)."))
			return

		if(cost > 0)
			C.church_favor = max(0, C.church_favor - cost)

		user.visible_message(
			span_notice("[target.name] принимает метку [choice]."),
			span_notice("[target.name] принимает метку [choice]. Ритуал завершён[cost > 0 ? ", это стоит вам [cost] Милости" : ""].")
		)
		to_chat(target, span_notice("Вы чувствуете, как метка [choice] оседает в вашей душе."))
