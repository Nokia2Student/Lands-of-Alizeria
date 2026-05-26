// ============================================ СУХОЙ ПАЁК ============================================

/obj/item/reagent_containers/food/snacks/rogue/ration
	name = "сухой паёк"
	desc = "Компактный контейнер с сухим пайком. Содержит всё необходимое для полноценного приёма пищи. Крайне питателен и дорог. Используется опытными приключенцами в самых крайних случаях."
	icon = 'icons/roguetown/alizeria/items.dmi'
	icon_state = "ration_closed"
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 32
	grid_height = 32

	// Переменные для механики
	var/is_opened = FALSE
	var/is_heated = FALSE
	var/heating_multiplier = 1.0

	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	faretype = FARE_POOR
	portable = TRUE
	tastes = list("рис" = 1, "вяленое мясо" = 1, "сухофрукты" = 1)

/obj/item/reagent_containers/food/snacks/rogue/ration/Initialize()
	. = ..()
	if(is_opened)
		update_icon()

/obj/item/reagent_containers/food/snacks/rogue/ration/examine(mob/user)
	. = ..()
	if(is_opened)
		. += span_info("Паёк открыт и готов к употреблению.")
		if(is_heated)
			. += span_notice("Паёк прогрет! Его питательность увеличена.")
	else
		. += span_info("Паёк закрыт. Нужно его открыть.")

/obj/item/reagent_containers/food/snacks/rogue/ration/update_icon()
	if(is_opened)
		if(bitecount >= 1 && bitecount <= 3)
			if(is_heated)
				icon_state = "ration_open_warm_bite[bitecount]"
			else
				icon_state = "ration_open_bite[bitecount]"
		else if(is_heated)
			icon_state = "ration_open_warm"
		else
			icon_state = "ration_open"
	else
		icon_state = "ration_closed"

/obj/item/reagent_containers/food/snacks/rogue/ration/attack_self(mob/user)
	// Попытка открыть паёк
	if(!is_opened)
		return open_ration(user)
	else
		return FALSE

/obj/item/reagent_containers/food/snacks/rogue/ration/proc/open_ration(mob/living/user)
	if(is_opened)
		to_chat(user, span_notice("Паёк уже открыт!"))
		return FALSE

	to_chat(user, span_notice("Я открываю паёк..."))
	user.visible_message(span_notice("[user] открывает паёк."))

	playsound(user, 'sound/alizeria/rationopen.ogg', 50, TRUE)

	is_opened = TRUE
	update_icon()
	return TRUE

/obj/item/reagent_containers/food/snacks/rogue/ration/attack(mob/living/M, mob/living/user, def_zone)
	// Проверяем, открыт ли паёк перед едой
	if(!is_opened)
		to_chat(user, span_warning("Нужно сначала открыть паёк!"))
		return FALSE

	// Вызываем стандартную механику еды
	return ..()

/obj/item/reagent_containers/food/snacks/rogue/ration/On_Consume(mob/living/eater)
	..()
	update_icon()

	// Обновляем спрайт при каждом укусе
	var/bite_visual_state = bitecount
	if(bite_visual_state >= 1 && bite_visual_state <= 3)
		if(is_heated)
			icon_state = "ration_open_warm_bite[bite_visual_state]"
		else
			icon_state = "ration_open_bite[bite_visual_state]"

	// Финальный укус - сообщение в чат
	if(bitecount >= bitesize)
		eater.visible_message(
			span_notice("[eater] доедает паёк и оставляет контейнер на земле."),
			span_notice("Я доедаю паёк и оставляю контейнер на земле.")
		)

/obj/item/reagent_containers/food/snacks/rogue/ration/afterattack(atom/target, mob/user, proximity)
	// Механика прогрева на костре
	if(is_opened && !is_heated && proximity)
		if(istype(target, /obj/machinery/light/rogue/campfire) || istype(target, /obj/machinery/light/rogue/firebowl) || istype(target, /obj/machinery/light/rogue/hearth))
			return heat_on_fire(target, user)

	. = ..()

/obj/item/reagent_containers/food/snacks/rogue/ration/proc/heat_on_fire(atom/fire_source, mob/living/user)
	if(is_heated)
		to_chat(user, span_notice("Паёк уже прогрет!"))
		return FALSE

	if(bitecount > 0)
		to_chat(user, span_warning("Невозможно прогреть частично съеденный паёк!"))
		return FALSE

	to_chat(user, span_notice("Я прогреваю паёк на огне..."))
	user.visible_message(span_notice("[user] прогревает паёк на огне."))

	if(!do_after(user, 3 SECONDS, target = fire_source))
		return FALSE

	playsound(user, 'sound/foley/dropsound/food_drop.ogg', 30, TRUE)

	is_heated = TRUE
	heating_multiplier = 2.0

	// Увеличиваем питательность в 2 раза
	var/current_nutriment = reagents.get_reagent_amount(/datum/reagent/consumable/nutriment)
	if(current_nutriment > 0)
		reagents.remove_reagent(/datum/reagent/consumable/nutriment, current_nutriment)
		reagents.add_reagent(/datum/reagent/consumable/nutriment, current_nutriment * 2)

	update_icon()
	to_chat(user, span_notice("Паёк прогрет и его питательность увеличена в 2 раза!"))

	return TRUE

// ============================================ КОНТЕЙНЕР (мусор) ============================================

/obj/item/ration_container
	name = "контейнер от пайка"
	desc = "Пустой контейнер от сухого пайка. Можно оставить как мусор."
	icon = 'icons/roguetown/alizeria/items.dmi'
	icon_state = "ration_container_open"
	w_class = WEIGHT_CLASS_TINY