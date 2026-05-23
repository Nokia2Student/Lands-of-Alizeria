/datum/crafting_recipe/roguetown/survival/spoon
	name = "ложки (x3)"
	category = "Утварь"
	result = list(
		/obj/item/kitchen/spoon,
		/obj/item/kitchen/spoon,
		/obj/item/kitchen/spoon,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/fork
	name = "вилки (x3)"
	category = "Утварь"
	result = list(
		/obj/item/kitchen/fork,
		/obj/item/kitchen/fork,
		/obj/item/kitchen/fork,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/platter
	name = "блюда (x2)"
	category = "Утварь"
	result = list(
		/obj/item/cooking/platter,
		/obj/item/cooking/platter,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/rollingpin
	name = "скалка"
	category = "Утварь"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/woodbucket
	name = "деревянное ведро"
	category = "Утварь"
	result = /obj/item/reagent_containers/glass/bucket
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/woodcup
	name = "деревянные кружки (x3)"
	category = "Утварь"
	result = list(
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/survival/woodtray
	name = "деревянные подносы (x2)"
	category = "Утварь"
	result = list(
		/obj/item/storage/bag/tray,
		/obj/item/storage/bag/tray,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/woodbowl
	name = "деревянные миски (x3)"
	category = "Утварь"
	result = list(
		/obj/item/reagent_containers/glass/bowl,
		/obj/item/reagent_containers/glass/bowl,
		/obj/item/reagent_containers/glass/bowl,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/pot
	name = "каменный горшок"
	category = "Утварь"
	result = /obj/item/reagent_containers/glass/bucket/pot/stone
	reqs = list(/obj/item/natural/stone = 2)

/datum/crafting_recipe/roguetown/survival/soap
	name = "мыло (x3)"
	category = "Утварь"
	result = list(
		/obj/item/soap,
		/obj/item/soap,
		/obj/item/soap,
		)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/survival/candle
	name = "свечи (x3)"
	category = "Утварь"
	result = list(
		/obj/item/candle/yellow,
		/obj/item/candle/yellow,
		/obj/item/candle/yellow,
		)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/survival/candle/eora
	name = "свечи Эоры (x3)"
	category = "Утварь"
	result = list(
		/obj/item/candle/eora,
		/obj/item/candle/eora,
		/obj/item/candle/eora,
		)
	reqs = list(
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/alch/rosa = 1,
		/datum/reagent/water/blessed = 25,
		)
