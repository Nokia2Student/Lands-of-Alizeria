// Light Armor Pack. Only includes the "highest tier" plus a special package of budget armor.
// Pricing principles - Based on uhh sell price x 1.5 approx lol.

/datum/supply_pack/rogue/light_armor
	group = "Доспехи (лёгкие)"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/light_armor/padded_gambeson
	name = "Гамбезон"
	cost = 40 // Base sellprice of 25
	contains = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)

/datum/supply_pack/rogue/light_armor/leather_gorget
	name = "Кожаный горжет"
	cost = 20 // Base sellprice of 10
	contains = list(/obj/item/clothing/neck/roguetown/leather)

/datum/supply_pack/rogue/light_armor/leather_bracers
	name = "Наручи из усиленной кожи"
	cost = 20 // Base sellprice of 10
	contains = list(/obj/item/clothing/wrists/roguetown/bracers/leather/heavy)

/datum/supply_pack/rogue/light_armor/heavy_leather_pants
	name = "Штаны из усиленной кожи"
	cost = 30 // Base sellprice of 20
	contains = list(/obj/item/clothing/under/roguetown/heavy_leather_pants)

/datum/supply_pack/rogue/light_armor/hide_armor
	name = "Шкурный доспех"
	cost = 30 // Base sellprice of 20
	contains = list(/obj/item/clothing/suit/roguetown/armor/leather/hide)

/datum/supply_pack/rogue/light_armor/heavy_leather_armor
	name = "Доспех из усиленной кожи"
	cost = 30 // Base sellprice of 20
	contains = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy)

/datum/supply_pack/rogue/light_armor/studded_leather_armor
	name = "Шипастый кожаный доспех"
	cost = 40 // I added 5 to the base sellprice of 25 because it cost 1 ingot
	contains = list(/obj/item/clothing/suit/roguetown/armor/leather/studded)

/datum/supply_pack/rogue/light_armor/heavy_leather_coat
	name = "Плащ из усиленной кожи"
	cost = 35 // Base sellprice of 25
	contains = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy/coat)

/datum/supply_pack/rogue/light_armor/heavy_leather_jacket
	name = "Куртка из усиленной кожи"
	cost = 35 // Base sellprice of 25
	contains = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy/jacket)

/datum/supply_pack/rogue/light_armor/heavy_leather_gloves
	name = "Тяжёлые кожаные перчатки"
	cost = 20 // No one buying this lmao it costs 1 fur
	contains = list(/obj/item/clothing/gloves/roguetown/angle)

/datum/supply_pack/rogue/light_armor/padded_leather_hood
	name = "Стёганый кожаный капюшон"
	cost = 35 //based off of other leather stuff
	contains = list(/obj/item/clothing/head/roguetown/helmet/leather/armorhood)

/datum/supply_pack/rogue/light_armor/studded_leather_hood
	name = "Шипастый кожаный капюшон"
	cost = 40 //based off of studded leather leather
	contains = list(/obj/item/clothing/head/roguetown/helmet/leather/armorhood/advanced)
