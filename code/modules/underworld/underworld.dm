/obj/item/flashlight/lantern/shrunken
	name = "shrunken lamp"
	desc = "A beacon."
	icon_state = "shrunkenlamp"
	item_state = "shrunkenlamp"
	lefthand_file = 'icons/roguetown/underworld/enigma_husks.dmi'
	righthand_file = 'icons/roguetown/underworld/enigma_husks.dmi'
	light_outer_range = 4
	light_power = 20
	light_color = LIGHT_COLOR_BLOOD_MAGIC

/obj/item/flashlight/lantern/shrunken/update_brightness(mob/user = null)
	if(on)
		icon_state = "[initial(icon_state)]-on"
		set_light(3, 3, 20, l_color = LIGHT_COLOR_BLOOD_MAGIC)
	else
		icon_state = initial(icon_state)
		set_light(0)

/obj/structure/underworld/carriageman
	name = "The Carriageman"
	desc = "They will take the reigns and lead the way. But only if the price I can pay."
	icon = 'icons/roguetown/underworld/enigma_carriageman.dmi'
	icon_state = "carriageman"
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	density = TRUE

/obj/structure/underworld/carriageman/Initialize()
	. = ..()
	set_light(5, 4, 30, l_color = LIGHT_COLOR_BLUE)

/obj/structure/underworld/carriageman/attack_hand(mob/living/carbon/spirit/user)
	if(!user.paid)
		user << sound(pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 0, 0 ,0, 50)
		to_chat(user, "<br><font color=purple><span class='bold'>FETCH THE TOLL AND YOU MAY BOARD</span></font>")
	else
		to_chat(user, "<br><font color=purple><span class='bold'>HANDS EXCHANGE PAY, BE ON YOUR WAY</span></font>")
		user << sound(pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 0, 0 ,0, 50)

/obj/structure/underworld/carriageman/attackby(obj/item/W, mob/living/user)
	var/mob/living/carbon/spirit/ghost = user
	if(istype(W, /obj/item/underworld/coin))
		if(!ghost.paid)
			qdel(W)
			to_chat(ghost, "<br><font color=purple><span class='bold'>THE TOLL IS PAID, THROUGH THE CARRIAGE THE UNDERMAIDEN WAITS.</span></font>")
			user << sound(pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 0, 0 ,0, 50)
			ghost.paid = TRUE
			return
		if(ghost.paid)
			to_chat(ghost, "<br><font color=purple><span class='bold'>FURTHER PAYMENT WILL NOT CHANGE HER JUDGEMENT.</span></font>")
			user << sound(pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 0, 0 ,0, 50)
	else
		to_chat(ghost, "<br><font color=purple><span class='bold'>ONLY THE TOLL WILL I ACCEPT</span></font>")
		user << sound(pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 0, 0 ,0, 50)

/obj/structure/underworld/barrier //Blocks sprite locations
	name = "DONT STAND HERE"
	desc = "The Undermaiden awaits."
	icon = 'icons/roguetown/underworld/underworld.dmi'
	icon_state = "spiritpart"
	density = TRUE
	anchored = TRUE

/obj/structure/underworld/carriage_normal
	name = "Carriage"
	desc = "Scarlet Reach awaits."
	icon = 'icons/roguetown/underworld/enigma_carriage.dmi'
	icon_state = "carriage_normal"
	anchored = TRUE
	density = TRUE
	var/carriage_tag = "Carriage"
	var/transit_cost = 30 //Стоимость путешествия в маммонах

/obj/structure/underworld/carriage_normal/Initialize()
	. = ..()
	GLOB.underworld_carriages += src

/obj/structure/underworld/carriage_normal/Destroy()
	GLOB.underworld_carriages -= src
	return ..()

/obj/structure/underworld/carriage_normal/attack_hand(mob/living/user)
	show_carriage_menu(user, src)

/proc/calculate_player_money(mob/living/user)
	var/total_money = 0
	//Ищем монеты в руках
	for(var/obj/item/roguecoin/coin in user.held_items)
		if(coin)
			total_money += coin.sellprice * coin.quantity

	//Ищем монеты в карманах (если это human)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.l_store)
			for(var/obj/item/roguecoin/coin in H.l_store.contents)
				total_money += coin.sellprice * coin.quantity
		if(H.r_store)
			for(var/obj/item/roguecoin/coin in H.r_store.contents)
				total_money += coin.sellprice * coin.quantity
		if(H.s_store)
			for(var/obj/item/roguecoin/coin in H.s_store.contents)
				total_money += coin.sellprice * coin.quantity
		if(H.back)
			for(var/obj/item/roguecoin/coin in H.back.contents)
				total_money += coin.sellprice * coin.quantity

	return total_money

/proc/subtract_player_money(mob/living/user, amount)
	if(amount <= 0)
		return TRUE

	var/needed = amount
	var/list/all_coins = list()

	//Собираем все монеты из рук
	for(var/obj/item/roguecoin/coin in user.held_items)
		if(coin)
			all_coins += coin

	//Собираем монеты из карманов (если это human)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.l_store)
			for(var/obj/item/roguecoin/coin in H.l_store.contents)
				all_coins += coin
		if(H.r_store)
			for(var/obj/item/roguecoin/coin in H.r_store.contents)
				all_coins += coin
		if(H.s_store)
			for(var/obj/item/roguecoin/coin in H.s_store.contents)
				all_coins += coin
		if(H.back)
			for(var/obj/item/roguecoin/coin in H.back.contents)
				all_coins += coin

	//Сначала пытаемся вычесть золото
	for(var/obj/item/roguecoin/gold/coin in all_coins)
		if(needed <= 0)
			break
		var/take = min(coin.quantity, ceil(needed / 10))
		coin.set_quantity(coin.quantity - take)
		needed -= take * 10
		if(coin.quantity <= 0)
			qdel(coin)

	//Затем серебро
	for(var/obj/item/roguecoin/silver/coin in all_coins)
		if(needed <= 0)
			break
		var/take = min(coin.quantity, ceil(needed / 5))
		coin.set_quantity(coin.quantity - take)
		needed -= take * 5
		if(coin.quantity <= 0)
			qdel(coin)

	//И медь
	for(var/obj/item/roguecoin/copper/coin in all_coins)
		if(needed <= 0)
			break
		var/take = min(coin.quantity, needed)
		coin.set_quantity(coin.quantity - take)
		needed -= take
		if(coin.quantity <= 0)
			qdel(coin)

	if(needed > 0)
		return FALSE
	return TRUE

/proc/show_carriage_menu(mob/living/user, obj/structure/underworld/carriage_normal/current_carriage)
	if(user.stat == DEAD)
		return

	//Проверка наличия денег
	var/total_money = calculate_player_money(user)

	if(total_money < 30)
		to_chat(user, "<span class='warning'>Я должен заплатить 30 маммон...</span>")
		return

	var/list/available_carriages = list()

	for(var/obj/structure/underworld/carriage_normal/carriage in GLOB.underworld_carriages)
		if(QDELETED(carriage))
			continue
		//Исключаем саму карету, на которую кликнул игрок
		if(carriage == current_carriage)
			continue
		if(carriage.loc != user.loc)
			available_carriages[carriage.carriage_tag] = carriage

	if(!available_carriages.len)
		to_chat(user, "<span class='warning'>Нету доступных карет.</span>")
		return

	var/selected_tag = input(user, "Куда отправляемся?", "Точки интереса", null) as null|anything in available_carriages
	if(!selected_tag)
		return

	var/obj/structure/underworld/carriage_normal/destination = available_carriages[selected_tag]

	if(QDELETED(destination))
		to_chat(user, "<span class='warning'>Кареты нет...</span>")
		return

	start_carriage_transit(user, destination)

/proc/start_carriage_transit(mob/living/user, obj/structure/underworld/carriage_normal/destination)
	if(user.stat == DEAD)
		return

	if(QDELETED(destination))
		return

	var/start_loc = user.loc
	var/start_time = world.time
	var/transit_duration = 15 SECONDS
	var/datum/progressbar/progbar = new(user, transit_duration, user)

	to_chat(user, "<span class='notice'>Ты подготавливаешься к путешествию...</span>")
	destination.visible_message("<span class='notice'>[user] заходит в карету, спешно уезжая...</span>")

	playsound(user, 'sound/misc/carriage1.ogg', 50, TRUE)

	while(world.time < start_time + transit_duration)
		if(user.stat == DEAD || QDELETED(user) || QDELETED(destination))
			qdel(progbar)
			to_chat(user, "<span class='warning'>Путешествие отменено.</span>")
			return

		if(user.loc != start_loc)
			qdel(progbar)
			to_chat(user, "<span class='warning'>Ты двинулся! Путешествие отменено.</span>")
			return

		progbar.update(world.time - start_time)
		stoplag(1)

	if(QDELETED(user) || QDELETED(destination))
		qdel(progbar)
		return

	//Проверка наличия денег перед завершением путешествия
	var/total_money = calculate_player_money(user)

	if(total_money < 30)
		qdel(progbar)
		to_chat(user, "<span class='warning'>Я должен заплатить 30 маммон...</span>")
		return

	//Удаляем 30 маммонов
	if(!subtract_player_money(user, 30))
		qdel(progbar)
		to_chat(user, "<span class='warning'>Я должен заплатить 30 маммон...</span>")
		return

	qdel(progbar)
	playsound(destination, 'sound/misc/deadbell.ogg', 50, TRUE, -2)
	to_chat(user, "<span class='notice'>Ты начинаешь своё путешествие...</span>")
	user.forceMove(destination.loc)

	destination.visible_message("<span class='notice'>[user] выходит из кареты...</span>")
	playsound(destination, pick('sound/misc/carriage1.ogg', 'sound/misc/carriage2.ogg', 'sound/misc/carriage3.ogg', 'sound/misc/carriage4.ogg'), 50, TRUE, -2)

GLOBAL_LIST_INIT(underworld_carriages, list())


/obj/structure/underworld/carriage
	name = "Carriage"
	desc = "The Undermaiden awaits."
	icon = 'icons/roguetown/underworld/enigma_carriage.dmi'
	icon_state = "carriage_lit"
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	density = TRUE


/obj/structure/underworld/carriage/Initialize()
	. = ..()
	set_light(5, 3, 30, l_color = LIGHT_COLOR_BLUE)

/obj/structure/underworld/carriage/attack_hand(mob/living/carbon/spirit/user)
	if(user.paid)
		switch(alert("Are you ready to be judged?",,"Yes","No"))
			if("Yes")
				playsound(user, 'sound/misc/deadbell.ogg', 50, TRUE, -2, ignore_walls = TRUE)
				user.returntolobby()
			if("No")
				usr << "You delay fate."
	else
		to_chat(user, "<B><font size=3 color=red>It's LOCKED.</font></B>")

GLOBAL_VAR_INIT(underworld_coins, 0)

/obj/item/underworld/coin
	name = "The Toll"
	desc = "This is more than just a coin."
	icon = 'icons/roguetown/underworld/enigma_husks.dmi'
	icon_state = "soultoken_floor"
	var/should_track = TRUE

/obj/item/underworld/coin/Initialize()
	. = ..()
	if(should_track)
		GLOB.underworld_coins += 1

/obj/item/underworld/coin/Destroy()
	if(should_track)
		GLOB.underworld_coins -= 1
	coin_upkeep()
	return ..()

/obj/item/underworld/coin/pickup(mob/user)
	..()
	if(should_track)
		GLOB.underworld_coins -= 1
	coin_upkeep()
	icon_state = "soultoken"

/obj/item/underworld/coin/dropped(mob/user)
	..()
	if(should_track)
		GLOB.underworld_coins += 1
	icon_state = "soultoken_floor"

/obj/item/underworld/coin/notracking
	should_track = FALSE

/proc/coin_upkeep()
	if(GLOB.underworld_coins < 8)
		for(var/obj/effect/landmark/underworldcoin/B in GLOB.landmarks_list)
			new /obj/item/underworld/coin(B.loc)


