/obj/item/roguekey/alizeria/lord
	name = "ключ лорда"
	desc = "Ключ, открывающий большинство дверей во дворце."
	icon_state = "lord"
	lockid = "lord"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/lordh
	name = "ключ лорда"
	desc = "Ключ, открывающий некоторые двери во дворце."
	icon_state = "lordh"
	lockid = "lordh"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/jan
	name = "ключ жандарма"
	desc = "Ключ, открывающий большинство дверей в крепости жандармов."
	icon_state = "jan"
	lockid = "jan"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/janh
	name = "ключ жандарма"
	desc = "Ключ, открывающий некоторые двери в крепости жандармов."
	icon_state = "janh"
	lockid = "janh"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/town
	name = "ключ от города"
	desc = "Ключ, открывающий большинство дверей стражников города."
	icon_state = "town"
	lockid = "town"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/townh
	name = "ключ от города"
	desc = "Ключ, открывающий некоторые двери стражников города."
	icon_state = "townh"
	lockid = "townh"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/manor
	name = "ключ от дворца"
	icon_state = "brownkey"
	lockid = "manor"

/obj/item/roguekey/alizeria/farm
	name = "ключ от фермы"
	icon_state = "brownkey"
	lockid = "farm"

/obj/item/roguekey/alizeria/squire
	name = "ключ оруженосца"
	icon_state = "brownkey"
	lockid = "squire"

/obj/item/roguekey/alizeria/manorguest
	name = "ключ от гостевой"
	icon_state = "brownkey"
	lockid = "manorguest"

/obj/item/roguekey/alizeria/royal
	name = "ключ от покоев наместника"
	icon_state = "brownkey"
	lockid = "royalroom"

/obj/item/roguekey/alizeria/heir
	name = "ключ от покоев наследника"
	icon_state = "brownkey"
	lockid = "heirroom"

/obj/item/roguekey/alizeria/guardes
	name = "ключ от покоев гвардии"
	icon_state = "brownkey"
	lockid = "guardes"

/obj/item/storage/keyring/alizeria/lady
	keys = list(/obj/item/roguekey/alizeria/lord, /obj/item/roguekey/alizeria/heir, /obj/item/roguekey/alizeria/lordh, /obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm, /obj/item/roguekey/alizeria/squire, /obj/item/roguekey/alizeria/manorguest, /obj/item/roguekey/alizeria/royal)

/obj/item/storage/keyring/alizeria/knight
	keys = list(/obj/item/roguekey/alizeria/lord, /obj/item/roguekey/alizeria/guardes, /obj/item/roguekey/alizeria/lordh, /obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm, /obj/item/roguekey/alizeria/squire, /obj/item/roguekey/alizeria/manorguest)

/obj/item/storage/keyring/alizeria/blackguard
	keys = list(/obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/heir, /obj/item/roguekey/alizeria/farm, /obj/item/roguekey/alizeria/manorguest, /obj/item/roguekey/alizeria/lord, /obj/item/roguekey/alizeria/lordh)

/obj/item/storage/keyring/alizeria/prince
	keys = list(/obj/item/roguekey/alizeria/lord, /obj/item/roguekey/alizeria/heir, /obj/item/roguekey/alizeria/squire, /obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm)

/obj/item/storage/keyring/alizeria/servant
	keys = list(/obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm)

/obj/item/storage/keyring/alizeria/squire
	keys = list(/obj/item/roguekey/alizeria/squire, /obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm)

/obj/item/storage/keyring/alizeria/gover
	keys = list(/obj/item/roguekey/alizeria/lord, /obj/item/roguekey/alizeria/heir, /obj/item/roguekey/alizeria/lordh, /obj/item/roguekey/alizeria/manor, /obj/item/roguekey/alizeria/farm)

////////////////////////////

/obj/item/roguekey/alizeria/jano
	name = "ключ офицера жандармов"
	desc = "Ключ, открывающий личную комнату офицера."
	icon_state = "jan"
	lockid = "jano"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/roguekey/alizeria/ins
	name = "ключ инструктора"
	desc = "Ключ, открывающий кабинет инструктора жандармов."
	icon_state = "jan"
	lockid = "ins"
	icon = 'icons/roguetown/alizeria/keys.dmi'

/obj/item/storage/keyring/alizeria/janmashall
	keys = list(/obj/item/roguekey/alizeria/jan, /obj/item/roguekey/alizeria/jano, /obj/item/roguekey/alizeria/ins, /obj/item/roguekey/alizeria/janh)

/obj/item/storage/keyring/alizeria/jano
	keys = list(/obj/item/roguekey/alizeria/jan, /obj/item/roguekey/alizeria/jano)

/obj/item/storage/keyring/alizeria/ins
	keys = list(/obj/item/roguekey/alizeria/jan, /obj/item/roguekey/alizeria/ins)

/obj/item/storage/keyring/alizeria/janu
	keys = list(/obj/item/roguekey/alizeria/jan)

////////////////////////////

/obj/item/roguekey/alizeria/necromist
	name = "ключ некромиста"
	desc = "Ключ, открывающий особняк некромиста."
	icon_state = "birdkey"
	lockid = "necromist"

////////////////////////////

/obj/item/roguekey/alizeria/portshop
	name = "ключ от портовой лавки"
	desc = "Ключ, открывающий портовую лавку."
	icon_state = "rustkey"
	lockid = "portshop"

////////////////////////////

/obj/item/storage/keyring/alizeria/sherifft
	keys = list(/obj/item/roguekey/alizeria/town, /obj/item/roguekey/alizeria/townh)

/obj/item/storage/keyring/alizeria/townguard
	keys = list(/obj/item/roguekey/alizeria/town)

/obj/item/storage/keyring/alizeria/clerk
	keys = list(/obj/item/roguekey/alizeria/town, /obj/item/roguekey/steward)

////////////////////////////

/obj/item/roguekey/alizeria/roomo
	name = "ключ от первой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom1"

/obj/item/roguekey/alizeria/roomtw
	name = "ключ от второй комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom2"

/obj/item/roguekey/alizeria/roomth
	name = "ключ от третьей комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom3"

/obj/item/roguekey/alizeria/roomf
	name = "ключ от четвёртой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom4"

/obj/item/roguekey/alizeria/roomfi
	name = "ключ от пятой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom5"

/obj/item/roguekey/alizeria/roomsix
	name = "ключ от шестой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom6"

/obj/item/roguekey/alizeria/roomsev
	name = "ключ от седьмой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom7"

/obj/item/roguekey/alizeria/roomeight
	name = "ключ от восьмой комнаты"
	desc = "Ключ, открывающий одну из комнат в таверне."
	icon_state = "brownkey"
	lockid = "troom8"

////////////////////////////

/obj/item/storage/keyring/alizeria/innkeep
	keys = list(/obj/item/roguekey/tavern)

/obj/item/roguekey/alizeria/bar
	name = "ключ от бара"
	icon_state = "brownkey"
	desc = "Ключ, открывающий дверь в бар нижнего порта."
	lockid = "bar"

/obj/item/roguekey/alizeria/miner
	name = "ключ шахтёра"
	icon_state = "brownkey"
	desc = "Ключ, помещения шахтёров в порту."
	lockid = "towner_miner"

/obj/item/storage/keyring/alizeria/guildmaster
	keys = list(/obj/item/roguekey/tavern, /obj/item/roguekey/alizeria/bar, /obj/item/roguekey/tailor, /obj/item/roguekey/alizeria/pblacksmith, /obj/item/roguekey/alizeria/miner, /obj/item/roguekey/physician)

////////////////////////////

/obj/item/roguekey/alizeria/jour
	name = "ключ журналиста"
	icon_state = "brownkey"
	lockid = "jour"

////////////////////////////

/obj/item/roguekey/alizeria/capo
	name = "ключ капо"
	icon_state = "ekey"
	lockid = "capo"

/obj/item/roguekey/alizeria/courtesan
	name = "ключ куртизанки"
	icon_state = "bathkey"
	lockid = "courtesan"

/obj/item/roguekey/alizeria/hotel
	name = "ключ от квартирного дома"
	icon_state = "greenkey"
	lockid = "hotel"

/obj/item/storage/keyring/alizeria/capo
	keys = list(/obj/item/roguekey/alizeria/capo, /obj/item/roguekey/nightmaiden, /obj/item/roguekey/alizeria/courtesan, /obj/item/roguekey/alizeria/hotel)

////////////////////////////


/obj/item/roguekey/alizeria/ten
	name = "ключ защитника десяти"
	icon_state = "ekey"
	lockid = "ten"

/obj/item/storage/keyring/alizeria/ten
	keys = list(/obj/item/roguekey/alizeria/ten, /obj/item/roguekey/church)

////////////////////////////

/obj/item/roguekey/alizeria/caffe
	name = "ключ от кафе"
	desc = "Ключ, открывающий кофейню в городе."
	icon_state = "brownkey"
	lockid = "cafe"

////////////////////////////

/obj/item/roguekey/alizeria/house3
	name = "ключ от третьего дома"
	icon_state = "brownkey"
	lockid = "house3"

/obj/item/roguekey/alizeria/house2
	name = "ключ от второго дома"
	icon_state = "brownkey"
	lockid = "house2"

/obj/item/roguekey/alizeria/house9
	name = "ключ от девятого дома"
	icon_state = "brownkey"
	lockid = "house9"

/obj/item/roguekey/alizeria/house1
	name = "ключ от первого дома"
	icon_state = "brownkey"
	lockid = "house1"

/obj/item/roguekey/alizeria/house10
	name = "ключ от десятого дома"
	icon_state = "brownkey"
	lockid = "house10"

/obj/item/roguekey/alizeria/house11
	name = "ключ от одиннадцатого дома"
	icon_state = "brownkey"
	lockid = "house11"

/obj/item/roguekey/alizeria/noblehouse1
	name = "ключ от первого поместья"
	icon_state = "brownkey"
	lockid = "noblehouse1"

/obj/item/roguekey/alizeria/noblehouse2
	name = "ключ от второго поместья"
	icon_state = "brownkey"
	lockid = "noblehouse2"

/obj/item/roguekey/alizeria/noblehouse3
	name = "ключ от третьего поместья"
	icon_state = "brownkey"
	lockid = "noblehouse3"

////////////////////////////

/obj/item/roguekey/alizeria/room1
	name = "ключ от первой комнаты"
	icon_state = "brownkey"
	lockid = "room1"

/obj/item/roguekey/alizeria/room2
	name = "ключ от второй комнаты"
	icon_state = "brownkey"
	lockid = "room2"

/obj/item/roguekey/alizeria/room3
	name = "ключ от третьей комнаты"
	icon_state = "brownkey"
	lockid = "room3"

/obj/item/roguekey/alizeria/room4
	name = "ключ от четвертой комнаты"
	icon_state = "brownkey"
	lockid = "room4"

/obj/item/roguekey/alizeria/room5
	name = "ключ от пятой комнаты"
	icon_state = "brownkey"
	lockid = "room5"

/obj/item/roguekey/alizeria/room6
	name = "ключ от шестой комнаты"
	icon_state = "brownkey"
	lockid = "room6"

/obj/item/roguekey/alizeria/room7
	name = "ключ от седьмой комнаты"
	icon_state = "brownkey"
	lockid = "room7"

/obj/item/roguekey/alizeria/room8
	name = "ключ от восьмой комнаты"
	icon_state = "brownkey"
	lockid = "room8"

/obj/item/roguekey/alizeria/room9
	name = "ключ от девятой комнаты"
	icon_state = "brownkey"
	lockid = "room9"

/////////////////////////

/obj/item/roguekey/alizeria/pblacksmith
	name = "ключ кузнеца"
	desc = "Ключ, открывающий кузню."
	icon_state = "brownkey"
	lockid = "portblacksmith"

/////////////////////////

/obj/item/roguekey/alizeria/hcaffe
	name = "ключ главы кабаре"
	desc = "Ключ, открывающий некоторые двери в кабаре."
	icon_state = "brownkey"
	lockid = "hcafe"

/obj/item/storage/keyring/alizeria/whore
	keys = list(/obj/item/roguekey/alizeria/courtesan, /obj/item/roguekey/alizeria/caffe)

/obj/item/storage/keyring/alizeria/hcafe
	keys = list(/obj/item/roguekey/alizeria/hcaffe, /obj/item/roguekey/alizeria/caffe, /obj/item/roguekey/alizeria/courtesan)