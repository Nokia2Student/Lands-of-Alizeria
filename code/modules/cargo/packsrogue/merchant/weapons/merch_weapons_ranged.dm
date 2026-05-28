/datum/supply_pack/rogue/ranged_weapons
	group = "Weapons (Ranged)"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/ranged_weapons/tossbladeiron
	name = "Пояс с метательными клинками, железный"
	cost = 25
	contains = list(/obj/item/storage/belt/rogue/leather/knifebelt/black/iron)

/datum/supply_pack/rogue/ranged_weapons/tossbladesteel
	name = "Пояс с метательными клинками, стальной"
	cost = 45
	contains = list(/obj/item/storage/belt/rogue/leather/knifebelt/black/steel)

/datum/supply_pack/rogue/ranged_weapons/javeliniron
	name = "Дротики, железные"
	cost = 40 // 2 Iron Ingots
	contains = list(/obj/item/quiver/javelin/iron)

/datum/supply_pack/rogue/ranged_weapons/javelinsteel
	name = "Дротики, стальные"
	cost = 80 // 2 Steel Ingots + Small Log
	contains = list(/obj/item/quiver/javelin/steel)

/datum/supply_pack/rogue/ranged_weapons/crossbow
	name = "Арбалет"
	cost = 30
	contains = list(
					/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
				)

/datum/supply_pack/rogue/ranged_weapons/recurvebow
	name = "Лук, рекурсивный"
	cost = 20
	contains = list(
					/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
				)

/datum/supply_pack/rogue/ranged_weapons/longbow
	name = "Лук, длинный"
	cost = 45
	contains = list(
					/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow,
				)

/datum/supply_pack/rogue/ranged_weapons/quiver
	name = "Колчан"
	cost = 5
	contains = list(
					/obj/item/quiver,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/arrows
	name = "Колчан стрел"
	cost = 35 // 2 Iron Ingots
	contains = list(
					/obj/item/quiver/arrows,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/barrows
	name = "Колчан шиловидных стрел"
	cost = 100 // 2 Steel Ingots + Sticks
	contains = list(
					/obj/item/quiver/bodkin,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/pyroarrows
	name = "Колчан огненных стрел"
	cost = 100
	contains = list(
					/obj/item/quiver/pyroarrows,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/poisonarrows
	name = "Колчан отравленных стрел"
	cost = 100 
	contains = list(
					/obj/item/quiver/poisonarrows,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/bolts
	name = "Колчан болтов"
	cost = 35 // 2 Iron Ingots
	contains = list(
					/obj/item/quiver/bolts,
				)

/datum/supply_pack/rogue/ranged_weapons/quivers/pyrobolts
	name = "Колчан пирокластических болтов"
	cost = 100 // Matching price of steel
	contains = list(
					/obj/item/quiver/pyrobolts,
				)

/datum/supply_pack/rogue/ranged_weapons/bottlebombs
	name = "Бутылочная бомба"
	cost = 40
	contains = list(
					/obj/item/bomb,
					/obj/item/bomb,
					/obj/item/bomb,
					/obj/item/bomb,
					/obj/item/bomb
				)

/datum/supply_pack/rogue/ranged_weapons/slingandpouch
	name = "Праща и мешочек"
	cost = 15
	no_name_quantity = TRUE
	contains = list(
					/obj/item/gun/ballistic/revolver/grenadelauncher/sling,
					/obj/item/quiver/sling,
				)

/datum/supply_pack/rogue/ranged_weapons/slingiron
	name = "Мешочек для пуль для пращи, железный"
	cost = 35 // 2 Iron Ingots
	contains = list(
					/obj/item/quiver/sling/iron,
				)

/*/datum/supply_pack/rogue/ranged_weapons/net
	name = "Net"
	cost = 20
	contains = list(
					/obj/item/net,
					/obj/item/net
				)*/
