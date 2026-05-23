// Рецепты луков, стрел и метательного оружия (категория "Дальний бой")

/*/datum/crafting_recipe/roguetown/survival/net
    name = "сеть"
    category = "Дальний бой"
    result = /obj/item/net
    craftdiff = 2
    reqs = list(
        /obj/item/rope = 2,
        /obj/item/natural/stone = 3,
        )
    verbage_simple = "плести"
    verbage = "плетёт"*/

/datum/crafting_recipe/roguetown/survival/bowstring
    name = "волоконная тетива"
    category = "Дальний бой"
    result = /obj/item/natural/bowstring
    reqs = list(/obj/item/natural/fibers = 2)
    verbage_simple = "скрутить"
    verbage = "скручивает"

/datum/crafting_recipe/roguetown/survival/bowpartial
    name = "ненатянутый лук"
    category = "Дальний бой"
    result = /obj/item/grown/log/tree/bowpartial
    reqs = list(/obj/item/grown/log/tree/small = 1)
    tools = /obj/item/rogueweapon/huntingknife
    verbage_simple = "вырезать"
    verbage = "вырезает"

/datum/crafting_recipe/roguetown/survival/bow
    name = "деревянный лук"
    category = "Дальний бой"
    result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
    reqs = list(
        /obj/item/natural/bowstring = 1,
        /obj/item/grown/log/tree/bowpartial = 1,
        )
    verbage_simple = "натянуть тетиву"
    verbage = "натягивает тетиву"
    craftdiff = 2

/datum/crafting_recipe/roguetown/survival/recurvepartial
    name = "ненатянутый обратный лук"
    category = "Дальний бой"
    result = /obj/item/grown/log/tree/bowpartial/recurve
    reqs = list(
        /obj/item/grown/log/tree = 1,
        /obj/item/natural/bone = 2,
        /obj/item/reagent_containers/food/snacks/tallow = 1,
        /obj/item/natural/fibers = 2,
        )
    tools = /obj/item/rogueweapon/huntingknife
    verbage_simple = "вырезать"
    verbage = "вырезает"
    craftdiff = 3

/datum/crafting_recipe/roguetown/survival/recurvebow
    name = "обратный лук"
    category = "Дальний бой"
    result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
    reqs = list(
        /obj/item/natural/bowstring = 1,
        /obj/item/grown/log/tree/bowpartial/recurve = 1,
        )
    verbage_simple = "натянуть тетиву"
    verbage = "натягивает тетиву"
    craftdiff = 3

/datum/crafting_recipe/roguetown/survival/longbowpartial
    name = "ненатянутый длинный лук"
    category = "Дальний бой"
    result = /obj/item/grown/log/tree/bowpartial/longbow
    reqs = list(
        /obj/item/grown/log/tree = 1,
        /obj/item/natural/cloth = 1,
        /obj/item/reagent_containers/food/snacks/tallow = 1,
        /obj/item/natural/fibers = 2,
        )
    tools = /obj/item/rogueweapon/huntingknife
    verbage_simple = "вырезать"
    verbage = "вырезает"
    craftdiff = 4

/datum/crafting_recipe/roguetown/survival/longbow
    name = "длинный лук"
    category = "Дальний бой"
    result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
    reqs = list(
        /obj/item/natural/bowstring = 1,
        /obj/item/grown/log/tree/bowpartial/longbow = 1,
        )
    verbage_simple = "натянуть тетиву"
    verbage = "натягивает тетиву"
    craftdiff = 4

/datum/crafting_recipe/roguetown/survival/longbow_warden
	name = "длинный лук Чёрный Рог"
	category = "Дальний бой"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/warden
	reqs = list(
		/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow = 1,
		/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve/warden = 1,
	)
	verbage_simple = "перенатянуть"
	verbage = "перенатягивает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/stonearrow
    name = "каменная стрела"
    category = "Дальний бой"
    result = /obj/item/ammo_casing/caseless/rogue/arrow/stone
    reqs = list(
        /obj/item/grown/log/tree/stick = 1,
        /obj/item/natural/stone = 1,
        )
    req_table = TRUE

/datum/crafting_recipe/roguetown/survival/stonearrow_five
    name = "каменная стрела (x5)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/stone,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone
        )
    reqs = list(
        /obj/item/grown/log/tree/stick = 5,
        /obj/item/natural/stone = 5,
        )
    req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow
    name = "отравленная стрела"
    category = "Дальний бой"
    result = /obj/item/ammo_casing/caseless/rogue/arrow/poison
    reqs = list(
                /obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
                /datum/reagent/toxin/berrypoison = 5
                )
    req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow_stone
    name = "отравленная каменная стрела"
    category = "Дальний бой"
    result = /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
    reqs = list(
                /obj/item/ammo_casing/caseless/rogue/arrow/stone = 1,
                /datum/reagent/toxin/berrypoison = 5
                )
    req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow_five
    name = "отравленная стрела (x5)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/poison,
        )
    reqs = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
        /datum/reagent/toxin/berrypoison = 25,
        )

    req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow_five_stone
    name = "отравленная каменная стрела (x5)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
        /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
        )
    reqs = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/stone = 5,
        /datum/reagent/toxin/berrypoison = 25,
        )

    req_table = TRUE


/datum/crafting_recipe/roguetown/survival/waterbolt_ten
    name = "водяной болт (x10)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
    )
    reqs = list(
        /obj/item/natural/glass_shard = 1,
        /obj/item/grown/log/tree/stick = 10,
        )
    req_table = TRUE
    craftdiff = 0
    skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterbolt_twenty
    name = "водяной болт (x20)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        /obj/item/ammo_casing/caseless/rogue/bolt/water,
        )
    reqs = list(
        /obj/item/natural/glass_shard = 2,
        /obj/item/grown/log/tree/stick = 10,
        )
    req_table = TRUE
    craftdiff = 0
    skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterarrow_ten
    name = "водяная стрела (x10)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        )
    reqs = list(
        /obj/item/natural/glass_shard = 1,
        /obj/item/grown/log/tree/stick = 10,
        )
    req_table = TRUE
    craftdiff = 0
    skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterarrow_twenty
    name = "водяная стрела (x20)"
    category = "Дальний бой"
    result = list(
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        /obj/item/ammo_casing/caseless/rogue/arrow/water,
        )
    reqs = list(
        /obj/item/natural/glass_shard = 2,
        /obj/item/grown/log/tree/stick = 20,
        )
    req_table = TRUE
    craftdiff = 0
    skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/slingcraft
	name = "праща"
	category = "Дальний бой"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
	reqs = list(/obj/item/natural/fibers = 6)
	verbage_simple = "скрутить"
	verbage = "скручивает"
	craftdiff = 1 //you should make some ammo first!
	
/datum/crafting_recipe/roguetown/survival/slingpouchcraft
	name = "подсумок для пуль к праще"
	category = "Дальний бой"
	result = /obj/item/quiver/sling/
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/cloth = 1,
		)
	verbage_simple = "изготовить"
	verbage = "изготавливает"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/stonebullets
	name = "пули для пращи — каменные (x2)"
	category = "Дальний бой"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		)
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "обточить"
	verbage = "обтачивает"
	craftdiff = 0
	
/datum/crafting_recipe/roguetown/survival/stonebullets10x
	name = "пули для пращи — каменные (x10)"
	category = "Дальний бой"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		)
	reqs = list(/obj/item/natural/stone = 5)
	verbage_simple = "обточить"
	verbage = "обтачивает"
	craftdiff = 0
