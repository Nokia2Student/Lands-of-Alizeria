/datum/crafting_recipe/roguetown/leather/container
	abstract_type = /datum/crafting_recipe/roguetown/leather/container
	category = "Контейнеры"

/datum/crafting_recipe/roguetown/leather/container/pouch
	name = "подсумок (x2)"
	result = list(/obj/item/storage/belt/rogue/pouch,
				/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	sellprice = 6
	craftdiff = 0

/datum/crafting_recipe/roguetown/leather/container/magepouch
	name = "сумка заклинателя"
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/fibers = 1,
	)
	result = /obj/item/storage/magebag
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/container/meatbag
	name = "сумка для дичи"
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/cloth = 1,
	)
	result = /obj/item/storage/meatbag
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/container/satchel
	name = "сумка через плечо"
	result = /obj/item/storage/backpack/rogue/satchel
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/leather/container/satchelshort
	name = "короткая сумка через плечо (1 волокно, 2 кожи)"
	result = /obj/item/storage/backpack/rogue/satchel/short
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 15

/datum/crafting_recipe/roguetown/leather/container/backpack
	name = "рюкзак"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/leather/container/waterskin
	name = "бурдюк для воды"
	result = /obj/item/reagent_containers/glass/bottle/waterskin
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2)

/datum/crafting_recipe/roguetown/leather/container/quiver
	name = "колчан"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)

/datum/crafting_recipe/roguetown/leather/container/javelinbag
	name = "мешок для дротиков"
	result = /obj/item/quiver/javelin
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/leather/container/twstrap
	name = "перевязь"
	result = /obj/item/twstrap
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/leather/container/belt
	name = "кожаный пояс"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)

/datum/crafting_recipe/roguetown/leather/container/belt/black
	name = "чёрный кожаный пояс"
	result = /obj/item/storage/belt/rogue/leather/black
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)

/datum/crafting_recipe/roguetown/leather/container/belt/knifebelt
	name = "пояс для метательных ножей"
	result = /obj/item/storage/belt/rogue/leather/knifebelt
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)


/datum/crafting_recipe/roguetown/leather/container/scabbard/sword
	name = "ножны для меча"
	result = list(/obj/item/rogueweapon/scabbard/sword)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/fibers = 3,
		/obj/item/grown/log/tree/small = 1,
	)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/container/scabbard/dagger
	name = "ножны для кинжала"
	result = list(/obj/item/rogueweapon/scabbard/sheath)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/grown/log/tree/stick = 2,
	)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/container/beltogre
	name = "огромный кожаный пояс"
	result = /obj/item/storage/belt/rogue/leather/ogre
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 2)
