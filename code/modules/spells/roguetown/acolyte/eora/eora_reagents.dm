//Dummy fluid for effect
/datum/reagent/medicine/revival_fluid
	name = "Эоранский бальзам"
	description = "Чудесная жидкость, медленно исцеляющая мёртвых и возвращающая их к жизни, когда их раны залечены."
	color = "#cd2be2"
	metabolization_rate = REAGENTS_METABOLISM
	taste_description = "холодная надежда"

/obj/item/reagent_containers/glass/bottle/revival
	name = "фиал Эоранского бальзама"
	desc = "Зловещая фиолетовая жидкость, которая, кажется, пульсирует тусклым светом. Она заключена в странное мерцающее стекло. Выглядит хрупкой."
	list_reagents = list(/datum/reagent/medicine/revival_fluid = 48)

/obj/item/reagent_containers/glass/bottle/revival/attack(mob/living/M, mob/living/user)
	if(M.stat < DEAD)
		to_chat(user, "Они не мертвы!")
		return FALSE
	if(!M.mind)
		to_chat(user, "Сердце [M] бездействует.")
		return FALSE

	. = ..()
	if(iscarbon(M))
		if(HAS_TRAIT(M, TRAIT_DNR) && M.stat == DEAD)
			to_chat(user, span_warning("[M] никогда не вернётся."))
			return FALSE
		M.apply_status_effect(/datum/status_effect/buff/eoran_balm_effect)
	to_chat(user, span_notice("Фиал разбивается после использования!"))
	qdel(src)
	return TRUE
