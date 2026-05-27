// КАРТИНЫ
/obj/structure/fluff/walldeco/alizeriapaintings/queen
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Картина императрицы-изменницы. Многие фанатики кодекса её проклинают, а некоторые видят в ней объект для подражания. Последние обычно не приветствуются обществом."
	name = "картина"
	icon_state = "picture_queen"

/obj/structure/fluff/walldeco/alizeriapaintings/monsters
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Картина троицы основных демонических сил, что существовали ещё до создания империи."
	name = "картина"
	icon_state = "picture_monsters"

/obj/structure/fluff/walldeco/alizeriapaintings/muscet
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Картина знаменитой мушкетёрши, которая дослужилась до личного гвардейца регента Монфора."
	name = "картина"
	icon_state = "picture_muscet"

/obj/structure/fluff/walldeco/alizeriapaintings/crown
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Картина короны, которую когда-то давно позволяли себе носить бароны."
	name = "картина"
	icon_state = "picture_crown"

/obj/structure/fluff/walldeco/alizeriapaintings/sybaris
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Картина забытого города. Когда-то давно там произошла какая-то трагедия. Впрочем - всем было на неё всё равно, однако город был красивым."
	name = "картина"
	icon_state = "picture_sybaris"

/obj/structure/fluff/walldeco/alizeriapaintings/demon
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Тревожная картина. Точно неизвестно, кто именно на ней изображён."
	name = "картина"
	icon_state = "picture_demon"

/obj/structure/fluff/walldeco/alizeriapaintings/strange
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Странная картина ночного города. Нарисована безумцем."
	name = "картина"
	icon_state = "picture_strange"

/obj/structure/fluff/walldeco/alizeriapaintings/cat
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = "Знаменитая картина самого кровожадного преступника, домашнего кота кайзера - Мупи. Обвиняется в: преднамеренном сбрасывании статуэтки Императрицы с комода(статуэтка была его же), организации подкроватного партизанского движения с использованием клубков шерсти, тактическом блокировании эвакуационного выхода (дверь в кухню) путём растяжки из собственного хвоста, взломе закрытого шкафа с хрусталём (способ — метод тарана головой), психологической операции «Мимолётная ласка», после которой жертва теряет веру в человечество, самовольном захвате кресла с последующим имитированием смертельной усталости, глумлении над трупом дивана (выдирание ниток из подлокотника), вандализме в отношении занавесок методом вертикального подъёма с когтями, незаконном хранении украденной заколки для волос в миске с кормом, массовом дезертирстве крыс из подвала после демонстрации кошачьего «пляски смерти», лженаучной деятельности по преобразованию газет в мелкие прямоугольные конфиски, организации «мокрухи» с участием мухи (труп расчленён лапами, усы разбросаны), шпионаже за хозяевами в душевой через 2-миллиметровую щель двери, насильственном принуждении человека к ношению мебельных царапин на руках в качестве трофеев, убийстве времени путём 5-часового вылизывания ануса в поле зрения гостей, доведении до белого каления трёх домочадцев одним многократным «мяу» в замочную скважину, хладнокровном затоплении ванной комнаты лапой, запущенной в стакан с зубной пастой, создании оборонительного рубежа из рассыпанного наполнителя лотка на пороге спальни, и наконец — невыносимо милом взгляде, который суды признали орудием пытки совести. Если вы его найдёте - пожалуйста, сообщите в посольство Гриммшталя. Кайзер по нему скучает."
	name = "картина"
	icon_state = "picture_cat"
	var/examined_players = list()

/obj/structure/fluff/walldeco/alizeriapaintings/cat/examine(mob/user)
	. = ..()
	. += "<br><span style='font-size: 1.5em; font-weight: bold; color: #00FF00;'>Пасхалка! Вам повезло это увидеть.</span>"

	if(!(user.ckey in examined_players))
		examined_players += user.ckey
		user.adjust_triumphs(1)


// ТАБУРЕТЫ
/obj/item/chair/stool/alizeriadecoritem/stool1
	name = "роскошный табурет"
	icon_state = "stool_toppled"
	item_state = "stool"
	origin_type = /obj/structure/chair/alizeriadecor/stool1
	break_chance = 0 //It's too sturdy.

/obj/item/chair/stool/alizeriadecoritem/stool2
	name = "роскошный табурет"
	icon_state = "stool_toppled"
	item_state = "stool"
	origin_type = /obj/structure/chair/alizeriadecor/stool2
	break_chance = 0 //It's too sturdy.

/obj/item/chair/stool/alizeriadecoritem/stool3
	name = "роскошный табурет"
	icon_state = "stool_toppled"
	item_state = "stool"
	origin_type = /obj/structure/chair/alizeriadecor/stool3
	break_chance = 0 //It's too sturdy.

/obj/structure/chair/alizeriadecor/stool1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "роскошный табурет"
	desc = ""
	icon_state = "decor_stool1"
	can_buckle = 0
	buildstackamount = 1
	item_chair = /obj/item/chair/stool/alizeriadecoritem/stool1

/obj/structure/chair/alizeriadecor/stool2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "роскошный табурет"
	desc = ""
	icon_state = "decor_stool2"
	can_buckle = 0
	buildstackamount = 1
	item_chair = /obj/item/chair/stool/alizeriadecoritem/stool2

/obj/structure/chair/alizeriadecor/stool3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "роскошный табурет"
	desc = ""
	icon_state = "decor_stool3"
	can_buckle = 0
	buildstackamount = 1
	item_chair = /obj/item/chair/stool/alizeriadecoritem/stool3




// СТОЛБЫ
/obj/structure/fluff/statue/alizeriadecor/stolb1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "колонна"
	desc = ""
	icon_state = "decor_stolb1"

/obj/structure/fluff/statue/alizeriadecor/stolb2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "колонна"
	desc = ""
	icon_state = "decor_stolb2"

/obj/structure/fluff/statue/alizeriadecor/stolb3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "колонна"
	desc = ""
	icon_state = "decor_stolb3"

// ФЛАГИ
/obj/structure/fluff/walldeco/alizeria/decor/flag1
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag1"

/obj/structure/fluff/walldeco/alizeria/decor/flag2
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag2"

/obj/structure/fluff/walldeco/alizeria/decor/flag3
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag3"

/obj/structure/fluff/walldeco/alizeria/decor/flag7
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag7"

/obj/structure/fluff/walldeco/alizeria/decor/flag8
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag8"

/obj/structure/fluff/walldeco/alizeria/decor/flag9
	name = "флаг города"
	desc = "Обычное знамя города."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag9"

/obj/structure/fluff/walldeco/alizeria/decor/flag4
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag4"

/obj/structure/fluff/walldeco/alizeria/decor/flag5
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag5"

/obj/structure/fluff/walldeco/alizeria/decor/flag6
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag6"

/obj/structure/fluff/walldeco/alizeria/decor/flag10
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag10"

/obj/structure/fluff/walldeco/alizeria/decor/flag11
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag11"

/obj/structure/fluff/walldeco/alizeria/decor/flag12
	name = "флаг жандармерии"
	desc = "Обычное знамя жандармерии."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag12"

/obj/structure/fluff/walldeco/alizeria/decor/flag13
	name = "флаг неизвестного королевства"
	desc = "Обычное знамя какого-то враждебного королевства. Его воины являются настоящими психами, следует быть крайне осторожным."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "flag13"

/obj/structure/fluff/walldeco/alizeria/decor/flagorkind1
	name = "флаг оркоидов"
	desc = "Флаг мерзких оркоидов. Будь осторожен, они где-то рядом."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "banner_orkind1"

/obj/structure/fluff/walldeco/alizeria/decor/flagorkind2
	name = "флаг оркоидов"
	desc = "Флаг мерзких оркоидов. Будь осторожен, они где-то рядом."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "banner_orkind2"



// ТАБЛИЧКИ
/obj/structure/fluff/walldeco/alizeria/decor/sign1
	name = "табличка бара"
	desc = "Дешёвая, еле держащаяся табличка с надписью 'Бар'."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "sign1"

/obj/structure/fluff/walldeco/alizeria/decor/sign2
	name = "табличка кафе"
	desc = "Роскошная, позолоченная табличка с надписью 'Кафе'."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "sign2"

/obj/structure/fluff/walldeco/alizeria/decor/sign3
	name = "табличка кабаре"
	desc = "Роскошная, позолоченная табличка с надписью 'Кабаре'."
	icon = 'icons/roguetown/alizeria/decor64x32.dmi'
	icon_state = "sign3"



// ЛИСТЬЯ
/obj/structure/flora/alizeria/decor/leaves1
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves1"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves2
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves2"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves3
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves3"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves4
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves4"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves5
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves5"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves6
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves6"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves7
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves7"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves8
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves8"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves9
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves9"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

/obj/structure/flora/alizeria/decor/leaves10
	name = "листья"
	desc = "Кучка опавших листьев."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "leaves10"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	blade_dulling = DULLING_CUT
	plane = GAME_PLANE

// ЯЩИКИ И ШКАФЫ
/obj/structure/closet/crate/roguecloset/inn/south/alizeria/closet1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	base_icon_state = "decor_darkshelf1"
	icon_state = "decor_darkshelf1"
	dir = SOUTH
	pixel_y = 16

/obj/structure/rack/rogue/shelf/alizeria/shelf1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "decor_shelf1"
	density = FALSE
	climbable = FALSE
	dir = SOUTH
	pixel_y = 32

/obj/structure/rack/rogue/shelf/alizeria/shelf2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "decor_shelf2"
	density = FALSE
	climbable = FALSE
	dir = SOUTH
	pixel_y = 32



// ЗАБОР
/obj/structure/bars/alizeria/decor/fence1
	name = "забор"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "fence1"



// ТАЙЛЫ
/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile1"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile2"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile8"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile9"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood5
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile7"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood6
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile14"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood7
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile13"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/carpet1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile2"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/carpet/alizeria/tiles/carpet1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile3"

/turf/open/floor/carpet/alizeria/tiles/carpet2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile4"

/turf/open/floor/carpet/alizeria/tiles/carpet3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile5"

/turf/open/floor/carpet/alizeria/tiles/carpet4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile6"

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood8
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile10"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood9
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile11"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood10
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile12"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/tile/alizeria/tiles/stonefloor1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile15"

/turf/open/floor/rogue/tile/alizeria/tiles/stonefloor2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile16"

/turf/open/floor/rogue/tile/alizeria/tiles/stonefloor3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile17"

/turf/open/floor/rogue/tile/alizeria/tiles/stonefloor4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile18"

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood19
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile19"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood20
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile20"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood21
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile21"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood22
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile22"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood23
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile23"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood24
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile24"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood25
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile25"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood26
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile26"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood27
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile27"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood28
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile28"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."

/turf/open/floor/rogue/ruinedwood/alizeria/tiles/wood29
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "tile29"
	name = "floor"
	desc = "Interlocking wooden floorboards scratched with thousands of steps."



// ДЕКАЛИ
/obj/effect/decal/alizeria/decals/woodpath1
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal_1"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/woodpath2
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal_2"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/woodpath3
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal_3"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/woodpath4
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal_4"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal1
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_1"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal2
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_2"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal3
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_3"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal4
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_4"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal5
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_5"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal6
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_6"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal7
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_7"
	mouse_opacity = 0

/obj/effect/decal/alizeria/decals/wooddecal8
	name = "wood path"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "wooddecal2_8"
	mouse_opacity = 0

// ЛЮК
/obj/structure/ladder/alizeria/hatch
	name = "люк"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "hatch1"

/obj/structure/ladder/alizeria/hatch2
	name = "лестница к люку"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "hatch3"


// САДОВЫЕ ГОРШКИ
/obj/structure/fluff/walldeco/alizeria/plants1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants1"

/obj/structure/fluff/walldeco/alizeria/plants2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants2"

/obj/structure/fluff/walldeco/alizeria/plants3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants3"

/obj/structure/fluff/walldeco/alizeria/plants4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants4"

/obj/structure/fluff/walldeco/alizeria/plants5
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants5"

/obj/structure/fluff/walldeco/alizeria/plants6
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants6"

/obj/structure/fluff/walldeco/alizeria/plants7
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants7"

/obj/structure/fluff/walldeco/alizeria/plants8
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	desc = ""
	name = "садовый горшок"
	icon_state = "wallplants8"


// ОГРАДА
/obj/structure/fluff/railing/alizeria/stone1
	icon_state = "stonefence1"
	blade_dulling = DULLING_BASHCHOP
	layer = ABOVE_MOB_LAYER
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'

/obj/structure/fluff/railing/alizeria/stone2
	icon_state = "stonefence2"
	blade_dulling = DULLING_BASHCHOP
	layer = ABOVE_MOB_LAYER
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'

/obj/structure/fluff/railing/alizeria/stone3
	icon_state = "stonefence3"
	blade_dulling = DULLING_BASHCHOP
	layer = ABOVE_MOB_LAYER
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'

/obj/structure/fluff/railing/alizeria/stone4
	icon_state = "stonefence4"
	blade_dulling = DULLING_BASHCHOP
	layer = ABOVE_MOB_LAYER
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'


//МОГИЛЫ
/obj/structure/fluff/statue/alizeria/mogil1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil1"

/obj/structure/fluff/statue/alizeria/mogil2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil2"

/obj/structure/fluff/statue/alizeria/mogil3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil3"

/obj/structure/fluff/statue/alizeria/mogil4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil4"

/obj/structure/fluff/statue/alizeria/mogil5
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil5"

/obj/structure/fluff/statue/alizeria/mogil6
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "могила"
	desc = ""
	icon_state = "mogil6"


// СВЕТ
/obj/machinery/light/rogue/firebowl/alizeria/decor/redlight1
	desc = "A wide metal bowl mounted on a stand for a healthy roaring flame."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "credlight1"
	base_state = "credlight"
	bulb_colour = "#c21313"

/obj/machinery/light/rogue/firebowl/alizeria/decor/offw/redlight1
	icon_state = "credlight0"
	base_state = "credlight"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	soundloop = null
	light_on = FALSE

/obj/machinery/light/rogue/firebowl/alizeria/decor/redlight2
	desc = "A wide metal bowl mounted on a stand for a healthy roaring flame."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "redlight1"
	base_state = "redlight"
	bulb_colour = "#c21313"

/obj/machinery/light/rogue/firebowl/alizeria/decor/offw/redlight2
	icon_state = "redlight0"
	base_state = "redlight"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	soundloop = null
	light_on = FALSE

/obj/machinery/light/rogue/firebowl/standing/alizeria/decor/red
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "sredlight1"
	base_state = "sredlight"
	bulb_colour = "#c21313"
	desc = "Soft and blue like the blood light."

/obj/machinery/light/rogue/wallfire/candle/alizeria/decor/red
	name = "candles"
	desc = "Tiny flames flicker to the slightest breeze and offer enough light to see."
	icon_state = "wredlight1"
	base_state = "wredlight"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	bulb_colour = "#c21313"
	light_outer_range = 3
	crossfire = FALSE
	cookonme = FALSE
	soundloop = null

/obj/machinery/light/rogue/wallfire/candle/alizeria/decor/red/off
	name = "candles"
	desc = "Cold wax sticks in sad half-melted repose. All they need is a spark."
	icon_state = "wredlight0"
	base_state = "wredlight"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	crossfire = FALSE
	cookonme = FALSE
	soundloop = null
	light_on = FALSE
	on = FALSE


// ШТОРЫ
/obj/structure/alizeria/curtainaliz
	name = "curtain"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "shtori_1"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = FALSE

/obj/structure/alizeria/curtainaliz/purple
	icon_state = "shtori_2"

/obj/structure/alizeria/curtainaliz/yellow
	icon_state = "shtori_3"

/obj/structure/alizeria/curtainaliz/green
	icon_state = "shtori_4"


// ЯЩИКИ
/obj/structure/roguecratesal
	name = "ящики"
	desc = ""
	icon = 'icons/roguetown/alizeria/yashiki.dmi'
	icon_state = "yashik"
	var/base_state
	density = TRUE
	opacity = FALSE
	anchored = FALSE
	var/kover = FALSE
	drag_slowdown = 2
	throw_speed = 1
	throw_range = 1
	blade_dulling = DULLING_BASHCHOP
	obj_flags = CAN_BE_HIT
	climbable = TRUE

/obj/structure/roguecratesal/alizeria/decor/crates1
	icon_state = "yashik"

/obj/structure/roguecratesal/alizeria/decor/crates2
	icon_state = "yashik-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates3
	icon_state = "yashik-open"

/obj/structure/roguecratesal/alizeria/decor/crates4
	icon_state = "yashik-broken"

/obj/structure/roguecratesal/alizeria/decor/crates5
	icon_state = "yashik1"

/obj/structure/roguecratesal/alizeria/decor/crates6
	icon_state = "yashik2-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates7
	icon_state = "yashik2-open"

/obj/structure/roguecratesal/alizeria/decor/crates8
	icon_state = "yashik2-broken"

/obj/structure/roguecratesal/alizeria/decor/crates9
	icon_state = "yashik3"

/obj/structure/roguecratesal/alizeria/decor/crates10
	icon_state = "yashik3-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates11
	icon_state = "yashik3-open"

/obj/structure/roguecratesal/alizeria/decor/crates12
	icon_state = "yashik3-broken"

/obj/structure/roguecratesal/alizeria/decor/crates13
	icon_state = "yashik4"

/obj/structure/roguecratesal/alizeria/decor/crates14
	icon_state = "yashik4-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates15
	icon_state = "yashik4-open"

/obj/structure/roguecratesal/alizeria/decor/crates16
	icon_state = "yashik4-broken"

/obj/structure/roguecratesal/alizeria/decor/crates17
	icon_state = "stack-yashik"

/obj/structure/roguecratesal/alizeria/decor/crates18
	icon_state = "stack-yashik-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates19
	icon_state = "stack-yashik-open"

/obj/structure/roguecratesal/alizeria/decor/crates20
	icon_state = "stack-yashik-broken"

/obj/structure/roguecratesal/alizeria/decor/crates21
	icon_state = "stack-yashik2"

/obj/structure/roguecratesal/alizeria/decor/crates22
	icon_state = "stack-yashik2-preopen"

/obj/structure/roguecratesal/alizeria/decor/crates23
	icon_state = "stack-yashik2-open"

/obj/structure/roguecratesal/alizeria/decor/crates24
	icon_state = "stack-yashik2-broken"

// БАРРИКАДЫ
/obj/structure/alizeria/decor/barricade1
	name = "barricade"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "barik1"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = 1
	max_integrity = 100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'

/obj/structure/alizeria/decor/barricade2
	name = "barricade"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "barik2"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = 1
	max_integrity = 100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'

/obj/structure/alizeria/decor/barricade3
	name = "barricade"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "barik3"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = 1
	max_integrity = 100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'

/obj/structure/alizeria/decor/barricade4
	name = "barricade"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "barik4"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = 1
	max_integrity = 100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'

/obj/structure/alizeria/decor/barricade5
	name = "barricade"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "barik5"
	alpha = 255 // Mappers can set this to 200 if they want it slightly see-through
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	opacity = 0
	density = 1
	max_integrity = 100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'


// УКАЗАТЕЛИ
/obj/structure/fluff/statue/alizeria/decor/ykaz1
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель"
	desc = "Указатель, который на что-то указывает."
	icon_state = "yknone"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz2
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель храма"
	desc = "Указатель, показывающий направление к храму."
	icon_state = "ykhram"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz3
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель дворца"
	desc = "Указатель, показывающий направление к дворцу."
	icon_state = "ykcrown"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz4
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель жандармерии"
	desc = "Указатель, показывающий направление к жандармерии."
	icon_state = "ykjan"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz5
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель кабаре"
	desc = "Указатель, показывающий направление к кабаре."
	icon_state = "ykkab"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz6
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель игорного дома"
	desc = "Указатель, показывающий направление к игорному дому."
	icon_state = "ykigdom"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz7
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель таверны"
	desc = "Указатель, показывающий направление к таверне."
	icon_state = "yktav"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz8
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель кузни"
	desc = "Указатель, показывающий направление к кузне."
	icon_state = "ykkyzn"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz9
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель портного"
	desc = "Указатель, показывающий направление к лавке портного."
	icon_state = "yktailor"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz10
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель торговца"
	desc = "Указатель, показывающий направление к торговой лавке."
	icon_state = "ykshop"
	density = 1
	max_integrity = 1000

/obj/structure/fluff/statue/alizeria/decor/ykaz11
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	name = "указатель стражи"
	desc = "Указатель, показывающий направление к городской страже."
	icon_state = "ykstraja"
	density = 1
	max_integrity = 1000

// НАСТЕННЫЕ ГАЗЕТЫ И ПЛАКАТЫ
/obj/structure/fluff/walldeco/alizeria/decor/plakat1
	name = "настенная газета"
	desc = "<b>Объявления: «Ализерский Вестник»</b><br><br>- Куплю сапоги. Желательно парой.<br>- Продам козу. Не моя, но привыкли друг к другу.<br>- Ищу мужа. Требования: Живой, с двумя ногами и руками, мытый ( опционально )<br>- Нашедшему часы некромиста награда 2 серебряных, подходите в поместье!<br><br><b>Политика: «Ализерский Вестник»</b><br><b>Монфор уверяет, что ситуация стабильна</b><br><br>Представитель администрации сообщил, что продовольствия достаточно, паника необоснованна, а слухи распространяют враги короны.<br><br><b>Слухи недели:«Подпольщик»</b><br><br>- В руинах столицы видели трон, который дышит.<br>- Некромант покупает детские ботинки.<br>- Король Монфора уже год разговаривает с зеркалом. Зеркало побеждает в споре.<br>- Один рыбак доплыл до края шторма и вернулся трезвым. Никто не верит."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat1"

/obj/structure/fluff/walldeco/alizeria/decor/plakat2
	name = "настенная газета"
	desc = "<b>Газета «Рыбный Листок»</b><br><i>Еженедельник для тех, кто пахнет морем и бедностью.</i><br><br><b>Главное:</b><br><b>Рыбак вернулся с уловом и без лодки</b><br><br>По словам очевидцев, он просто вышел из тумана с мешком трески на спине.<br>На вопрос, где судно, ответил: «Ему там спокойнее».<br>После чего уснул упавши лицом в брусчатку.<br><br><b>Объявления:«Рыночный Шёпот»</b><br><br>- Куплю окно. Моё снова смотрит не туда!<br>Ищу свидетелей свадьбы. Жених сбежал, невеста догнала.<br>Продам бочку за дорого. Внутри сюрприз. Подходите к Д. Ди.<br><br><b>Торговля:«Рыночный Шёпот»</b><br><b>Рынок вводит новые меры веса</b><br><br>Теперь мешок муки может означать что угодно.<br><br>Покупателям советуют развивать воображение."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat2"

/obj/structure/fluff/walldeco/alizeria/decor/plakat3
	name = "настенная газета"
	desc = "<b>Газета «Монфорский Разум»</b><br><i>Официальное издание для людей с приказом думать правильно!</i><br><br><b>Передовица:</b><br><b>Регент София Де'Патье держит ситуацию под контролем</b><br><br>Согласно сообщению администрации, каждый мешок зерна учтён, каждый чиновник честен, каждый слух ложен.<br>Редакция напоминает: смех над официальными сообщениями считается непатриотичным и грубым оскорблением короны!<br><br><b>Советы быта:«Ализерский Вестник»</b><br><br>Если слышите стук в окно на третьем этаже, не открывайте.<br>Если живёте на первом, тем более.<br><br><b>Погода:«Ализерский Вестник»</b><br><br>Утром холодно.<br>Днём сыро.<br>К вечеру вероятны угрозы с севера."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat3"

/obj/structure/fluff/walldeco/alizeria/decor/plakat4
	name = "настенная газета"
	desc = "<b>Газета «Шепот Рынка»</b><br><b>Объявления:</b><br>- Ищу тёмного эльфа. Не для того, о чём вы подумали. Хотя…<br>- Продам склад. Немного осквернён репутацией.<br>- Куплю чувство стыда. Срочно, для друга из ополчения.<br>- Меняю слухи на подтверждения. Пока безуспешно."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat4"

/obj/structure/fluff/walldeco/alizeria/decor/plakat5
	name = "настенная газета"
	desc = "<b>Газета «Городская Легенда»</b><br><i>Выпуск №12. Слухи недели.</i><br>- Жандармы начали брать меньше взяток. Вероятно, копят.<br>- В руинах нашли дверь, которая не скрипит. Подозрительно.<br>- Один стражник честно вернул кошелёк. Его ищут лекари.<br>- Бургомистр задумался о народе. Свидетели не уверены, что это был он."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat5"

/obj/structure/fluff/walldeco/alizeria/decor/plakat6
	name = "настенная газета"
	desc = "<b>Газета «Городская Легенда»</b><br><i>Выпуск №11. Всё, что вы не хотели знать, но теперь уже знаете.</i><br><br><b>Главная новость:</b><br><b>Гражданин дня: Исайя и дипломатия, которую мы не заслужили</b><br>Вчера поздно вечером на складе у южной пристани был замечен некий Исайя Сангвин, в процессе, который официальные лица пока называют “активным культурным обменом”. Источники утверждают, что в роли представителя другой стороны выступал тёмный эльф. Да, именно тот самый. Нет, это не шутка. Мы тоже сначала надеялись. Свидетели происшествия разделились на два лагеря: первые утверждают, что это был акт дипломатии, направленный на укрепление межрасовых связей, вторые - что Исайя просто проиграл спор. Сам Исайя от комментариев отказался, заявив лишь, что “всё было по взаимному согласию и с уважением к культуре партнёра”. Бургомистр уже рассматривает возможность признания данного инцидента либо позором, либо прецедентом. Решение ожидается после того, как они перестанут смеяться."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat6"

/obj/structure/fluff/walldeco/alizeria/decor/plakat7
	name = "плакат"
	desc = "<b>Указ Короны!</b> <br><br>Любое распространение слухов о слабости короны, гибели флота или бунте карается арестом. <br><br>Монфор не пал. <br>Монфор не отступил. <br>Монфор всё контролирует. <br><br>Если вам кажется обратное, значит у вас слишком хорошие глаза."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat7"

/obj/structure/fluff/walldeco/alizeria/decor/plakat8
	name = "плакат"
	desc = "<b>Напоминание о Кодексе.</b> <br><br>Власть дана не для пира. <br>Меч дан не для грабежа. <br>Суд дан не для мести. <br><br>Тем, кто считает иначе, напоминаем: могилы роются одинаково для всех. <br><br>Пожертвования, как всегда, справа от входа. Святость любит порядок."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat8"

/obj/structure/fluff/walldeco/alizeria/decor/plakat9
	name = "плакат"
	desc = "<b>ОСТРОВ — ЭТО ВСЁ, ЧТО У НАС ОСТАЛОСЬ!</b>"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat9"

/obj/structure/fluff/walldeco/alizeria/decor/plakat10
	name = "плакат"
	desc = "<b>УСИЛЕНИЕ ПОРЯДКА</b> <br><br>В связи с нестабильной обстановкой на острове Ализерия <br>патрулирование жилых и портовых районов усиливается. <br><br>- введены дополнительные ночные обходы   <br>- увеличено число стационарных постов   <br>- ограничено перемещение после заката   <br><br><i>Любое скопление граждан будет расценено как потенциальная угроза.</i>"
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat10"

/obj/structure/fluff/walldeco/alizeria/decor/plakat11
	name = "плакат"
	desc = "<b>СЛУЖБА ЖАНДАРМЕРИИ — ЭТО НЕ ПРАВО, А ОБЯЗАННОСТЬ!</b> <br><br>Каждый жандарм обязан помнить: <br>порядок не существует сам по себе — он поддерживается рукой, которая не дрожит. <br><br>Исполняй приказ без промедления. <br>Не допускай сомнений в присутствии гражданских. <br>Сила применяется только во имя стабильности. <br><br>Нарушение Кодекса карается разжалованием или судом бургомистра."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat11"

/obj/structure/fluff/walldeco/alizeria/decor/plakat12
	name = "плакат"
	desc = "<b>ЖАНДАРМЕРИЯ АЛИЗЕРИИ — ЩИТ ОСТРОВА</b> <br><br>После Катаклизма остров Ализерия находится в изоляции. <br>Любое нарушение порядка рассматривается как угроза выживанию всех жителей острова!  <br><br>Ночные сборища запрещены. <br>Слухи о «свете за горизонтом» не подлежат обсуждению. <br><br>Жандармерия действует от имени нашего монарха."
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakat12"

/obj/structure/fluff/walldeco/alizeria/decor/plakatspawner
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "plakatspawner"
	name = "plakat spawner"
	desc = "Haha, im in danger."

/obj/structure/fluff/walldeco/alizeria/decor/plakatspawner/Initialize()
	var/type = pick(list(/obj/structure/fluff/walldeco/alizeria/decor/plakat1,/obj/structure/fluff/walldeco/alizeria/decor/plakat2,
	/obj/structure/fluff/walldeco/alizeria/decor/plakat3,/obj/structure/fluff/walldeco/alizeria/decor/plakat4,
	/obj/structure/fluff/walldeco/alizeria/decor/plakat5,/obj/structure/fluff/walldeco/alizeria/decor/plakat6,
	/obj/structure/fluff/walldeco/alizeria/decor/plakat7,/obj/structure/fluff/walldeco/alizeria/decor/plakat8,
	/obj/structure/fluff/walldeco/alizeria/decor/plakat9,/obj/structure/fluff/walldeco/alizeria/decor/plakat10,
	/obj/structure/fluff/walldeco/alizeria/decor/plakat11,/obj/structure/fluff/walldeco/alizeria/decor/plakat12))

	var/obj/structure/fluff/walldeco/alizeria/decor/plakatspawner/boi = new type
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()

	return INITIALIZE_HINT_QDEL

// АВАНГАРД

/obj/structure/far_travel/alizeria/arrival
	name = "великая руна телепортации"
	desc = "Одна из множества рун всемирной объединённой телепортационной системы. Через неё возможно вернуться на континент."
	icon = 'icons/effects/224x224.dmi'
	icon_state = "huge_runegreen"
	pixel_x = -96 //So the big ol' 96x96 sprite shows up right
	pixel_y = -96
	pixel_z = 0
	light_outer_range =  7
	light_power = 2
	light_color = "#78e37f"

/obj/structure/flora/roguegrass/bush/alizeria/bush1
	name = "thorn bush"
	desc = "Колючий куст. В нём можно найти шипы и волокна."
	icon_state = "bush1winter"
/obj/structure/flora/roguegrass/bush/alizeria/bush1/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush1/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/natural/thorn=3,
					/obj/item/natural/fibers=3,
					/obj/item/grown/log/tree/stick=3,
					/obj/item/natural/stone=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush2
	name = "thorn bush"
	desc = "Колючий куст. В нём можно найти шипы и волокна."
	icon_state = "bush2winter"
/obj/structure/flora/roguegrass/bush/alizeria/bush2/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush2/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/natural/thorn=3,
					/obj/item/natural/fibers=3,
					/obj/item/grown/log/tree/stick=3,
					/obj/item/natural/stone=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush3
	name = "thorn bush"
	desc = "Колючий куст. В нём можно найти шипы и волокна."
	icon_state = "bush3winter"
/obj/structure/flora/roguegrass/bush/alizeria/bush3/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush3/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/natural/thorn=3,
					/obj/item/natural/fibers=3,
					/obj/item/grown/log/tree/stick=3,
					/obj/item/natural/stone=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush4
	name = "flower bush"
	desc = "Ярко пахнущий куст. В его недрах можно найти различные цветы."
	icon_state = "bush1spring"
/obj/structure/flora/roguegrass/bush/alizeria/bush4/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush4/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/alch/artemisia=3,
					/obj/item/alch/atropa=3,
					/obj/item/alch/benedictus=3,
					/obj/item/alch/calendula=3,
					/obj/item/alch/matricaria=3,
					/obj/item/alch/mentha=3,
					/obj/item/alch/rosa=3,
					/obj/item/alch/salvia=3,
					/obj/item/alch/taraxacum=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush5
	name = "flower bush"
	desc = "Ярко пахнущий куст. В его недрах можно найти различные цветы."
	icon_state = "bush2spring"
/obj/structure/flora/roguegrass/bush/alizeria/bush5/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush5/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/alch/artemisia=3,
					/obj/item/alch/atropa=3,
					/obj/item/alch/benedictus=3,
					/obj/item/alch/calendula=3,
					/obj/item/alch/matricaria=3,
					/obj/item/alch/mentha=3,
					/obj/item/alch/rosa=3,
					/obj/item/alch/salvia=3,
					/obj/item/alch/taraxacum=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush6
	name = "flower bush"
	desc = "Ярко пахнущий куст. В его недрах можно найти различные цветы."
	icon_state = "bush3spring"
/obj/structure/flora/roguegrass/bush/alizeria/bush6/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush6/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/alch/artemisia=3,
					/obj/item/alch/atropa=3,
					/obj/item/alch/benedictus=3,
					/obj/item/alch/calendula=3,
					/obj/item/alch/matricaria=3,
					/obj/item/alch/mentha=3,
					/obj/item/alch/rosa=3,
					/obj/item/alch/salvia=3,
					/obj/item/alch/taraxacum=3))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()


/obj/structure/flora/roguegrass/bush/alizeria/bush7
	name = "strange bush"
	desc = "Крайне странный куст, внушающий лёгкое чуство паранойи и склоняющий к лудомании. В его недрах можно найти что угодно."
	icon_state = "bush1strange"
/obj/structure/flora/roguegrass/bush/alizeria/bush7/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush7/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/powder/ozium=1,
					/obj/item/clothing/mask/cigarette/rollie/cannabis=1,
					/obj/item/clothing/mask/cigarette/rollie/nicotine=1,
					/mob/living/simple_animal/butterfly=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/chicken=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mirespider/angry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/cabbit=1,
					/mob/living/simple_animal/hostile/rogue/skeleton=1,
					/mob/living/simple_animal/pet/familiar/cat_black=1,
					/obj/item/lovepotion=1,
					/obj/item/bomb=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/spider=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1,
					/obj/item/clothing/shoes/roguetown/simpleshoes/buckle=1,
					/obj/item/grapplinghook=1,
					/obj/item/handmirror=1,
					/obj/item/scomstone=1,
					/obj/item/carvedgem/onyxa/spider=1,
					/obj/item/flowercrown/thorny=1,
					/obj/item/lockpick=1,
					/obj/item/dice/d6=1,
					/obj/item/reagent_containers/food/snacks/grown/cucumber=1,
					/obj/item/ingot/blacksteel=1,
					/obj/item/clothing/mask/rogue/facemask/cheap_kitsune=1,
					/obj/item/legwears/silk/white=1,
					/obj/item/rogueweapon/whip=1,
					/obj/item/clothing/gloves/roguetown/leather=1,
					/obj/item/rogueweapon/huntingknife/throwingknife=1,
					/obj/item/roguecoin/gold=1,
					/obj/item/reagent_containers/food/snacks/rogue/berrycakeslice/poison=1,
					/obj/item/reagent_containers/glass/bottle/rogue/beer=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush8
	name = "strange bush"
	desc = "Крайне странный куст, внушающий лёгкое чуство паранойи и склоняющий к лудомании. В его недрах можно найти что угодно."
	icon_state = "bush2strange"
/obj/structure/flora/roguegrass/bush/alizeria/bush8/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush8/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/powder/ozium=1,
					/obj/item/clothing/mask/cigarette/rollie/cannabis=1,
					/obj/item/clothing/mask/cigarette/rollie/nicotine=1,
					/mob/living/simple_animal/butterfly=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/chicken=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mirespider/angry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/cabbit=1,
					/mob/living/simple_animal/hostile/rogue/skeleton=1,
					/mob/living/simple_animal/pet/familiar/cat_black=1,
					/obj/item/lovepotion=1,
					/obj/item/bomb=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/spider=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1,
					/obj/item/clothing/shoes/roguetown/simpleshoes/buckle=1,
					/obj/item/grapplinghook=1,
					/obj/item/handmirror=1,
					/obj/item/scomstone=1,
					/obj/item/carvedgem/onyxa/spider=1,
					/obj/item/flowercrown/thorny=1,
					/obj/item/lockpick=1,
					/obj/item/dice/d6=1,
					/obj/item/reagent_containers/food/snacks/grown/cucumber=1,
					/obj/item/ingot/blacksteel=1,
					/obj/item/clothing/mask/rogue/facemask/cheap_kitsune=1,
					/obj/item/legwears/silk/white=1,
					/obj/item/rogueweapon/whip=1,
					/obj/item/clothing/gloves/roguetown/leather=1,
					/obj/item/rogueweapon/huntingknife/throwingknife=1,
					/obj/item/roguecoin/gold=1,
					/obj/item/reagent_containers/food/snacks/rogue/berrycakeslice/poison=1,
					/obj/item/reagent_containers/glass/bottle/rogue/beer=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush9
	name = "strange bush"
	desc = "Крайне странный куст, внушающий лёгкое чуство паранойи и склоняющий к лудомании. В его недрах можно найти что угодно."
	icon_state = "bush3strange"
/obj/structure/flora/roguegrass/bush/alizeria/bush9/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush9/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/powder/ozium=1,
					/obj/item/clothing/mask/cigarette/rollie/cannabis=1,
					/obj/item/clothing/mask/cigarette/rollie/nicotine=1,
					/mob/living/simple_animal/butterfly=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/chicken=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mirespider/angry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/cabbit=1,
					/mob/living/simple_animal/hostile/rogue/skeleton=1,
					/mob/living/simple_animal/pet/familiar/cat_black=1,
					/obj/item/lovepotion=1,
					/obj/item/bomb=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/spider=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1,
					/obj/item/clothing/shoes/roguetown/simpleshoes/buckle=1,
					/obj/item/grapplinghook=1,
					/obj/item/handmirror=1,
					/obj/item/scomstone=1,
					/obj/item/carvedgem/onyxa/spider=1,
					/obj/item/flowercrown/thorny=1,
					/obj/item/lockpick=1,
					/obj/item/dice/d6=1,
					/obj/item/reagent_containers/food/snacks/grown/cucumber=1,
					/obj/item/ingot/blacksteel=1,
					/obj/item/clothing/mask/rogue/facemask/cheap_kitsune=1,
					/obj/item/legwears/silk/white=1,
					/obj/item/rogueweapon/whip=1,
					/obj/item/clothing/gloves/roguetown/leather=1,
					/obj/item/rogueweapon/huntingknife/throwingknife=1,
					/obj/item/roguecoin/gold=1,
					/obj/item/reagent_containers/food/snacks/rogue/berrycakeslice/poison=1,
					/obj/item/reagent_containers/glass/bottle/rogue/beer=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush10
	name = "berry bush"
	desc = "Обычный ягодный куст. Помните, что поесть ягоды любите не только вы."
	icon_state = "bush1berry"
/obj/structure/flora/roguegrass/bush/alizeria/bush10/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush10/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue=1,
					/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/goat=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush11
	name = "berry bush"
	desc = "Обычный ягодный куст. Помните, что поесть ягоды любите не только вы."
	icon_state = "bush2berry"
/obj/structure/flora/roguegrass/bush/alizeria/bush11/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush11/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue=1,
					/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/goat=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/alizeria/bush12
	name = "berry bush"
	desc = "Обычный ягодный куст. Помните, что поесть ягоды любите не только вы."
	icon_state = "bush3berry"
/obj/structure/flora/roguegrass/bush/alizeria/bush12/update_icon()
	return
/obj/structure/flora/roguegrass/bush/alizeria/bush12/Initialize()
	if(prob(88) && isnull(bushtype))
		bushtype = pickweight(list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue=1,
					/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry=1,
					/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/direbear=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/goat=1,
					/mob/living/simple_animal/hostile/retaliate/rogue/wolf=1))
	loot_replenish()
	pixel_x += rand(-3,3)
	return ..()

/obj/structure/flora/roguegrass/bush/wall/alizeria/bush4
	name = "great bush"
	desc = "A bush. This one’s roots are thick enough to block the way."
	opacity = TRUE
	density = 1
	climbable = FALSE
	icon_state = "bush5winter"
	max_integrity = 150
	debris = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 1, /obj/item/natural/thorn = 1)
	attacked_sound = 'sound/misc/woodhit.ogg'
/obj/structure/flora/roguegrass/bush/wall/alizeria/bush4/Initialize()
	. = ..()
	icon_state = "bush5winter"

/obj/structure/flora/roguegrass/bush/wall/alizeria/bush5
	name = "great bush"
	desc = "A bush. This one’s roots are thick enough to block the way."
	opacity = TRUE
	density = 1
	climbable = FALSE
	icon_state = "bush6winter"
	max_integrity = 150
	debris = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 1, /obj/item/natural/thorn = 1)
	attacked_sound = 'sound/misc/woodhit.ogg'
/obj/structure/flora/roguegrass/bush/wall/alizeria/bush5/Initialize()
	. = ..()
	icon_state = "bush6winter"

/obj/structure/flora/roguegrass/bush/wall/tallcold
	icon = 'icons/roguetown/misc/foliagetall.dmi'
	icon_state = "tallbush_tundra1"
	opacity = 1
	pixel_x = -16
	debris = null
	static_debris = null

/obj/structure/flora/roguegrass/bush/wall/tallcold/Initialize()
	. = ..()
	icon_state = "tallbush_tundra[pick(1,2)]"

/obj/effect/spawner/roguemap/alizeria/bushspawner
	icon_state = "Treeorbush"
	name = "Tree or bush spawner"
	probby = 50
	spawned = list(/obj/structure/flora/roguegrass/bush/alizeria/bush1, /obj/structure/flora/roguegrass/bush/alizeria/bush2, /obj/structure/flora/roguegrass/bush/alizeria/bush2, /obj/structure/flora/roguegrass/bush/alizeria/bush3, /obj/structure/flora/roguegrass/bush/alizeria/bush4, /obj/structure/flora/roguegrass/bush/alizeria/bush5, /obj/structure/flora/roguegrass/bush/alizeria/bush6, /obj/structure/flora/roguegrass/bush/alizeria/bush7, /obj/structure/flora/roguegrass/bush/alizeria/bush8, /obj/structure/flora/roguegrass/bush/alizeria/bush9, /obj/structure/flora/roguegrass/bush/alizeria/bush10, /obj/structure/flora/roguegrass/bush/alizeria/bush11, /obj/structure/flora/roguegrass/bush/alizeria/bush12)

/obj/structure/flora/roguegrass/cold
	name = "grass"
	desc = "Green, soft, and lively."
	icon = 'icons/roguetown/misc/foliage.dmi'
	icon_state = "grasscold1"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	plane = GAME_PLANE
	blade_dulling = DULLING_CUT
	debris = list(/obj/item/natural/fibers = 1)


/obj/structure/flora/roguegrass/cold/spark_act()
	fire_act()

/obj/structure/flora/roguegrass/cold/Initialize()
	update_icon()
	AddComponent(/datum/component/roguegrass)
	. = ..()

/obj/structure/flora/roguegrass/cold/update_icon()
	icon_state = "grasscold[rand(1, 6)]"

/turf/open/lava/acid/cold
	name = "concentrated refrigerant"
	desc = "Лужа концентрированного хладагента. Подобной жидкостью часто запитывают различные генераторы, однако сейчас - это не более чем просто крайне опасная жидкость. Её вид обманчив, она вполне себе способна сжечь тело человека."
	light_outer_range =  4
	light_power = 1
	icon_state = "coldogen"
	light_color = "#58c5f3"

/turf/open/lava/acid/cold/burn_stuff(AM)
	. = 0

	if(is_safe())
		return FALSE

	var/thing_to_check = src
	if (AM)
		thing_to_check = list(AM)
	for(var/thing in thing_to_check)
		if(isobj(thing))
			var/obj/O = thing
			if((O.resistance_flags & (ACID_PROOF|INDESTRUCTIBLE)) || O.throwing)
				continue
			O.obj_integrity -= O.max_integrity * 0.1
			if(O.obj_integrity <= 0)
				qdel(O)
			. = 1

		else if (isliving(thing))
			. = 1
			var/mob/living/L = thing
			if(L.movement_type & FLYING)
				continue	//YOU'RE FLYING OVER IT
			var/buckle_check = L.buckling
			if(!buckle_check)
				buckle_check = L.buckled
			if(isobj(buckle_check))
				var/obj/O = buckle_check
				if(O.resistance_flags & ACID_PROOF)
					continue
			else if(isliving(buckle_check))
				var/mob/living/live = buckle_check
				if("lava" in live.weather_immunities)
					continue
			for(var/obj/item/clothing/C in L.contents)
				if(C.resistance_flags & (ACID_PROOF|INDESTRUCTIBLE))
					continue
				C.obj_integrity -= C.max_integrity * 0.1
				if(C.obj_integrity <= 0)
					to_chat(L, span_danger("Your [C.name] is destroyed by the acid!"))
					qdel(C)

			L.adjustFireLoss(100)
			to_chat(L, span_userdanger("THE ACID BURNS!"))

/turf/open/lava/acid/cold/onbite(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			if(C.is_mouth_covered())
				return
		playsound(user, pick('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg'), 100, FALSE)
		user.visible_message(span_info("[user] starts to drink from [src]."))
		if(do_after(L, 25, target = src))
			var/mob/living/carbon/C = user
			to_chat(C, span_userdanger("ПОЧЕМУ Я ТАКОЙ ИДИОТ?!"))
			C.flash_fullscreen("redflash3")
			C.emote("agony", forced = TRUE)
			C.gib() //YOU. LITERALLY. DESERVE THIS.

/obj/structure/bars/alizeria/woodenbridge
	name = "wooden bridge"
	desc = ""
	icon = 'icons/roguetown/alizeria/vladegeg_decor.dmi'
	icon_state = "most"
	density = FALSE
	layer = TABLE_LAYER
	plane = GAME_PLANE
	damage_deflection = 5
	blade_dulling = DULLING_BASHCHOP
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP


/// БОЛОТА
/obj/structure/flora/roguegrass/kamish
	name = "reed"
	desc = "Green, soft, and deadly."
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	icon_state = "kamish1"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	plane = GAME_PLANE
	blade_dulling = DULLING_CUT
	debris = list(/obj/item/natural/fibers = 1)


/obj/structure/flora/roguegrass/kamish/spark_act()
	fire_act()

/obj/structure/flora/roguegrass/kamish/Initialize()
	update_icon()
	AddComponent(/datum/component/roguegrass)
	. = ..()

/obj/structure/flora/roguegrass/kamish/update_icon()
	icon_state = "kamish[rand(1, 5)]"



/obj/structure/flora/roguegrass/whitegrass
	name = "nasty grass"
	desc = "Green, soft, and deadly."
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	icon_state = "grass1"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	plane = GAME_PLANE
	blade_dulling = DULLING_CUT
	debris = list(/obj/item/natural/fibers = 1)


/obj/structure/flora/roguegrass/whitegrass/spark_act()
	fire_act()

/obj/structure/flora/roguegrass/whitegrass/Initialize()
	update_icon()
	AddComponent(/datum/component/roguegrass)
	. = ..()

/obj/structure/flora/roguegrass/whitegrass/update_icon()
	icon_state = "grass[rand(1, 6)]"


/obj/structure/flora/roguegrass/deadgrass
	name = "deadly grass"
	desc = "Green, soft, and deadly."
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	icon_state = "altgrass1"
	attacked_sound = "plantcross"
	destroy_sound = "plantcross"
	max_integrity = 2
	plane = GAME_PLANE
	blade_dulling = DULLING_CUT
	debris = list(/obj/item/natural/fibers = 1)


/obj/structure/flora/roguegrass/deadgrass/spark_act()
	fire_act()

/obj/structure/flora/roguegrass/deadgrass/Initialize()
	update_icon()
	AddComponent(/datum/component/roguegrass)
	. = ..()

/obj/structure/flora/roguegrass/deadgrass/update_icon()
	icon_state = "altgrass[rand(1, 6)]"


/obj/structure/flora/roguetree/stump/swamplog
	name = "ancient log"
	desc = "The rotten remains of a tree that suffered nature's cruelty ages ago."
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	icon_state = "log1"
	opacity = 0
	pixel_x = 0
	max_integrity = 200
	blade_dulling = DULLING_CUT
	static_debris = list(/obj/item/grown/log/tree = 1)
	climb_offset = 14
	stump_type = FALSE

/obj/structure/flora/roguetree/stump/swamplogalt
	name = "ancient log"
	desc = "The rotten remains of a tree that suffered nature's cruelty ages ago."
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	icon_state = "log2"
	opacity = 0
	pixel_x = 0
	max_integrity = 200
	blade_dulling = DULLING_CUT
	static_debris = list(/obj/item/grown/log/tree = 1)
	climb_offset = 14
	stump_type = FALSE

/obj/effect/spawner/roguemap/alizeria/logspawner
	icon_state = "logspawner"
	icon = 'icons/roguetown/alizeria/swamp32.dmi'
	name = "log spawner"
	probby = 50
	spawned = list(/obj/structure/flora/roguetree/stump/swamplog, /obj/structure/flora/roguetree/stump/swamplogalt, /obj/structure/flora/roguetree/stump/log)


/obj/structure/flora/roguetree/swamptree
	name = "swamp tree"
	icon = 'icons/roguetown/alizeria/swamp64.dmi'
	icon_state = "swamptree3"
	desc = ""
	pixel_x = -16
	density = 1
	max_integrity = 100
	static_debris = list(/obj/item/grown/log/tree = 1)
	stump_type = null
	opacity = 0

/obj/structure/flora/roguetree/swamptree/Initialize()
	. = ..()
	icon_state = "swamptree[rand(1, 14)]"

/obj/structure/flora/roguetree/swamptree/burn()
	new /obj/structure/flora/roguetree/pine/dead(get_turf(src))
	qdel(src)


/obj/structure/flora/roguetree/mashroom
	name = "giant mushroom"
	icon = 'icons/roguetown/alizeria/swamp64.dmi'
	icon_state = "mashroom1"
	desc = ""
	pixel_x = -19
	density = 1
	max_integrity = 100
	static_debris = list(/obj/item/grown/log/tree = 1)
	stump_type = null
	opacity = 0

/obj/structure/flora/roguetree/mashroom/Initialize()
	. = ..()
	icon_state = "mashroom[rand(1, 7)]"

/obj/structure/flora/roguetree/mashroom/burn()
	new /obj/structure/flora/roguetree/pine/dead(get_turf(src))
	qdel(src)



/obj/structure/flora/roguetree/swamptreealt
	name = "swamp tree"
	icon = 'icons/roguetown/alizeria/swamp80.dmi'
	icon_state = "tree6"
	desc = ""
	pixel_x = -22
	density = 1
	max_integrity = 100
	static_debris = list(/obj/item/grown/log/tree = 1)
	stump_type = null
	opacity = 0

/obj/structure/flora/roguetree/swamptreealt/Initialize()
	. = ..()
	icon_state = "tree[rand(1, 8)]"

/obj/structure/flora/roguetree/swamptreealt/burn()
	new /obj/structure/flora/roguetree/pine/dead(get_turf(src))
	qdel(src)


/obj/structure/flora/roguetree/swamptreelight
	name = "swamp light tree"
	icon = 'icons/roguetown/alizeria/swamp80.dmi'
	icon_state = "lighttree1"
	desc = ""
	pixel_x = -24
	density = 1
	max_integrity = 100
	static_debris = list(/obj/item/grown/log/tree = 1)
	stump_type = null
	light_outer_range = 5
	light_inner_range = 3
	light_power = 3
	light_color = "#9fe48b"
	opacity = 0

/obj/structure/flora/roguetree/swamptreelight/Initialize()
	. = ..()
	icon_state = "lighttree[rand(1, 3)]"

/obj/structure/flora/roguetree/swamptreelight/burn()
	new /obj/structure/flora/roguetree/pine/dead(get_turf(src))
	qdel(src)