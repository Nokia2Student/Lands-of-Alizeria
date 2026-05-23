/datum/crafting_recipe/roguetown/engineering
	abstract_type = /datum/crafting_recipe/roguetown/engineering

/datum/crafting_recipe/roguetown/engineering/coolingtable
	name = "охлаждающий стол"
	result = /obj/structure/table/cooling
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/ingot/iron = 1,
				/obj/item/roguegear = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/lever
	name = "рычаг"
	result = /obj/structure/lever
	reqs = list(/obj/item/roguegear = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/trapdoor
	name = "люк в полу"
	result = /obj/structure/floordoor
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/roguegear = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/bars
	name = "металлические прутья"
	result = /obj/structure/bars
	reqs = list(/obj/item/ingot/iron = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/shopbars
	name = "торговая решётка"
	result = /obj/structure/bars/shop
	reqs = list(/obj/item/ingot/iron = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	ignoredensity = TRUE
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/distiller
	name = "медный дистиллятор"
	result = /obj/structure/fermentation_keg/distiller
	reqs = list(/obj/item/ingot/copper = 2, /obj/item/roguegear = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/freedomchair
	name = "LIBERTAS"
	result = /obj/structure/chair/freedomchair/crafted
	reqs = list(/obj/item/ingot/gold = 1, /obj/item/roguegear = 3)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/passage
	name = "проход"
	result = /obj/structure/bars/passage
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/roguegear = 1)
	verbage_simple = "изготовить"
	verbage = "смастерил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/passage/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T,/turf/open/lava))
		return FALSE
	if(istype(T,/turf/open/water))
		return FALSE
	return ..()

//pyro arrow crafting, from stonekeep
/datum/crafting_recipe/roguetown/engineering/pyrobolt
	name = "пирокластический болт"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyrobolt_five
	name = "пирокластический болт (x5)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyroarrow
	name = "пирокластическая стрела"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyroarrow_five
	name = "пирокластическая стрела (x5)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pressure_plate
	name = "нажимная плита"
	result = /obj/structure/pressure_plate
	reqs = list(/obj/item/roguegear = 1, /obj/item/natural/wood/plank = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/activator
	name = "инженерная пусковая установка"
	result = /obj/structure/englauncher
	reqs = list(/obj/item/roguegear = 1, /obj/item/natural/wood/plank = 4, /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

//rotational and minecart parts
/datum/crafting_recipe/roguetown/engineering/shaft
	name = "деревянный вал (4x)"
	category = "Вращательные механизмы"
	result = list(/obj/item/rotation_contraption/shaft,
				  /obj/item/rotation_contraption/shaft,
				  /obj/item/rotation_contraption/shaft,
				  /obj/item/rotation_contraption/shaft)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/stickshaft
	name = "деревянный вал"
	category = "Вращательные механизмы"
	result = list(/obj/item/rotation_contraption/shaft)
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/cog
	name = "деревянная шестерня (2x)"
	category = "Вращательные механизмы"
	result = list(/obj/item/rotation_contraption/cog,
				  /obj/item/rotation_contraption/cog)
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/roguegear = 2, /obj/item/grown/log/tree/stick = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	craftdiff = 4


/datum/crafting_recipe/roguetown/engineering/waterwheel
	name = "деревянное водяное колесо"
	category = "Вращательные механизмы"
	result = /obj/item/rotation_contraption/waterwheel
	reqs = list(/obj/item/natural/wood/plank = 3, /obj/item/grown/log/tree/stick = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/large_cog
	name = "большая деревянная шестерня"
	category = "Вращательные механизмы"
	result = /obj/item/rotation_contraption/large_cog
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/ingot/bronze = 1, /obj/item/grown/log/tree/stick = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	tools = list(/obj/item/rogueweapon/huntingknife = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/gearbox
	name = "редуктор"
	category = "Вращательные механизмы"
	result = /obj/item/rotation_contraption/horizontal
	reqs = list(/obj/item/roguegear = 2, /obj/item/natural/stoneblock = 2,/obj/item/grown/log/tree/stick = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/structure/vertical_gearbox
	name = "вертикальный редуктор"
	category = "Вращательные механизмы"
	result = /obj/item/rotation_contraption/vertical
	reqs = list(/obj/item/roguegear = 2, /obj/item/natural/stoneblock = 2, /obj/item/grown/log/tree/stick = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/rails
	name = "рельсы для вагонетки (10x)"
	category = "Вагонетки"
	result = list(/obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail,
				  /obj/item/rotation_contraption/minecart_rail)
	reqs = list(/obj/item/natural/wood/plank = 5, /obj/item/ingot/iron = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3

/datum/crafting_recipe/roguetown/engineering/railbreak
	name = "тормоз для вагонетки (4x)"
	category = "Вагонетки"
	result = list(/obj/item/rotation_contraption/minecart_rail/railbreak,
				  /obj/item/rotation_contraption/minecart_rail/railbreak,
				  /obj/item/rotation_contraption/minecart_rail/railbreak,
				  /obj/item/rotation_contraption/minecart_rail/railbreak)
	reqs = list(/obj/item/roguegear = 1, /obj/item/ingot/iron = 1)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3


/datum/crafting_recipe/roguetown/engineering/minecart
	name = "вагонетка"
	category = "Вагонетки"
	result = /obj/structure/closet/crate/miningcar
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/ingot/iron = 1, /obj/item/grown/log/tree/stick = 4, /obj/item/roguegear = 2)
	verbage_simple = "изготовить"
	verbage = "изготовил"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4
