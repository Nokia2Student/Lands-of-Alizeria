/obj/item/rune
	var/list/remarks = list() //things to read about while learning.
	var/pages_to_mastery = 5 //Essentially controls how long a mob must keep the rune in his hand to actually successfully learn
	var/reading = FALSE //sanity
	var/oneuse = TRUE //default this is true, but admins can var this to 0 if we wanna all have a pass around of the rod form rune
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/items/books.dmi'

/obj/item/rune/proc/turn_page(mob/user)
	//playsound(user, pick('sound/blank.ogg'), 30, TRUE)
	if(do_after(user,50, user))
		return TRUE
	return FALSE

/obj/item/rune/proc/already_known(mob/user)
	return FALSE

/obj/item/rune/proc/on_start(mob/user)
	to_chat(user, "<span class='notice'>Я начинаю читать [name]...</span>")

/obj/item/rune/proc/on_stopped(mob/user)
	to_chat(user, "<span class='notice'>Я перестаю читать...</span>")

/obj/item/rune/proc/on_finished(mob/user)
	to_chat(user, "<span class='notice'>Я заканчиваю читать [name]!</span>")

/obj/item/rune/proc/onlearned(mob/user)
	qdel(src)

/obj/item/rune/attack_self(mob/user)
	if(reading)
		//to_chat(user, "<span class='warning'>You're already reading this!</span>")
		return FALSE
	if(already_known(user))
		to_chat(user, "<span class='notice'>Я уже знаю это заклинание.</span>")
		return FALSE
	if(!user.get_skill_level(/datum/skill/magic/arcane))
		to_chat(user, "<span class='warning'>У меня не хватает знаний выучить это заклинание.</span>")
		return FALSE
	on_start(user)
	reading = TRUE
	if(remarks.len)
		to_chat(user, "<span class='notice'>[pick(remarks)]</span>")
	for(var/i=1, i<=pages_to_mastery, i++)
		if(!turn_page(user))
			on_stopped()
			reading = FALSE
			return
	if(do_after(user,50, user))
		on_finished(user)
		reading = FALSE
	return TRUE

//Spells
/obj/item/rune/spell
	name = "rune"
	pages_to_mastery = 3
	var/spell
	var/spellname = "no spell"
	icon_state = "spellbookpower1_0" //temporary sprite

/obj/item/rune/spell/on_start(mob/user)
	user.visible_message("<span class='warning'>[user] начинает впитывать руну.</span>")

/obj/item/rune/spell/on_finished(mob/user)
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == spell)
			spell = null
	if(spell)
		to_chat(user, "<span class='notice'>Сила [spellname] запечатлевается в твоём разуме!</span>")
		var/obj/effect/proc_holder/spell/S = new spell
		user.mind.AddSpell(S)
		if(user.get_skill_level(/datum/skill/magic/arcane) <= 5)
			user.adjust_experience(/datum/skill/magic/arcane, 100, FALSE)
	else if(user.get_skill_level(/datum/skill/magic/arcane) <= 5)
		to_chat(user, "<span class='notice'>Магическая сила запечатлевается в твоём разуме!</span>")
		user.adjust_experience(/datum/skill/magic/arcane, 150, FALSE)
	user.visible_message("<span class='warning'>[src] вспыхивает тьмой и рассыпается!</span>")
	qdel(src)

/obj/item/rune/spell/fire_rune
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball
	spellname = "огненный шар"
	// icon_state = "fire_rune"
	name = "руна огня"
	desc = "Тёплая от силы."
	remarks = list("Понять бы эти древние штуки...", "Просто поджечь их не выйдет...", "Учитывать боковой ветер... серьёзно?", "Кажется, я обжёг руку...")

/obj/item/rune/spell/water_rune
	spell = /obj/effect/proc_holder/spell/targeted/ethereal_jaunt
	spellname = "эфирная прогулка"
	// icon_state = "water_rune"
	name = "руна воды"
	desc = "Слегка влажная."
	remarks = list("Понять бы эти древние штуки...", "Мана течёт через всё живое...", "Это заклинание измотает меня...", "Заклинание должно течь как вода...")

/obj/item/rune/spell/air_rune
	spell = /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	spellname = "молния"
	// icon_state = "air_rune"
	name = "руна воздуха"
	desc = "Прохладная на ощупь."
	remarks = list("Понять бы эти древние штуки...", "Если сделать правильно, это могло бы...", "Кажется, меня ударило током...")

/obj/item/rune/spell/earth_rune
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	spellname = "притяжение"
	// icon_state = "earth_rune"
	name = "руна земли"
	desc = "Тяжелее, чем кажется."
	remarks = list("Понять бы эти древние штуки...", "Я могу только притягивать, не толкать...", "Мой разум как в тумане...")

/obj/item/rune/spell/blank_rune
	spell = null
	spellname = "арканная магия"
	// icon_state = "blank_rune"
	name = "сущность руны"
	desc = "Источник магии в нашем мире."
	remarks = list("Голова болит...", "Я никогда этого не пойму!", "Не хочу отрывать взгляд...")
