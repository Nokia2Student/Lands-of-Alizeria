
/mob/living/carbon/human
	var/datum/charflaw/charflaw

/mob/proc/sate_addiction()
	return

/mob/living/carbon/human/sate_addiction()
	if(istype(charflaw, /datum/charflaw/addiction))
		var/datum/charflaw/addiction/A = charflaw
		if(!A.sated)
			to_chat(src, span_blue(A.sated_text))
		A.sated = TRUE
		A.time = initial(A.time) //reset roundstart sate offset to standard
		A.next_sate = world.time + A.time
		remove_stress(/datum/stressevent/vice)
		if(A.debuff)
			remove_status_effect(A.debuff)

/datum/charflaw/addiction
	var/next_sate = 0
	var/sated = TRUE
	var/time = 5 MINUTES
//	var/debuff = /datum/status_effect/debuff/addiction
	var/debuff //so heroin junkies can have big problems
	var/needsate_text
	var/sated_text = "That's much better..."
	var/unsate_time


/datum/charflaw/addiction/New()
	..()
	time = rand(6 MINUTES, 30 MINUTES)
	next_sate = world.time + time

/datum/charflaw/addiction/flaw_on_life(mob/user)
	if(!ishuman(user))
		return
	if(user.mind?.antag_datums)
		for(var/datum/antagonist/D in user.mind?.antag_datums)
			if(istype(D, /datum/antagonist/vampire/lord) || istype(D, /datum/antagonist/werewolf) || istype(D, /datum/antagonist/skeleton) || istype(D, /datum/antagonist/zombie) || istype(D, /datum/antagonist/lich))
				return
	var/mob/living/carbon/human/H = user
	var/oldsated = sated
	if(oldsated)
		if(next_sate)
			if(world.time > next_sate)
				sated = FALSE
	if(sated != oldsated)
		unsate_time = world.time
		if(needsate_text)
			to_chat(user, span_boldwarning("[needsate_text]"))
	if(!sated)
		H.add_stress(/datum/stressevent/vice)
		if(debuff)
			H.apply_status_effect(debuff)



/datum/status_effect/debuff/addiction
	id = "addiction"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/addiction
	effectedstats = list("endurance" = -1,"fortune" = -1)
	duration = 100


/atom/movable/screen/alert/status_effect/debuff/addiction
	name = "Addiction"
	desc = ""
	icon_state = "debuff"


/// ALCOHOLIC

/datum/charflaw/addiction/alcoholic
	name = "Алкоголик"
	desc = "Я зависим от алкоголя."
	time = 40 MINUTES
	needsate_text = "Время выпить..."


/// JUNKIE

/datum/charflaw/addiction/junkie
	name = "Зависимый"
	desc = "Мне нужно принимать наркотики что бы чувствовать себя хорошо."
	time = 40 MINUTES
	needsate_text = "Время что-нибудь принять..."

/// Smoker

/datum/charflaw/addiction/smoker
	name = "Курильщик"
	desc = "Меня постоянно тянет на сигареты..."
	time = 40 MINUTES
	needsate_text = "Время закурить..."

/// GOD-FEARING

/datum/charflaw/addiction/godfearing
	name = "Набожный"
	desc = "Я обязан неуклонно следовать заветам своего покровителя. А также я обязан постоянно молиться ему."
	time = 40 MINUTES
	needsate_text = "Время помолиться..."

/// SADIST

/datum/charflaw/addiction/sadist
	name = "Садист"
	desc = "Я обожаю когда кто-то испытывает боль."
	time = 40 MINUTES
	needsate_text = "Мне нужно услышать, как кто-нибудь захнычет."
