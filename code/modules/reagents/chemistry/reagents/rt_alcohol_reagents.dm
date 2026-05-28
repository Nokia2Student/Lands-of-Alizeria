// Just store all of the alcohol reagents that isn't base tg here
/datum/reagent/consumable/ethanol/beer
	name = "Пиво"
	description = ""
	color = "#a17c10" // rgb: 102, 67, 0
	nutriment_factor = 0.1
	boozepwr = 25
	taste_description = "эль"
	glass_name = "стакан пива"
	glass_desc = ""

/datum/reagent/consumable/ethanol/rum
	name = "Ром"
	description = "Куда делся ром?"
	color = "#5f3b23" // rgb: 102, 67, 0
	boozepwr = 40
	taste_description = "сладость с оттенком карамели и ванили"

/datum/reagent/consumable/ethanol/cider
	name = "Яблочный сидр"
	boozepwr = 40
	taste_description = "свежая яблочная хрусткость"
	glass_name = "стакан сидра"
	color = "#6aa945"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/cider/pear
	name = "Грушевый сидр"
	boozepwr = 40
	taste_description = "нежная грушевая сладость"
	glass_name = "стакан грушевого сидра"
	color = "fffc6c"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/cider/strawberry
	name = "Клубничный сидр"
	boozepwr = 40
	taste_description = "тонкий намёк на клубничную сладость"
	color = "#da4d4d"
	taste_description = "клубничный сидр"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/aqua_vitae
	name = "Аква Вита"
	boozepwr = 150
	taste_description = "смерть"
	color = "#6e6e6e"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/brandy
	name = "Яблочный бренди"
	boozepwr = 60
	taste_description = "карамельно-дубовый бренди"
	glass_name = "бокал бренди"
	color = "#6aa945"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/brandy/pear
	name = "Грушевый бренди"
	boozepwr = 60
	taste_description = "спелая груша с пряной искоркой"
	color = "b9b607"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/brandy/strawberry
	name = "Клубничный бренди"
	boozepwr = 60
	taste_description = "густая сладость с мягким послевкусием"
	color = "#bb1a1a"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/brandy/tangerine
	name = "Мандариновый бренди"
	boozepwr = 60
	taste_description = "пряность с цитрусовым акцентом"
	color = "#bb751a"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/brandy/plum
	name = "Сливовый бренди"
	boozepwr = 60
	taste_description = "пурпурная сладость и ваниль"
	color = "#5c0449"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/wine
	name = "Вино"
	boozepwr = 30
	taste_description = "вино"
	glass_name = "бокал вина"
	color = "#8a0b0b"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/light
	name = "Лёгкое пиво"
	description = "Алкогольный напиток, сваренный с древних времён на Старой Земле. Этот сорт обладает пониженной калорийностью и крепостью."
	boozepwr = 5 //Space Europeans hate it
	taste_description = "помои"
	glass_name = "стакан лёгкого пива"
	glass_desc = ""

/datum/reagent/consumable/ethanol/green
	name = "Зелёное пиво"
	description = "Алкогольный напиток, сваренный с древних времён на Старой Земле. Этот сорт окрашен в праздничный зелёный цвет."
	color = "#A8E61D"
	taste_description = "зелёная моча"
	glass_icon_state = "greenbeerglass"
	glass_name = "стакан зелёного пива"
	glass_desc = ""

/datum/reagent/consumable/ethanol/green/on_mob_life(mob/living/carbon/M)
	if(M.color != color)
		M.add_atom_colour(color, TEMPORARY_COLOUR_PRIORITY)
	return ..()

/datum/reagent/consumable/ethanol/green/on_mob_end_metabolize(mob/living/M)
	M.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY, color)

/datum/reagent/consumable/ethanol/ale
	name = "Эль"
	description = "Тёмный алкогольный напиток из соложёного ячменя и дрожжей."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 25
	taste_description = "ядрёный ячменный эль"
	glass_icon_state = "aleglass"
	glass_name = "кружка эля"
	glass_desc = ""


// BEERS - Imported for now, later the styles will be 'mockable', if and when I get to brewing.

// Humen Production - Underwhelming, but cheap.

/datum/reagent/consumable/ethanol/zagul
	name = "Лагер Загул"
	boozepwr = 15
	taste_description = "дешёвая моча"
	color = "#DBD77F"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/gin
	name = "Джин"
	boozepwr = 65
	taste_description = "резкий, хвойный вкус"
	color = "#809978"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/spottedhen
	name = "Пятнистая курица"
	boozepwr = 15
	taste_description = "дешёвая моча"
	color = "#DBD77F"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/hagwoodbitter
	name = "Горькое пиво Грензельхофта"
	boozepwr = 25
	taste_description = "пресная горечь"
	color = "#BBB525"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/blackgoat
	name = "Чёрный козёл"
	boozepwr = 25
	taste_description = "обжигающая кислота"
	color = "#401806"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/onion
	name = "Коньяк «Крысиная заначка»"
	boozepwr = 10
	taste_description = "пряная сладость с солодовыми оттенками"
	color = "#683e00"
	quality = DRINK_NICE

// Elf Production - LEAF-LOVERS MOTHERFUCKER

/datum/reagent/consumable/ethanol/aurorian
	name = "Аурориан"
	boozepwr = 5
	taste_description = "тонкие травяные нотки"
	color = "#5D8A8A"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/fireleaf // cabbbage
	name = "Огненный лист"
	boozepwr = 2
	taste_description = "отвратительный ликёр"
	color = "#475e45"
	quality = DRINK_NICE

// Dwarven Production - Best in the Realms

/datum/reagent/consumable/ethanol/butterhairs
	name = "Масляные косы"
	boozepwr = 30
	taste_description = "маслянистая насыщенность"
	color = "#5D8A8A"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/stonebeards
	name = "Резерв Каменной Бороды"
	boozepwr = 40
	taste_description = "крепкий овсяный ликёр"
	color = "#5D8A8A"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/voddena // Definitely Actually Just Vodka Now. 
	name = "Воддена"
	boozepwr = 40  // now it's just vodka
	taste_description = "чистый алкоголь"
	color = "#a1a1a1"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/sazdistal // Definitely Not Vodka. 
	name = "Сац-Дисталь"
	boozepwr = 55  // holy shit
	taste_description = "жгучий перец, имбирь и земля"
	color = "#2D1D1D"
	quality = DRINK_GOOD	

/datum/reagent/consumable/ethanol/limoncello
	name = "Лимончелло"
	boozepwr = 45  // holy shit
	taste_description = "жгучий и лимонный"
	color = "#d2da63"
	quality = DRINK_GOOD

// Generic Rice
/datum/reagent/consumable/ethanol/ricewine
	name = "Рисовое вино"
	taste_description = "цветочная сладость с тонким умами"
	color = "#F5E6C4" // rgb: 210, 218, 99
	boozepwr = 30

/datum/reagent/consumable/ethanol/ricespirit
	name = "Рисовый спирт"
	taste_description = "чистое тепло и сухое послевкусие"
	color = "#F8FDFC" // rgb: 210, 218, 99
	boozepwr = 55
	quality = DRINK_NICE

// WINE - Fancy.

// Humen Production - Grape Based

/datum/reagent/consumable/ethanol/sourwine // Peasant grade shit.
	name = "Кислое вино"
	boozepwr = 20
	taste_description = "кислое вино"
	color = "#552b4b"

/datum/reagent/consumable/ethanol/whitewine
	name = "Белое вино"
	boozepwr = 30
	taste_description = "сладкое белое вино"
	color = "#F3ED91"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/redwine
	name = "Красное вино"
	boozepwr = 30
	taste_description = "вино с яркими танинами"
	color = "#571111"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/jackberrywine
	name = "Ежевичное вино"
	boozepwr = 15
	taste_description = "приторно-сладкое молодое вино"
	color = "#3b2342"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/jackberrywine/aged
	name = "Выдержанное ежевичное вино"
	boozepwr = 30
	taste_description = "сладкое выдержанное вино"
	color = "#402249"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/jackberrywine/delectable
	name = "Изысканное ежевичное вино"
	boozepwr = 30
	taste_description = "изысканно сладкое выдержанное вино"
	color = "#652679"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/plum_wine
	name = "Умешу"
	boozepwr = 15
	taste_description = "приторно-кислое молодое вино"
	color = "#c997d8"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/plum_wine/aged
	name = "Выдержанное умешу"
	boozepwr = 30
	taste_description = "сладкое с лёгкой кислинкой выдержанное вино"
	color = "#c27cd8"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/plum_wine/delectable
	name = "Изысканное умешу"
	boozepwr = 30
	taste_description = "изысканно выдержанное кисло-сладкое вино"
	color = "#a854c2"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/tangerine
	name = "Мандариновое вино"
	boozepwr = 15
	taste_description = "горьковато-сладкое цитрусовое молодое вино"
	color = "#e7aa59"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/tangerine/aged
	name = "Выдержанное мандариновое вино"
	boozepwr = 30
	taste_description = "горьковато-сладкое цитрусовое выдержанное вино"
	color = "#d68d2d"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/tangerine/delectable
	name = "Изысканное мандариновое вино"
	boozepwr = 30
	taste_description = "горьковато-сладкое цитрусовое изысканно выдержанное вино"
	color = "#eb9321"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/raspberry
	name = "Малиновое вино"
	boozepwr = 15
	taste_description = "терпко-сладкое молодое вино"
	color = "#ee5ea6"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/raspberry/aged
	name = "Выдержанное малиновое вино"
	boozepwr = 30
	taste_description = "терпко-сладкое выдержанное вино"
	color = "#d83788"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/raspberry/delectable
	name = "Изысканное малиновое вино"
	boozepwr = 30
	taste_description = "терпко-сладкое изысканно выдержанное вино"
	color = "#db0d74"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/blackberry
	name = "Черничное вино"
	boozepwr = 15
	taste_description = "горько-терпкое молодое вино"
	color = "#861491"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/blackberry/aged
	name = "Выдержанное черничное вино"
	boozepwr = 30
	taste_description = "горько-терпкое выдержанное вино"
	color = "#58065f"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/blackberry/delectable
	name = "Изысканное черничное вино"
	boozepwr = 30
	taste_description = "горько-терпкое изысканно выдержанное вино"
	color = "#330038"
	quality = DRINK_VERYGOOD

// Elf Production - Berries & Herbal

/datum/reagent/consumable/ethanol/elfred
	name = "Эльфийское красное"
	boozepwr = 15
	taste_description = "изысканные фруктовые ноты"
	color = "#6C0000"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/elfblue
	name = "Лазурное вино Вальмора"
	boozepwr = 50
	taste_description = "божественная сладость"
	color = "#2C9DAF"
	quality = DRINK_FANTASTIC

// Azure Drinks
/datum/reagent/consumable/ethanol/jagdtrunk // JÄGERMEISTER!!!!
	name = "Ягдтрунк"
	boozepwr = 55  // gotta be stronk
	taste_description = "пряное травяное снадобье"
	color = "#331f18"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/apfelweinheim
	name = "Апфельвайнхаймский сидр"
	boozepwr = 45
	taste_description = "терпкая свежесть и мягкая сладость"
	color = "#e0cb55"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/rtoper
	name = "Рокхилл Тоупер"
	boozepwr = 40
	taste_description = "мощная терпкость"
	color = "#e0a400"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/nred
	name = "Норвандинский красный эль"
	boozepwr = 30
	taste_description = "насыщенная карамельная нота с лёгкой горчинкой"
	color = "#543633"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/gronnmead
	name = "Мёд Рагнара"
	boozepwr = 35
	taste_description = "ноты мёда и красных ягод" //I love red mead ok...
	color = "#772C48"
	quality = DRINK_GOOD

//Avar boozes

/datum/reagent/consumable/ethanol/avarmead
	name = "Зёгийн бал"
	boozepwr = 30
	taste_description = "пряный мёд"
	color = "#e0a400"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/avarrice
	name = "Макколир"
	boozepwr = 30
	taste_description = "кисло-сладкий вкус"
	color = "#ddcbc9"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/saigamilk //No way, kumys from avar!!!
	name = "Бёхийн Архи"
	boozepwr = 15
	taste_description = "шипучая кислая соль"
	color = "#dddddd"

//Kazengun boozes

/datum/reagent/consumable/ethanol/kgunlager
	name = "Ямагути Пэйл"
	boozepwr = 10 //A PALE imitation actual beer...
	taste_description = "мягкая горечь с оттенком зелёного чая"
	color = "#d7dbbc"

/datum/reagent/consumable/ethanol/kgunsake
	name = "Джунмай-гиндзё"
	boozepwr = 50
	taste_description = "сухая сладость"
	color = "#ccd7e0"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/kgunshochu
	name = "Сётю"
	boozepwr = 60
	taste_description = "сухое, чистое послевкусие"
	color = "#F8FDFC"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/kgunplum
	name = "Умешу"
	boozepwr = 30
	taste_description = "смесь сладкого и кислого"
	color = "#ddb99b"
	quality = DRINK_GOOD

// Zhongese
/datum/reagent/consumable/ethanol/huangjiu
	name = "Хуанцзю"
	boozepwr = 30
	taste_description = "смесь сладкого и кислого"
	color = "#d8b84c"

/datum/reagent/consumable/ethanol/baijiu
	name = "Байцзю"
	boozepwr = 60
	taste_description = "огненный и резкий алкоголь с ноткой сладости"
	color = "#f8fdfc"
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/yaojiu
	name = "Яоцзю"
	boozepwr = 50
	taste_description = "горько-сладкий алкоголь с глубокими травяными нотами"
	color = "#8C4B1F"
	quality = DRINK_VERYGOOD

/datum/reagent/consumable/ethanol/shejiu
	name = "Шэцзю"
	boozepwr = 50
	taste_description = "мускусный и крепкий алкоголь с оттенком дичи"
	color = "#C49A6C"
	quality = DRINK_VERYGOOD

// Mead 
/datum/reagent/consumable/ethanol/mead
	name = "Мёд"
	description = "Напиток воинов, хоть и дёшев."
	color = "#664300" // rgb: 102, 67, 0
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 30
	quality = DRINK_NICE
	taste_description = "сладкий-пресладкий алкоголь"
	glass_icon_state = "meadglass"
	glass_name = "Мёд"
	glass_desc = ""

/datum/reagent/consumable/ethanol/mead/spider
	color = "#660061"

// Special Drugs
/datum/reagent/consumable/ethanol/murkwine // not Toilet wine
	name = "Мутное вино"
	boozepwr = 50  // bubba's best
	taste_description = "ноты сомнительных решений — букет мутной воды и чистого этанола"
	color = "#4b1e00"

/datum/reagent/consumable/ethanol/murkwine/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/murkwine)
	M.stamina_add(0.1)
	..()
	. = 1

/datum/reagent/consumable/ethanol/murkwine/on_mob_end_metabolize(mob/living/M)
	M.remove_status_effect(/datum/status_effect/buff/murkwine)

/datum/reagent/consumable/ethanol/nocshine // wait, no, NOCSHINE
	name = "Самогон Нокса"
	boozepwr = 70  // YEEEEEHAAAWWWWWW
	taste_description = "то ли плавится горло, то ли горят волосы в носу"
	color = "#d8fbfd63"
	quality = DRINK_NICE


/datum/reagent/consumable/ethanol/nocshine/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/nocshine)
	if(HAS_TRAIT(M, TRAIT_CRACKHEAD))
		M.adjustToxLoss(0.1, 0)
	else
		M.adjustToxLoss(0.75, 0)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nocshine/on_mob_end_metabolize(mob/living/M)
	M.remove_status_effect(/datum/status_effect/buff/nocshine)

/datum/reagent/consumable/ethanol/luxwine
	name = "Люксинтебере"
	boozepwr = 100 //get out of here nocshine this is made for true alcohol vicers
	taste_description = "зелёное онемение, а затем жгучая бодрость в сердце"
	color = "#86CCA3"
	quality = DRINK_FANTASTIC //having this should get you fragged so it should be worth the risk
	overdose_threshold = 10


/datum/reagent/consumable/ethanol/luxwine/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/vitae) //its still lux
	..()
	. = 1

/datum/reagent/consumable/ethanol/luxwine/on_mob_life(mob/living/carbon/M)
	if(M.has_flaw(/datum/charflaw/addiction/junkie))
		M.sate_addiction()
	M.apply_status_effect(/datum/status_effect/buff/vitae)
	..()

/datum/reagent/consumable/ethanol/luxwine/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.25*REM)
	M.adjustFireLoss(0.25*REM, 0)
	..()
	. = 1\
