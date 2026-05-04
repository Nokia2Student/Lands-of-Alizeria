/datum/crafting_recipe/roguetown/leather/armor
	abstract_type = /datum/crafting_recipe/roguetown/leather/armor
	category = "Доспехи"

/datum/crafting_recipe/roguetown/leather/armor/lgorget
	name = "укреплённый кожаный горжет"
	result = /obj/item/clothing/neck/roguetown/leather
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/armor/heavybracers
	name = "укреплённые кожаные наручи"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/armor/bracers
	name = "кожаные наручи"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather,
			/obj/item/clothing/wrists/roguetown/bracers/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/armor/pants
	name = "кожаные штаны"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/armor/volfhelm
	name = "шлем из волка"
	result = list(/obj/item/clothing/head/roguetown/helmet/leather/volfhelm)
	reqs = list(/obj/item/natural/hide/cured = 1, /obj/item/natural/fur/wolf = 1, /obj/item/natural/head/volf = 1)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/armor/volfmantle
	name = "накидка из волка"
	result = /obj/item/clothing/cloak/volfmantle
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/head/volf = 1,
	)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/armor/saigahelm
	name = "шлем из черепа сайги"
	result = list(/obj/item/clothing/head/roguetown/helmet/leather/saiga)
	reqs = list(/obj/item/natural/hide/cured = 1, /obj/item/natural/hide = 2, /obj/item/natural/head/saiga = 1)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/armor/heavy_leather_pants
	name = "укреплённые кожаные штаны"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants)
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/armor/heavy_leather_pants/shorts
	name = "укреплённые кожаные шорты"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/shorts)
	reqs = list(
		/obj/item/natural/hide/cured = 1, //they cover less, you see
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/armor/helmet/advanced
	name = "укреплённый кожаный шлем"
	result = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/armor/armor
	name = "кожаный доспех"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/armor/cuirass
	name = "кожаная кираса"
	result = /obj/item/clothing/suit/roguetown/armor/leather/cuirass
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/armor/hidearmor
	name = "шкурный доспех"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/armor/heavy_leather_armor
	name = "укреплённый кожаный доспех"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/armor/freivest
	name = "фехтовальная куртка"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter
	reqs = list(
		/obj/item/natural/hide/cured = 4,
		/obj/item/reagent_containers/food/snacks/tallow = 2,
		/obj/item/natural/fibers = 4
	)

/datum/crafting_recipe/roguetown/leather/armor/heavy_leather_armor/coat
	name = "укреплённое кожаное пальто"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/armor/heavy_leather_armor/jacket
	name = "укреплённая кожаная куртка"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy/jacket
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/armor/helmet
	name = "кожаный шлем"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/leather/armor/carapacecuirass
	name = "хитиновая кираса"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace/cuirass)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 4)
	craftdiff = 4
	sellprice = 22

/datum/crafting_recipe/roguetown/leather/armor/carapacearmor
	name = "хитиновый доспех"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace)
	reqs = list(/obj/item/natural/carapace = 4,
				/obj/item/natural/fibers = 6)
	craftdiff = 5
	sellprice = 42

/datum/crafting_recipe/roguetown/leather/armor/carapacelegs
	name = "хитиновые поножи"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 4
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/armor/carapaceskirt
	name = "хитиновая юбка"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs/skirt)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 4
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/armor/carapacecap
	name = "хитиновая шапка"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacecap)
	reqs = list(/obj/item/natural/carapace = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 3
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/armor/carapacehelm
	name = "хитиновый шлем"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacehelm)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 4)
	craftdiff = 4
	sellprice = 22

/datum/crafting_recipe/roguetown/leather/armor/carapaceboots
	name = "хитиновые сапоги"
	result = list(/obj/item/clothing/shoes/roguetown/boots/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/armor/carapacegloves
	name = "хитиновые рукавицы"
	result = list(/obj/item/clothing/gloves/roguetown/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/armor/carapacebracers
	name = "хитиновые наручи"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 3
	sellprice = 20

////// OGRE - GIANT LEATHER GEAR /////
/datum/crafting_recipe/roguetown/leather/gloves_ogre
	name = "большие кожаные перчатки"
	result = /obj/item/clothing/gloves/roguetown/leather/ogre
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/boots_ogre
	name = "большие кожаные сапоги"
	result = /obj/item/clothing/shoes/roguetown/boots/ogre
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 1
