///////////
// WOOD //
//////////

//Master wood crafting - standardizes all wood crafting.
/datum/crafting_recipe/roguetown/turfs/wood
	name = "деревянный пол"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/wood/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/wood/floor
	name = "пол (грубое дерево)"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/natural/wood/plank = 1)

/datum/crafting_recipe/roguetown/turfs/wood/floor
	name = "пол (деревянный)"
	result = /turf/open/floor/rogue/wood
	reqs = list(/obj/item/natural/wood/plank = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/wood/platform
	name = "помост (деревянный)"
	result = /turf/open/floor/rogue/ruinedwood/platform
	reqs = list(/obj/item/natural/wood/plank = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/wood/floorhw
	name = "пол (ёлочка, потёртый)"
	result = /turf/open/floor/rogue/ruinedwood/herringbone
	reqs = list(/obj/item/natural/wood/plank = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/wood/floorhs
	name = "пол (ёлочка, тиснёный)"
	result = /turf/open/floor/rogue/ruinedwood/chevron
	reqs = list(/obj/item/natural/wood/plank = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/wood/floorslanted
	name = "пол (скошенный)"
	result = /turf/open/floor/rogue/ruinedwood/spiral
	reqs = list(/obj/item/natural/wood/plank = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/carpet
	name = "ковёр (таверна)"
	result = /turf/open/floor/carpet/inn
	reqs = list(/obj/item/natural/silk= 2)	
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/carpet/purple
	name = "ковёр (пурпурный)"
	result = /turf/open/floor/carpet/purple
	reqs = list(/obj/item/natural/silk= 2)	
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/carpet/red
	name = "ковёр (красный)"
	result = /turf/open/floor/carpet/red
	reqs = list(/obj/item/natural/silk= 2)	
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/carpet/stellar
	name = "ковёр (звёздный)"
	result = /turf/open/floor/carpet/stellar
	reqs = list(/obj/item/natural/silk= 2)	
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/carpet/royalblack
	name = "ковёр (королевский чёрный)"
	result = /turf/open/floor/carpet/royalblack
	reqs = list(/obj/item/natural/silk= 2)	
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/redstone
	name = "пол (красный камень)"
	result = /turf/open/floor/rogue/blocks/stonered
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stone/tinyredstone
	name = "пол (мелкий красный камень)"
	result = /turf/open/floor/rogue/blocks/stonered/tiny
	craftdiff = 2

//Platform has unique turf-check vs normal turf.
/datum/crafting_recipe/roguetown/turfs/wood/platform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/wood/wall
	name = "стена (деревянная)"
	result = /turf/closed/wall/mineral/rogue/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/wood/wall/alt
	reqs = list(/obj/item/natural/wood/plank = 2)

/datum/crafting_recipe/roguetown/turfs/wood/fancy
	name = "стена (нарядное дерево)"
	result = /turf/closed/wall/mineral/rogue/decowood
	reqs = list(/obj/item/natural/wood/plank = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/wood/murderhole
	name = "бойница (деревянная)"
	result = /turf/closed/wall/mineral/rogue/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/wood/darkwoodwall
	name = "стена из тёмного дерева"
	result = /turf/closed/wall/mineral/rogue/wooddark
	reqs = list(/obj/item/natural/wood/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/wood/darkwoodwindow
	name = "бойница из тёмного дерева"
	result = /turf/closed/wall/mineral/rogue/wooddark/window
	reqs = list(/obj/item/natural/wood/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/wood/murderhole/alt
	reqs = list(/obj/item/natural/wood/plank = 2)

/// STONE

/datum/crafting_recipe/roguetown/turfs/stone
	reqs = list(/obj/item/natural/stoneblock = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "построить"
	verbage = "строит"

/datum/crafting_recipe/roguetown/turfs/stone/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/cobblerock
	name = "дорога (булыжник)"
	result = /turf/open/floor/rogue/cobblerock
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/stone/cobblerock/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/cobble
	name = "пол (булыжный)"
	result = /turf/open/floor/rogue/cobble
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stone/block
	name = "пол (каменный блок)"
	result = /turf/open/floor/rogue/blocks
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stone/newstone
	name = "пол (новый камень)"
	result = /turf/open/floor/rogue/blocks/newstone/alt
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stone/herringbone
	name = "пол (каменная ёлочка)"
	result = /turf/open/floor/rogue/herringbone
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/hexstone
	name = "пол (шестигранный камень)"
	result = /turf/open/floor/rogue/hexstone
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/stone/platform
	name = "помост (каменный)"
	result = /turf/open/floor/rogue/blocks/platform
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stone/marblefloor
	name = "мраморный пол"
	result = /turf/open/floor/rogue/churchmarble
	reqs = list(/obj/item/natural/stoneblock = 4)
	craftdiff = 4
// intentionally expensive and hard to make, its marble

/datum/crafting_recipe/roguetown/turfs/stone/bluestone2
	name = "плиты из голубого камня"
	result = /turf/open/floor/rogue/blocks/bluestone
	reqs = list(/obj/item/natural/stoneblock = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/concreteslab
	name = "крупные каменные плиты"
	result = /turf/open/floor/rogue/concrete
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stone/masonic
	name = "масонский декоративный пол"
	result = /turf/open/floor/rogue/tile/masonic
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/masonicalt
	name = "масонский декоративный пол (инверсия)"
	result = /turf/open/floor/rogue/tile/masonic/inverted
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/masonicspiral
	name = "масонский спиральный декоративный пол"
	result = /turf/open/floor/rogue/tile/masonic/spiral
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/bluelargetile
	name = "крупная голубая плитка"
	result = /turf/open/floor/rogue/tile/bfloorz
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/churchredbrick
	name = "крупный красный масонский кирпич"
	result = /turf/open/floor/rogue/churchbrick
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/haremgreenbricks
	name = "зелёный кирпич гарема"
	result = /turf/open/floor/rogue/tile/harem1
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/haremredbricks
	name = "красный кирпич гарема"
	result = /turf/open/floor/rogue/tile/harem
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/harempink
	name = "розовый кирпич гарема"
	result = /turf/open/floor/rogue/tile/harem2
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turf/stone/glassfloors
	name = "стеклянный каменный пол"
	result = /turf/open/transparent/glass
	skillcraft = /datum/skill/craft/masonry
	reqs = list(/obj/item/natural/stoneblock = 2, /obj/item/natural/glass = 2)
	craftdiff = 5 //you should be a master in whatever trade you do to make literal floors out of glass that won't crack


/datum/crafting_recipe/roguetown/turfs/stone/platform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/wall
	name = "стена (каменная)"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stone/brick
	name = "стена (кирпичная)"
	result = /turf/closed/wall/mineral/rogue/stonebrick
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/decorated
	name = "стена (декорированный камень)"
	result = /turf/closed/wall/mineral/rogue/decostone
	reqs = list(/obj/item/natural/stone = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stone/craft
	name = "стена (ремесленный камень)"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stoneblock = 3)
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/stone/window
	name = "бойница (каменная)"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stoneblock = 2)
	craftdiff = 2


/// BRICK

/datum/crafting_recipe/roguetown/turfs/brick
	reqs = list(/obj/item/natural/brick = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "построить"
	verbage = "строит"

/datum/crafting_recipe/roguetown/turfs/brick/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

//Needs brick walls, windows, and platforms added at some point but need sprites for this.
/datum/crafting_recipe/roguetown/turfs/brick/floor
	name = "пол (кирпичный)"
	result = /turf/open/floor/rogue/tile/brick
	reqs = list(/obj/item/natural/brick = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/brick/wall
	name = "стена (кирпичная)"
	result = /turf/closed/wall/mineral/rogue/brick
	reqs = list(/obj/item/natural/brick = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/brick/window
	name = "бойница (кирпичная)"
	result = /turf/closed/wall/mineral/rogue/brick/window
	reqs = list(/obj/item/natural/brick = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/brick/window/openclose
	name = "укреплённое окно (кирпичное)"
	result = /obj/structure/roguewindow/openclose/reinforced/brick
	reqs = list(
	  /obj/item/natural/brick = 2,
	  /obj/item/ingot/iron = 1,
	  /obj/item/natural/glass = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/blacksmithing
	craftsound = 'sound/items/bsmith1.ogg'
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 2

/// WINDOWS

/datum/crafting_recipe/roguetown/turfs/roguewindow
	name = "деревянное окно"
	result = /obj/structure/roguewindow
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/fancywindow/openclose
	name = "нарядное окно"
	result = /obj/structure/roguewindow/openclose
	reqs = list(
	  /obj/item/grown/log/tree/small = 2,
	  /obj/item/natural/stone = 1,
	  /obj/item/natural/glass = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/reinforcedwindow/openclose
	name = "укреплённое окно"
	result = /obj/structure/roguewindow/openclose/reinforced
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/ingot/iron = 1,
		/obj/item/natural/glass = 1,
		/obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/blacksmithing
	craftsound = 'sound/items/bsmith1.ogg'
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 2
	
/// HAY, TWIG AND TENT

/datum/crafting_recipe/roguetown/turfs/hay
	name = "пол (сено)"
	result = /turf/open/floor/rogue/hay
	reqs = list(/obj/item/natural/chaff/wheat = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "собрать"
	verbage = "собирает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/twig
	name = "пол (хворост)"
	result = /turf/open/floor/rogue/twig
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "собрать"
	verbage = "собирает"
	craftdiff = 0
	loud = TRUE

/datum/crafting_recipe/roguetown/turfs/twig/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!(istype(T, /turf/open/floor/rogue/grass) || istype(T, /turf/open/floor/rogue/grassred) || istype(T, /turf/open/floor/rogue/grassyel) || istype(T, /turf/open/floor/rogue/grasscold)))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/twigplatform
	name = "помост (хворост)"
	result = /turf/open/floor/rogue/twig/platform
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "собрать"
	verbage = "собирает"
	craftdiff = 1
	loud = TRUE

/datum/crafting_recipe/roguetown/turfs/twigplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentwall
	name = "стена палатки"
	result = /turf/closed/wall/mineral/rogue/tent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "установить"	
	verbage = "устанавливает"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentdoor
	name = "дверь палатки"
	result = /obj/structure/roguetent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "установить"
	verbage = "устанавливает"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentdoor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return ..()

// Normal, non-openable window
/datum/crafting_recipe/roguetown/turfs/roguewindow
	name = "статичное стеклянное окно"
	result = /obj/structure/roguewindow
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/glass = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 3

	/*
	By the way, glass windows needing Masonry and Carpentry instead of Ceramics isn't an oversight.
	The Mason and the Carpenter are the ones who will build the window itself from wood and
	an already prepared pane of glass. The potter has nothing to do with this part of the process.
	*/// - SunriseOYH

/datum/crafting_recipe/roguetown/turfs/roguewindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/roguewindow/harem1
	name = "окно гарема"
	result = /obj/structure/roguewindow/harem1
	reqs = list(/obj/item/natural/stone = 2, /obj/item/natural/glass = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/roguewindow/harem2
	name = "декоративное окно гарема"
	result = /obj/structure/roguewindow/harem2
	reqs = list(/obj/item/natural/stone = 2, /obj/item/natural/glass = 1, /obj/item/alch/rosa = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 3

/datum/crafting_recipe/roguetown/roguewindow/harem3
	name = "укреплённое окно гарема"
	result = /obj/structure/roguewindow/harem3
	reqs = list(/obj/item/natural/stone = 2, /obj/item/natural/glass =2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "построить"
	verbage = "строит"
	craftdiff = 4

// The windows you can open and close
/datum/crafting_recipe/roguetown/turfs/roguewindow/dynamic
	name = "открываемое стеклянное окно"
	result = /obj/structure/roguewindow/openclose
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/glass = 1)
	craftdiff = 3

// The 'windows' of the church that almost no one knows exists.
/datum/crafting_recipe/roguetown/turfs/roguewindow/stone
	name = "статичное стеклянное окно"
	result = /obj/structure/roguewindow/stained/silver
	reqs = list(/obj/item/natural/stone = 2, /obj/item/natural/glass = 1)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3

// Reinfored windows
/datum/crafting_recipe/roguetown/turfs/roguewindow/reinforced
	name = "укреплённое стеклянное окно"
	result = /obj/structure/roguewindow/openclose/reinforced
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/glass = 1, /obj/item/ingot/iron = 1)
	craftdiff = 3
