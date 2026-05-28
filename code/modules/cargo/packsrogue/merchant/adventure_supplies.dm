// Adventuring Supplies. General category for random stuffs useful for adventurers
// Like container, bedrolls etc.

/datum/supply_pack/rogue/adventure_supplies
	group = "Припасы для приключений"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/adventure_supplies/bedroll
	name = "Спальный мешок"
	cost = 13
	contains = list(/obj/item/bedroll)

/datum/supply_pack/rogue/adventure_supplies/waterskin
	name = "Бурдюк с водой"
	cost = 13
	contains = list(/obj/item/reagent_containers/glass/bottle/waterskin)

/datum/supply_pack/rogue/adventure_supplies/satchel
	name = "Сумка"
	cost = 13
	contains = list(/obj/item/storage/backpack/rogue/satchel)

/datum/supply_pack/rogue/adventure_supplies/short_satchel
	name = "Малая сумка"
	cost = 10
	contains = list(/obj/item/storage/backpack/rogue/satchel/short)

/datum/supply_pack/rogue/adventure_supplies/backpack
	name = "Рюкзак"
	cost = 18
	contains = list(/obj/item/storage/backpack/rogue/backpack)

/datum/supply_pack/rogue/adventure_supplies/pouches
	name = "Мешочек"
	cost = 8
	contains = list(
					/obj/item/storage/belt/rogue/pouch,
					/obj/item/storage/belt/rogue/pouch,
					/obj/item/storage/belt/rogue/pouch)

/datum/supply_pack/rogue/adventure_supplies/belts
	name = "Пояс"
	cost = 14
	contains = list(
					/obj/item/storage/belt/rogue/leather,
					/obj/item/storage/belt/rogue/leather,
					/obj/item/storage/belt/rogue/leather,
				)

/datum/supply_pack/rogue/adventure_supplies/sheath
	name = "Ножны"
	cost = 12
	contains = list(
					/obj/item/rogueweapon/scabbard/sheath
				)

/datum/supply_pack/rogue/adventure_supplies/scabbard
	name = "Ножны (длинные)"
	cost = 15
	contains = list(
					/obj/item/rogueweapon/scabbard/sword
				)


/datum/supply_pack/rogue/adventure_supplies/ropes
	name = "Верёвки"
	cost = 10
	contains = list(
					/obj/item/rope,
					/obj/item/rope,
					/obj/item/rope,
				)

/datum/supply_pack/rogue/adventure_supplies/woodstaff
	name = "Шест"
	cost = 6
	contains = list(/obj/item/rogueweapon/woodstaff)

/datum/supply_pack/rogue/adventure_supplies/lamptern
	name = "Фонарь"
	cost = 15
	contains = list(/obj/item/flashlight/flare/torch/lantern)

/datum/supply_pack/rogue/adventure_supplies/folding_table
	name = "Складной стол"
	cost = 35
	contains = list(/obj/item/folding_table_stored)

/datum/supply_pack/rogue/adventure_supplies/mess_kit
	name = "Походный набор"
	cost = 60
	contains = list(/obj/item/storage/gadget/messkit)

/datum/supply_pack/rogue/adventure_supplies/needles
	name = "Иглы"
	cost = 15
	contains = list(/obj/item/needle,
					/obj/item/needle,
					/obj/item/needle)

/datum/supply_pack/rogue/adventure_supplies/rationpaper
	name = "Паёк"
	cost = 20
	contains = list(
					/obj/item/ration,
					/obj/item/ration,
				)
