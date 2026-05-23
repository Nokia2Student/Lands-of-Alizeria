// Steel Weapons - Base price of 35 per steel ingot
// Minimum price of 40
/datum/supply_pack/rogue/steel_weapons
	group = "Оружие (сталь)"
	crate_name = "merchant guild's crate"
	mandated_public_profit = 1 // 100% Mandatory Profit Margin on top
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/steel_weapons/dagger
	name = "Кинжал"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/huntingknife/idagger/steel,
				)


/datum/supply_pack/rogue/steel_weapons/katar
	name = "Катар"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/katar
				)

/datum/supply_pack/rogue/steel_weapons/steelknuckle
	name = "Стальной кастет"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/knuckles
				)

/datum/supply_pack/rogue/steel_weapons/rapier
	name = "Рапира"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/rapier,
				)
				
/datum/supply_pack/rogue/steel_weapons/cutlass
	name = "Абордажная сабля"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/cutlass,
				)

/datum/supply_pack/rogue/steel_weapons/shortsword
	name = "Короткий меч"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/short,
				)

/datum/supply_pack/rogue/steel_weapons/falchion
	name = "Фальшион"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/falchion,
				)

/datum/supply_pack/rogue/steel_weapons/messer
	name = "Мессер"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/short/messer,
				)

// No one order generic sword I CBA

/datum/supply_pack/rogue/steel_weapons/sabre
	name = "Сабля"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/sabre,
				)

/datum/supply_pack/rogue/steel_weapons/flail
	name = "Цеп"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/flail/sflail,
				)

/datum/supply_pack/rogue/steel_weapons/longsword
	name = "Длинный меч"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/long,
				)

/datum/supply_pack/rogue/steel_weapons/kriegmesser
	name = "Кригмессер"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/long/kriegmesser,
				)

/datum/supply_pack/rogue/steel_weapons/battleaxe
	name = "Боевой топор"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/stoneaxe/battle,
				)

/datum/supply_pack/rogue/steel_weapons/mace
	name = "Булава"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/mace/steel,
				)

/datum/supply_pack/rogue/steel_weapons/greatsword
	name = "Двуручный меч"
	cost = 105 // 3 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/greatsword,
				)

/datum/supply_pack/rogue/steel_weapons/zweihander
	name = "Цвайхандер"
	cost = 105 // 3 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/greatsword/grenz,
				)

/datum/supply_pack/rogue/steel_weapons/estoc
	name = "Эсток"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/estoc,
				)

/datum/supply_pack/rogue/steel_weapons/greataxe
	name = "Секира"
	cost = 75 // 2 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/greataxe/steel,
				)

/datum/supply_pack/rogue/steel_weapons/greataxedoublehead
	name = "Секира, двуглавая"
	cost = 110 // 3 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/greataxe/steel/doublehead,
				)

/datum/supply_pack/rogue/steel_weapons/billhook
	name = "Биллхук"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/spear/billhook,
				)

/datum/supply_pack/rogue/steel_weapons/halberd
	name = "Алебарда"
	cost = 75 // 2 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/halberd,
				)

/datum/supply_pack/rogue/steel_weapons/eaglebeak
	name = "Орлиный клюв"
	cost = 75 // 2 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/eaglebeak,
				)

/datum/supply_pack/rogue/steel_weapons/grandmace
	name = "Великая булава"
	cost = 75 // 2 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/mace/goden/steel,
				)

/datum/supply_pack/rogue/steel_weapons/partizan
	name = "Партизан"
	cost = 80 // 2 Steel Ingot, 1 Small Log. Slight increase cuz gated behind skill 4
	contains = list(
					/obj/item/rogueweapon/spear/partizan,
				)

/datum/supply_pack/rogue/steel_weapons/boarspear
	name = "Копьё на кабана"
	cost = 80 // 2 Steel Ingot, 1 Small Log. Slight increase cuz gated behind skill 4
	contains = list(
					/obj/item/rogueweapon/spear/boar,
				)

/datum/supply_pack/rogue/steel_weapons/lance
	name = "Лэнс"
	cost = 80 // 2 Steel Ingot, 1 Small Log. Slight increase cuz gated behind skill 4
	contains = list(
					/obj/item/rogueweapon/spear/lance,
				)

/datum/supply_pack/rogue/steel_weapons/fishingspear
	name = "Рыболовное копьё"
	cost = 75 // 2 Steel Ingot, 1 Small Log. 
	contains = list(
					/obj/item/rogueweapon/fishspear,
				)
/datum/supply_pack/rogue/steel_weapons/rhomphaia
	name = "Ромфея"
	cost = 70 // 2 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/long/rhomphaia,
				)

/datum/supply_pack/rogue/steel_weapons/falx
	name = "Фалькс"
	cost = 40 // 1 Steel Ingot
	contains = list(
					/obj/item/rogueweapon/sword/falx,
				)

/datum/supply_pack/rogue/steel_weapons/glaive
	name = "Глефа"
	cost = 150 // 3 Steel Ingot, 1 Small Log
	contains = list(
					/obj/item/rogueweapon/halberd/glaive,
				)
