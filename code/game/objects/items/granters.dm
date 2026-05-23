
///books that teach things (intrinsic actions like bar flinging, spells like fireball or smoke, or martial arts)///

/obj/item/book/granter
	due_date = 0 // Game time in deciseconds
	unique = 1   // 0  Normal book, 1  Should not be treated as normal book, unable to be copied, unable to be modified
	var/list/remarks = list() //things to read about while learning.
	var/pages_to_mastery = 3 //Essentially controls how long a mob must keep the book in his hand to actually successfully learn
	var/reading = FALSE //sanity
	var/oneuse = TRUE //default this is true, but admins can var this to 0 if we wanna all have a pass around of the rod form book
	var/used = FALSE //only really matters if oneuse but it might be nice to know if someone's used it for admin investigations perhaps

/obj/item/book/granter/proc/turn_page(mob/user)
	playsound(user, pick('sound/blank.ogg'), 30, TRUE)
	if(do_after(user,50, user))
		if(remarks.len)
			to_chat(user, span_notice("[pick(remarks)]"))
		else
			to_chat(user, span_notice("Я продолжаю читать..."))
		return TRUE
	return FALSE

/obj/item/book/granter/proc/recoil(mob/user) //nothing so some books can just return

/obj/item/book/granter/proc/already_known(mob/user)
	return FALSE

/obj/item/book/granter/proc/on_reading_start(mob/user)
	to_chat(user, span_notice("Я начинаю читать [name]..."))

/obj/item/book/granter/proc/on_reading_stopped(mob/user)
	to_chat(user, span_notice("Я прекращаю читать..."))

/obj/item/book/granter/proc/on_reading_finished(mob/user)
	to_chat(user, span_notice("Я заканчиваю читать [name]!"))

/obj/item/book/granter/proc/onlearned(mob/user)
	used = TRUE


/obj/item/book/granter/attack_self(mob/living/user)
	if(reading)
		to_chat(user, span_warning("Я уже читаю это!"))
		return FALSE
	if(!user.can_read(src))
		return FALSE
	if(already_known(user))
		return FALSE
/*	REMOVAL -- UNUSED ANYWAY
	if(user.STAINT < 12)
			to_chat(user, span_warning("You can't make sense of the sprawling runes!"))
			return FALSE */
	if(used && oneuse)
		to_chat(user, span_warning("Этот источник знаний не предназначен для повторного использования!"))
		recoil(user)
		return FALSE
	on_reading_start(user)
	reading = TRUE
	for(var/i=1, i<=pages_to_mastery, i++)
		if(!turn_page(user))
			reading = FALSE
			on_reading_stopped()
			return FALSE
	if(do_after(user, 50, user))
		reading = FALSE
		on_reading_finished(user)
		return TRUE
	reading = FALSE //failsafe
	return FALSE

/obj/item/book/granter/spell
	grid_width = 64
	grid_height = 32

	var/spell
	var/spellname = "conjure bugs"

/obj/item/book/granter/spell/already_known(mob/user)
	if(!spell)
		return TRUE
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == spell)
			if(user.mind)
				to_chat(user,span_warning("Вы не можете разобрать эти раскидистые руны!"))
			return TRUE
	return FALSE

/obj/item/book/granter/spell/on_reading_start(mob/user)
	to_chat(user, span_notice("Я начинаю читать о сотворении [spellname]..."))

/obj/item/book/granter/spell/on_reading_finished(mob/user)
	to_chat(user, span_notice("Я чувствую, что вы достаточно опытны, чтобы сотворить [spellname]!"))
	var/obj/effect/proc_holder/spell/S = new spell
	user.mind.AddSpell(S)
	user.log_message("learned the spell [spellname] ([S])", LOG_ATTACK, color="orange")
	onlearned(user)

/obj/item/book/granter/spell/random
	icon_state = "random_book"

/obj/item/book/granter/spell/random/Initialize()
	. = ..()
	var/static/banned_spells = list(/obj/item/book/granter/spell/mimery_blockade)
	var/real_type = pick(subtypesof(/obj/item/book/granter/spell) - banned_spells)
	new real_type(loc)
	return INITIALIZE_HINT_QDEL

///ACTION BUTTONS///

/obj/item/book/granter/action
	var/granted_action
	var/actionname = "catching bugs" //might not seem needed but this makes it so you can safely name action buttons toggle this or that without it fucking up the granter, also caps

/obj/item/book/granter/action/already_known(mob/user)
	if(!granted_action)
		return TRUE
	for(var/datum/action/A in user.actions)
		if(A.type == granted_action)
			to_chat(user, span_warning("I already know all about [actionname]!"))
			return TRUE
	return FALSE

/obj/item/book/granter/action/on_reading_start(mob/user)
	to_chat(user, span_notice("Я начинаю читать о [actionname]..."))

/obj/item/book/granter/action/on_reading_finished(mob/user)
	to_chat(user, span_notice("Я чувствую, что вы хорошо освоили [actionname]!"))
	var/datum/action/G = new granted_action
	G.Grant(user)
	onlearned(user)

//Crafting Recipe books

/obj/item/book/granter/crafting_recipe
	var/list/crafting_recipe_types = list()

/obj/item/book/granter/crafting_recipe/on_reading_finished(mob/user)
	. = ..()
	if(!user.mind)
		return
	for(var/crafting_recipe_type in crafting_recipe_types)
		var/datum/crafting_recipe/R = crafting_recipe_type
		user.mind.teach_crafting_recipe(crafting_recipe_type)
		to_chat(user,span_notice("Я научился создавать [initial(R.name)]."))

//! --BLACKSTONE SCROLLS-- !/
/obj/item/book/granter/spell/blackstone/
    desc = "Свиток потенциала, известный лишь тем, кто может расшифровать его тайны."
    icon = 'icons/roguetown/items/misc.dmi'
    oneuse = TRUE
    drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
    pickup_sound =  'sound/blank.ogg'

/obj/item/book/granter/spell/blackstone/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		name = "siphoned scroll"
		desc = "Свиток, некогда исписанный магическими письменами. Поверхность теперь лишена знаний, вытянутых кем-то другим. Абсолютно бесполезен."
		icon_state = "scroll"
		user.visible_message(span_warning("Магические чернила [src] исчезли со свитка!"))

/obj/item/book/granter/spell/blackstone/fireball
	name = "Свиток Огненного шара"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball
	spellname = "огненный шар"
	icon_state ="scrollred"
	remarks = list("Ignis et oleum..", "Flammam continere ad momentum..", "Flammam iactare..", "Sit flamma constructum..")

/obj/item/book/granter/spell/blackstone/greaterfireball
	name = "Свиток Большого огненного шара"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	spellname = "большой огненный шар"
	icon_state ="scrollred"
	remarks = list("Ignis et oleum..", "Flammam continere ad momentum..", "Flammam iactare..", "Sit flamma constructum..")

/obj/item/book/granter/spell/blackstone/lightning
	name = "Свиток Молнии"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	spellname = "молния"
	icon_state ="scrollyellow"
	remarks = list("Essentia fulgurum digitorum..", "Fulgur de nubibus desuper..", "Fulgur eiecit digitos..", "Praecipe intus aedificatur..")

/obj/item/book/granter/spell/blackstone/fetch
	name = "Свиток Притяжения"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	spellname = "притяжение"
	icon_state ="scrollpurple"
	remarks = list("Returnus Revico..", "Manus de reverti..", "Menus de returnus..")

/obj/item/book/granter/spell/blackstone/blindness
	name = "Свиток Слепоты"
	spell = /obj/effect/proc_holder/spell/invoked/blindness
	spellname = "слепота"
	icon_state ="scrollpurple"
	remarks = list("Occultare oculos..", "Vivus amoevtar..", "Visioner removan..")

/obj/item/book/granter/spell/blackstone/invisibility
	name = "Свиток Невидимости"
	spell = /obj/effect/proc_holder/spell/invoked/invisibility
	spellname = "невидимость"
	icon_state ="scrollpurple"
	remarks = list("Pallium nihilum..", "Occultare veritatem..", "Veritatem removan menor..")

/obj/item/book/granter/spell/blackstone/skeleton
	name = "Свиток реинкарнации скелета"
	spell = /obj/effect/proc_holder/spell/invoked/raise_undead
	spellname = "реинкарнация скелета"
	icon_state ="scrolldarkred"
	remarks = list("Redi damnatos..", "Exitio ad Necram scriptor exolvuntur..", "Ossa in propinquus..")

/obj/item/book/granter/spell/blackstone/sicknessray
	name = "Свиток Луча хвори"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/sickness
	spellname = "Луч хвори"
	icon_state ="scrollgreen"
	remarks = list("Foe rubiginem meam..", "Pestilentia in terris..", "Trabes putrida..")

/obj/item/book/granter/spell/blackstone/bonechill
	name = "Свиток Костяного холода"
	spell = /obj/effect/proc_holder/spell/invoked/bonechill
	spellname = "Костяной холод"
	icon_state ="scrolldarkred"
	remarks = list("Mediolanum ventis..", "Sana damnatorum..", "Frigidus ossa mortuorum..")

/obj/item/book/granter/spell/blackstone/acidsplash
	name = "Свиток Кислотного шара"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/acidsplash
	spellname = "Кислотный шар"
	icon_state ="scrolldarkred"
	remarks = list("Lapides corrodunt..", "Spuma venenosa..", "Guttae flavescentes..")

/obj/item/book/granter/spell/blackstone/spitfire
	name = "Свиток Огненного плевка"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/spitfire
	spellname = "Огненный плевок"
	icon_state ="scrollred"
	remarks = list("Ignis et oleum..", "Flammam continere ad momentum..", "Flammam iactare..", "Sit flamma constructum..")

/obj/item/book/granter/spell/blackstone/lesserknock
	name = "Свиток Малого отмыкания"
	spell = /obj/effect/proc_holder/spell/targeted/touch/lesserknock
	spellname = "Малое отмыкание"
	icon_state ="scrollred"
	remarks = list("Clavis vetusta portam..", "Perdita numquam..", "Manus tremens..")

/obj/item/book/granter/spell/blackstone/repel
	name = "Свиток Отталкивания"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/repel
	spellname = "Отталкивание"
	icon_state ="scrolldarkred"
	remarks = list("Ventos adversos..", "Terra sibilat..", "Lapides vetusti..")


/obj/item/book/granter/spell/blackstone/aerosolize
	name = "Свиток Распыления"
	spell = /obj/effect/proc_holder/spell/invoked/aerosolize
	spellname = "Распыление"
	icon_state ="scrolldarkred"
	remarks = list("Lapides corrodunt..", "Spuma venenosa..", "Guttae flavescentes..")
	

/obj/item/book/granter/spell/blackstone/guidance
	name = "Свиток Наставления"
	spell = /obj/effect/proc_holder/spell/invoked/guidance
	spellname = "Наставление"
	icon_state ="scrolldarkred"
	remarks = list("Lux in tenebris..", "Passus certus umbras non timet..", "Anima viam scit..")

/obj/item/book/granter/spell/blackstone/frostbolt
	name = "Свиток Ледяной стрелы"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/frostbolt
	spellname = "Ледяная стрела"
	icon_state ="scrolldarkred"
	remarks = list("Gelum serpentibus..", "Crystallum in silentio..", "Nullum ardor glaciem..")

/obj/item/book/granter/spell/blackstone/fortitude
	name = "Свиток Стойкости"
	spell = /obj/effect/proc_holder/spell/invoked/fortitude
	spellname = "Стойкость"
	icon_state ="scrolldarkred"
	remarks = list("Animus in adversis..", "Gravitas oneris..", "Vita renascitur..")

/obj/item/book/granter/spell/blackstone/message
	name = "Свиток Шёпота"
	spell = /obj/effect/proc_holder/spell/self/message
	spellname = "Шёпот"
	icon_state ="scrolldarkred"
	remarks = list("Verba volant..", "Vincula inter mentes..", "Inter verba et silentium..")

/obj/item/book/granter/spell/blackstone/ensnare
	name = "Свиток Опутывания"
	spell = /obj/effect/proc_holder/spell/invoked/ensnare
	spellname = "Опутывание"
	icon_state ="scrolldarkred"
	remarks = list("Qui intrat..", "Radices in tenebris..", "Nexus occultus..")

/obj/item/book/granter/spell/blackstone/forcewall_weak
	name = "Свиток Силовой стены"
	spell = /obj/effect/proc_holder/spell/invoked/forcewall
	spellname = "Силовая стена"
	icon_state ="scrolldarkred"
	remarks = list("Murus non solum hostem..", "Manus invisibiles saxa invicem..", "Infracta moenia..")

/obj/item/book/granter/spell/blackstone/featherfall
	name = "Свиток Перинного полёта"
	spell = /obj/effect/proc_holder/spell/invoked/featherfall
	spellname = "Перинный полёт"
	icon_state ="scrolldarkred"
	remarks = list("In silentio cadit..", "Alis levitas..", "Plumis taciti dolores..")

/obj/item/book/granter/spell/blackstone/enlarge
	name = "Свиток Увеличения"
	spell = /obj/effect/proc_holder/spell/invoked/enlarge
	spellname = "Увеличение"
	icon_state ="scrolldarkred"
	remarks = list("Immensum agitur..", "Montes tremunt..", "Quantitas expanditur..")

/obj/item/book/granter/spell/blackstone/leap
	name = "Свиток Прыжка"
	spell = /obj/effect/proc_holder/spell/invoked/leap
	spellname = "Прыжок"
	icon_state ="scrolldarkred"
	remarks = list("Altitudinem revelat..", "Cuius pedes in aere volant..", "In levitate audacia..")

//scroll for giving the reader 3 spell points, this should be dungeon loot
/obj/item/book/granter/spell_points
	name = "Арканное прозрение"
	icon_state = "scrollpurple"
	icon = 'icons/roguetown/items/misc.dmi'
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound =  'sound/blank.ogg'

/obj/item/book/granter/spell_points/on_reading_finished(mob/user)
	var/arcaneskill = user.get_skill_level(/datum/skill/magic/arcane)
	if(arcaneskill >= SKILL_LEVEL_NOVICE) //Required arcane skill of NOVICE or higher to use the granter
		to_chat(user, span_notice("Я впитываю прозрения со свитка и чувствую себя более искусным в волшбе!"))
		user.mind.adjust_spellpoints(3)
		onlearned(user)
	else
		to_chat(user, span_notice("Я не знаю, что с этим делать."))

/obj/item/book/granter/spell_points/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		name = "siphoned scroll"
		desc = "A scroll once inscribed with magical scripture. The surface is now barren of knowledge, siphoned by someone else. It's utterly useless."
		icon_state = "scroll"
		user.visible_message(span_warning("[src] has had its magic ink ripped from the scroll!"))

/obj/item/book/granter/spell/blackstone/mirror_transform
	name = "Свиток Зеркального превращения"
	spell = /obj/effect/proc_holder/spell/invoked/mirror_transform
	spellname = "Зеркальное превращение"
	icon_state ="scrolldarkred"
	remarks = list("Aspectum rebis adopta..", "Fac me novum..", "Pulcher ero..")
