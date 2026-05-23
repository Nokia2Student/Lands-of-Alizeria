// Cost is around 1.6x the sell price of the gem
/datum/supply_pack/rogue/gems
	group = "Самоцветы"
	crate_name = "merchant guild's crate"
	mandated_public_profit = 1 // 100% Mandatory Profit Margin on top
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/gems/amethyst
	name = "Амиторц"
	cost = 25
	contains = list(/obj/item/roguegem/amethyst)

/datum/supply_pack/rogue/gems/toper
	name = "Топер"
	cost = 55
	contains = list(/obj/item/roguegem/yellow)

/datum/supply_pack/rogue/gems/gemerald
	name = "Жемральд"
	cost = 67
	contains = list(/obj/item/roguegem/green)

/datum/supply_pack/rogue/gems/saffira
	name = "Сафира"
	cost = 89
	contains = list(/obj/item/roguegem/violet)

/datum/supply_pack/rogue/gems/blortz
	name = "Блорц"
	cost = 130
	contains = list(/obj/item/roguegem/blue)

/datum/supply_pack/rogue/gems/ruby
	name = "Ронц"
	cost = 160
	contains = list(/obj/item/roguegem/ruby)

/datum/supply_pack/rogue/gems/diamond
	name = "Алмаз"
	cost = 190
	contains = list(/obj/item/roguegem/diamond)

/datum/supply_pack/rogue/gems/riddleofsteel
	name = "Загадка Стали"
	cost = 500
	contains = list(/obj/item/riddleofsteel)

//Gemcarving gems. Currently following the 1.6x sell price of the gem format.  This currently makes most gems generally a loss, or at least only minorly profitable, to buy, carve, resell

/datum/supply_pack/rogue/gems/jade
	name = "Джоапстоун"
	cost = 80
	contains = list(/obj/item/roguegem/jade)

/datum/supply_pack/rogue/gems/onyxa
	name = "Оникса"
	cost = 48
	contains = list(/obj/item/roguegem/onyxa)

/datum/supply_pack/rogue/gems/coral
	name = "Аоэталь"
	cost = 96
	contains = list(/obj/item/roguegem/coral)

/datum/supply_pack/rogue/gems/turq
	name = "Церулеабастер"
	cost = 120
	contains = list(/obj/item/roguegem/turq)

/datum/supply_pack/rogue/gems/amber
	name = "Петриамбер"
	cost = 80
	contains = list(/obj/item/roguegem/amber)

/datum/supply_pack/rogue/gems/opal
	name = "Опалуаз"
	cost = 128
	contains = list(/obj/item/roguegem/opal)

/datum/supply_pack/rogue/gems/rose
	name = "Розеллуск"
	cost = 24
	contains = list(/obj/item/carvedgem/rose/rawrose)
