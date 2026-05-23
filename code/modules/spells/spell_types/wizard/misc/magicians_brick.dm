/obj/effect/proc_holder/spell/self/magicians_brick
	name = "Магический кирпич"
	desc = "Создаёт в руке магический кирпич. Его сила растёт с Интеллектом.\n\
	Кирпич существует, пока не будет призван новый или заклинание не будет забыто. Это заклинание веками оттачивалось, чтобы обходить антимагическую защиту."
	overlay_state = "magicians_brick"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 30
	recharge_time = 5 SECONDS // Quite spammable

	warnie = "spellwarning"
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 2
	spell_tier = 2 // Spellblade tier.

	invocation = "Valtarem!"
	invocation_type = "shout"

	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW

	gesture_required = TRUE // Don't really matter
	var/obj/item/rogueweapon/conjured_brick = null

/obj/effect/proc_holder/spell/self/magicians_brick/cast(list/targets, mob/living/user = usr)
	if(src.conjured_brick)
		qdel(conjured_brick)
	var/obj/item/rogueweapon/R = new /obj/item/rogueweapon/magicbrick(user.drop_location())
	R.AddComponent(/datum/component/conjured_item)

	if(user.STAINT > 10)
		var/int_scaling = user.STAINT - 10
		R.force = R.force + int_scaling
		R.throwforce = R.throwforce + int_scaling * 2 // 2x scaling for throwing. Let's go.
		R.name = "магический кирпич +[int_scaling]"
	user.put_in_hands(R)
	src.conjured_brick = R
	return TRUE

/obj/effect/proc_holder/spell/self/magicians_brick/Destroy()
	if(src.conjured_brick)
		conjured_brick.visible_message(span_warning("Края [conjured_brick] начинают мерцать и таять, пока он полностью не исчезает!"))
		qdel(conjured_brick)
	return ..()

/obj/item/rogueweapon/magicbrick
	name = "магический кирпич"
	desc = "Кирпич из арканной энергии. Не настоящий кирпич и не может использоваться для строительства. Очень смертоносное оружие в ближнем и метательном бою."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybrickcook"
	dropshrink = 0.75
	force = 15 // Copy pasted from real brick + 1 for neat number
	throwforce = 20 // +2 from real brick for neat scaling
	throw_speed = 4
	armor_penetration = 30 // From iron tossblade
	wdefense = 0
	wbalance = WBALANCE_NORMAL
	max_integrity = 50 // Don't parry with it lol
	slot_flags = ITEM_SLOT_MOUTH
	obj_flags = null
	w_class = WEIGHT_CLASS_TINY
	possible_item_intents = list(/datum/intent/mace/strike) // Not giving it smash so it don't become competetive with conjure weapon (as a melee weapon)
	associated_skill = /datum/skill/combat/maces // If it was tied to Arcyne it'd be too strong
	hitsound = list('sound/combat/hits/blunt/brick.ogg')
