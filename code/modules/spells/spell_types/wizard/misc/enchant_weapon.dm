#define ENCHANT_DURATION 15 MINUTES
#define ENCHANT_DURATION_GOLD 200 MINUTES

/obj/effect/proc_holder/spell/invoked/enchant_weapon
	name = "Зачаровать оружие"
	desc = "Зачаровывает выбранное оружие в руке или на земле, заменяя существующие чары. \n\
	Чары действуют 15 минут и автоматически обновляются в руке пользователя Арканы.\n\
	Если заклинатель держит в руке кусок золотой руды, она поглощается, делая чары постоянными (200 минут).\n\
	Нельзя наложить чары на уже зачарованное оружие.\n\
	Силовой клинок: Увеличивает силу оружия на 5.\n\
	Прочность: Увеличивает прочность и максимальную прочность оружия на 100."
	overlay_state = "enchant_weapon"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 30
	chargedrain = 2
	chargetime = 3 SECONDS // Can be used mid combat if needed.
	no_early_release = TRUE
	recharge_time = 1 MINUTES 

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE

	charging_slowdown = 3
	cost = 2 // Slightly discounted as it is mostly buff.
	spell_tier = 2 // Spellblade tier.

	invocation = "Incantare Arma!" // Enchant Weapon(s)
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

/obj/effect/proc_holder/spell/invoked/enchant_weapon/cast(list/targets, mob/user = usr)
	var/target = targets[1]
	var/obj/item/sacrifice

	var/list/enchant_types = list(
		"Силовой клинок" = FORCE_BLADE_ENCHANT,
		"Прочность" = DURABILITY_ENCHANT
	)

	for(var/obj/item/I in user.held_items)
		if(istype(I, /obj/item/rogueore/gold))
			sacrifice = I

	if(istype(target, /obj/item/rogueweapon))
		var/obj/item/I = target
		var/enchant_type = input(user, "Выберите тип чар, которые хотите наложить:", "Зачаровать оружие") as anything in enchant_types
		if(!enchant_type)
			return
		enchant_type = enchant_types[enchant_type]
		var/enchant_duration = sacrifice ? ENCHANT_DURATION_GOLD : ENCHANT_DURATION
		if(sacrifice)
			qdel(sacrifice)
			to_chat(user, "Я использую [sacrifice], чтобы навсегда зачаровать [I].")
		if(I.GetComponent(/datum/component/enchanted_weapon))
			qdel(I.GetComponent(/datum/component/enchanted_weapon))
		I.AddComponent(/datum/component/enchanted_weapon, enchant_duration, TRUE, /datum/skill/magic/arcane, enchant_type)
		user.visible_message("[user] зачаровывает [I], окутывая его магическим сиянием.")
		return TRUE
	else
		to_chat(user, span_warning("Это неподходящая цель для чар! Вам нужно зачаровать оружие."))
		revert_cast()
		return FALSE
		
#undef ENCHANT_DURATION
