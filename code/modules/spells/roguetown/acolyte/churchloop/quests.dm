//===================================================
// quests.dm
//=============================================
// -----------------------------------------------------
// HELP ME
// -----------------------------------------------

/proc/_is_digit_string(t)
	if(!istext(t)) return FALSE
	if(length(t) != 4) return FALSE
	for(var/i = 1, i <= 4, i++)
		var/c = copytext(t, i, i + 1)
		if(c < "0" || c > "9") return FALSE
	return TRUE

/proc/_digit_count(txt, dc)
	var/n = 0
	for(var/i = 1, i <= length(txt), i++)
		if(copytext(txt, i, i + 1) == dc)
			n++
	return n

/proc/_has_quest_lock(H)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	var/mob/living/carbon/human/HH = H
	return HH.has_status_effect(/datum/status_effect/debuff/quest_lock)

/proc/_apply_quest_lock(H)
	if(!istype(H, /mob/living/carbon/human)) return
	var/mob/living/carbon/human/HH = H
	if(!HH.has_status_effect(/datum/status_effect/debuff/quest_lock))
		HH.apply_status_effect(/datum/status_effect/debuff/quest_lock)

/proc/_apply_parish_boon(H)
	if(!istype(H, /mob/living/carbon/human)) return
	var/mob/living/carbon/human/HH = H
	HH.apply_status_effect(/datum/status_effect/buff/parish_boon)

/proc/_is_antagonist(H)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	var/mob/living/carbon/human/HH = H
	if(!HH.mind) return FALSE

	if("antag_datums" in HH.mind.vars)
		var/list/L = HH.mind.vars["antag_datums"]
		if(islist(L) && L.len)
			return TRUE

	if("special_role" in HH.mind.vars)
		var/sr = HH.mind.vars["special_role"]
		if(istext(sr) && length(sr))
			return TRUE

	return FALSE

/proc/_rt_type_display_name(T)
	if(!ispath(T)) return "[T]"
	var/obj/O = new T
	var/n = "[T]"
	if(istype(O, /obj) && istext(O.name) && length(O.name))
		n = O.name
	qdel(O)
	return n

/proc/_race_satisfies(H, key)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	var/mob/living/carbon/human/HH = H

	var/k = lowertext("[key]")

	if(k == "northern_human") return ishumannorthern(HH)
	if(k == "dwarf")          return isdwarf(HH)
	if(k == "dark_elf")       return isdarkelf(HH)
	if(k == "wood_elf")       return iswoodelf(HH)
	if(k == "half_elf")       return ishalfelf(HH)
	if(k == "half_orc")       return ishalforc(HH)
	if(k == "goblin")         return isgoblinp(HH)
	if(k == "kobold")         return iskobold(HH)
	if(k == "lizard")         return islizard(HH)
	if(k == "aasimar")        return isaasimar(HH)
	if(k == "tiefling")       return istiefling(HH)
	if(k == "halfkin")        return ishalfkin(HH)
	if(k == "wildkin")        return iswildkin(HH)
	if(k == "golem")          return isgolemp(HH)
	if(k == "doll")           return isdoll(HH)
	if(k == "vermin")         return isvermin(HH)
	if(k == "dracon")         return isdracon(HH)
	if(k == "axian")          return isaxian(HH)
	if(k == "tabaxi")         return istabaxi(HH)
	if(k == "vulp")           return isvulp(HH)
	if(k == "lupian")         return islupian(HH)
	if(k == "moth")           return ismoth(HH)
	if(k == "lamia")          return islamia(HH)

	return FALSE

/proc/_rt_effect_type_name(T)
	if(!ispath(T, /datum/status_effect))
		return "[T]"
	var/datum/status_effect/E = new T
	var/n = "[T]"
	if(E && ("id" in E.vars) && istext(E.vars["id"]) && length(E.vars["id"]))
		n = "[E.vars["id"]]"
	if(E) qdel(E)
	return capitalize(n)

/proc/_safe_has_skill_expert(H, skill_type)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	if(!ispath(skill_type, /datum/skill)) return FALSE

	var/mob/living/carbon/human/HH = H

	if(hascall(HH, "get_skill_level"))
		var/level = call(HH, "get_skill_level")(skill_type)
		return isnum(level) && level >= 4

	if("skill_levels" in HH.vars)
		var/list/L = HH.vars["skill_levels"]
		if(islist(L) && (skill_type in L))
			var/val = L[skill_type]
			if(isnum(val) && val >= 4)
				return TRUE

	return FALSE

/proc/_target_has_flaw(H, flaw_type)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	var/mob/living/carbon/human/HH = H
	if(!ispath(flaw_type, /datum/charflaw)) return FALSE

	if(hascall(HH, "has_flaw"))
		return !!call(HH, "has_flaw")(flaw_type)

	if("charflaws" in HH.vars)
		var/list/L = HH.vars["charflaws"]
		if(islist(L))
			for(var/datum/charflaw/F in L)
				if(istype(F, flaw_type))
					return TRUE

	return FALSE

/proc/_patron_matches(mob/living/carbon/human/H, required_patron_name as text)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	if(!istext(required_patron_name) || !length(required_patron_name)) return FALSE
	if(!("patron" in H.vars)) return FALSE

	var/need_name = lowertext(trim("[required_patron_name]"))
	var/p = H.vars["patron"]

	if(istext(p))
		return lowertext(trim("[p]")) == need_name

	if(ispath(p, /datum/patron))
		var/datum/patron/Pt = new p
		var/match = FALSE
		if(("name" in Pt.vars) && istext(Pt.vars["name"]))
			match = (lowertext(trim("[Pt.vars["name"]]")) == need_name)
		qdel(Pt)
		return match

	if(istype(p, /datum/patron))
		var/datum/patron/P = p
		if(("name" in P.vars) && istext(P.vars["name"]))
			return lowertext(trim("[P.vars["name"]]")) == need_name
		return FALSE

	return FALSE

/proc/_patron_matches_any(mob/living/carbon/human/H, list/names)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	if(!islist(names) || !names.len) return FALSE
	for(var/n in names)
		if(_patron_matches(H, "[n]"))
			return TRUE
	return FALSE

//--------------------------------------------------
// I HATE FEET KNIGHT SO MUCH
//--------------------------------------------------

/proc/_rt_job_display_name(jobtype)
	if(!ispath(jobtype, /datum/job))
		return "[jobtype]"

	var/datum/job/Jtmp = new jobtype
	var/name_out = "[jobtype]"

	if(Jtmp)
		if(("title" in Jtmp.vars) && istext(Jtmp.vars["title"]) && length(Jtmp.vars["title"]))
			name_out = Jtmp.vars["title"]
		else if(("name" in Jtmp.vars) && istext(Jtmp.vars["name"]) && length(Jtmp.vars["name"]))
			name_out = Jtmp.vars["name"]

	qdel(Jtmp)
	return name_out


// Yiff checks

/proc/_mob_matches_any_job(mob/living/carbon/human/H, list/required_job_types)
	if(!istype(H, /mob/living/carbon/human))
		return FALSE
	if(!islist(required_job_types) || !required_job_types.len)
		return FALSE
	var/list/req_titles = list()
	for(var/T in required_job_types)
		if(ispath(T, /datum/job))
			var/title_txt = lowertext(trim(_rt_job_display_name(T)))
			if(length(title_txt))
				req_titles += title_txt

	var/datum/job/J = null
	if(H.mind)
		if(("assigned_job" in H.mind.vars) && istype(H.mind.vars["assigned_job"], /datum/job))
			J = H.mind.vars["assigned_job"]

		if(!J && ("current_job" in H.mind.vars) && istype(H.mind.vars["current_job"], /datum/job))
			J = H.mind.vars["current_job"]

	if(J)
		for(var/T2 in required_job_types)
			if(ispath(T2, /datum/job))
				if(istype(J, T2))
					return TRUE

	var/list/candidate_strings = list()

	if(J)
		if(("title" in J.vars) && istext(J.vars["title"]) && length(J.vars["title"]))
			candidate_strings += lowertext(trim("[J.vars["title"]]"))
		if(("name" in J.vars) && istext(J.vars["name"]) && length(J.vars["name"]))
			candidate_strings += lowertext(trim("[J.vars["name"]]"))

	if(H.mind)
		if(("assigned_role" in H.mind.vars) && istext(H.mind.vars["assigned_role"]))
			candidate_strings += lowertext(trim("[H.mind.vars["assigned_role"]]"))
		if(("special_role" in H.mind.vars) && istext(H.mind.vars["special_role"]))
			candidate_strings += lowertext(trim("[H.mind.vars["special_role"]]"))

	for(var/cs in candidate_strings)
		if(!istext(cs) || !length(cs))
			continue

		for(var/rt in req_titles)
			if(!istext(rt) || !length(rt))
				continue

			if(cs == rt)
				return TRUE

			if(findtext(cs, rt))
				return TRUE
			if(findtext(rt, cs))
				return TRUE

	return FALSE

/proc/_rt_mob_has_antag_datum(mob/living/carbon/human/H, datumpath)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	if(!H.mind) return FALSE

	var/datum/mind/M = H.mind

	if(hascall(M, "has_antag_datum"))
		if(call(M, "has_antag_datum")(datumpath))
			return TRUE

	if("antag_datums" in M.vars)
		var/list/L = M.vars["antag_datums"]
		if(islist(L))
			for(var/datum/antagonist/A in L)
				if(istype(A, datumpath))
					return TRUE

	return FALSE

/proc/_rt_is_bandit_or_wretch(mob/living/carbon/human/H)
	if(!istype(H, /mob/living/carbon/human)) return FALSE
	if(!H.mind) return FALSE

	if("assigned_role" in H.mind.vars && istext(H.mind.vars["assigned_role"]))
		var/rn = lowertext("[H.mind.vars["assigned_role"]]")
		if(findtext(rn, "bandit") || findtext(rn, "wretch"))
			return TRUE

	return FALSE

/proc/_rt_antag_tier(mob/living/carbon/human/H)
	if(_rt_mob_has_antag_datum(H, /datum/antagonist/lich))        return 3

	if(_rt_mob_has_antag_datum(H, /datum/antagonist/werewolf))                     return 2

	if(_rt_is_bandit_or_wretch(H)) return 1

	return 0

/proc/_rt_pick_unique(list/src_list, count)
	var/list/candidates = list()
	if(islist(src_list))
		for(var/X in src_list)
			candidates += X

	var/list/out = list()
	var/left = count
	while(left > 0 && candidates.len)
		var/ch = pick(candidates)
		out += ch
		candidates -= ch
		left--
	return out

/proc/_rt_skill_names(list/type_list)
	var/list/names = list()
	if(islist(type_list))
		for(var/T in type_list)
			var/datum/skill/SK = new T
			var/n = (SK && SK.name) ? SK.name : "[T]"
			if(SK) qdel(SK)
			names += n
	return names

/proc/_rt_flaw_names(list/type_list)
	var/list/names = list()
	if(islist(type_list))
		for(var/T in type_list)
			var/datum/charflaw/F = new T
			var/n = (F && F.name) ? F.name : "[T]"
			if(F) qdel(F)
			names += n
	return names

/proc/_rt_all_job_types_master()
	var/list/L = list(
		/datum/job/roguetown/jester,
		/datum/job/roguetown/veteran,
		/datum/job/roguetown/clerk,
		/datum/job/roguetown/wapprentice,
		/datum/job/roguetown/servant,
		/datum/job/roguetown/butler,
		/datum/job/roguetown/apothecary,
		/datum/job/roguetown/magician,
		/datum/job/roguetown/prince,
		/datum/job/roguetown/councillor,
		/datum/job/roguetown/physician,
		/datum/job/roguetown/marshal,
		/datum/job/roguetown/hand,
		/datum/job/roguetown/knight,
		/datum/job/roguetown/lady,
		/datum/job/roguetown/lord,
		/datum/job/roguetown/steward,
		/datum/job/roguetown/villager,
		/datum/job/roguetown/nightmaiden,
		/datum/job/roguetown/beggar,
		/datum/job/roguetown/cook,
		/datum/job/roguetown/knavewench,
		/datum/job/roguetown/lunatic,
		/datum/job/roguetown/farmer,
		/datum/job/roguetown/orphan,
		/datum/job/roguetown/shophand,
		/datum/job/roguetown/elder,
		/datum/job/roguetown/niteman,
		/datum/job/roguetown/loudmouth,
		/datum/job/roguetown/archivist,
		/datum/job/roguetown/barkeep,
		/datum/job/roguetown/guildmaster,
		/datum/job/roguetown/guildsman,
		/datum/job/roguetown/tailor,
		/datum/job/roguetown/merchant,
		/datum/job/roguetown/pilgrim,
		/datum/job/roguetown/adventurer,
		/datum/job/roguetown/mercenary,
		/datum/job/roguetown/warden,
		/datum/job/roguetown/sergeant,
		/datum/job/roguetown/dungeoneer,
		/datum/job/roguetown/gatemaster,
		/datum/job/roguetown/manorguard,
		/datum/job/roguetown/squire,
		/datum/job/roguetown/guardsman
	)

	var/list/out = list()
	for(var/T in L)
		if(!(T in out))
			out += T
	return out

// GLOBAL
var/global/list/Q_WITNESS_EFFECTS = list(
	/datum/status_effect/buff/sermon,
	/datum/status_effect/buff/drunk,
	/datum/status_effect/buff/foodbuff,
	/datum/status_effect/buff/ozium,
	/datum/status_effect/buff/moondust,
	/datum/status_effect/buff/moondust_purest,
	/datum/status_effect/buff/starsugar,
	/datum/status_effect/buff/weed
)

// ---------------------------------------------------------------------
//
//  THE QUEST TOKEN TREE SHIT STARTS HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
//
// ---------------------------------------------------------------------

/obj/item/quest_token
	name = "жетон задания"
	desc = "Жетон, привязанный к задаче. Сообщите администратору, если увидите это"
	icon = 'icons/roguetown/items/misc.dmi'
	w_class = WEIGHT_CLASS_TINY

	var/owner_ckey  = ""
	var/owner_name  = ""
	var/delete_at   = 0

	var/reward_amount = 250

/obj/item/quest_token/Initialize()
	. = ..()
	if(ismob(loc))
		var/mob/M = loc
		if(M && M.client)
			owner_ckey = M.client.ckey
			if(istype(M, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = M
				owner_name = H.real_name || H.name || owner_ckey
			else
				owner_name = M.name || owner_ckey
		else if(istext(M?.key))
			owner_ckey = ckey(M.key)
			owner_name = M.name || owner_ckey

	if(!length(owner_name))
		owner_name = "неизвестный"

	delete_at = world.time + (3 * 60 * 10)
	addtimer(CALLBACK(src, PROC_REF(_maybe_qdel_self)), 10, TIMER_LOOP)

	if(length(owner_ckey))
		_start_owner_watch()

/obj/item/quest_token/proc/set_owner(mob/living/carbon/human/H)
	if(!H) return
	if(H.client)
		owner_ckey = H.client.ckey
	else if(istext(H.key))
		owner_ckey = ckey(H.key)
	owner_name = H.real_name || H.name || owner_ckey
	_start_owner_watch()

/obj/item/quest_token/proc/_start_owner_watch()
	spawn(0)
		while(src)
			if(!length(owner_ckey))
				qdel(src)
				return

			var/found = FALSE
			for(var/mob/living/carbon/human/H in world)
				if(H.client && H.client.ckey == owner_ckey)
					found = TRUE
					break

			if(!found)
				qdel(src)
				return

			sleep(50)

/obj/item/quest_token/proc/_maybe_qdel_self()
	if(QDELETED(src)) return
	if(world.time >= delete_at)
		qdel(src)

/obj/item/quest_token/proc/_payout(amount)
	if(!amount) return
	if(!length(owner_ckey)) return

	var/half_bonus = round(amount * 0.5)

	for(var/mob/living/carbon/human/HH in world)
		if(!HH.client) continue
		if(!HAS_TRAIT(HH, TRAIT_CLERGY)) continue

		if(HH.client.ckey == owner_ckey)
			HH.church_favor += amount
			to_chat(HH, span_notice("+[amount] Милости за выполнение чудесного задания."))
		else
			HH.church_favor += half_bonus
			to_chat(HH, span_notice("+[half_bonus] общей Милости за выполненное чудесное задание."))

/obj/item/quest_token/proc/_ensure_attacker(user)
	if(!user || !ismob(user)) return FALSE
	var/mob/M = user
	var/u_ckey = ""
	if(M.client)
		u_ckey = M.client.ckey
	else if(istext(M.key))
		u_ckey = ckey(M.key)

	if(u_ckey != owner_ckey)
		to_chat(user, span_warning("Оно не слушается вашей руки. (Владелец: [owner_name].)"))
		return FALSE

	if(!HAS_TRAIT(M, TRAIT_CLERGY))
		to_chat(user, span_warning("Только духовенство может использовать это."))
		return FALSE

	return TRUE

/obj/item/quest_token/proc/_ensure_target_player(H, user)
	if(!istype(H, /mob/living/carbon/human))
		to_chat(user, span_warning("Цель должна быть человеком."))
		return FALSE

	var/mob/living/carbon/human/HH = H
	if(!HH.client)
		to_chat(user, span_warning("Цель должна быть игроком."))
		return FALSE

	if(HAS_TRAIT(HH, TRAIT_CLERGY))
		to_chat(user, span_warning("Духовенство не может быть целью."))
		return FALSE

	return TRUE


// ---------------------------------------------------------------------
// QUEST MY TOKENS
// ---------------------------------------------------------------------

/*
/obj/item/quest_token/antag_find
	name = "сигил прозрения"
	desc = "Соберите запретное знание с врага."
	icon_state = "questflaw"
	var/list/allowed_tiers = list()

/obj/item/quest_token/antag_find/attack(target, user)
	if(!istype(target, /mob/living/carbon/human)) return ..()
	if(!_ensure_attacker(user)) return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user)) return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(allowed_tiers) || !allowed_tiers.len)
		to_chat(user, span_warning("Этот сигил неверно настроен."))
		return

	if(!do_after(user, 15 SECONDS, H)) return

	var/tier = _rt_antag_tier(H)
	_apply_parish_boon(H)
	_apply_quest_lock(H)

	if(tier && (tier in allowed_tiers))
		to_chat(user, span_notice("Скрытая злоба раскрыта. Вы завершили исследование."))
		_payout(reward_amount)
	else
		to_chat(user, span_notice("Запретной скверны такого калибра не найдено. Сигил исчерпан."))

	qdel(src)
*/

// 2) Find Expertise
/obj/item/quest_token/skill_bless
	name = "метка ремесла"
	desc = "Получить мнение эксперта по указанным навыкам."
	icon_state = "questflaw"
	var/list/required_skills = list()

/obj/item/quest_token/skill_bless/attack(target, user)
	if(!istype(target, /mob/living/carbon/human)) return ..()
	if(!_ensure_attacker(user)) return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user)) return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_skills) || !required_skills.len)
		to_chat(user, span_warning("Этот жетон неверно настроен. (не заданы навыки)"))
		return

	var/is_ok = FALSE
	for(var/st in required_skills)
		if(_safe_has_skill_expert(H, st))
			is_ok = TRUE
			break

	if(!is_ok)
		to_chat(user, span_warning("Они не являются ЭКСПЕРТОМ требуемых навыков."))
		return

	if(!do_after(user, 15 SECONDS, H)) return

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)
	qdel(src)


// 3) Blood Research
/obj/item/quest_token/blood_draw
	name = "освящённый ланцет"
	desc = "Возьмите кровь у определённых родословных."
	icon_state = "questblood"
	var/list/required_race_keys = list()

/obj/item/quest_token/blood_draw/attack(target, user)
	if(!istype(target, /mob/living/carbon/human)) return ..()
	if(!_ensure_attacker(user)) return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user)) return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_race_keys) || !required_race_keys.len)
		to_chat(user, span_warning("Этот жетон неверно настроен. (не заданы ключи расы)"))
		return

	var/matchrace = FALSE
	for(var/rk in required_race_keys)
		if(_race_satisfies(H, rk))
			matchrace = TRUE
			break

	if(!matchrace)
		to_chat(user, span_warning("Они не принадлежат к требуемой(ым) родословной(ым)."))
		return

	if(!do_after(user, 15 SECONDS, H)) return

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)
	qdel(src)


// 4) Tithe
/obj/item/quest_token/coin_chest
	name = "сундук десятины"
	desc = "Наполните его мамоной. Когда он насытится, он исчезнет."
	icon_state = "questbox"
	var/sum = 0
	var/required_sum = 250

/obj/item/quest_token/coin_chest/attackby(I, user, params)
	if(!I) return
	if(!_ensure_attacker(user)) return
	if(_has_quest_lock(user))
		to_chat(user, span_warning("Вы под Декретом и не можете выполнять другое рутинное задание."))
		return

	if(istype(I, /obj/item/roguecoin/aalloy)) return
	if(istype(I, /obj/item/roguecoin/inqcoin)) return

	if(istype(I, /obj/item/roguecoin))
		var/obj/item/roguecoin/C = I
		sum += C.get_real_price()
		qdel(C)

		to_chat(user, span_notice("Внесено. Текущая десятина: [sum]."))

		if(sum >= required_sum)
			to_chat(user, span_notice("Сундук принимает десятину."))
			_payout(reward_amount)
			qdel(src)
		return

	..()


// 5) Reliquary

/obj/item/quest_token/reliquary
	name = "запечатанный реликварий"
	desc = "Древняя шкатулка, запечатанная божественными сигилами."
	icon_state = "questbox"
	w_class = WEIGHT_CLASS_NORMAL

	var/code = "0000"
	var/list/bonus_patron_names = list()
	var/next_attempt_ds = 0

/obj/item/quest_token/reliquary/Initialize()
	. = ..()

	if(!length(code) || code == "0000")
		code = generate_reliquary_code()
	else
		if(!(code in GLOB.generated_reliquary_codes))
			GLOB.generated_reliquary_codes += code

	if(!islist(bonus_patron_names) || !bonus_patron_names.len)
		var/list/fallback = list("Astrata","Noc","Dendor","Abyssor","Ravox","Necra","Xylix","Pestra","Malum","Eora")
		bonus_patron_names = list(pick(fallback))

	next_attempt_ds = world.time

/obj/item/quest_token/reliquary/examine(mob/user)
	. = ..()

	if(!islist(bonus_patron_names) || !bonus_patron_names.len)
		return

	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(_patron_matches_any(H, bonus_patron_names))
			. += "<br><span class='notice'>Божественное откровение: <b>[code]</b></span>"
		else
			. += "<br><span class='info'>Последователи [jointext(bonus_patron_names, ", ")] видят код ясно.</span>"

/obj/item/quest_token/reliquary/proc/_ensure_ui_access(mob/living/user)
	if(!user) return FALSE
	if(!user.canUseTopic(src, TRUE)) return FALSE
	if(get_dist(user, src) > 1) return FALSE
	return TRUE

/obj/item/quest_token/reliquary/attack_hand(mob/living/user)
	. = ..()
	if(!_ensure_attacker(user)) return
	if(!_ensure_ui_access(user)) return

	user.set_machine(src)

	var/locked = (world.time < next_attempt_ds)
	var/left = max(0, next_attempt_ds - world.time)
	var/left_s = round(left / 10)
	var/m = left_s / 60
	var/s = left_s % 60
	var/s2 = (s < 10) ? "0[s]" : "[s]"

	var/html = "<center><b>Запечатанный Реликварий</b></center><hr>"
	html += "Введите 4-значный код, чтобы открыть шкатулку.<br>"
	html += "<b>Попытки:</b> раз в <b>20 секунд</b>.<br>"
	html += "<b>Подсказка:</b> <span style='color:#2ecc71'>зелёный</span> = правильное место, "
	html += "<span style='color:#f1c40f'>жёлтый</span> = правильная цифра не на месте.<br><br>"

	if(locked)
		html += "<span style='color:#7f8c8d'>Следующая попытка через [m]:[s2]</span>"
	else
		html += "<a href='?src=[REF(src)];trycode=1'>Попробовать код</a>"

	var/datum/browser/B = new(user, "RELIQUARY_UI", "Запечатанный Реликварий", 360, 220)
	B.set_content(html)
	B.open()
	return TRUE

/obj/item/quest_token/reliquary/Topic(href, href_list)
	. = ..()
	if(!usr) return
	if(!_ensure_attacker(usr)) return
	if(!_ensure_ui_access(usr)) return

	if(_has_quest_lock(usr))
		to_chat(usr, span_warning("Вы под Декретом и не можете выполнять другое рутинное задание."))
		return

	if(href_list["trycode"])
		if(world.time < next_attempt_ds)
			attack_hand(usr)
			return

		var/guess = input(usr, "Введите 4 цифры (0-9).", "Реликварий") as null|text
		if(isnull(guess))
			attack_hand(usr)
			return

		guess = copytext(guess, 1, 5)
		if(!_is_digit_string(guess) || length(guess) != 4)
			to_chat(usr, span_warning("Нужно ровно четыре цифры 0-9."))
			attack_hand(usr)
			return

		var/correct_pos = 0
		for(var/i = 1 to 4)
			if(copytext(code, i, i + 1) == copytext(guess, i, i + 1))
				correct_pos++

		var/correct_digit = 0
		for(var/d = 0 to 9)
			var/ds = "[d]"
			var/nc = _digit_count(code, ds)
			var/ng = _digit_count(guess, ds)
			correct_digit += min(nc, ng)
		correct_digit -= correct_pos

		next_attempt_ds = world.time + (20 SECONDS)

		if(guess == code)
			to_chat(usr, span_notice("Реликварий открывается."))
			_payout(reward_amount)
			qdel(src)
			return
		else
			to_chat(usr, "<span class='notice'>Результат — <span style='color:#2ecc71'>зелёный</span>: [correct_pos], <span style='color:#f1c40f'>жёлтый</span>: [correct_digit]</span>")

		attack_hand(usr)
		return


// 6) Deliver Ration
/obj/item/quest_token/ration_delivery
	name = "благотворительный паёк"
	desc = "Доставьте еду и заботу указанным профессиям."
	icon_state = "questration"
	var/list/required_job_types = list()

/obj/item/quest_token/ration_delivery/attack(target, user)
	if(!istype(target, /mob/living/carbon/human)) return ..()
	if(!_ensure_attacker(user)) return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user)) return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_job_types) || !required_job_types.len)
		to_chat(user, span_warning("Этот паёк неверно настроен. (не задан список профессий)"))
		return

	if(!_mob_matches_any_job(H, required_job_types))
		to_chat(user, span_warning("Они не являются представителями ни одной из требуемых профессий."))
		return

	if(!do_after(user, 15 SECONDS, H)) return

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)

	var/obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice/B = new /obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice(get_turf(H))
	if(istype(H, /mob/living/carbon/human))
		if(hascall(H, "put_in_hands"))
			var/success = call(H, "put_in_hands")(B)
			if(!success)
				B.forceMove(get_turf(H))
		else
			B.forceMove(get_turf(H))
	else
		B.forceMove(get_turf(H))
	qdel(src)


// 7) Offering of Supplies
/obj/item/quest_token/donation_box
	name = "сундук для подношений"
	desc = "Принимает одно заданное подношение."
	icon_state = "questbox"
	var/list/need_types = list()
	var/collected = FALSE

/obj/item/quest_token/donation_box/attackby(I, user, params)
	if(collected || !I) return
	if(!_ensure_attacker(user)) return

	if(_has_quest_lock(user))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти"))
		return

	for(var/T in need_types)
		if(istype(I, T))
			qdel(I)
			collected = TRUE
			to_chat(user, span_notice("Подношение принято."))
			_payout(reward_amount)
			qdel(src)
			return

	to_chat(user, span_warning("Это неприемлемое подношение."))

// 8) Minor Sermon

/obj/item/quest_token/sermon_minor
	name = "жетон проповеди"
	desc = "Произнесите Малую Проповедь последователю определённого покровителя."
	icon_state = "questflaw"

	var/list/required_patron_names = list()

/obj/item/quest_token/sermon_minor/Initialize()
	. = ..()
	if(!islist(required_patron_names) || !required_patron_names.len)
		var/list/fallback = list("Astrata","Noc","Dendor","Abyssor","Ravox","Necra","Xylix","Pestra","Malum","Eora")
		required_patron_names = list(pick(fallback))

/obj/item/quest_token/sermon_minor/examine(mob/user)
	. = ..()
	if(islist(required_patron_names) && required_patron_names.len)
		. += "<br><span class='info'>Эта проповедь ищет последователя: <b>[jointext(required_patron_names, ", ")]</b>.</span>"

/obj/item/quest_token/sermon_minor/attack(mob/living/target, mob/living/user)
	if(!istype(target, /mob/living/carbon/human))
		return ..()
	if(!_ensure_attacker(user))
		return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user))
		return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_patron_names) || !required_patron_names.len)
		to_chat(user, span_warning("Этот жетон неверно настроен. (не задан список покровителей)"))
		return

	if(!_patron_matches_any(H, required_patron_names))
		to_chat(user, span_warning("Они не следуют ни одному из требуемых покровителей."))
		return

	user.visible_message(
		span_notice("[user] начинает краткую проповедь для [H]."),
		span_notice("Я начинаю краткую проповедь для [H].")
	)

	if(!do_after(user, 15 SECONDS, target = H))
		return

	user.visible_message(
		span_notice("[user] заканчивает проповедь для [H]."),
		span_notice("Я заканчиваю проповедь для [H].")
	)

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)
	qdel(src)
	return TRUE


// 9) Witness the Sermon (replaced with find a buff)

/obj/item/quest_token/sermon_witness
	name = "фармакологический зонд"
	desc = "Запишите реакцию: цель должна иметь разрешённый эффект."
	icon_state = "questflaw"
	var/list/required_effect_types = list()

/obj/item/quest_token/sermon_witness/Initialize()
	. = ..()
	if(!islist(required_effect_types) || !required_effect_types.len)
		if(islist(Q_WITNESS_EFFECTS) && Q_WITNESS_EFFECTS.len)
			required_effect_types = Q_WITNESS_EFFECTS.Copy()
		else
			required_effect_types = list(/datum/status_effect/buff/sermon)

/obj/item/quest_token/sermon_witness/attack(target, user)
	if(!istype(target, /mob/living/carbon/human))
		return ..()
	if(!_ensure_attacker(user))
		return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user))
		return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_effect_types) || !required_effect_types.len)
		to_chat(user, span_warning("Этот жетон неверно настроен. (не задан список эффектов)"))
		return

	var/matched = FALSE
	for(var/T in required_effect_types)
		if(ispath(T, /datum/status_effect))
			if(H.has_status_effect(T))
				matched = TRUE
				break

	if(!matched)
		to_chat(user, span_warning("Они не имеют ни одного из требуемых эффектов."))
		return

	if(!do_after(user, 10 SECONDS, H))
		return

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)
	qdel(src)


// 10) Researchment of Addiction
/obj/item/quest_token/flaw_aid
	name = "амулет милосердия"
	desc = "Успокоить игрока, имеющего указанный недостаток."
	icon_state = "questflaw"
	var/list/required_flaw_types = list()

/obj/item/quest_token/flaw_aid/attack(target, user)
	if(!istype(target, /mob/living/carbon/human)) return ..()
	if(!_ensure_attacker(user)) return

	var/mob/living/carbon/human/H = target
	if(!_ensure_target_player(H, user)) return

	if(_has_quest_lock(H))
		to_chat(user, span_warning("Они уже ответили на зов — отойдите и дайте времени идти."))
		return

	if(!islist(required_flaw_types) || !required_flaw_types.len)
		to_chat(user, span_warning("Этот амулет неверно настроен. (не задан список недостатков)"))
		return

	var/matched = FALSE
	for(var/ft in required_flaw_types)
		if(_target_has_flaw(H, ft))
			matched = TRUE
			break

	if(!matched)
		to_chat(user, span_warning("Цель не имеет ни одного из требуемых недостатков."))
		return

	if(!do_after(user, 15 SECONDS, H)) return

	_apply_parish_boon(H)
	_apply_quest_lock(H)
	_payout(reward_amount)
	qdel(src)


// ---------------------------------------------------------------------
// quest fliff
// ---------------------------------------------------------------------

/proc/_rt_patron_name_pool()
	build_divine_patrons_index()
	var/list/pool = list()
	if(divine_patrons_index && divine_patrons_index.len)
		for(var/n in divine_patrons_index)
			pool += "[n]"
	else
		pool = list("Astrata","Noc","Dendor","Abyssor","Ravox","Necra","Xylix","Pestra","Malum","Eora")
	return pool

/proc/_rt_build_full_quest_set(mob/living/carbon/human/H)
	if(!H) return list()
	var/list/archetypes = list()

	var/list/skill_cands = list()
	for(var/t in typesof(/datum/skill))
		if(t != /datum/skill)
			skill_cands += t

	var/list/race_keys_master = list(
		"northern_human","dwarf","dark_elf","wood_elf","half_elf","half_orc",
		"goblin","kobold","lizard","aasimar","tiefling","halfkin","wildkin",
		"golem","doll","vermin","dracon","axian","tabaxi","vulp","lupian",
		"moth","lamia"
	)

	var/list/candidate_types_master = list(
		/obj/item/ingot/iron,
		/obj/item/ingot/steel,
		/obj/item/rogueweapon/spear/billhook,
		/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
		/obj/item/clothing/neck/roguetown/chaincoif,
		/obj/item/clothing/wrists/roguetown/bracers,
		/obj/item/reagent_containers/powder/spice,
		/obj/item/reagent_containers/glass/cup/ceramic/fancy,
		/obj/item/polishing_cream,
		/obj/item/reagent_containers/food/snacks/grown/manabloom,
		/obj/item/roguegem/green,
		/obj/item/roguegem/violet,
		/obj/item/roguegem/amethyst
	)
	if(!candidate_types_master.len)
		candidate_types_master = list(/obj/item/ingot/iron)

	var/list/patron_pool = _rt_patron_name_pool()

	var/list/job_pool = _rt_all_job_types_master()

	var/list/flaw_cands = list()
	for(var/t2 in typesof(/datum/charflaw))
		if(t2 != /datum/charflaw)
			flaw_cands += t2

	var/list/diff_generic = list(
		"easy"   = list("count" = 5, "reward" = 100),
		"medium" = list("count" = 3, "reward" = 150),
		"hard"   = list("count" = 1, "reward" = 200)
	)

	var/list/diff_tithe = list(
		"easy"   = list("required_sum" = 100, "reward" = 100),
		"medium" = list("required_sum" = 250, "reward" = 150),
		"hard"   = list("required_sum" = 500, "reward" = 200)
	)

	var/list/tithe_diffs = list()
	for(var/dn4 in diff_tithe)
		var/list/D4 = diff_tithe[dn4]
		var/need_sum = D4["required_sum"]
		var/rew4     = D4["reward"]

		tithe_diffs[dn4] = list(
			"diff"       = dn4,
			"desc"       = "Пожертвуйте не менее [need_sum] мамоны в сундук.",
			"reward"     = rew4,
			"token_path" = /obj/item/quest_token/coin_chest,
			"params"     = list("required_sum" = need_sum),
			"spawned"    = FALSE
		)

	archetypes += list(list(
		"kind"          = "coin_chest",
		"title"         = "Tithe",
		"accepted_diff" = "",
		"difficulties"  = tithe_diffs
	))

	var/list/skill_diffs = list()
	for(var/dn2 in diff_generic)
		var/list/D2 = diff_generic[dn2]
		var/ccount2 = D2["count"]
		var/rew2    = D2["reward"]

		var/list/picked_skills = _rt_pick_unique(skill_cands, ccount2)
		if(!picked_skills.len) continue

		var/list/skill_names = _rt_skill_names(picked_skills)
		var/skills_desc_txt = html_attr(jointext(skill_names, ", "))

		skill_diffs[dn2] = list(
			"diff"       = dn2,
			"desc"       = "Благословите ЭКСПЕРТА ЛЮБОГО из навыков: [skills_desc_txt].",
			"reward"     = rew2,
			"token_path" = /obj/item/quest_token/skill_bless,
			"params"     = list("required_skills" = picked_skills),
			"spawned"    = FALSE
		)

	if(skill_diffs.len)
		archetypes += list(list(
			"kind"          = "skill_bless",
			"title"         = "Find Expertise",
			"accepted_diff" = "",
			"difficulties"  = skill_diffs
		))

	var/list/blood_diffs = list()
	for(var/dn3 in diff_generic)
		var/list/D3 = diff_generic[dn3]
		var/ccount3 = D3["count"]
		var/rew3    = D3["reward"]

		var/list/picked_races = _rt_pick_unique(race_keys_master, ccount3)
		if(!picked_races.len) continue

		var/list/races_upper = list()
		for(var/R in picked_races)
			races_upper += uppertext("[R]")

		var/races_desc_txt = html_attr(jointext(races_upper, ", "))

		blood_diffs[dn3] = list(
			"diff"       = dn3,
			"desc"       = "Возьмите кровь у ЛЮБОГО из: [races_desc_txt].",
			"reward"     = rew3,
			"token_path" = /obj/item/quest_token/blood_draw,
			"params"     = list("required_race_keys" = picked_races),
			"spawned"    = FALSE
		)

	if(blood_diffs.len)
		archetypes += list(list(
			"kind"          = "blood_draw",
			"title"         = "Blood Research",
			"accepted_diff" = "",
			"difficulties"  = blood_diffs
		))

	var/list/ration_diffs = list()
	for(var/dn6 in diff_generic)
		var/list/D6 = diff_generic[dn6]
		var/ccount6 = D6["count"]
		var/rew6    = D6["reward"]

		var/list/picked_jobs = _rt_pick_unique(job_pool, ccount6)
		if(!picked_jobs.len) continue

		var/list/job_names = list()
		for(var/JT in picked_jobs)
			job_names += html_attr(_rt_job_display_name(JT))

		var/jobs_desc_txt = jointext(job_names, ", ")

		ration_diffs[dn6] = list(
			"diff"       = dn6,
			"desc"       = "Доставьте паёк ЛЮБОМУ из: [jobs_desc_txt].",
			"reward"     = rew6,
			"token_path" = /obj/item/quest_token/ration_delivery,
			"params"     = list("required_job_types" = picked_jobs),
			"spawned"    = FALSE
		)

	if(ration_diffs.len)
		archetypes += list(list(
			"kind"          = "ration_delivery",
			"title"         = "Deliver Ration",
			"accepted_diff" = "",
			"difficulties"  = ration_diffs
		))

	var/list/donate_diffs = list()
	for(var/dn7 in diff_generic)
		var/list/D7 = diff_generic[dn7]
		var/ccount7 = D7["count"]
		var/rew7    = D7["reward"]

		var/list/picked_types = _rt_pick_unique(candidate_types_master, ccount7)
		if(!picked_types.len) continue

		var/list/item_names = list()
		for(var/T in picked_types)
			item_names += html_attr(_rt_type_display_name(T))
		var/items_desc_txt = jointext(item_names, ", ")

		donate_diffs[dn7] = list(
			"diff"       = dn7,
			"desc"       = "Поместите ОДНО подношение в сундук — ЛЮБОЕ из: [items_desc_txt].",
			"reward"     = rew7,
			"token_path" = /obj/item/quest_token/donation_box,
			"params"     = list("need_types" = picked_types),
			"spawned"    = FALSE
		)

	if(donate_diffs.len)
		archetypes += list(list(
			"kind"          = "donation_box",
			"title"         = "Offering of Supplies",
			"accepted_diff" = "",
			"difficulties"  = donate_diffs
		))

	var/list/sermon_minor_diffs = list()
	for(var/dn8 in diff_generic)
		var/list/D8 = diff_generic[dn8]
		var/ccount8 = D8["count"]
		var/rew8    = D8["reward"]

		var/list/picked_patrons = _rt_pick_unique(patron_pool, ccount8)
		if(!picked_patrons.len) continue

		var/patrons_desc_txt = html_attr(jointext(picked_patrons, ", "))

		sermon_minor_diffs[dn8] = list(
			"diff"       = dn8,
			"desc"       = "Произнесите Малую Проповедь последователю ЛЮБОГО из: [patrons_desc_txt].",
			"reward"     = rew8,
			"token_path" = /obj/item/quest_token/sermon_minor,
			"params"     = list("required_patron_names" = picked_patrons),
			"spawned"    = FALSE
		)

	if(sermon_minor_diffs.len)
		archetypes += list(list(
			"kind"          = "sermon_minor",
			"title"         = "Minor Sermon",
			"accepted_diff" = "",
			"difficulties"  = sermon_minor_diffs
		))

	var/list/box_diffs = list()
	for(var/dn5 in diff_generic)
		var/list/D5 = diff_generic[dn5]
		var/ccount5 = D5["count"]
		var/rew5    = D5["reward"]

		var/list/picked_patrons2 = _rt_pick_unique(patron_pool, ccount5)
		if(!picked_patrons2.len) continue

		var/patrons_hint_txt = html_attr(jointext(picked_patrons2, ", "))

		box_diffs[dn5] = list(
			"diff"       = dn5,
			"desc"       = "Разгадайте 4-значный код (последователи [patrons_hint_txt] могут его видеть).",
			"reward"     = rew5,
			"token_path" = /obj/item/quest_token/reliquary,
			"params"     = list("bonus_patron_names" = picked_patrons2),
			"spawned"    = FALSE
		)

	if(box_diffs.len)
		archetypes += list(list(
			"kind"          = "reliquary",
			"title"         = "The Riddle of the Box",
			"accepted_diff" = "",
			"difficulties"  = box_diffs
		))

	var/list/witness_diffs = list()
	for(var/dn9 in diff_generic)
		var/list/D9 = diff_generic[dn9]
		var/rew9    = D9["reward"]

		var/cn9 = 1
		if("count" in D9 && isnum(D9["count"]))
			cn9 = D9["count"]

		var/list/pool   = (islist(Q_WITNESS_EFFECTS) && Q_WITNESS_EFFECTS.len) ? Q_WITNESS_EFFECTS : list(/datum/status_effect/buff/sermon)
		var/list/picked = _rt_pick_unique(pool, max(1, cn9))

		var/list/names = list()
		for(var/T in picked)
			names += html_attr(_rt_effect_type_name(T))
		var/effects_desc_txt = jointext(names, ", ")

		witness_diffs[dn9] = list(
			"diff"       = dn9,
			"desc"       = "Запишите реакцию: цель должна иметь ЛЮБОЙ из: [effects_desc_txt].",
			"reward"     = rew9,
			"token_path" = /obj/item/quest_token/sermon_witness,
			"params"     = list("required_effect_types" = picked),
			"spawned"    = FALSE
		)

	archetypes += list(list(
		"kind"          = "sermon_witness",
		"title"         = "Record the Reaction",
		"accepted_diff" = "",
		"difficulties"  = witness_diffs
	))

	var/list/flaw_diffs = list()
	for(var/dn10 in diff_generic)
		var/list/D10 = diff_generic[dn10]
		var/ccount10 = D10["count"]
		var/rew10    = D10["reward"]

		var/list/picked_flaws = _rt_pick_unique(flaw_cands, ccount10)
		if(!picked_flaws.len) continue

		var/list/flaw_names = _rt_flaw_names(picked_flaws)
		var/flaws_desc_txt = html_attr(jointext(flaw_names, ", "))

		flaw_diffs[dn10] = list(
			"diff"       = dn10,
			"desc"       = "Успокойте игрока, имеющего ЛЮБОЙ из: [flaws_desc_txt].",
			"reward"     = rew10,
			"token_path" = /obj/item/quest_token/flaw_aid,
			"params"     = list("required_flaw_types" = picked_flaws),
			"spawned"    = FALSE
		)

	if(flaw_diffs.len)
		archetypes += list(list(
			"kind"          = "flaw_aid",
			"title"         = "Mercy",
			"accepted_diff" = "",
			"difficulties"  = flaw_diffs
		))

	return archetypes

/proc/_rt_shuffle_list(list/L)
	if(!islist(L))
		return list()
	var/list/out = L.Copy()
	if(out.len <= 1)
		return out
	for(var/i = 1, i <= out.len - 1, i++)
		var/j = rand(i, out.len)
		if(j != i)
			var/tmp = out[i]
			out[i] = out[j]
			out[j] = tmp
	return out

/proc/_rt_build_player_quest_set(mob/living/carbon/human/H)
	if(!H) return list()
	var/list/full = _rt_build_full_quest_set(H)
	if(!islist(full) || !full.len)
		return list()
	full = _rt_shuffle_list(full)

	var/list/final_list = list()
	var/list/used_kinds = list()

	for(var/i = 1, i <= full.len && final_list.len < 3, i++)
		var/list/arch = full[i]
		if(!islist(arch)) continue
		var/k = arch["kind"]
		if(!istext(k) || !length(k))
			k = "[arch["title"]]"
		if(used_kinds.Find(k))
			continue
		used_kinds[k] = TRUE
		arch["accepted_diff"] = ""
		var/list/diffs = arch["difficulties"]
		if(islist(diffs))
			for(var/dkey in diffs)
				var/list/D = diffs[dkey]
				if(!islist(D)) continue
				D["spawned"] = FALSE
				diffs[dkey] = D
			arch["difficulties"] = diffs

		final_list += list(arch)

	return final_list
