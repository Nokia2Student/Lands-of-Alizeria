/obj/effect/proc_holder/spell/self/message
	name = "Шёпот"
	desc = "Проникает в разум знакомого вам человека, передавая шёпотом сообщение или отправляя интуитивную проекцию в его голову."
	cost = 2
	xp_gain = TRUE
	releasedrain = 30
	recharge_time = 60 SECONDS
	warnie = "spellwarning"
	spell_tier = 2
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "message"
	/// The stat threshold needed to pass the identify check.
	var/identify_difficulty = 15

/obj/effect/proc_holder/spell/self/message/cast(list/targets, mob/user)
	. = ..()

	var/list/eligible_players = list()

	if(user.mind.known_people.len)
		for(var/people in user.mind.known_people)
			eligible_players += people
	else
		to_chat(user, span_warning("Я никого не знаю."))
		revert_cast()
		return

	eligible_players = sortList(eligible_players)
	var/input = input(user, "С кем вы хотите связаться?", src) as null|anything in eligible_players
	if(isnull(input))
		to_chat(user, span_warning("Цель не выбрана."))
		revert_cast()
		return

	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == input)
			user.emote("me", 1, "бормочет заклинание, и его рот ненадолго вспыхивает белым!", TRUE, custom_me = TRUE)

			// Standard message color, for anonymous communications.
			var/message_color = "7246ff"

			// Is this a message or a projection? Messages are whispered words, a projection is a projected image or vision.
			// Projections do have the benefit of not being whispered, but your saviours will have to make do with non-explicit
			// imagery from which they'll have to figure out what you're trying to tell them.
			var/is_projection = FALSE

			// Are we sending a message or a projection?
			if(alert(user, "Передать как бессловесную проекцию или шёпотом?", "", "Проекция", "Сообщение") == "Проекция")
				is_projection = TRUE

			var/message = input(user, "[is_projection == TRUE ? "Какое сенсорное видение вы пытаетесь отправить в их разум?" : "Что вы пытаетесь прошептать в их разум?"]")

			if(!message)
				revert_cast()
				return

			if(alert(user, "Отправить анонимно?", "", "Да", "Нет") == "Нет") //yes or no popup, if you say No run this code
				identify_difficulty = 0 //anyone can clear this

			HL.playsound_local(HL, 'sound/magic/message.ogg', 100)
			user.playsound_local(user, 'sound/magic/message.ogg', 100)

			var/identified = FALSE
			if(HL.STAPER >= identify_difficulty) //quick stat check
				if(HL.mind)
					if(HL.mind.do_i_know(name=user.real_name)) //do we know who this person is?
						identified = TRUE // we do

						// Typecasting so we can access the user's voice color!
						if(ishuman(user))
							var/mob/living/carbon/human/H = user
							// If we aren't anonymous, we speak in our own voice colour.
							message_color = H.voice_color

						// If this a projection or not?
						if(!is_projection)
							to_chat(HL, span_big("Арканный шёпот проникает в мой разум, превращаясь в голос [user]: <font color=#[message_color]><i>\"[message]\"</i></font>"))
							to_chat(user, span_big("Вы шепчете в разум [HL], раскрывая себя: <font color=#[message_color]><i>\"[message]\"</i></font>"))
						else
							to_chat(HL, span_big("В моём разуме внезапно вспыхивает видение, знакомое как исходящее из сознания [user]: <font color=#[message_color]>\[<b>[message]</b>\]</font>"))
							to_chat(user, span_big("Вы отправляете краткое видение в разум [HL], раскрывая себя: <font color=#[message_color]>\[<b>[message]</b>\]</font>"))

			// We failed the check OR we just dont know who that is
			if(!identified)
				if(!is_projection)
					to_chat(HL, span_big("Арканный шёпот проникает в мой разум, превращаясь в голос неизвестной [user.gender == FEMALE ? "женщины" : "мужчины"]: <font color=#[message_color]><i>\"[message]\"</i></font>"))
					to_chat(user, span_big("Вы анонимно шепчете в разум [HL]: <font color=#[message_color]><i>\"[message]\"</i></font>"))
				else
					to_chat(HL, span_big("Внезапная вспышка видения в моём разуме, источник неизвестен: <font color=#[message_color]>\[<b>[message]</b>\]</font>"))
					to_chat(user, span_big("Вы анонимно отправляете краткое видение в разум [HL]: <font color=#[message_color]>\[<b>[message]</b>\]</font>"))

			// Messages are whispered out loud, projections are just a silent murmur.
			if(!is_projection)
				user.whisper(message)
			else
				user.emote("me", 1, "тихо бормочет что-то похожее на речь...", TRUE, custom_me = TRUE)
			log_game("[key_name(user)] sent a message to [key_name(HL)] with contents [message]")
			to_chat(user, span_notice("Я закрываю глаза и сосредотачиваю свой разум на [HL.real_name]... Мои слова проникают в их голову."))
			// maybe an option to return a message, here?
			return TRUE
			
	to_chat(user, span_warning("Я ищу ментальную связь, но не могу найти [input]."))
	revert_cast()
	return
