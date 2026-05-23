// Triumph Loadout Items - предметы, которые можно взять за триумфы

GLOBAL_LIST_EMPTY(triumph_loadout_items)

/datum/triumph_loadout_item
	var/name = "Parent triumph loadout datum"
	var/desc
	var/path
	var/tr_cost = 0 // Стоимость в триумфы (для обычных игроков)
	var/list/ckeywhitelist

/datum/triumph_loadout_item/New()
	if(isnull(path))
		path = null

/datum/triumph_loadout_item/proc/ckey_check(key)
	if(ckeywhitelist && ckeywhitelist.Find(key))
		return TRUE
	return FALSE

// Процедура для получения цены с учётом Age Vetted статуса
/datum/triumph_loadout_item/proc/get_cost_for_player(mob/living/carbon/human/H)
	if(!H)
		return tr_cost

	var/final_cost = tr_cost

	// Если игрок Age Vetted - скидка 50% с округлением в большую сторону
	if(H.check_agevet())
		final_cost = ceil(tr_cost / 2.0)

	return final_cost

// ===== ПРИМЕРЫ ПРЕДМЕТОВ ЗА ТРИУМФЫ =====

/datum/triumph_loadout_item/lockpick
	name = "Отмычка"
	path = /obj/item/lockpick
	tr_cost = 5
	desc = "Обычная отмычка, для использования которой нужен навык. Либо хорошая удача..."

/datum/triumph_loadout_item/hammer
	name = "Молоток"
	path = /obj/item/rogueweapon/hammer/iron
	tr_cost = 5
	desc = "Железный молоток, который может пригодиться в кузнечном деле."

/datum/triumph_loadout_item/flint
	name = "Огниво"
	path = /obj/item/flint
	tr_cost = 3
	desc = "Простая железка, с помощью которой можно легко что-нибудь разжечь."

/obj/item/clothing/gloves/roguetown/leather/tr
	name = "leather gloves"

/datum/triumph_loadout_item/gloves
	name = "Кожаные перчатки"
	path = /obj/item/clothing/gloves/roguetown/leather/tr
	tr_cost = 3
	desc = "Обычные кожаные перчатки с помощью которых можно безопасно поднимать горячие предметы."

/datum/triumph_loadout_item/bronzelamptern
	name = "Бронзовая лампа"
	path = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
	tr_cost = 3
	desc = "Бронзовая лампа с зелёным свечением и ничего более."

/obj/item/reagent_containers/glass/bottle/waterskin/tr
	name = "waterskin"

/datum/triumph_loadout_item/fl
	name = "Фляга"
	path = /obj/item/reagent_containers/glass/bottle/waterskin/tr
	tr_cost = 3
	desc = "Обычная фляга, в которую можно налить воду."

/obj/item/rogueweapon/huntingknife/tr
	name = "hunting knife"

/datum/triumph_loadout_item/huntingknife
	name = "Охотничий нож"
	path = /obj/item/rogueweapon/huntingknife/tr
	tr_cost = 5
	desc = "Ножик, с помощью которого можно кого-нибудь разделать. По правде говоря - он много у кого есть."

/datum/triumph_loadout_item/handaxe
	name = "Одноручный топор"
	path = /obj/item/rogueweapon/stoneaxe/handaxe
	tr_cost = 7
	desc = "Железный одноручный топор. Можно применять по разному."

/datum/triumph_loadout_item/wood
	name = "Деревянный щит"
	path = /obj/item/rogueweapon/shield/wood
	tr_cost = 8
	desc = "Уродливый деревянный щит. Защитит, но быстро сломается."

/datum/triumph_loadout_item/zig
	name = "Зигарета"
	path = /obj/item/clothing/mask/cigarette/rollie/nicotine/cheroot
	tr_cost = 5
	desc = "Обычная зигарета которую можно закурить."

/datum/triumph_loadout_item/ozium
	name = "Озиум"
	path = /obj/item/reagent_containers/powder/ozium
	tr_cost = 5
	desc = "Обычный порошок, который можно занюхать."

/obj/item/storage/backpack/rogue/backpack/tr
	name = "backpack"

/datum/triumph_loadout_item/backpack
	name = "Рюкзак"
	path = /obj/item/storage/backpack/rogue/backpack/tr
	tr_cost = 15
	desc = "Большой рюкзак в котором можно носить много вещей."

/datum/triumph_loadout_item/grapplinghook
	name = "Крюк альпиниста"
	path = /obj/item/grapplinghook
	tr_cost = 15
	desc = "Прочный крюк, с которым можно быстро забираться на возвышенности."

/datum/triumph_loadout_item/lovepotion
	name = "Любовное зелье"
	path = /obj/item/lovepotion
	tr_cost = 20
	desc = "Бутыль любовного зелья, с которым можно хорошо повеселиться."

/obj/item/scomstone/tr
	name = "scomstone"

/datum/triumph_loadout_item/scomstone
	name = "СКОМ кольцо"
	path = /obj/item/scomstone/tr
	tr_cost = 20
	desc = "Дорогое устройство, с помощью которого можно общаться с такими же обладателями подобной вещи."

/obj/item/needle/tr
	name = "needle"

/datum/triumph_loadout_item/needle
	name = "Игла"
	path = /obj/item/needle/tr
	tr_cost = 5
	desc = "Обычная игла, которая поможет зашить раны."


// ===== ОБРАБОТКА СПЕЦ. ПРЕДМЕТОВ ПРИ ВХОДЕ В РАУНД =====

/mob/living/carbon/human/proc/apply_triumph_loadout_item()
	if(!client || !client.prefs)
		return

	var/datum/triumph_loadout_item/item = client.prefs.triumph_loadout

	// Если ничего не выбрано
	if(!item || !item.path)
		return

	// Получаем финальную цену с учётом Age Vetted
	var/final_cost = item.get_cost_for_player(src)

	// Получаем количество триумфов у игрока
	var/player_triumphs = SStriumphs.get_triumphs(client.ckey)

	// Сообщаем цену (с учётом скидки если есть)
	if(check_agevet())
		to_chat(src, "DEBUG: Триумфов у вас: [player_triumphs], нужно: [final_cost] (обычная цена: [item.tr_cost], скидка 50% за Age Vetted)")
	else
		to_chat(src, "DEBUG: Триумфов у вас: [player_triumphs], нужно: [final_cost]")

	// Проверяем, хватает ли триумфов
	if(player_triumphs < final_cost)
		to_chat(src, "<span class='warning'>У вас оказалось недостаточно триумфов для взятия спец. предмета!</span>")
		to_chat(src, "<span class='warning'>Требуется: [final_cost] триумфов, у вас было: [player_triumphs]</span>")
		client.prefs.triumph_loadout = null
		return

	// Забираем триумфы
	if(mind)
		mind.adjust_triumphs(-final_cost, FALSE)
	else
		SStriumphs.triumph_adjust(-final_cost, client.ckey)

	// Создаём предмет
	var/obj/item/new_item = new item.path(src)
	if(!istype(new_item))
		qdel(new_item)
		to_chat(src, "<span class='warning'>Ошибка при создании спец. предмета!</span>")
		return

	// Даём предмет в инвентарь
	if(new_item.w_class <= WEIGHT_CLASS_SMALL)
		new_item.forceMove(src)
	else
		new_item.forceMove(get_turf(src))

	// Сообщаем игроку
	to_chat(src, "<span class='notice'>Вы получили спец. предмет: <b>[new_item.name]</b></span>")
	if(check_agevet())
		to_chat(src, "<span class='notice'>За этот предмет списано <b>[final_cost]</b> триумфов (50% скидка за доверенность).</span>")
	else
		to_chat(src, "<span class='notice'>За этот предмет списано <b>[final_cost]</b> триумфов.</span>")
	to_chat(src, "<span class='notice'><b>Предмет должен был появиться у вас под ногами.</b> Если вы его не видите - проверьте тайл вашего спавна через ALT+ПКМ.</span>")

	// Очищаем выбор
	client.prefs.triumph_loadout = null