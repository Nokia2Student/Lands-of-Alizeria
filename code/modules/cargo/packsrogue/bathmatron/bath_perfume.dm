#define CHEAP_PERFUME_PRICE 15
#define EXPENSIVE_PERFUME_PRICE 30

// Ofc Bathhouse sells perfumes
// Other server has it as random. I prefer it to not be random so people can get what they want.

/datum/supply_pack/rogue/bath_perfume
	group = "Парфюмы"
	crate_name = "perfumery' crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/bath_perfume/lavender
	name = "Лавандовый парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/lavender)

/datum/supply_pack/rogue/bath_perfume/cherry
	name = "Вишнёвый парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cherry)

/datum/supply_pack/rogue/bath_perfume/rose
	name = "Розовый парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/rose)

/datum/supply_pack/rogue/bath_perfume/jasmine
	name = "Жасминовый парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/jasmine)

/datum/supply_pack/rogue/bath_perfume/mint
	name = "Мятный парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/mint)

/datum/supply_pack/rogue/bath_perfume/vanilla
	name = "Ванильный парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/vanilla)

/datum/supply_pack/rogue/bath_perfume/pear
	name = "Грушевый парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/pear)

/datum/supply_pack/rogue/bath_perfume/strawberry
	name = "Клубничный парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/strawberry)

/datum/supply_pack/rogue/bath_perfume/cinnamon
	name = "Коричный парфюм"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cinnamon)

// "Premium" perfumes they are more expensive by default
// No special mechanical effects
/datum/supply_pack/rogue/bath_perfume/frankincense
	name = "Ладанный парфюм"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/frankincense)

/datum/supply_pack/rogue/bath_perfume/sandalwood
	name = "Сандаловый парфюм"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/sandalwood)

/datum/supply_pack/rogue/bath_perfume/myrrh
	name = "Мирровый парфюм"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/myrrh)
