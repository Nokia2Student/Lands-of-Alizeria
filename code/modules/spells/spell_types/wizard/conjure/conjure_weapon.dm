/obj/effect/proc_holder/spell/invoked/conjure_weapon
	name = "Сотворение оружия"
	desc = "Создаёт в руке выбранное вами оружие. Оружие исчезнет, если вы сотворите новое или отвяжете заклинание.\n\
	При интеллекте 12 и выше создаётся оружие стального качества, иначе — железное. Только рукопашное."
	overlay_state = "conjure_weapon"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 60
	chargedrain = 1
	chargetime = 2 SECONDS
	no_early_release = TRUE
	recharge_time = 5 MINUTES // Not meant to be spammed or used as a mega support spell to outfit an entire party

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 2
	spell_tier = 2 // Spellblade tier.

	invocation = "Conjura Telum!" // I was offered Me Armare (Arm Myself) but Conjura Telum (Conjure Weapon) is more suitable.
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

	var/obj/item/rogueweapon/conjured_weapon = null

	var/list/iron_weapons = list(
		"Короткий железный меч" = /obj/item/rogueweapon/sword/iron/short,
		"Железный мессер" = /obj/item/rogueweapon/sword/iron/messer,
		"Железный цвайхандер" = /obj/item/rogueweapon/greatsword/zwei,
		"Дубина" = /obj/item/rogueweapon/mace/cudgel,
		"Железный боевой молот" = /obj/item/rogueweapon/mace/warhammer,
		"Железный кинжал" = /obj/item/rogueweapon/huntingknife/idagger,
		"Железный топор" = /obj/item/rogueweapon/stoneaxe/woodcut,
		"Железная секира" = /obj/item/rogueweapon/greataxe,
		"Железный цеп" = /obj/item/rogueweapon/flail,
		"Железное копьё" = /obj/item/rogueweapon/spear,
		"Кнут" = /obj/item/rogueweapon/whip,
	)
	// There's no way I am putting Lucerne in iron tier I am gonna misclassify it as steel on purpose

	// Trying to keep the list manageable so 1 / 2 iconic thing from each family is fine
	var/list/steel_weapons = list(
		"Стальная сабля" = /obj/item/rogueweapon/sword/sabre,
		"Стальная рапира" = /obj/item/rogueweapon/sword/rapier,
		"Длинный меч" = /obj/item/rogueweapon/sword/long,
		"Стальной цвайхандер" = /obj/item/rogueweapon/greatsword/grenz,
		"Боевой топор" = /obj/item/rogueweapon/stoneaxe/battle,
		"Стальной кинжал" = /obj/item/rogueweapon/huntingknife/idagger/steel,
		"Алебарда" = /obj/item/rogueweapon/halberd,
		"Стальной боевой молот" = /obj/item/rogueweapon/mace/warhammer/steel,
		"Стальной цеп" = /obj/item/rogueweapon/flail/sflail,
		"Кнут" = /obj/item/rogueweapon/whip,
	)

/obj/effect/proc_holder/spell/invoked/conjure_weapon/cast(list/targets, mob/living/user = usr)
	var/list/weapons = iron_weapons
	if(user.STAINT >= 12)
		weapons = steel_weapons
	var/weapon_choice = input(user, "Выберите оружие", "Сотворение оружия") as anything in weapons
	if(!weapon_choice)
		return
	if(src.conjured_weapon)
		qdel(src.conjured_weapon)
	weapon_choice = weapons[weapon_choice]

	var/obj/item/rogueweapon/R = new weapon_choice(user.drop_location())
	R.blade_dulling = DULLING_SHAFT_CONJURED
	if(!QDELETED(R))
		R.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE)
	user.put_in_hands(R)
	src.conjured_weapon = R
	return TRUE

/obj/effect/proc_holder/spell/invoked/conjure_weapon/miracle
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/conjure_weapon/Destroy()
	if(src.conjured_weapon)
		conjured_weapon.visible_message(span_warning("Края [conjured_weapon] начинают мерцать и таять, пока оружие полностью не исчезает!"))
		qdel(src.conjured_weapon)
	return ..()
