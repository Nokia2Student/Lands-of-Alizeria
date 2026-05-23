// Unique class drip or something that might fit into another category
/datum/crafting_recipe/roguetown/leather/unique
	abstract_type = /datum/crafting_recipe/roguetown/leather/unique

/datum/crafting_recipe/roguetown/leather/unique/artipants
	name = "штаны ремесленника"
	result = list(/obj/item/clothing/under/roguetown/trou/artipants)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/hide/cured = 2)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 11

/datum/crafting_recipe/roguetown/leather/unique/baggyleatherpants
	name = "шаровары понтифика"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/pontifex)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20
		
/datum/crafting_recipe/roguetown/leather/unique/gladsandals
	name = "сандалии гладиатора"
	result = list(/obj/item/clothing/shoes/roguetown/gladiator)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/leather/unique/grenzelboots
	name = "грензельхофтские сапоги"
	result = list(/obj/item/clothing/shoes/roguetown/boots/grenzelhoft)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 15
	
/datum/crafting_recipe/roguetown/leather/unique/otavanleatherpants
	name = "отавские кожаные штаны"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/otavan)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/unique/otavanleathergloves
	name = "отавские кожаные перчатки"
	result = list(/obj/item/clothing/gloves/roguetown/otavan)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 1,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/unique/otavanleathersatchel
	name = "отавская кожаная сумка"
	result = list(/obj/item/storage/backpack/rogue/satchel/otavan)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
	            /obj/item/natural/fibers = 2,
	            /obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/unique/fencingbreeches
	name = "фехтовальные панталоны"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/otavan/generic)
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cloth = 4)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/unique/otavanboots
	name = "отавские кожаные сапоги"
	result = list(/obj/item/clothing/shoes/roguetown/boots/otavan)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/unique/buckleshoes
	name = "башмаки с пряжками"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes/buckle)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/unique/monkleather
	name = "кафтан понтифика"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/pontifex)
	reqs = list(/obj/item/natural/hide/cured = 4,
	            /obj/item/natural/cloth = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 23

/datum/crafting_recipe/roguetown/leather/unique/furlinedjacket
	name = "куртка ремесленника"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 21

/datum/crafting_recipe/roguetown/leather/unique/winterjacket
	name = "зимняя куртка"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/vest/winterjacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 2,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 24

/datum/crafting_recipe/roguetown/leather/unique/openrobes
	name = "шаманское пальто"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy/atgervi)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/unique/monkrobes
	name = "монашеское облачение"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/monk)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6	//Can be a bit strong, reduce to 5 if too high.

/datum/crafting_recipe/roguetown/leather/unique/basiceast/light
	name = "лёгкое добо (1 шёлк, 1 кожа, 2 волокна)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/light)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 1
		)
	tools = list(/obj/item/needle)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/unique/basiceast/mentorsuit/light
	name = "поношенное добо (1 шёлк, 1 кожа, 2 волокна)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit/light)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 1
		)
	tools = list(/obj/item/needle)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/unique/basiceast/crafteast/light
	name = "парадное добо (1 шёлк, 1 кожа, 2 волокна)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/crafteast/light)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 1
		)
	tools = list(/obj/item/needle)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/unique/captainrobe/light
	name = "цветочные одеяния (1 шёлк, 1 кожа, 2 волокна)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/captainrobe/light)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 1
		)
	tools = list(/obj/item/needle)
	craftdiff = 2
	
/datum/crafting_recipe/roguetown/leather/unique/crafteast
	name = "украшенное добо"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/crafteast)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/clothing/suit/roguetown/armor/basiceast = 1,
		)
	tools = list(/obj/item/needle)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/unique/basiceast
	name = "простое добо (2 шёлка, 2 кожи, 2 волокна, 1 жир)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 2
		)
	tools = list(/obj/item/needle)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/unique/mentorsuit
	name = "старое добо (4 шёлка, 4 кожи, 2 волокна, 2 жира)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit)
	reqs = list(
		/obj/item/natural/hide/cured = 4,
		/obj/item/reagent_containers/food/snacks/tallow = 2,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 4
		)
	tools = list(/obj/item/needle)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/unique/shrinekeeper
	name = "восточное церемониальное одеяние (6 шёлка, 4 кожи, 2 волокна, 2 жира)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/crafteast/shrinekeeper)
	reqs = list(
		/obj/item/natural/hide/cured = 4,
		/obj/item/reagent_containers/food/snacks/tallow = 2,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 6
		)
	tools = list(/obj/item/needle)
	craftdiff = 6

/datum/crafting_recipe/roguetown/leather/unique/captainrobe
	name = "чужеземное одеяние (6 шёлка, 4 кожи, 2 волокна, 2 жира)"
	result = list(/obj/item/clothing/suit/roguetown/armor/basiceast/captainrobe)
	reqs = list(
		/obj/item/natural/hide/cured = 4,
		/obj/item/reagent_containers/food/snacks/tallow = 2,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 6
		)
	tools = list(/obj/item/needle)
	craftdiff = 6

/datum/crafting_recipe/roguetown/leather/unique/eastpants1
	name = "штаны головореза (2 шёлка, 2 волокна, 2 кожи, 1 жир)"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 2
		)
	tools = list(/obj/item/needle)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/unique/eastpants2
	name = "странные рваные штаны (2 шёлка, 2 волокна, 2 кожи, 1 жир)"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2)
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 2
		)
	tools = list(/obj/item/needle)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/unique/eastgloves1
	name = "чёрные перчатки (2 шёлка, 2 волокна, 1 кожа)"
	result = list(/obj/item/clothing/gloves/roguetown/eastgloves1)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 2
		)
	tools = list(/obj/item/needle)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/unique/eastgloves2
	name = "стильные перчатки (2 шёлка, 2 волокна, 1 кожа)"
	result = list(/obj/item/clothing/gloves/roguetown/eastgloves2)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/natural/silk = 2
		)
	tools = list(/obj/item/needle)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/unique/daisho
	name = "дайсё (1 волокно, 1 кожа)"
	result = list(/obj/item/storage/belt/rogue/leather/daisho)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 1
		)
	tools = list(/obj/item/needle)
	craftdiff = 1
	
