/datum/crafting_recipe/roguetown/leather
	abstract_type = /datum/crafting_recipe/roguetown/leather
	tools = list(/obj/item/needle)
	structurecraft = /obj/machinery/tanningrack
	skillcraft = /datum/skill/craft/tanning
	subtype_reqs = TRUE		//Makes it so fur-subtypes work. Basically if anything is just 'obj/item/natural/fur' - it'll take any fur. If it specifies 'natural/fur/direbear' - it will still require direbear.

/datum/crafting_recipe/roguetown/leather/bedroll
	name = "спальный мешок"
	result = /obj/item/bedroll
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/rope = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "соорудить"
	verbage = "сооружает"
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/peltbedsheet
	name = "простыня из шкуры"
	result = /obj/item/bedsheet/rogue/pelt
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/doublepeltbedsheet
	name = "двойная простыня из шкуры"
	result = /obj/item/bedsheet/rogue/double_pelt
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/fur = 2)
	tools = list(/obj/item/needle)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/corset
	name = "корсет (1 волокно, 1 кожа)"
	result = /obj/item/clothing/suit/roguetown/shirt/undershirt/corset
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	sellprice = 15
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/gloves
	name = "кожаные перчатки"
	result = list(/obj/item/clothing/gloves/roguetown/leather,
	/obj/item/clothing/gloves/roguetown/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/heavygloves
	name = "тёплые кожаные рукавицы"
	result = /obj/item/clothing/gloves/roguetown/angle
	reqs = list(/obj/item/natural/fur = 1)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/fingerless_leather_gloves
	name = "кожаные перчатки без пальцев"
	result = /obj/item/clothing/gloves/roguetown/fingerless_leather
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/bandana
	name = "кожаная бандана"
	result = /obj/item/clothing/head/roguetown/helmet/bandana
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27
	craftdiff = 0

/datum/crafting_recipe/roguetown/leather/tricorn
	name = "кожаная треуголка"
	result = /obj/item/clothing/head/roguetown/helmet/tricorn
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/hood
	name = "кожаный капюшон"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/coif
	name = "кожаный подшлемник"
	result = /obj/item/clothing/neck/roguetown/coif
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/vest
	name = "кожаный жилет"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/bikini
	name = "кожаный корслет"
	result = /obj/item/clothing/suit/roguetown/armor/leather/bikini
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/hidebikini
	name = "корслет из шкуры"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/cloak
	name = "дождевой плащ"
	result = /obj/item/clothing/cloak/raincloak/brown
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/apron/blacksmith
	name = "кожаный фартук"
	result = /obj/item/clothing/cloak/apron/blacksmith
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/leather/cloakfur
	name = "меховой плащ"
	result = /obj/item/clothing/cloak/raincloak/furcloak/crafted
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/fur = 1)

/obj/item/clothing/cloak/raincloak/furcloak/crafted
	sellprice = 55

/datum/crafting_recipe/roguetown/leather/papakha
	name = "шапка-папаха"
	result = /obj/item/clothing/head/roguetown/papakha/crafted
	reqs = list(/obj/item/natural/fur = 1, /obj/item/natural/fibers = 2)

/obj/item/clothing/head/roguetown/papakha/crafted
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/saddle
	name = "седло"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/whip
	name = "кожаный кнут"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/stone = 1)
	sellprice = 39

/datum/crafting_recipe/roguetown/leather/drum
	name = "барабан"
	result = /obj/item/rogue/instrument/drum
	reqs = list(/obj/item/natural/hide/cured = 1,/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/leather/vest/sailor
	name = "морская кожаная куртка"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/darkcloak
	name = "тёмный плащ"
	result = list(/obj/item/clothing/cloak/darkcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 5
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/bearcloak
	name = "плащ из лютого медведя"
	result = list(/obj/item/clothing/cloak/darkcloak/bear)
	reqs = list(/obj/item/natural/fur/direbear = 1,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 3
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/lightbearcloak
	name = "лёгкий плащ из лютого медведя"
	result = list(/obj/item/clothing/cloak/darkcloak/bear/light)
	reqs = list(/obj/item/natural/fur/direbear = 1,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 3
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/leathertights
	name = "кожаные трико"
	result = list(/obj/item/clothing/under/roguetown/trou/leathertights)
	reqs = list(/obj/item/natural/hide/cured = 2)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/neck/leather_leash
	name = "кожаный поводок"
	result = /obj/item/leash/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	time = 10 SECONDS
	always_availible = TRUE

/datum/crafting_recipe/roguetown/leather/skillbook
	name = "незаконченная книга навыков"
	result = /obj/item/skillbook/unfinished
	reqs = list(/obj/item/natural/hide/cured = 1, /obj/item/paper = 1)
	tools = list(/obj/item/needle)
	time = 10 SECONDS
	structurecraft = null//surely it's possible to stitch a book and paper together without a drying rack...
	craftdiff = 1
	always_availible = TRUE
