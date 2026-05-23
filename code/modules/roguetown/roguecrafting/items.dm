// Generic category for everything that is related to "general survival".
// Includes some skill diff 0 or 1 recipes that make sense like drying rack.
// This is just basically everything under the generic "crafting" skills
// With a few exceptions atm to be cleared out later.
// Quarterstaff, carpentry etc. you know.
// Previously known as items.dm
/datum/crafting_recipe/roguetown/
	always_availible = TRUE

/datum/crafting_recipe/roguetown/survival
	abstract_type = /datum/crafting_recipe/roguetown/survival/
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/survival/tneedle
	name = "швейная игла"
	result = /obj/item/needle/thorn
	reqs = list(
		/obj/item/natural/thorn = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/cloth
	name = "ткань"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "шить"
	verbage = "шьёт"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/clothbelt
	name = "тканевый пояс"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	verbage_simple = "завязать"
	verbage = "завязывает"

/datum/crafting_recipe/roguetown/survival/unclothbelt
	name = "развязать тканевый пояс"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	craftdiff = 0
	verbage_simple = "развязать"
	verbage = "развязывает"

/datum/crafting_recipe/roguetown/survival/clothsash
	name = "изящный кушак"
	result = /obj/item/storage/belt/rogue/leather/sash
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/ropebelt
	name = "верёвочный пояс"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	craftdiff = 0
	verbage_simple = "завязать"
	verbage = "завязывает"

/datum/crafting_recipe/roguetown/survival/unropebelt
	name = "развязать верёвочный пояс"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	craftdiff = 0
	verbage_simple = "развязать"
	verbage = "развязывает"

/datum/crafting_recipe/roguetown/survival/rope
	name = "верёвка"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage_simple = "плести"
	verbage = "плетёт"

/datum/crafting_recipe/roguetown/survival/rope_leash
	name = "верёвочный поводок"
	result = /obj/item/leash
	reqs = list(/obj/item/rope = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "шить"
	verbage = "шьёт"
	category = "Основное"
	always_availible = TRUE

/datum/crafting_recipe/roguetown/survival/chain_leash
	name = "цепной поводок"
	result = /obj/item/leash/chain
	reqs = list(/obj/item/rope/chain = 1)
	verbage_simple = "изготовить"
	verbage = "изготавливает"
	category = "Основное"
	always_availible = TRUE

/datum/crafting_recipe/roguetown/survival/torch
	name = "факел"
	result = /obj/item/flashlight/flare/torch
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 0


/datum/crafting_recipe/roguetown/survival/mortar
	name = "алхимическая ступка"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/pestle
	name = "каменный пестик"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/bag
	name = "мешок"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/cloth = 1,
		)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/obj/item/storage/roguebag/crafted
	sellprice = 4

/datum/crafting_recipe/roguetown/survival/bait
	name = "наживка"
	result = /obj/item/bait
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/wheat = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/sbaita
	name = "сладкая наживка — яблоко"
	result = /obj/item/bait/sweet
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/apple = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/sbait
	name = "сладкая наживка — ягода"
	result = /obj/item/bait/sweet
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/bloodbait
	name = "кровавая наживка"
	result = /obj/item/bait/bloody
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/rogue/meat = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/pipe
	name = "деревянная трубка"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/survival/broom
	name = "метла"
	result = /obj/item/broom
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 4,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/cheap_kitsune
	name = "резная маска кицунэ"
	result = /obj/item/clothing/mask/rogue/facemask/cheap_kitsune
	reqs = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/small = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/cheap_oni
	name = "резная маска óни"
	result = /obj/item/clothing/mask/rogue/facemask/cheap_oni
	reqs = list(
		/obj/item/natural/cloth = 1,
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/small = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/book_crafting_kit
	name = "набор для переплёта книг"
	result = /obj/item/book_crafting_kit
	reqs = list(
		/obj/item/natural/hide = 2,
		/obj/item/natural/cloth = 1,
		)
	tools = list(/obj/item/needle = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/survival/mantrap
	name = "капкан"
	result = list(
		/obj/item/restraints/legcuffs/beartrap,
		/obj/item/restraints/legcuffs/beartrap,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/ingot/iron = 1,
		)
	req_table = TRUE
	skillcraft = /datum/skill/craft/traps
	craftdiff = 1
	verbage_simple = "собрать"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/survival/paperscroll
	name = "свиток пергамента (x3)"
	result = list(
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/datum/reagent/water = 48,
		)
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/prosthetic/woodleftarm
	name = "деревянная рука (Л)"
	result = list(/obj/item/bodypart/l_arm/prosthetic/woodleft)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodrightarm
	name = "деревянная рука (П)"
	result = list(/obj/item/bodypart/r_arm/prosthetic/woodright)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodleftleft
	name = "деревянная нога (Л)"
	result = list(/obj/item/bodypart/l_leg/prosthetic/woodleft)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodrightleg
	name = "деревянная нога (П)"
	result = list(/obj/item/bodypart/r_leg/prosthetic/woodright)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/tarot_deck
	name = "колода Таро"
	result = list(/obj/item/toy/cards/deck/tarot)
	reqs = list(
		/obj/item/paper/scroll = 3,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/ash = 1,
		)
	skillcraft = /datum/skill/misc/reading
	tools = list(/obj/item/natural/feather)
	req_table = TRUE
	craftdiff = 2

// Woodcutting recipe
/datum/crafting_recipe/roguetown/survival/lumberjacking
	skillcraft = /datum/skill/labor/lumberjacking
	tools = list(/obj/item/rogueweapon/huntingknife = 1)

/datum/crafting_recipe/roguetown/survival/lumberjacking/cart_upgrade
	name = "крепление колеса дровосека"
	result = /obj/item/cart_upgrade/level_1
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/lumberjacking/cart_upgrade2
	name = "усиленное крепление колеса дровосека"
	result = /obj/item/cart_upgrade/level_2
	reqs = list(
		/obj/item/grown/log/tree/small = 4,
		/obj/item/cart_upgrade/level_1 = 1,
		/obj/item/ingot/iron = 1,
		)
	craftdiff = 4


/datum/crafting_recipe/hair_dye
    name = "краска для волос"
    result = /obj/item/hair_dye_cream
    reqs = list(
        /obj/item/reagent_containers/glass/bowl = 1,
        /obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3,
    )

// DIE

/datum/crafting_recipe/roguetown/survival/d4
	name = "костяной кубик (d4)"
	result = /obj/item/dice/d4
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/d6
	name = "костяной кубик (d6)"
	result = /obj/item/dice/d6
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/d8
	name = "костяной кубик (d8)"
	result = /obj/item/dice/d8
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d10
	name = "костяной кубик (d10)"
	result = /obj/item/dice/d10
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d12
	name = "костяной кубик (d12)"
	result = /obj/item/dice/d12
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d20
	name = "костяной кубик (d20)"
	result = /obj/item/dice/d20
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/dye_brush
	name = "кисть для окраски"
	result = /obj/item/dye_brush
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/fur = 1
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/whetstone
	name = "точильный камень"
	result = /obj/item/natural/whetstone
	reqs = list(
		/obj/item/natural/stone = 1,
		/obj/item/grown/log/tree/stake = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/rucksack
	name = "рюкзак"
	result = /obj/item/storage/backpack/rogue/backpack/bagpack
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/rope = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/rucksack/crafted
	reqs = list(/obj/item/storage/roguebag/crafted = 1,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/survival/woodshaft
	name = "деревянное древко (x2)"
	result = list(
		/obj/item/shaft/wood,
		/obj/item/shaft/wood
	)
	tools = list(/obj/item/rogueweapon/huntingknife)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/reinforcedshaft
	name = "усиленное древко"
	result = /obj/item/shaft/reinforced
	tools = list(/obj/item/rogueweapon/hammer)
	reqs = list(
		/obj/item/shaft/wood = 1,
		/obj/item/natural/whetstone = 2,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/handmirror
	name = "ручное зеркало"
	result = /obj/item/handmirror
	reqs = list(
		/obj/item/natural/glass = 1,
		/obj/item/grown/log/tree/stick = 1,
		)
	craftdiff = 2

// Improvised surgey tools. They go here for now (TM)
/datum/crafting_recipe/roguetown/survival/improvisedsaw
	name = "самодельная хирургическая пила"
	result = /obj/item/rogueweapon/surgery/saw/improv
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/stone = 1,
		/obj/item/grown/log/tree/stick = 1,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/improvisedclamp
	name = "самодельный ретрактор"
	result = /obj/item/rogueweapon/surgery/retractor/improv
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 2,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/improvisedhemo
	name = "самодельный зажим"
	result = /obj/item/rogueweapon/surgery/hemostat/improv
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 2,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/improvisescalpel
	name = "самодельный скальпель"
	result = /obj/item/rogueweapon/surgery/scalpel/improv
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/magic/obsidian = 1,
		)
	craftdiff = 1

// Unfortunately there's no good category for it, yet.
// I don't want ration paper to be too expensive, making wrapped food underused
// So instead, ration paper is a very cheap recipe with parchment and tallow (instead of full fat) that makes 2 wrapper
// However, it is heavily skillgated by cooking skill. At Craftdiff 4, only Innkeep / Cook can make it easily off the bat.
// Servant w/ high int can also make it, but it is a bit harder. Or just be middle aged / old instead lol
// For 1 fat, 1 log (48 reagents), you get 4 tallow + 6 piece of paper yielding 12 ration wrappers with 1 tallow leftover.
/datum/crafting_recipe/roguetown/survival/ration_wrapper
	name = "обёрточная бумага для пайка (x2)"
	result = list(
		/obj/item/ration,
		/obj/item/ration,
		)
	reqs = list(
		/obj/item/paper = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		)
	skillcraft = /datum/skill/craft/cooking
	craftdiff = 4


/datum/crafting_recipe/roguetown/survival/cheele
	name = "чиль"
	result = list(
		/obj/item/natural/worms/leech/cheele
		)
	reqs = list(
		/obj/item/reagent_containers/lux = 1,
		/obj/item/natural/worms/leech = 1,
		)
	skillcraft = /datum/skill/misc/medicine
	craftdiff = SKILL_LEVEL_EXPERT
