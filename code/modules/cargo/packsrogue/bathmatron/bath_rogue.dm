// Thievery Related Supplies. I sure hope this don't go wrong!!!
// Took lockpicks out so it don't get spammed. Get the expensive hairpins instead.

/datum/supply_pack/rogue/bath_rogue
	group = "Воровские принадлежности"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

// Same as merchant
/datum/supply_pack/rogue/bath_rogue/chains
	name = "Цепи"
	cost = 15
	contains = list(
		/obj/item/rope/chain,
		/obj/item/rope/chain,
		/obj/item/rope/chain,
	)

/datum/supply_pack/rogue/bath_rogue/goldpin
	name = "Золотая шпилька"
	cost = 70
	contains = list(/obj/item/lockpick/goldpin)

/datum/supply_pack/rogue/bath_rogue/silverpin
	name = "Серебряная шпилька"
	cost = 140
	contains = list(/obj/item/lockpick/goldpin/silver)

/datum/supply_pack/rogue/bath_rogue/smokebomb
	name = "Дымовая бомба"
	cost = 25
	contains = list(
		/obj/item/bomb/smoke,
		/obj/item/bomb/smoke,
		/obj/item/bomb/smoke)

/datum/supply_pack/rogue/bath_rogue/waterarrows
	name = "Водная стрела"
	cost = 20
	contains = list (
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
	)

/datum/supply_pack/rogue/bath_rogue/grappler
	name = "Крюк-кошка"
	cost = 200
	contains = list(/obj/item/grapplinghook)

/datum/supply_pack/rogue/bath_rogue/climbing_gear
	name = "Снаряжение для лазания"
	cost = 150
	contains = list(/obj/item/clothing/climbing_gear)

/datum/supply_pack/rogue/bath_rogue/smokebelt
	name = "Пояс с дымовыми бомбами"
	cost = 90 // smokebombs are pretty expensive, this is justified
	contains = list(
					/obj/item/storage/belt/rogue/leather/smokebelt
				)

/datum/supply_pack/rogue/bath_rogue/mirrortransform
	name = "Свиток зеркального превращения"
	cost = 50
	contains = list(/obj/item/book/granter/spell/blackstone/mirror_transform)
