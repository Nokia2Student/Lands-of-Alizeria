/datum/crafting_recipe/roguetown/survival/peasantry
	abstract_type = /datum/crafting_recipe/roguetown/survival/peasantry
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	skillcraft = /datum/skill/craft/carpentry
	category = "Инструменты"

/datum/crafting_recipe/roguetown/survival/peasantry/thresher
	name = "молотило (из железного слитка)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/thresher
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/thresher/whetstone
	name = "молотило — точильный камень"
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/whetstone = 4,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/thresher
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/shovel
	name = "лопата (из железного слитка)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/shovel
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/shovel/whetstone
	name = "лопата — точильный камень"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/shovel
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/hoe
	name = "мотыга (из железного слитка)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/hoe
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/hoe/whetstone
	name = "мотыга — точильный камень"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/hoe
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/pitchfork
	name = "вилы (из железного слитка)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/pitchfork
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/pitchfork/whetstone
	name = "вилы — точильный камень"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/pitchfork
	craftdiff = 0


/datum/crafting_recipe/roguetown/survival/peasantry/peasantwarflail
	name = "крестьянский боевой цеп (из молотила)"
	result = /obj/item/rogueweapon/flail/peasantwarflail
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		/obj/item/rogueweapon/thresher = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/goedendag
	name = "годендаг ополченца"
	result = /obj/item/rogueweapon/woodstaff/militia
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/whetstone = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/waraxe
	name = "боевой топор ополченца (из лопаты)"
	result = /obj/item/rogueweapon/greataxe/militia
	reqs = list(
		/obj/item/rogueweapon/shovel = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warspear_hoe
	name = "боевое копьё ополченца (из мотыги)"
	result = /obj/item/rogueweapon/spear/militia
	reqs = list(
		/obj/item/rogueweapon/hoe = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warspear_pitchfork
	name = "боевое копьё ополченца (из вил)"
	result = /obj/item/rogueweapon/spear/militia
	reqs = list(
		/obj/item/rogueweapon/pitchfork = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/scythe
	name = "коса"
	result = /obj/item/rogueweapon/scythe
	reqs = list(
		/obj/item/natural/whetstone = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/peasantry/warflail
	name = "цеп ополченца"
	result = /obj/item/rogueweapon/flail/militia
	reqs = list(
		/obj/item/natural/whetstone = 2,
		/obj/item/rogueweapon/thresher = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warpick
	name = "боевая кирка ополченца"
	result = /obj/item/rogueweapon/pick/militia
	reqs = list(
		/obj/item/rogueweapon/pick = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warpick_steel
	name = "стальная боевая кирка ополченца"
	result = /obj/item/rogueweapon/pick/militia/steel
	reqs = list(
		/obj/item/rogueweapon/pick/steel = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/maciejowski_knife
	name = "мацеёвский нож (из охотничьего ножа)"
	result = /obj/item/rogueweapon/sword/falchion/militia
	reqs = list(
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/natural/whetstone = 2,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/maciejowski_messer
	name = "мацеёвский мессер (из железного мессера)"
	result = /obj/item/rogueweapon/sword/falchion/militia
	reqs = list(
		/obj/item/rogueweapon/sword/iron/messer = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/stoneaxe
	name = "каменный топор"
	category = "Инструменты"
	result = /obj/item/rogueweapon/stoneaxe
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/woodhammer
	name = "деревянная киянка"
	category = "Инструменты"
	result = /obj/item/rogueweapon/hammer/wood
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonehammer
	name = "каменный молот"
	category = "Инструменты"
	result = /obj/item/rogueweapon/hammer/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonehoe
	name = "каменная мотыга"
	category = "Инструменты"
	result = /obj/item/rogueweapon/hoe/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonetongs
	name = "каменные щипцы"
	category = "Инструменты"
	result = /obj/item/rogueweapon/tongs/stone
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonepick
	name = "каменная кирка"
	category = "Инструменты"
	result = /obj/item/rogueweapon/pick/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 2,
		)

/datum/crafting_recipe/roguetown/survival/stoneknife
	name = "каменный нож"
	category = "Инструменты"
	result = /obj/item/rogueweapon/huntingknife/stoneknife
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/stonespear
	name = "каменное копьё"
	category = "Инструменты"
	result = /obj/item/rogueweapon/spear/stone
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/stonesword
	name = "каменный меч"
	category = "Инструменты"
	result = /obj/item/rogueweapon/sword/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/stone = 3,
		)
	craftdiff = 1


/datum/crafting_recipe/roguetown/survival/woodclub
	name = "деревянная дубина"
	category = "Инструменты"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/billhook
	name = "самодельный садовый крюк"
	category = "Инструменты"
	result = /obj/item/rogueweapon/spear/improvisedbillhook
	reqs = list(
		/obj/item/rogueweapon/sickle = 1,
		/obj/item/rope = 1,
		/obj/item/grown/log/tree/small = 1,
		)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/goedendag
	name = "годендаг"
	category = "Инструменты"
	result = /obj/item/rogueweapon/mace/goden
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/rope = 1,
		/obj/item/rogueweapon/hoe = 1,
		)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3


/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/survival/woodstaff
	name = "деревянный посох"
	category = "Инструменты"
	result = list(
		/obj/item/rogueweapon/woodstaff,
		/obj/item/rogueweapon/woodstaff,
		/obj/item/rogueweapon/woodstaff,
		)
	reqs = list(/obj/item/grown/log/tree = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/quarterstaff
	name = "усиленный посох"
	category = "Инструменты"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff)
	reqs = list(/obj/item/grown/log/tree = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/quarterstaff_iron
	name = "усиленный железом посох"
	category = "Инструменты"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/iron)
	reqs = list(
		/obj/item/rogueweapon/woodstaff/quarterstaff = 1,
		/obj/item/ingot/iron = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/quarterstaff_steel
	name = "усиленный сталью посох"
	category = "Инструменты"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/steel)
	reqs = list(
		/obj/item/rogueweapon/woodstaff/quarterstaff = 1,
		/obj/item/ingot/steel = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/woodsword
	name = "деревянный меч"
	category = "Инструменты"
	result = list(
		/obj/item/rogueweapon/mace/wsword,
		/obj/item/rogueweapon/mace/wsword,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/woodshield
	name = "деревянный щит"
	category = "Инструменты"
	result = /obj/item/rogueweapon/shield/wood
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/hide = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/heatershield
	name = "каплевидный щит"
	category = "Инструменты"
	result = /obj/item/rogueweapon/shield/heater/crafted
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/hide/cured = 1,
		)
	skillcraft = /datum/skill/craft/carpentry

/obj/item/rogueweapon/shield/heater/crafted
	sellprice = 6


/datum/crafting_recipe/roguetown/survival/bonespear
	name = "костяное копьё"
	category = "Инструменты"
	result = /obj/item/rogueweapon/spear/bonespear
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/bone = 2,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 3


/datum/crafting_recipe/roguetown/survival/boneaxe
	name = "костяной топор"
	category = "Инструменты"
	result = /obj/item/rogueweapon/stoneaxe/boneaxe
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/bone = 2,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/woodspade
	name = "деревянная лопата"
	category = "Инструменты"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 1,
		)
/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/survival/rod
	name = "удочка"
	category = "Инструменты"
	result = /obj/item/fishingrod/crafted
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2,
		)


/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/survival/fishingcage
	name = "рыболовная клеть"
	category = "Инструменты"
	result = /obj/item/fishingcage
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 2,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/strucrepairkit
	name = "Набор для ремонта строений"
	category = "Инструменты"
	result = /obj/item/construction/repairkit/structure
	reqs = list(/obj/item/construction/nail = 3,
				/obj/item/natural/wood/plank = 3,
				/obj/item/natural/stoneblock = 3)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 5
