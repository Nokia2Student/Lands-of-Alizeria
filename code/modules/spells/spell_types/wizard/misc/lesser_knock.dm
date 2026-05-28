/obj/effect/proc_holder/spell/targeted/touch/lesserknock
	name = "Малое отмыкание"
	desc = "Простое заклинание, фокусирующее аркану в инструмент для взлома замков. Рассеивается при использовании на чём-либо, кроме запертой/открытой двери."
	clothes_req = FALSE
	drawmessage = "Я готовлюсь произнести малое арканное заклинание."
	dropmessage = "Я отпускаю свой малый арканный фокус."
	school = "transmutation"
	overlay_state = "rune4"
	chargedrain = 0
	chargetime = 0
	releasedrain = 5 // this influences -every- cost involved in the spell's functionality, if you want to edit specific features, do so in handle_cost
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	hand_path = /obj/item/melee/touch_attack/lesserknock
	spell_tier = 1
	invocation = "Parvus Pulso"
	invocation_type = "whisper" // It is a fake stealth spell (lockpicking is very loud)
	hide_charge_effect = TRUE
	cost = 2 // Utility and needs lockpicking skills

/obj/effect/proc_holder/spell/targeted/touch/lesserknock/miracle
	name = "Малое отмыкание Маттиоса"
	miracle = TRUE
	devotion_cost = 30
	invocation = "From One to Many"
	invocation_type = "whisper" // It is a fake stealth spell (lockpicking is very loud)
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/targeted/touch/lesserknock/miracle/kazengun
	name = "Малое отмыкание Матоко"

/obj/item/melee/touch_attack/lesserknock
	name = "Спектральная отмычка"
	desc = "Тускло светящаяся отмычка, которая, кажется, держится вместе благодаря тайнам арканы. Чтобы рассеять её, просто используйте на чём-либо, кроме двери."
	catchphrase = null
	possible_item_intents = list(/datum/intent/use)
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "lockpick"
	color = "#3FBAFD" // spooky magic blue color that's also used by presti
	picklvl = 1
	max_integrity = 30
	destroy_sound = 'sound/items/pickbreak.ogg'
	resistance_flags = FIRE_PROOF

/obj/item/melee/touch_attack/lesserknock/attack_self()
	qdel(src)
