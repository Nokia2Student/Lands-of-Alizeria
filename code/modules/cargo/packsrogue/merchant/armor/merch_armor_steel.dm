// Steel Armor
// Iron Ingot is 20 each.
// Each Steel Ingot is 35 each, 40 minimum price.
// Cured Leather is 5 each.
// For Steel Armor, we applies a base 1.25x multiplier AFTER ingot price to account for labor.
// Then round up to nearest 5.

/datum/supply_pack/rogue/armor_steel
	group = "Доспехи (сталь)"
	crate_name = "merchant guild's crate"
	mandated_public_profit = 1 // 100% Mandatory Profit Margin on top
	crate_type = /obj/structure/closet/crate/chest/merchant

// Steel Armor Section. Massive selection here so I am not going to include everything
/datum/supply_pack/rogue/armor_steel/haubergeon_steel
	name = "Хаубержон"
	cost = 50 // 1 Ingots
	contains = list(/obj/item/clothing/suit/roguetown/armor/chainmail)

/datum/supply_pack/rogue/armor_steel/hauberk_steel
	name = "Хауберк"
	cost = 90 // 2 Ingots
	contains = list(/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk)

/datum/supply_pack/rogue/armor_steel/halfplate
	name = "Полулатный доспех"
	cost = 130 // 3 Ingots, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate)

/datum/supply_pack/rogue/armor_steel/halfplate_fluted
	name = "Полулатный доспех, рифлёный"
	cost = 155 // 3 Ingots, 1 Iron, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/fluted)

/datum/supply_pack/rogue/armor_steel/fullplate
	name = "Полный латный доспех"
	cost = 180 // 4 Steel, 1 Cured Leather 
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/full)

/datum/supply_pack/rogue/armor_steel/fullplate_fluted
	name = "Полный латный доспех, рифлёный"
	cost = 210 // 4 Steel, 1 Iron, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/full/fluted)

/datum/supply_pack/rogue/armor_steel/coatplates
	name = "Пластинчатый панцирь"
	cost = 95 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates)

/datum/supply_pack/rogue/armor_steel/cuirass_steel
	name = "Кираса"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/half)

/datum/supply_pack/rogue/armor_steel/scalemail
	name = "Чешуйчатый доспех"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/scale)

/datum/supply_pack/rogue/armor_steel/brigandine
	name = "Бригантина"
	cost = 100 // 2 Steel, 2 Cloth
	contains = list(/obj/item/clothing/suit/roguetown/armor/brigandine)

/datum/supply_pack/rogue/armor_steel/chaincoif_steel
	name = "Кольчужный койф"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/chaincoif)

/datum/supply_pack/rogue/armor_steel/chainmantle
	name = "Кольчужная мантия"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/chaincoif/chainmantle)

/datum/supply_pack/rogue/armor_steel/chaingloves_steel
	name = "Кольчужные рукавицы"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/gloves/roguetown/chain)

/datum/supply_pack/rogue/armor_steel/plategloves
	name = "Латные рукавицы"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/gloves/roguetown/plate)

/datum/supply_pack/rogue/armor_steel/chainleg_steel
	name = "Кольчужные поножи"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/under/roguetown/chainlegs)

/datum/supply_pack/rogue/armor_steel/platelegs
	name = "Латные поножи"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/under/roguetown/platelegs)

/datum/supply_pack/rogue/armor_steel/bracers_plate
	name = "Латные наручи"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/wrists/roguetown/bracers)

/datum/supply_pack/rogue/armor_steel/helmet_nasal
	name = "Шлем, назальный"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet)

/datum/supply_pack/rogue/armor_steel/helmet_winged
	name = "Шлем, крылатый"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/winged)

/datum/supply_pack/rogue/armor_steel/helmet_kettle
	name = "Шлем, котелок"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/kettle)

/datum/supply_pack/rogue/armor_steel/helmet_sallet
	name = "Шлем, саллет"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/sallet)

/datum/supply_pack/rogue/armor_steel/helmet_sallet_visor
	name = "Шлем, саллет с забралом"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/sallet/visored)

/datum/supply_pack/rogue/armor_steel/helmet_bucket
	name = "Шлем, ведро"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/bucket)

/datum/supply_pack/rogue/armor_steel/helmet_pigface
	name = "Шлем, свиное рыло"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/pigface)

/datum/supply_pack/rogue/armor_steel/helmet_hounskull
	name = "Шлем, гончий череп"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull)

/datum/supply_pack/rogue/armor_steel/helmet_bascinet
	name = "Шлем, бацинет"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet)

/datum/supply_pack/rogue/armor_steel/helmet_etruscan_bascinet
	name = "Шлем, этрусский бацинет"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/etruscan)

/datum/supply_pack/rogue/armor_steel/helmet_knight
	name = "Шлем, рыцарский"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/knight)

/datum/supply_pack/rogue/armor_steel/helmet_armet
	name = "Шлем, армет"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/knight/armet)

/datum/supply_pack/rogue/armor_steel/helmet_savoyard
	name = "Шлем, савойяр"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/guard)

/datum/supply_pack/rogue/armor_steel/helmet_barred
	name = "Шлем, решётчатый"
	cost = 90 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/sheriff)

/datum/supply_pack/rogue/armor_steel/bevor
	name = "Бевор"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/bevor)

/datum/supply_pack/rogue/armor_steel/gorget_steel
	name = "Горжет"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/gorget/steel)

/datum/supply_pack/rogue/armor_steel/boots_steel
	name = "Латные сапоги"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/shoes/roguetown/boots/armor)

/datum/supply_pack/rogue/armor_steel/mask_steel
	name = "Маска"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/mask/rogue/facemask/steel)

/datum/supply_pack/rogue/armor_steel/mask_steel_hound
	name = "Маска, гончая"
	cost = 50 // 1 Steel
	contains = list(/obj/item/clothing/mask/rogue/facemask/steel/hound)

/datum/supply_pack/rogue/armor_steel/steel/belt
	name = "Пояс"
	cost = 50 // 1 Steel
	contains = list(/obj/item/storage/belt/rogue/leather/steel)

/datum/supply_pack/rogue/armor_steel/steel/belt
	name = "Пояс, тассетный"
	cost = 50 // 1 Steel
	contains = list(/obj/item/storage/belt/rogue/leather/steel/tasset)
