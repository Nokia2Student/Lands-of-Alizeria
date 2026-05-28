/datum/crafting_recipe/roguetown/structure
	abstract_type = /datum/crafting_recipe/roguetown/structure
	req_table = FALSE
	craftsound = 'sound/foley/Building-01.ogg'

/datum/crafting_recipe/roguetown/structure/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T, /turf/open/water))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/handcart
	name = "ручная тележка"
	result = /obj/structure/handcart
	reqs = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/rope = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/psycrss
	name = "деревянный крест"
	result = /obj/structure/fluff/psycross/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stake = 3)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/psycruci
	name = "псайдонский деревянный крест"
	result = /obj/structure/fluff/psycross/psycrucifix
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stake = 3) 
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/stonepsycruci
	name = "псайдонский каменный крест"
	result = /obj/structure/fluff/psycross/psycrucifix/stone
	reqs =	list(/obj/item/natural/stone = 3)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/silverpsycruci
	name = "псайдонский серебряный крест"
	result = /obj/structure/fluff/psycross/psycrucifix/silver
	reqs = list(/obj/item/ingot/silverblessed = 1,
				/obj/item/ingot/steel = 2)	
	verbage_simple = "соорудить"
	verbage = "сооружает"	
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/stonepsycrss
	name = "каменный крест"
	result = /obj/structure/fluff/psycross
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/zizo_shrine
	name = "Нечестивое святилище"
	always_availible = FALSE
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 2,
		/obj/item/grown/log/tree/stake = 2
	)
	result = /obj/structure/fluff/psycross/zizocross

/datum/crafting_recipe/roguetown/structure/swing_door
	name = "распашная дверь"
	result = /obj/structure/mineral_door/swing_door
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/door
	name = "деревянная дверь"
	result = /obj/structure/mineral_door/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/stonedoor
	name = "каменная дверь"
	result = /obj/structure/mineral_door/wood/donjon/stone
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/doorbolt
	name = "деревянная дверь (с засовом)"
	result = /obj/structure/mineral_door/wood/deadbolt
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/fancydoor
	name = "нарядная дверь"
	result = /obj/structure/mineral_door/wood/fancywood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/metaldoor
	name = "деревянно-металлическая дверь"
	result = /obj/structure/mineral_door/bars
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/ingot/iron = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/metaldoorslotted
	name = "деревянно-металлическая дверь с окошком"
	result = /obj/structure/mineral_door/wood/donjon
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/ingot/iron = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/glassdoor
	name = "деревянно-стеклянная дверь"
	result = /obj/structure/mineral_door/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/glass = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

// furnishings

/datum/crafting_recipe/roguetown/structure/floorclock
	name = "напольные часы"
	result = /obj/structure/fluff/clock
	reqs = list(/obj/item/natural/wood/plank = 2,/obj/item/roguegear = 1, /obj/item/ingot/iron = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/drawer1
	name = "длинный комод"
	result = /obj/structure/closet/crate/drawer/drawer2
	reqs= list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/drawer2
	name = "длинный комод (вариант)"
	result = /obj/structure/closet/crate/drawer/drawer2
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/drawer3
	name = "высокий и длинный комод"
	result = /obj/structure/closet/crate/drawer/drawer3
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/drawer4
	name = "высокий и узкий комод"
	result = /obj/structure/closet/crate/drawer/drawer4
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/drawer5
	name = "прикроватный ящик"
	result = /obj/structure/closet/crate/drawer
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/telescope
	name = "телескоп"
	result = /obj/structure/telescope
	reqs = list(/obj/item/grown/log/tree/stick = 2, /obj/item/ingot/iron = 1, /obj/item/natural/glass = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/globe
	name = "глобус"
	result = /obj/structure/globe
	reqs = list(/obj/item/grown/log/tree/stick = 2, /obj/item/natural/wood/plank = 3)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/bookcase
	name = "книжный шкаф"
	result = /obj/structure/bookcase
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/goldchest
	name = "золотой сундук"
	result = /obj/structure/closet/crate/chest/gold
	reqs = list(/obj/item/natural/wood/plank = 2, /obj/item/alch/golddust = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/tablewood3
	name = "деревянный стол (вариант)"
	result = /obj/structure/table/wood/poor/alt_alt
	reqs = list(/obj/item/natural/wood/plank = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/ornatetable
	name = "изящный деревянный стол"
	result = /obj/structure/table/fine
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/barrel
	name = "деревянная бочка"
	result = /obj/structure/fermentation_keg/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "сделать"
	verbage = "делает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/display_stand
	name = "стойка для демонстрации"
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/grown/log/tree/stick = 2)
	result = /obj/structure/mannequin
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/mannequin_female
	name = "манекен (женский)"
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/grown/log/tree/stick = 2)
	result = /obj/structure/mannequin/male/female
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/mannequin_male
	name = "манекен (мужской)"
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/grown/log/tree/stick = 2)
	result = /obj/structure/mannequin/male
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2
	skillcraft = /datum/skill/craft/carpentry

/obj/structure/fermentation_keg/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/meathook
	name = "мясной крюк"
	result = /obj/structure/meathook
	reqs = list(/obj/item/grown/log/tree = 2,
				/obj/item/rope = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 2

/datum/crafting_recipe/roguetown/roguebin
	name = "деревянный ларь"
	result = /obj/item/roguebin
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "сделать"
	verbage = "делает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/chair
	name = "деревянный стул"
	result = /obj/item/chair/rogue/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/chairthrone
	name = "малый трон"
	result = /obj/structure/chair/wood/rogue/throne
	reqs = list(/obj/item/natural/wood/plank = 2, /obj/item/natural/silk = 2)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry


/obj/item/chair/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/parkbenchleft
	name = "скамья (левая часть)"
	result = /obj/structure/chair/hotspring_bench/left
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/parkbenchmiddle
	name = "скамья (средняя часть)"
	result = /obj/structure/chair/hotspring_bench
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/parkbenchright
	name = "скамья (правая часть)"
	result = /obj/structure/chair/hotspring_bench/right
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/fancychair
	name = "нарядный деревянный стул"
	result = /obj/item/chair/rogue/fancy/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/obj/item/chair/rogue/fancy/crafted
	sellprice = 12

/datum/crafting_recipe/roguetown/structure/stool
	name = "деревянный табурет"
	result = /obj/item/chair/stool/bar/rogue/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"

/obj/item/chair/stool/bar/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/anvil
	name = "наковальня"
	result = /obj/machinery/anvil
	reqs = list(/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/blacksmithing
	verbage_simple = "выковать"
	verbage = "выковывает"

/datum/crafting_recipe/roguetown/structure/smelter
	name = "плавильная печь"
	result = /obj/machinery/light/rogue/smelter
	reqs = list(/obj/item/natural/stone = 4,
			/obj/item/rogueore/coal = 1)
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/smelterhiron
	name = "железоплавильная печь"
	result = /obj/machinery/light/rogue/smelter/hiron
	reqs = list(/obj/item/natural/stone = 7,
			/obj/item/rogueore/coal = 2,
			/obj/item/rogueore/iron = 1)
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/smelterbronze
	name = "бронзовая плавильня"
	result = /obj/machinery/light/rogue/smelter/bronze
	reqs = list(/obj/item/natural/stone = 6,
			/obj/item/rogueore/coal = 1,
			/obj/item/rogueore/iron = 1)
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/greatsmelter
	name = "великая печь"
	result = /obj/machinery/light/rogue/smelter/great
	reqs = list(/obj/item/ingot/iron = 2,
				/obj/item/riddleofsteel = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/forge
	name = "кузнечный горн"
	result = /obj/machinery/light/rogue/forge
	reqs = list(/obj/item/natural/stone = 4,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/sharpwheel
	name = "точильный круг"
	result = /obj/structure/fluff/grindwheel
	reqs = list(/obj/item/ingot/iron = 1,
				/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/blacksmithing
	verbage_simple = "построить"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/loom
	name = "ткацкий станок"
	result = /obj/machinery/loom
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/fibers = 2)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/alch
	name = "алхимический стол"
	result = /obj/structure/fluff/alch
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/stone = 4,
				/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/alchemy
	craftdiff = 0
	verbage_simple = "собрать"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/dyestation
	name = "красильная станция"
	result = /obj/machinery/gear_painter
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "сделать"
	verbage = "делает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/stairsd
	name = "деревянные ступени (вниз)"
	result = /obj/structure/stairs/d
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2
	verbage_simple = "соорудить"
	verbage = "сооружает"
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stairsd/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/stonestairsd
	name = "каменные ступени (вниз)"
	result = /obj/structure/stairs/stone/d
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 2
	verbage_simple = "построить"
	verbage = "строит"
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stonestairsd/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/bordercorner
	name = "угловой бортик"
	result = /obj/structure/fluff/railing/corner
	reqs = list(/obj/item/natural/wood/plank = 1)
	ontile = TRUE
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	buildsame = TRUE
	diagonal = TRUE
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/border
	name = "бортик"
	result = /obj/structure/fluff/railing/border
	reqs = list(/obj/item/natural/wood/plank = 1)
	ontile = TRUE
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	buildsame = TRUE
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/railing
	name = "перила"
	result = /obj/structure/fluff/railing/wood
	reqs = list(/obj/item/natural/wood/plank = 1)
	ontile = TRUE
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/fence
	name = "частокол (2 кола)"
	result = /obj/structure/fluff/railing/fence
	reqs = list(/obj/item/grown/log/tree/stake = 2)
	ontile = TRUE
	verbage_simple = "установить"
	verbage = "устанавливает"
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/headstake
	name = "кол для головы"
	result = /obj/structure/fluff/headstake
	reqs = list(/obj/item/grown/log/tree/stake = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/grown/log/tree/stake = 1)
	verbage_simple = "установить"
	verbage = "устанавливает"
	craftdiff = 0


/datum/crafting_recipe/roguetown/structure/fencealt
	name = "частокол (малое бревно)"
	result = /obj/structure/fluff/railing/fence
	reqs = list(/obj/item/grown/log/tree/small = 1)
	ontile = TRUE
	verbage_simple = "установить"
	verbage = "устанавливает"
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/rack
	name = "стойка"
	result = /obj/structure/rack/rogue
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/pillory
	name = "позорный столб"
	result = /obj/structure/pillory
	reqs = list(/obj/item/grown/log/tree/small = 3)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2
	category = "Постройки"

/datum/crafting_recipe/roguetown/structure/chest
	name = "сундук"
	result = /obj/structure/closet/crate/chest/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/obj/structure/closet/crate/chest/crafted
	keylock = FALSE
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/closet
	name = "шкаф"
	result = /obj/structure/closet/crate/roguecloset
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/coffin
	name = "деревянный гроб"
	result = /obj/structure/closet/crate/coffin
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/obj/structure/closet/crate/roguecloset/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/campfire
	name = "костёр"
	result = /obj/machinery/light/rogue/campfire
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	verbage_simple = "развести"
	verbage = "разводит"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/densefire
	name = "укреплённый костёр"
	result = /obj/machinery/light/rogue/campfire/densefire
	reqs = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 2)
	verbage_simple = "развести"
	verbage = "разводит"

/datum/crafting_recipe/roguetown/structure/cookpit
	name = "очаг"
	result = /obj/machinery/light/rogue/hearth
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 3)
	verbage_simple = "построить"
	verbage = "строит"

/datum/crafting_recipe/roguetown/structure/brazier
	name = "жаровня"
	result = /obj/machinery/light/rogue/firebowl/stump
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "собрать"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/standing
	name = "стоячая жаровня"
	result = /obj/machinery/light/rogue/firebowl/standing
	reqs = list(/obj/item/natural/stone = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/standingblue
	name = "стоячая жаровня (синяя)"
	result = /obj/machinery/light/rogue/firebowl/standing/blue
	reqs = list(/obj/item/natural/stone = 1,
				/obj/item/rogueore/coal = 1,
				/obj/item/ash = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/oven
	name = "печь"
	result = /obj/machinery/light/rogue/oven
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 3)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE

/datum/crafting_recipe/roguetown/structure/tanningrack
	name = "сушилка"
	result = /obj/machinery/tanningrack
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/strawbed
	name = "соломенная кровать"
	result = /obj/structure/bed/rogue/shit
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/bed
	name = "хорошая кровать"
	result = /obj/structure/bed/rogue/inn
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/cloth = 2)
	tools = list(/obj/item/needle)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/woolbed
	name = "деревянная кровать"
	result = /obj/structure/bed/rogue/inn/wool
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/doublebed
	name = "двуспальная кровать"
	result = /obj/structure/bed/rogue/inn/double
	reqs = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/natural/cloth = 4)
	tools = list(/obj/item/needle)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2


/datum/crafting_recipe/roguetown/structure/wooldoublebed
	name = "двуспальная деревянная кровать"
	result = /obj/structure/bed/rogue/inn/wooldouble
	reqs = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/natural/cloth = 3)
	tools = list(/obj/item/needle)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/table
	name = "деревянный стол"
	result = /obj/structure/table/wood/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/operatingtable
	name = "операционный стол"
	result = /obj/structure/table/optable
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/ingot/iron = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/stonetable
	name = "каменный стол"
	result = /obj/structure/table/church
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/finestonetable
	name = "изящный каменный стол"
	result = /obj/structure/table/finestone
	reqs = list(/obj/item/natural/stoneblock = 1)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/fancytableblack
	name = "нарядный деревянный стол (чёрный)"
	result = /obj/structure/table/wood/fancy/black
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytableblue
	name = "нарядный деревянный стол (синий)"
	result = /obj/structure/table/wood/fancy/blue
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytablecyan
	name = "нарядный деревянный стол (бирюзовый)"
	result = /obj/structure/table/wood/fancy/cyan
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytablegreen
	name = "нарядный деревянный стол (зелёный)"
	result = /obj/structure/table/wood/fancy/green
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytableorange
	name = "нарядный деревянный стол (оранжевый)"
	result = /obj/structure/table/wood/fancy/orange
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytablered
	name = "нарядный деревянный стол (красный)"
	result = /obj/structure/table/wood/fancy/red
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytablepurple
	name = "нарядный деревянный стол (пурпурный)"
	result = /obj/structure/table/wood/fancy/purple
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/fancytableroyalblack
	name = "нарядный деревянный стол (королевский чёрный)"
	result = /obj/structure/table/wood/fancy/royalblack
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/fancytableroyalblue
	name = "нарядный деревянный стол (королевский синий)"
	result = /obj/structure/table/wood/fancy/royalblue
	reqs = list(/obj/item/natural/wood/plank = 1, /obj/item/natural/silk = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/longtable
	name = "длинный стол"
	result = /obj/structure/table/wood/long_table
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/longtablealt
	name = "длинный стол (средняя секция)"
	result = /obj/structure/table/wood/long_table/mid/alt
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/largetable
	name = "большой стол"
	result = /obj/structure/table/wood/large_table
	reqs = list(/obj/item/natural/wood/plank = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/millstone
	name = "жёрнов"
	result = /obj/item/millstone
	reqs = list(/obj/item/natural/stone = 3)
	verbage_simple = "собрать"
	verbage = "собирает"
	craftsound = null
	skillcraft = /datum/skill/craft/masonry


/datum/crafting_recipe/roguetown/structure/trapdoor/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return TRUE
	if(istype(T,/turf/open/lava))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/floorgrille
	name = "напольная решётка"
	result = /obj/structure/bars/grille
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/roguegear = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/floorgrille/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return TRUE
	if(istype(T,/turf/open/lava))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/sign
	name = "табличка"
	result = /obj/structure/fluff/customsign
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/dummy
	name = "тренировочное чучело"
	result = /obj/structure/fluff/statue/tdummy
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1



/datum/crafting_recipe/roguetown/structure/wallladder
	name = "настенная лестница"
	result = /obj/structure/wallladder
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	wallcraft = TRUE
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/torchholder
	name = "настенный светильник"
	result = /obj/machinery/light/rogue/torchholder
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/stonelantern
	name = "каменный фонарь (напольный)"
	result = /obj/machinery/light/rogue/torchholder/hotspring
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "построить"
	verbage = "строит"
	wallcraft = FALSE
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/stonelanternstanding
	name = "каменный фонарь (стоячий)"
	result = /obj/machinery/light/rogue/torchholder/hotspring/standing
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "построить"
	verbage = "строит"
	wallcraft = FALSE
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/floorcandle
    name = "напольные свечи"
    result = /obj/machinery/light/rogue/wallfire/candle/floorcandle
    reqs = list(/obj/item/candle/yellow = 2)
    verbage_simple = "построить"
    verbage = "строит"
    skillcraft = /datum/skill/craft/masonry
    wallcraft = FALSE
    craftdiff = 0


/datum/crafting_recipe/roguetown/structure/floorcandlealt
    name = "напольные свечи (вариант)"
    result = /obj/machinery/light/rogue/wallfire/candle/floorcandle/alt
    reqs = list(/obj/item/candle/yellow = 2)
    verbage_simple = "построить"
    verbage = "строит"
    skillcraft = /datum/skill/craft/masonry
    wallcraft = FALSE
    craftdiff = 0


/datum/crafting_recipe/roguetown/structure/floorcandlepink
    name = "напольные свечи Эоры"
    result = /obj/machinery/light/rogue/wallfire/candle/floorcandle/pink
    reqs = list(/obj/item/candle/eora = 2)
    verbage_simple = "построить"
    verbage = "строит"
    skillcraft = /datum/skill/craft/masonry
    wallcraft = FALSE
    craftdiff = 0


/datum/crafting_recipe/roguetown/structure/floorcandlealtpink
    name = "напольные свечи Эоры (вариант)"
    result = /obj/machinery/light/rogue/wallfire/candle/floorcandle/alt/pink
    reqs = list(/obj/item/candle/eora = 2)
    verbage_simple = "построить"
    verbage = "строит"
    skillcraft = /datum/skill/craft/masonry
    wallcraft = FALSE
    craftdiff = 0

/datum/crafting_recipe/roguetown/structure/wallcandle
	name = "настенные свечи"
	result = /obj/machinery/light/rogue/wallfire/candle
	reqs = list(/obj/item/natural/stone = 1, /obj/item/candle/yellow = 1)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/wallcandleblue
	name = "настенные свечи (синие)"
	result = /obj/machinery/light/rogue/wallfire/candle/blue
	reqs = list(/obj/item/natural/stone = 1, /obj/item/candle/yellow = 1, /obj/item/ash = 1)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/stonewalldeco
	name = "каменное настенное украшение"
	result = /obj/structure/fluff/walldeco/stone
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/statue
	name = "статуя"
	result = /obj/structure/fluff/statue/femalestatue
	reqs = list(/obj/item/natural/stone = 3)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/scom
	name = "С-КОМ"
	result = /obj/structure/roguemachine/scomm
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/reagent_containers/food/snacks/smallrat = 1)
	verbage_simple = "собрать"
	verbage = "собирает"
	skillcraft = /datum/skill/magic/arcane
	craftdiff = 3
	wallcraft = TRUE
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/cauldronalchemy
	name = "алхимический котёл"
	result = /obj/machinery/light/rogue/cauldron
	reqs = list(/obj/item/ingot/iron = 1)
	verbage_simple = "собрать"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/alchemy
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/ceramicswheel
	name = "гончарный круг"
	result = /obj/structure/fluff/ceramicswheel
	reqs = list(/obj/item/natural/stone = 2, /obj/item/grown/log/tree/small = 2, /obj/item/roguegear = 1)
	verbage_simple = "соорудить"
	craftdiff = 2
	verbage = "сооружает"

/datum/crafting_recipe/roguetown/structure/bearrug
	name = "медвежья шкура"
	result = /obj/structure/bearpelt
	reqs = list(/obj/item/natural/fur/direbear = 2, /obj/item/natural/head/direbear = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/foxrug
	name = "лисья шкура"
	result = /obj/structure/foxpelt
	reqs = list(/obj/item/natural/fur/fox = 2, /obj/item/natural/head/fox = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/bobcatrug
	name = "рысья шкура"
	result = /obj/structure/bobcatpelt
	reqs = list(/obj/item/natural/fur/bobcat = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/curtain
	name = "занавес"
	result = /obj/structure/curtain
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 0
	ignoredensity = TRUE

/datum/crafting_recipe/roguetown/structure/apiary
	name = "пасека"
	result = /obj/structure/apiary
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/grown/log/tree/stick = 4)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2


/datum/crafting_recipe/roguetown/structure/bee_smoker
	name = "дымарь"
	result = /obj/item/bee_smoker
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/cloth = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

// Here for now until we get a new file for anything trap related.
/datum/crafting_recipe/roguetown/structure/spike_pit
	name = "яма с кольями (требуется земляной пол)"
	result = list(/obj/structure/spike_pit)
	tools = list(/obj/item/rogueweapon/shovel = 1)
	reqs = list(/obj/item/grown/log/tree/stake = 3)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/spike_pit/TurfCheck(mob/user, turf/T)
	var/turf/to_check = get_step(user.loc, user.dir)
	if(!istype(to_check, /turf/open/floor/rogue/dirt))
		to_chat(user, span_info("Нужен земляной пол."))
		return FALSE
	for(var/obj/O in T.contents)
		if(istype(O, /obj/structure/spike_pit))
			to_chat(user, span_info("Здесь уже есть яма с кольями."))
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/wicker
	name = "плетёная корзина"
	result = /obj/structure/closet/crate/chest/wicker
	reqs = list(/obj/item/grown/log/tree/stick = 4,
				/obj/item/natural/fibers = 3)
	verbage_simple = "сплести"
	verbage = "плетёт"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/noose
	name = "петля"
	result = /obj/structure/noose
	reqs = list(/obj/item/rope = 1)
	craftdiff = 1	
	verbage_simple = "связать"
	verbage = "связывает"
	craftsound = 'sound/foley/noose_idle.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/noose/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return TRUE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking, /turf/open/transparent/openspace))
		return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/gallows
	name = "виселица"
	result = /obj/structure/noose/gallows
	reqs = list(/obj/item/rope = 1, /obj/item/grown/log/tree/small = 2)
	craftdiff = 2
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftsound = 'sound/foley/Building-01.ogg'
	ontile = TRUE

///----Couches---

/datum/crafting_recipe/roguetown/structure/couchleft
	name = "диван (левый)"
	result = /obj/structure/chair/bench/couch
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/couchright
	name = "диван (правый)"
	result = /obj/structure/chair/bench/couch/r
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/blackcouchleft
	name = "чёрный диван (левый)"
	result = /obj/structure/chair/bench/couchablack
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/blackcouchright
	name = "чёрный диван (правый)"
	result = /obj/structure/chair/bench/couchablack/r
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/ultimacouchleft
	name = "ультима-диван (левый)"
	result = /obj/structure/chair/bench/ultimacouch
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/ultimacouchright
	name = "ультима-диван (правый)"
	result = /obj/structure/chair/bench/ultimacouch/r
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/altcouchleft
	name = "диван иной (левый)"
	result = /obj/structure/chair/bench/coucha
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/altcouchright
	name = "диван иной (правый)"
	result = /obj/structure/chair/bench/coucha/r
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/magentacouchleft
	name = "пурпурный диван (левый)"
	result = /obj/structure/chair/bench/couchamagenta
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/magentacouchright
	name = "пурпурный диван (правый)"
	result = /obj/structure/chair/bench/couchamagenta/r
	reqs = list(/obj/item/natural/wood/plank = 3,
				/obj/item/natural/silk = 2)
	verbage_simple = "смастерить"
	verbage = "мастерит"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 4
//------------

//---Pillows---
/datum/crafting_recipe/roguetown/structure/redpillows
	name = "красные подушки"
	result = /obj/structure/fluff/pillow/red
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/bluepillows
	name = "синие подушки"
	result = /obj/structure/fluff/pillow/blue
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/greenpillows
	name = "зелёные подушки"
	result = /obj/structure/fluff/pillow/green
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/brownpillows
	name = "коричневые подушки"
	result = /obj/structure/fluff/pillow/brown
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/magentapillows
	name = "пурпурные подушки"
	result = /obj/structure/fluff/pillow/magenta
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/purplepillows
	name = "фиолетовые подушки"
	result = /obj/structure/fluff/pillow/purple
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/blackpillows
	name = "чёрные подушки"
	result = /obj/structure/fluff/pillow/black
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/cloth = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	craftdiff = 3

//---------

//---mirrors---
/datum/crafting_recipe/roguetown/structure/mirror
	name = "зеркало (северное)"
	result = /obj/structure/mirror
	reqs = list(/obj/item/natural/wood/plank = 2,
				/obj/item/ingot/iron = 1,
				/obj/item/natural/glass = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage = "сооружает"
	wallcraft = TRUE
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/fancymirror
	name = "нарядное зеркало (северное)"
	result = /obj/structure/mirror/fancy
	reqs = list(/obj/item/natural/wood/plank = 1,
				/obj/item/ingot/silver = 1,
				/obj/item/ingot/gold = 1,
				/obj/item/natural/glass = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "смастерить"
	verbage = "мастерит"
	wallcraft = TRUE
	craftdiff = 5

// ---fireplace----

/datum/crafting_recipe/roguetown/structure/fireplace
	name = "камин (северный)"
	result = /obj/machinery/light/rogue/wallfirecrafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stoneblock = 3)
	verbage_simple = "построить"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
