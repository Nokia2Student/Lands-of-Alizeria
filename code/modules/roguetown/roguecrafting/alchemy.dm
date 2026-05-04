/datum/crafting_recipe/roguetown/alchemy
	abstract_type = /datum/crafting_recipe/roguetown/alchemy
	req_table = FALSE
	verbage_simple = "смешать"
	skillcraft = /datum/skill/craft/alchemy
	subtype_reqs = TRUE
	structurecraft = /obj/structure/fluff/alch

/datum/crafting_recipe/roguetown/alchemy/bbomb
	name = "бутылочная бомба"
	category = "Стол"
	result = list(/obj/item/bomb)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/ash = 2, /obj/item/rogueore/coal = 1, /obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/bbomb_x3
	name = "бутылочная бомба (x3)"
	category = "Стол"
	result = list(/obj/item/bomb, /obj/item/bomb, /obj/item/bomb)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 3, /obj/item/ash = 6, /obj/item/rogueore/coal = 3, /obj/item/natural/cloth = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/sbomb
	name = "дымовая бомба"
	category = "Стол"
	result = list(/obj/item/bomb/smoke)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/ash = 2, /obj/item/reagent_containers/powder/salt = 1, /obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/sbomb_x3
	name = "дымовая бомба (x3)"
	category = "Стол"
	result = list(/obj/item/bomb/smoke, /obj/item/bomb/smoke, /obj/item/bomb/smoke)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 3, /obj/item/ash = 6, /obj/item/reagent_containers/powder/salt = 3, /obj/item/natural/cloth = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/ozium
	name = "озиум"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/ozium)
	reqs = list(/obj/item/ash = 2, /datum/reagent/toxin/stampoison = 2, /obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/ozium_3x
	name = "озиум (x3)"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/ozium,
					/obj/item/reagent_containers/powder/ozium,
					/obj/item/reagent_containers/powder/ozium)
	reqs = list(/obj/item/ash = 3, /datum/reagent/toxin/stampoison = 3, /obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/moon
	name = "лунная пыль"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/moondust)
	reqs = list(/obj/item/ash = 2, /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1, /datum/reagent/toxin/berrypoison = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/moon_3x
	name = "лунная пыль (x3)"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/moondust,
					/obj/item/reagent_containers/powder/moondust,
					/obj/item/reagent_containers/powder/moondust
				)
	reqs = list(/obj/item/ash = 3, /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 2, /datum/reagent/toxin/berrypoison = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/salt
	name = "соль (жир)"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/fat = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/salt_2
	name = "соль (фарш)"
	category = "Стол"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/rogue/meat/mince = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/quicksilver
	name = "ртуть"
	category = "Стол"
	result = list(/obj/item/quicksilver = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius/bloodied = 1, /datum/reagent/water/blessed = 45, /obj/item/natural/cloth = 1, /obj/item/alch/silverdust = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/qsabsolution
	name = "очищающее серебро"
	category = "Трансмутация"
	req_table = FALSE
	result = list(/obj/item/quicksilver/luxinfused = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius/bloodied = 1, /datum/reagent/water/blessed = 45, /obj/item/natural/cloth = 1, /obj/item/alch/silverdust = 1)
	craftdiff = 0
	verbage_simple = "трансмутировать"
	structurecraft = null

/datum/crafting_recipe/roguetown/alchemy/transisdust
	name = "пыль Sui"
	category = "Стол"
	result = list(/obj/item/alch/transisdust)
	reqs = list(/obj/item/herbseed/taraxacum = 1, /obj/item/herbseed/euphrasia = 1, /obj/item/herbseed/hypericum = 1, /obj/item/herbseed/salvia = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/menthazig
	name = "самодельная мятная сигарета"
	category = "Стол"
	result = list(/obj/item/clothing/mask/cigarette/rollie/mentha/crafted)
	reqs = list(/obj/item/clothing/mask/cigarette/rollie/nicotine = 1, /obj/item/alch/mentha = 1)
	craftdiff = 1

//Hard to craft but feasable, will give ONE vial but that has 10 units so, enough to cure 2 people if they ration it.
/datum/crafting_recipe/roguetown/alchemy/curerot
	name = "зелье излечения гнили"
	category = "Стол"
	result = list(/obj/item/reagent_containers/glass/bottle/alchemical/rogue/rotcure = 1)
	reqs = list(/obj/item/reagent_containers/glass/bottle/alchemical = 1, /obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1, /obj/item/alch/golddust = 1, /obj/item/alch/viscera = 2)
	craftdiff = 5	//Master-level

/datum/crafting_recipe/roguetown/alchemy/paralytic_venom
	name = "активация паралитического яда"
	category = "Стол"
	result = list(/obj/item/reagent_containers/glass/bottle/alchemical/spidervenom_paralytic = 1)
	reqs = list(/obj/item/reagent_containers/spidervenom_inert = 2, /obj/item/reagent_containers/powder/moondust, /obj/item/reagent_containers/glass/bottle/alchemical)
	craftdiff = 5
	verbage_simple = "смешать"

/datum/crafting_recipe/roguetown/alchemy/revival_potion
	name = "зелье возрождения"
	category = "Стол"
	result = list(/obj/item/reagent_containers/glass/bottle/revival = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/eoran_aril/auric = 1,
	 			/obj/item/alch/viscera = 2,
				/obj/item/reagent_containers/glass/bottle/alchemical,
				/obj/item/reagent_containers/spidervenom_inert = 1,
				/obj/item/alch/horn = 1)
	craftdiff = 5
	verbage_simple = "смешать"

/datum/crafting_recipe/roguetown/alchemy/revival_potion_spider
	name = "зелье возрождения"
	category = "Стол"
	result = list(/obj/item/reagent_containers/glass/bottle/revival = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/eoran_aril/auric = 1,
	 			/obj/item/alch/viscera = 2,
				/obj/item/reagent_containers/glass/bottle/alchemical,
				/obj/item/reagent_containers/spidervenom_inert = 3)
	craftdiff = 5
	verbage_simple = "смешать"

/// bottle craft

/datum/crafting_recipe/roguetown/alchemy/glassbottles
	name = "алхимические склянки"
	category = "Сосуды"
	result = list(/obj/item/reagent_containers/glass/bottle/alchemical, /obj/item/reagent_containers/glass/bottle/alchemical, /obj/item/reagent_containers/glass/bottle/alchemical, /obj/item/reagent_containers/glass/bottle/alchemical, /obj/item/reagent_containers/glass/bottle/alchemical, /obj/item/reagent_containers/glass/bottle/alchemical)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1)
	craftdiff = 1
	verbage_simple = "выковать"

/datum/crafting_recipe/roguetown/alchemy/glassbottles2
	name = "стеклянные бутылки"
	category = "Сосуды"
	result = list(/obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1)
	craftdiff = 1
	verbage_simple = "выковать"

/// transmutation

/datum/crafting_recipe/roguetown/alchemy/distill
	name = "перегонка воды"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/water = 1)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/water/gross = 48)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/w2w
	name = "вода в вино"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/wine = 1)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/water = 48)
	craftdiff = 3 //WHO THE FUCK THOUGHT SETTING THIS AT 2 WAS A GOOD IDEA? MAKE IT MAKE SENSE.
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/g2wes
	name = "зерно в вестлич"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	craftdiff = 3
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/w2swa
	name = "вестлич в болотную траву"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 2)
	craftdiff = 3
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/f2gra
	name = "волокна в зерно"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 1)
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 3
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/b2app
	name = "ягоды в яблоко"
	category = "Трансмутация"
	result = list(/obj/item/reagent_containers/food/snacks/grown/apple = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	craftdiff = 3
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/s2coa
	name = "камень в уголь"
	category = "Трансмутация"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/natural/stone = 4)
	craftdiff = 2
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/c2irn
	name = "уголь в железо"
	category = "Трансмутация"
	result = list(/obj/item/rogueore/iron = 1)
	reqs = list(/obj/item/rogueore/coal = 2)
	craftdiff = 3
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/i2gol
	name = "железо в золото"
	category = "Трансмутация"
	result = list(/obj/item/rogueore/gold = 1)
	reqs = list(/obj/item/rogueore/iron = 4)
	craftdiff = 4
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/g2top
	name = "золото в топер"
	category = "Трансмутация"
	result = list(/obj/item/roguegem/yellow = 1)
	reqs = list(/obj/item/rogueore/gold = 2, /obj/item/natural/stone = 1)
	craftdiff = 4
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/t2gem
	name = "топер в изумруд"
	category = "Трансмутация"
	result = list(/obj/item/roguegem/green = 1)
	reqs = list(/obj/item/roguegem/yellow = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/g2saf
	name = "изумруд в сапфиру"
	category = "Трансмутация"
	result = list(/obj/item/roguegem/violet = 1)
	reqs = list(/obj/item/roguegem/green = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/s2blo
	name = "сапфира в блортц"
	category = "Трансмутация"
	result = list(/obj/item/roguegem/blue = 1)
	reqs = list(/obj/item/roguegem/violet = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/r2dia
	name = "блортц в алмаз"
	category = "Трансмутация"
	result = list(/obj/item/roguegem/diamond = 1)
	reqs = list(/obj/item/roguegem/blue = 2, /obj/item/rogueore/gold = 2)
	craftdiff = 5
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/d2ros
	name = "алмаз в загадку стали" /// holy grail requires legendary. (sell price on average is 350. rontz and diamond worth 100 each. you get to legndary you deserve 150-200 profit)
	category = "Трансмутация"
	result = list(/obj/item/riddleofsteel = 1)
	reqs = list(/obj/item/roguegem/diamond = 2, /obj/item/rogueore/iron = 1, /obj/item/rogueore/coal = 1)
	craftdiff = 6
	verbage_simple = "трансмутировать"

/datum/crafting_recipe/roguetown/alchemy/frankenbrew
	name = "эликсир оживления"
	category = "Стол"
	result = list(
		/obj/item/reagent_containers/glass/bottle/frankenbrew,
		/obj/item/reagent_containers/glass/bottle/frankenbrew
	)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 2,
		/obj/item/reagent_containers/food/snacks/grown/manabloom = 1,
		/obj/item/reagent_containers/lux = 1,
		/obj/item/alch/calendula = 1,
		/datum/reagent/water = 98
	)
	craftdiff = 4
	verbage_simple = "смешать"

/datum/crafting_recipe/roguetown/alchemy/continuity_head
	name = "Голова Непрерывности"
	category = "Плотекрафт"
	result = list(/obj/item/bodypart/head/prosthetic/continuity_head)
	reqs = list(
		/obj/item/bodypart/head = 1,
		/obj/item/rogueore/gold = 1, // you should insert the organs yourself before doing the ritual
//		/obj/item/organ/eyes,
//		/obj/item/organ/ears,
//		/obj/item/organ/tongue,
//		/obj/item/organ/brain,
	)
	craftdiff = 2
	skillcraft = /datum/skill/misc/medicine
	verbage_simple = "плотекрафт"
