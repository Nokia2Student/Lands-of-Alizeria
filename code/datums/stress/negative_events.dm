/datum/stressevent/vice
	timer = 5 MINUTES
	stressadd = 5
	desc = list(span_boldred("Мне больно от порочности своей души..."),span_boldred("Нужно заняться своим пороком."))

/datum/stressevent/miasmagas
	timer = 10 SECONDS
	stressadd = 2
	desc = span_red("Запах смерти...")

/datum/stressevent/peckish
	timer = 10 MINUTES
	stressadd = 1
	desc = span_red("Я проголодался.")

/datum/stressevent/hungry
	timer = 10 MINUTES
	stressadd = 3
	desc = span_red("Мне голодно.")

/datum/stressevent/starving
	timer = 10 MINUTES
	stressadd = 5
	desc = span_boldred("Я сильно голодаю...")

/datum/stressevent/drym
	timer = 10 MINUTES
	stressadd = 1
	desc = span_red("Мне нужно чего-нибудь выпить.")

/datum/stressevent/thirst
	timer = 10 MINUTES
	stressadd = 3
	desc = span_red("Я испытываю жажду.")

/datum/stressevent/parched
	timer = 10 MINUTES
	stressadd = 5
	desc = span_boldred("Я умираю от жажды...")

/datum/stressevent/dismembered
	timer = 40 MINUTES
	stressadd = 5
	desc = span_boldred("Я потерял конечность.")

/datum/stressevent/dwarfshaved
	timer = 40 MINUTES
	stressadd = 6
	desc = span_boldred("Меня лишили моей бороды!")

/datum/stressevent/viewdismember
	timer = 15 MINUTES
	max_stacks = 5
	stressadd = 2
	stressadd_per_extra_stack = 2
	desc = span_red("Я видел как убили человека.")

/datum/stressevent/fviewdismember
	timer = 1 MINUTES
	max_stacks = 10
	stressadd = 1
	stressadd_per_extra_stack = 1
	desc = span_red("Я увидел нечто ужасное!")

/datum/stressevent/viewgib
	timer = 5 MINUTES
	stressadd = 2
	desc = span_red("Я увидел нечто ужасное!")

/datum/stressevent/guillotinefail
	timer = 5 MINUTES
	stressadd = 3
	desc = span_red("Эта казнь - полный отстой!")

/datum/stressevent/guillotineexecutorfail
	timer = 15 MINUTES
	stressadd = 5
	desc = span_boldred("Я провалил казнь на гильотине! Какой позор!")

/datum/stressevent/bleeding
	timer = 2 MINUTES
	stressadd = 2
	desc = list(span_red("Кажется, у меня течёт кровь..."),span_red("У меня течёт кровь..."))

/datum/stressevent/bleeding/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/painmax
	timer = 1 MINUTES
	stressadd = 2
	desc = span_red("БОЛЬНО!!!")

/datum/stressevent/painmax/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/freakout
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("Я паникую!")

/datum/stressevent/felldown
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Я упал. Я дурак.")

/datum/stressevent/burntmeal
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("ФУ-У-У!")

/datum/stressevent/rotfood
	timer = 2 MINUTES
	stressadd = 4
	desc = span_red("ФУ-У-У!")

/datum/stressevent/psycurse
	timer = 5 MINUTES
	stressadd = 5
	desc = span_boldred("О нет! Я проклят!")

/datum/stressevent/virginchurch
	timer = 40 MINUTES
	stressadd = 30
	desc = span_boldred("Я нарушил свою клятву целомудрия!")

/datum/stressevent/badmeal
	timer = 3 MINUTES
	stressadd = 2
	desc = span_red("На вкус УЖАСНО!")

/datum/stressevent/vomit
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("Меня вырвало!")

/datum/stressevent/vomitself
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("Меня вырвало на себя!")

/datum/stressevent/vomitother
	timer = 3 MINUTES
	stressadd = 3
	max_stacks = 3
	stressadd_per_extra_stack = 3
	desc = span_red("На меня кого-то вырвало!")

/datum/stressevent/vomitedonother
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("Меня на кого-то вырвало!")

/datum/stressevent/cumbad
	timer = 5 MINUTES
	stressadd = 5
	desc = span_boldred("Надо мной надругались.")

/datum/stressevent/cumcorpse
	timer = 1 MINUTES
	stressadd = 10
	desc = span_boldred("Что я блять сделал?...")

/datum/stressevent/blueb
	timer = 1 MINUTES
	stressadd = 2
	desc = span_red("Моё чресло в огне!")

/datum/stressevent/shunned_race
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Лучше держаться подальше.")

/datum/stressevent/shunned_race_xenophobic
	timer = 2 MINUTES
	stressadd = 5
	desc = span_red("Лучше держаться подальше.")

/datum/stressevent/paracrowd
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("Здесь слишком много людей, которые не похожи на меня.")

/datum/stressevent/parablood
	timer = 15 SECONDS
	stressadd = 3
	desc = span_red("Здесь так много крови... Я как будто на поле битвы!")

/datum/stressevent/parastr
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Оно сильнее меня... Страшно!")

/datum/stressevent/paratalk
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Злые языки плетут против меня козни...")

/datum/stressevent/crowd
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Слишком много разных людей... Я хочу уйти.</span>"

/datum/stressevent/nopeople
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Где все?! Что-то происходит?...</span>"

/datum/stressevent/jesterphobia
	timer = 4 MINUTES
	stressadd = 8
	desc = span_boldred("А-А-А, БЛЯДСКИЙ ШУТ!!!")

/datum/stressevent/coldhead
	timer = 60 SECONDS
	stressadd = 1
	desc = span_red("Моя голова сильно промокла...")

/datum/stressevent/sleepytime
	timer = 40 MINUTES
	stressadd = 2
	desc = span_red("Я устал.")

/datum/stressevent/tortured
	stressadd = 3
	max_stacks = 5
	stressadd_per_extra_stack = 2
	desc = span_boldred("Я сломлен.")
	timer = 60 SECONDS

/datum/stressevent/confessed
	stressadd = 3
	desc = span_red("Я признался в своем грехе.")
	timer = 15 MINUTES

/datum/stressevent/confessedgood
	stressadd = 1
	desc = span_red("Я признался в грехе, и мне малость приятно от этого.")
	timer = 15 MINUTES

/datum/stressevent/saw_wonder
	stressadd = 4
	desc = span_boldred("<B>Я увидел нечто кошмарное и боюсь за свою жизнь!</B>")
	timer = 999 MINUTES

/datum/stressevent/maniac_woke_up
	stressadd = 10
	desc = span_boldred("Нет... Я хочу вернуться...")
	timer = 999 MINUTES

/datum/stressevent/drankrat
	stressadd = 1
	desc = span_red("Я пил кровь низшего существа.")
	timer = 1 MINUTES

/datum/stressevent/lowvampire
	stressadd = 1
	desc = span_red("Я мертв... что будет дальше?")

/datum/stressevent/oziumoff
	stressadd = 10
	desc = span_blue("Мне нужна еще одна доза.")
	timer = 1 MINUTES

/datum/stressevent/puzzle_fail
	stressadd = 1
	desc = list(span_red("Я потратил своё время на тупую шкатулку."),span_red("Тупая шкатулка..."))
	timer = 5 MINUTES

/datum/stressevent/noble_impoverished_food
	stressadd = 2
	desc = span_boldred("Это отвратительно. Как кто-то может это есть?")
	timer = 5 MINUTES

/datum/stressevent/noble_desperate
	stressadd = 3
	desc = span_boldred("Боги, до чего я докатился?")
	timer = 15 MINUTES

/datum/stressevent/noble_bland_food
	stressadd = 1
	desc = span_red("Это действительно ниже моего достоинства. Я заслуживаю лучшего, чем это...")
	timer = 3 MINUTES

/datum/stressevent/tortured/on_apply(mob/living/user)
	. = ..()
	if(user.client)
		record_round_statistic(STATS_TORTURES)

/datum/stressevent/noble_bad_manners
	stressadd = 1
	desc = span_red("Мне следовало воспользоваться ложкой...")
	timer = 3 MINUTES

/datum/stressevent/noble_ate_without_table
	stressadd = 1
	desc = span_red("Есть такое блюдо без стола? Невежливо.")
	timer = 2 MINUTES

/datum/stressevent/graggar_culling_unfinished
	stressadd = 1
	desc = span_red("Я должен съесть сердце моего противника прежде, чем он съест МОЁ!")
	timer = INFINITY

/datum/stressevent/soulchurnerhorror
	timer = 10 SECONDS
	stressadd = 50
	desc = span_red("Ужасные вопли мертвых призывают к облегчению страданий! ЧТО Я НАДЕЛАЛ?!")

/datum/stressevent/soulchurner
	timer = 1 MINUTES
	stressadd = 30
	desc = span_red("Ужасные вопли мертвецов взывают к облегчению страданий!")

/datum/stressevent/soulchurnerpsydon
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Ужасные вопли мертвых призывают к облегчению страданий! Я не могу ВЫНЕСТИ такие крики...")

/datum/stressevent/sewertouched
	timer = 5 MINUTES
	stressadd = 2
	desc = span_red("Отвратительная вода!")

/datum/stressevent/unseemly
	stressadd = 3
	desc = span_red("Их выражение лица невыносимо!")
	timer = 3 MINUTES

/datum/stressevent/syoncalamity
	stressadd = 15
	desc = span_boldred("Клянусь Псайдоном, осколка великой кометы больше нет! Что мы будем делать теперь!?")
	timer = 15 MINUTES

/datum/stressevent/hithead
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Ох-х, моя голова...")

/datum/stressevent/psycurse
	stressadd = 3
	desc = span_boldred("О нет! Я проклят!")
	timer = 999 MINUTES

/datum/stressevent/excommunicated
	stressadd = 5
	desc = span_boldred("Пантеон Десяти покинул меня!")
	timer = 999 MINUTES

/datum/stressevent/disgracedknight
	stressadd = 8
	desc = span_boldred("Меня лишили чести и рыцарского достоинства!")
	timer = 999 MINUTES

/datum/stressevent/apostasy
	stressadd = 3
	desc = span_boldred("На мне лежит печать отступничества!")
	timer = 999 MINUTES

/datum/stressevent/heretic_on_sermon
	stressadd = 5
	desc = span_red("Мой ПОКРОВИТЕЛЬ НЕ ГОРДИТСЯ МНОЙ!")
	timer = 20 MINUTES

/datum/stressevent/blessed_weapon
	stressadd = -3
	timer = 999 MINUTES
	desc = span_green("У меня в руках ПРОКЛЯТОЕ оружие!")

/datum/stressevent/lostchampion
	stressadd = 8
	desc = span_red("Рядом со мной нет моего сира! Так волнительно за него!")
	timer = 25 MINUTES

/datum/stressevent/lostward
	stressadd = 8
	desc = span_red("Рядом со мной нет моего подопечного! Где он пропадает?!")
	timer = 25 MINUTES

/datum/stressevent/riddle_munch
	stressadd = 10
	desc = span_boldred("Возможно, мне не следовало этого делать...")
	timer = 12 MINUTES

/datum/stressevent/sensitivity
	stressadd = 5
	desc = span_boldred("Солнце слишком яркое!")
	timer = 5 MINUTES

/datum/stressevent/wingcut
	stressadd = 6
	desc = span_boldred("ААААААА!! МОИ ДРАГОЦЕННЫЕ КРЫЛЫШКИ!!")
	timer = 40 MINUTES

/datum/stressevent/vampiric_reality
	stressadd = 3
	desc = span_boldred("Священное солнце возвращается, и это только вопрос времени, когда я превращусь в пепел. Я хочу снова стать смертным...")
	timer = 30 SECONDS

/datum/stressevent/scorch
	timer = 2 MINUTES
	stressadd = 5
	desc = span_red("Я был поражен яростным гневом тирана!")
