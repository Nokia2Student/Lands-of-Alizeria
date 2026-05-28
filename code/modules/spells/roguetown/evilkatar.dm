/obj/effect/proc_holder/spell/targeted/touch/summonrogueweapon/evil
	castdrain = 25
	school = "transmutation"

/obj/effect/proc_holder/spell/targeted/touch/summonrogueweapon/evil/inhumenblade
	name = "Клинок нелюдей"
	desc = "Призывает клинок нелюдей."
	clothes_req = FALSE
	drawmessage = "Я прошу оружие, выкованное нелюдями. Они исполняют мою просьбу и помогают мне, ибо их чудеса могущественны..."
	dropmessage = "Отпуская, я смотрю, как клинок теряет форму..."
	overlay_state = "boundkatar"
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	hand_path = /obj/item/melee/touch_attack/rogueweapon/inhumenblade

/obj/item/melee/touch_attack/rogueweapon/inhumenblade
	name = "арканный толчковый кинжал"
	desc = "Этот клинок пульсирует, полупрозрачный и переливчатый, тёмная энергия готова помочь мне в бою..."
	catchphrase = null
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "katar_evil"
	charges = 30 // Inhumen influence is strong
	force = 24
	possible_item_intents = list(/datum/intent/katar/cut, /datum/intent/katar/thrust)
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_HUGE
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	max_blade_int = 999
	max_integrity = 50
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/unarmed
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	wdefense = 4
	wbalance = WBALANCE_SWIFT

/obj/item/melee/touch_attack/rogueweapon/attack_self()
	attached_spell.remove_hand()
