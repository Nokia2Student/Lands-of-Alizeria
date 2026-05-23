#define DISGRACE_KNIGHT_COOLDOWN (30 SECONDS)
#define FIRE_GUARD_COOLDOWN (30 SECONDS)
#define HAND_DISGUISE_COOLDOWN (30 SECONDS)

/datum/job/roguetown/hand
	title = "Spymaster"
	flag = HAND
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/hand
	advclass_cat_rolls = list(CTAG_HAND = 20)
	display_order = JDO_HAND
	tutorial = "Ты верный и ближайший советник своего лорда, вы прошли не одну битву и между вами нет места сомнению. Ты дал клятву вечного служения во славу своего лорда, защищая его власть не столько мечом, сколько тайной, словом, маской и ложью."
	give_bank_account = 44
	noble_income = 22
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'
	social_rank = SOCIAL_RANK_SPYMASTER

	job_traits = list(TRAIT_NOBLE, TRAIT_DISGUISER, TRAIT_DECEIVING_MEEKNESS, TRAIT_NOFALLDAMAGE1)

	job_subclasses = list(
		/datum/advclass/hand/spymaster
		)

	virtue_restrictions = list(
		/datum/virtue/combat/crimson_curse
	)

/datum/job/roguetown/hand/special_job_check(mob/dead/new_player/player)
	if(!player)
		return
	if(!player.ckey)
		return
	for(var/mob/dead/new_player/N in GLOB.player_list)
		if(N.mind.assigned_role == "Landowner")
			return TRUE
	return FALSE

/datum/job/roguetown/hand/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/mob/living/carbon/human/H = spawned
	addtimer(CALLBACK(SSfamilytree, TYPE_PROC_REF(/datum/controller/subsystem/familytree, AddRoyal), H, FAMILY_OMMER), 45 SECONDS)

/datum/outfit/job/hand
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/steel
	beltr = /obj/item/rogueweapon/scabbard/sword
	beltl = /obj/item/rogueweapon/scabbard/sheath
	job_bitflag = BITFLAG_ROYALTY

/datum/job/roguetown/hand/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(istype(H))
			H.verbs |= list(/mob/living/carbon/human/proc/hand_disguise)
			H.hand_disgrace_cooldown = 0
			H.hand_fire_guard_cooldown = 0
	addtimer(CALLBACK(src, PROC_REF(know_agents), L), 5 SECONDS)

/datum/job/roguetown/hand/proc/know_agents(var/mob/living/carbon/human/H)
	if(!GLOB.court_agents.len)
		to_chat(H, span_notice("You begun the week with no agents."))
	else
		to_chat(H, span_notice("We begun the week with these agents:"))
		for(var/name in GLOB.court_agents)
			to_chat(H, span_notice(name))

// Disgrace Knight verb - available to Duke and Hand
/mob/living/carbon/human
	var/fake_identity_name = null
	var/fake_job = null
	var/fake_species = null
	var/fake_origin = null
	var/fake_region = null
	var/fake_house = null
	var/hide_house = FALSE
	var/fake_age = null
	var/real_gender = null
	var/real_pronouns = null
	var/real_voice_type = null
	var/real_skin_tone = null
	var/real_voice_color = null
	var/list/original_descriptor_entries = null
	var/list/original_custom_descriptors = null
	var/hand_disgrace_cooldown = 0
	var/hand_fire_guard_cooldown = 0
	var/hand_disguise_cooldown = 0

/mob/living/carbon/human/proc/select_disguise(option)
	switch(option)
		if("Job")
			fake_job = tgui_input_text(src, "Введите фальшивую профессию:", "Фальшивая профессия")
		if("Species")
			var/new_species = tgui_input_list(src, "Выберите фальшивую расу:", "Фальшивая раса", list("Человек", "Зверолюд", "Полукровка", "Аасимар", "Эльф",
				"Солнечный Эльф", "Тёмный Эльф", "Тифлинг"))
			if(new_species)
				var/type = GLOB.species_list[trim(new_species)]
				if(type)
					var/datum/species/S = type
					fake_species = trim(new_species)
					if(S.origin)
						fake_origin = S.origin
					else if(S.origin_default)
						var/datum/virtue/origin/O = new S.origin_default
						fake_origin = O.name
					else
						fake_origin = null
					fake_region = S.region
		if("Gender")
			if(real_gender == null)
				real_gender = gender
			if(real_pronouns == null)
				real_pronouns = pronouns
			if(real_voice_type == null)
				real_voice_type = voice_type
			var/new_gender = tgui_input_list(src, "Выберите фальшивый пол", "Фальшивый пол", list(MALE, FEMALE))
			if(new_gender)
				switch(new_gender)
					if(MALE)
						gender = MALE
						pronouns = HE_HIM
						voice_type = VOICE_TYPE_MASC
					if(FEMALE)
						gender = FEMALE
						pronouns = SHE_HER
						voice_type = VOICE_TYPE_FEM
				update_body()
		if("House")
			var/new_house = tgui_input_list(src, "Выберите опцию знатного рода", "House", list("Выбрать фальшивый знатный род", "Скрыть знатный род", "Показать настоящий знатный род"))
			if(new_house)
				switch(new_house)
					if("Выбрать фальшивый знатный род")
						fake_house = tgui_input_text(src, "Название фальшивого знатного рода:", "Знатный род")
						if(fake_house)
							hide_house = FALSE
					if("Скрыть знатный род")
						hide_house = TRUE
					if("Показать настоящий знатный род")
						hide_house = FALSE
						fake_house = null
		if("Age")
			var/new_age = tgui_input_list(src, "Выберите фальшивый возраст:", "Фальшивый возраст", list("Взрослый", "Зрелый", "Старый"))
			if(new_age)
				switch(new_age)
					if("Взрослый")
						fake_age = AGE_ADULT
					if("Зрелый")
						fake_age = AGE_MIDDLEAGED
					if("Старый")
						fake_age = AGE_OLD
		if("Social Rank")
			var/new_rank = tgui_input_list(src, "Выберите фальшивый социальный ранг:", "Фальшивый социальный ранг", list("Нищий", "Крестьянин", "Чужак (Крестьянин с трейтом чужака)", "Йомен", "Мелкий дворянин", "Дворянин", "Мастер шпион", "Королевская особа"))
			if(new_rank)
				ADD_TRAIT(src, TRAIT_DISGUISED_SOCIAL, SPYMASTER_TRAIT)
				REMOVE_TRAIT(src, TRAIT_OUTLANDER, SPYMASTER_TRAIT)
				switch(new_rank)
					if("Нищий")
						social_rank = SOCIAL_RANK_DIRT
					if("Крестьянин")
						social_rank = SOCIAL_RANK_PEASANT
					if("Чужак (Крестьянин с трейтом чужака)")
						social_rank = SOCIAL_RANK_PEASANT
						ADD_TRAIT(src, TRAIT_OUTLANDER, SPYMASTER_TRAIT)
					if("Йомен")
						social_rank = SOCIAL_RANK_YEOMAN
					if("Мелкий дворянин")
						social_rank = SOCIAL_RANK_MINOR_NOBLE
					if("Дворянин")
						social_rank = SOCIAL_RANK_NOBLE
					if("Мастер шпион")
						social_rank = SOCIAL_RANK_SPYMASTER
						REMOVE_TRAIT(src, TRAIT_DISGUISED_SOCIAL, SPYMASTER_TRAIT)
					if("Королевская особа")
						social_rank = SOCIAL_RANK_ROYAL
		if("Descriptors")
			var/descriptor = tgui_input_list(src, "Выберите черту описания для изменения:", "Черта описания", list("Height", "Body", "Stature", "Face",
				"Resting Expression", "Skin", "Voice", "Prominent #1", "Prominent #2", "Prominent #3", "Prominent #4"))
			if(descriptor)
				client.prefs.select_descriptors_disguise(descriptor, src)
		if("Skin Tone")
			var/datum/species/S = get_effective_species()
			if(!(LAMIAN_TAIL in S.species_traits) && S.use_skintones)
				if(real_skin_tone == null)
					real_skin_tone = skin_tone
				var/listy = S.get_skin_list()
				var/new_tone = tgui_input_list(src, "Выберите фальшивый цвет кожи:", "Фальшивый цвет кожи", listy)
				if(new_tone)
					skin_tone = listy[new_tone]
					client.prefs.try_update_mutant_colors()
					updateappearance(TRUE)
			else
				to_chat(src, span_warning("Текущая раса не использует цвета кожи."))
		if("Voice Color")
			if(real_voice_color == null)
				real_voice_color = voice_color
			var/new_voice = input(src, "Выберите новый тон голоса:", "Тон голоса", "#"+voice_color) as color|null
			if(new_voice)
				if(color_hex2num(new_voice) < 230)
					to_chat(src, "<font color='red'>Этот голос слишком тёмный для смертных.</font>")
					return
				voice_color = sanitize_hexcolor(new_voice)
		if("Origin")
			var/list/origin_choices = list()
			for(var/path as anything in GLOB.virtues)
				var/datum/virtue/V = GLOB.virtues[path]
				if(!istype(V, /datum/virtue/origin))
					continue
				if(!V.name)
					continue
				origin_choices[V.name] = V
			var/new_origin = tgui_input_list(src, "Выберите фальшивое происхождение:", "Фальшивое происхождение:", origin_choices)
			if(new_origin)
				var/datum/virtue/origin/O = origin_choices[new_origin]
				fake_origin = O.name
				if(istype(O, /datum/virtue/origin/racial))
					fake_region = O.region_title
				else
					fake_region = null
				to_chat(src, span_notice("Вы замаскировали своё происхождение как: [fake_origin][fake_region ? " ([fake_region])" : ""]."))

/datum/preferences/proc/select_descriptors_disguise(option, mob/living/carbon/human/user)
	var/choice_type
	var/datum/species/S = user.get_effective_species()
	switch(option)
		if("Height")
			choice_type = /datum/descriptor_choice/height
		if("Body")
			choice_type = /datum/descriptor_choice/body
		if("Stature")
			choice_type = /datum/descriptor_choice/stature
		if("Face")
			choice_type = /datum/descriptor_choice/face
		if("Resting Expression")
			choice_type = /datum/descriptor_choice/face_exp
		if("Voice")
			choice_type = /datum/descriptor_choice/voice
		if("Prominent #1")
			choice_type = /datum/descriptor_choice/prominent_one
		if("Prominent #2")
			choice_type = /datum/descriptor_choice/prominent_two
		if("Prominent #3")
			choice_type = /datum/descriptor_choice/prominent_three
		if("Prominent #4")
			choice_type = /datum/descriptor_choice/prominent_four

		if("Skin")
			if(/datum/descriptor_choice/skin in S.descriptor_choices)
				choice_type = /datum/descriptor_choice/skin
			else if(/datum/descriptor_choice/fur in S.descriptor_choices)
				choice_type = /datum/descriptor_choice/fur
			else if(/datum/descriptor_choice/scales in S.descriptor_choices)
				choice_type = /datum/descriptor_choice/scales
			else if(/datum/descriptor_choice/chitin in S.descriptor_choices)
				choice_type = /datum/descriptor_choice/chitin
			else if(/datum/descriptor_choice/feathers in S.descriptor_choices)
				choice_type = /datum/descriptor_choice/feathers
	if(!choice_type)
		to_chat(user, span_warning("Эта черта описания недоступна для вашей расы."))
		return
	var/picked = pick_descriptor(choice_type, user)
	if(picked)
		var/datum/descriptor_entry/entry = get_descriptor_entry_for_choice(choice_type)
		entry.descriptor_type = picked
		apply_descriptors(user)
		to_chat(user, span_notice("Черта описания успешно обновлена."))

/mob/living/carbon/human/proc/hand_disguise()
	set name = "Замаскироваться"
	set category = "Маскировка"

	if(stat)
		return
	if(hand_disguise_cooldown > world.time)
		to_chat(src, span_warning("Мне нужно подождать [DisplayTimeText(hand_disguise_cooldown - world.time)] прежде чем замаскироваться."))
		return FALSE
	var/choice_initial = tgui_input_list(src, "Выберите действие:", "Маскировка", list("Замаскироваться", "Вернуть облик"))
	if(!choice_initial)
		return
	hand_disguise_cooldown = world.time + HAND_DISGUISE_COOLDOWN

	if(choice_initial == "Вернуть облик")
		if(original_descriptor_entries)
			client.prefs.descriptor_entries = list()
			for(var/datum/descriptor_entry/E as anything in original_descriptor_entries)
				var/datum/descriptor_entry/copy = new /datum/descriptor_entry()
				copy.descriptor_choice_type = E.descriptor_choice_type
				copy.descriptor_type = E.descriptor_type
				client.prefs.descriptor_entries += copy
		if(original_custom_descriptors)
			client.prefs.custom_descriptors = list()
			for(var/datum/custom_descriptor_entry/C as anything in original_custom_descriptors)
				var/datum/custom_descriptor_entry/copy2 = new /datum/custom_descriptor_entry()
				copy2.prefix_type = C.prefix_type
				copy2.content_text = C.content_text
				client.prefs.custom_descriptors += copy2
		client.prefs.apply_descriptors(src)
		original_descriptor_entries = null
		original_custom_descriptors = null

		REMOVE_TRAIT(src, TRAIT_DISGUISED, SPYMASTER_TRAIT)
		REMOVE_TRAIT(src, TRAIT_DISGUISED_SOCIAL, SPYMASTER_TRAIT)

		fake_identity_name = null
		fake_job = null
		fake_species = null
		fake_origin = null
		fake_region = null
		fake_house = null
		fake_age = null

		skin_tone = real_skin_tone
		real_skin_tone = null
		client.prefs.try_update_mutant_colors()
		updateappearance(TRUE)
		voice_color = real_voice_color
		real_voice_color = null

		gender = real_gender
		real_gender = null
		pronouns = real_pronouns
		real_pronouns = null
		voice_type = real_voice_type
		real_voice_type = null
		update_body()

		to_chat(src, span_notice("Вы вернули свой истинный облик."))
		return TRUE

	var/name_input = tgui_input_text(src, "Введите фальшивое имя:", "Фальшивое имя")
	name_input = reject_bad_name(name_input)
	if(!name_input || !length(name_input))
		to_chat(src, span_warning("Маскировка не удалась. Имя не было введено или оно было некорректно."))
		return FALSE

	ADD_TRAIT(src, TRAIT_DISGUISED, SPYMASTER_TRAIT)

	fake_identity_name = name_input

	if(!original_descriptor_entries)
		original_descriptor_entries = list()
		for(var/datum/descriptor_entry/E as anything in client.prefs.descriptor_entries)
			var/datum/descriptor_entry/copy = new /datum/descriptor_entry()
			copy.descriptor_choice_type = E.descriptor_choice_type
			copy.descriptor_type = E.descriptor_type
			original_descriptor_entries += copy
	if(!original_custom_descriptors)
		original_custom_descriptors = list()
		for(var/datum/custom_descriptor_entry/C as anything in client.prefs.custom_descriptors)
			var/datum/custom_descriptor_entry/copy2 = new /datum/custom_descriptor_entry()
			copy2.prefix_type = C.prefix_type
			copy2.content_text = C.content_text
			original_custom_descriptors += copy2

	to_chat(src, span_notice("Вы маскируетесь под новую личность: [fake_identity_name]."))

	var/list/disguise_options = list(
		"Job",
		"Gender",
		"Species",
		"House",
		"Age",
		"Social Rank",
		"Descriptors",
		"Skin Tone",
		"Voice Color",
		"Origin"
	)

	while(TRUE)
		var/choice = tgui_input_list(src, "Изменить что?", "Выбор маскировки", disguise_options)
		if(!choice)
			break
		select_disguise(choice)

	return TRUE

/mob/living/carbon/human/proc/disgrace_knight()
	set name = "Disgrace Knight"
	set category = "Nobility"

	if(stat)
		return

	// Check cooldown and show remaining time BEFORE input
	if(hand_disgrace_cooldown > world.time)
		to_chat(src, span_warning("I need to wait [DisplayTimeText(hand_disgrace_cooldown - world.time)] before disgracing another knight."))
		return FALSE

	// Must be in the throne room
	if(!istype(get_area(src), /area/rogue/indoors/town/manor))
		to_chat(src, span_warning("I need to do this from the keep's manor."))
		return FALSE

	var/inputty = input("Disgrace or restore a knight's honor. Enter their name:", "Knight Honor") as text|null
	if(!inputty)
		return

	// Find target knight
	var/mob/living/carbon/human/target
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H == src)
			continue
		if(H.real_name == inputty)
			target = H
			break

	if(!target)
		to_chat(src, span_warning("Could not find anyone by that name."))
		return FALSE

	// Check if target is actually a Knight
	if(!(target.job == "Knight" || target.job == "Dame"))
		to_chat(src, span_warning("[target.real_name] is not a knight."))
		return FALSE

	hand_disgrace_cooldown = world.time + DISGRACE_KNIGHT_COOLDOWN

	// If already disgraced, restore their honor
	if(HAS_TRAIT(target, TRAIT_DISGRACED_KNIGHT))
		REMOVE_TRAIT(target, TRAIT_DISGRACED_KNIGHT, TRAIT_GENERIC)
		target.remove_stress(/datum/stressevent/disgracedknight)
		target.remove_status_effect(/datum/status_effect/debuff/disgracedknight_town)
		target.remove_status_effect(/datum/status_effect/debuff/disgracedknight_keep)

		to_chat(target, span_notice("Your honor and knighthood have been restored by [real_name]!"))
		priority_announce("[real_name] has restored [inputty]'s honor and knighthood!", title = "Honor Restored", sound = 'sound/misc/bell.ogg')
		return TRUE

	// Otherwise, disgrace them
	ADD_TRAIT(target, TRAIT_DISGRACED_KNIGHT, TRAIT_GENERIC)
	target.add_stress(/datum/stressevent/disgracedknight)
	// Add two debuffs to cancel out the knight town and keep buffs because of the perma-testmerged PR
	// I'll fix this implementation after that PR gets merged, or closed.
	target.apply_status_effect(/datum/status_effect/debuff/disgracedknight_town)
	target.apply_status_effect(/datum/status_effect/debuff/disgracedknight_keep)

	to_chat(target, span_boldwarning("You have been stripped of your knighthood and honor by order of [real_name]!"))
	priority_announce("[real_name] has disgraced [inputty], stripping them of their knighthood!", title = "DISHONOR", sound = 'sound/misc/excomm.ogg')

	return TRUE

// Fire Guard verb - available to Duke, Hand, and Marshal
/mob/living/carbon/human/proc/fire_guard()
	set name = "Fire Guard"
	set category = "Nobility"

	if(stat)
		return

	// Check cooldown and show remaining time BEFORE input
	if(hand_fire_guard_cooldown > world.time)
		to_chat(src, span_warning("I need to wait [DisplayTimeText(hand_fire_guard_cooldown - world.time)] before firing another guard."))
		return FALSE

	var/inputty = input("Fire a guard from service. They cannot be re-hired. Enter their name:", "Fire Guard") as text|null
	if(!inputty)
		return

	// Find target
	var/mob/living/carbon/human/target
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H == src)
			continue
		if(H.real_name == inputty)
			target = H
			break

	if(!target)
		to_chat(src, span_warning("Could not find anyone by that name."))
		return FALSE

	// Check if target is actually a Man at Arms (guard with TRAIT_GUARDSMAN)
	if(!(target.job == "Man at Arms" || target.job == "Woman at Arms"))
		to_chat(src, span_warning("[target.real_name] is not a guard."))
		return FALSE

	if(!HAS_TRAIT(target, TRAIT_GUARDSMAN))
		to_chat(src, span_warning("[target.real_name] is not currently serving as a guard."))
		return FALSE

	hand_fire_guard_cooldown = world.time + FIRE_GUARD_COOLDOWN

	// Fire them - remove guard trait and change job to Towner
	REMOVE_TRAIT(target, TRAIT_GUARDSMAN, JOB_TRAIT)
	target.remove_status_effect(/datum/status_effect/buff/guardbuffone) // Remove the guard buff immediately
	target.job = "Towner"
	target.advjob = null // Clear their subclass so they don't show as their old advclass, yes I know this is hacky.
	if(target.mind)
		target.mind.assigned_role = "Towner"

	to_chat(target, span_boldwarning("You have been dismissed from the guard by [real_name]!"))
	priority_announce("[real_name] has dismissed [inputty] from the guard!", title = "Dismissal", sound = 'sound/misc/bell.ogg')

	return TRUE

/*
/datum/advclass/hand/hand
	name = "Hand"
	tutorial = "You serve as both soldier and strategist to the Noble-Family, wielding steel and intrigue with potent ability. Let no man forget whose ear you whisper into, your stratagems have claimed more lives than any spymaster's plots ever could."
	outfit = /datum/outfit/job/hand/handclassic

	category_tags = list(CTAG_HAND)

	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_HEAVYARMOR)
	subclass_stats = list(
		STATKEY_PER = 3,
		STATKEY_INT = 3,
		STATKEY_STR = 2
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
	)

//Classical hand start - same as before, nothing changed.
/datum/outfit/job/hand/handclassic/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = new /datum/voicepack/male/tyrant()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/dtace = 1, /obj/item/storage/keyring/hand = 1)
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	pants = /obj/item/clothing/under/roguetown/tights/black
	id = /obj/item/scomstone/garrison */

/datum/advclass/hand/spymaster
	name = "Spymaster"
	tutorial = "You serve as both spymaster and confidant to the Noble-Family, wielding cloak and dagger schemes with potent ability. Let no man forget whose ear you whisper into, your plots have claimed more lives than any strategist's steel ever could."
	outfit = /datum/outfit/job/hand/spymaster
	category_tags = list(CTAG_HAND)

	subclass_languages = list(
	/datum/language/thievescant,
	)

	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT, TRAIT_PERFECT_TRACKER, TRAIT_KEENEARS, TRAIT_ARCYNE_T2)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_PER = 2,
		STATKEY_INT = 2,
		STATKEY_STR = 2,
		STATKEY_END = 3,
		STATKEY_CON = -2,
		STATKEY_FOR = -2,
	)

	subclass_spellpoints = 12
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_MASTER,
		/datum/skill/misc/stealing = SKILL_LEVEL_MASTER,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_MASTER, // not like they're gonna break into the vault.
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/guns = SKILL_LEVEL_MASTER,
	)

//Spymaster start. More similar to the rogue adventurer - loses heavy armor for more sneaky stuff.
/datum/outfit/job/hand/spymaster/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mirror_transform)
	H.dna.species.soundpack_m = new /datum/voicepack/male/tyrant()
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/dtace = 1, /obj/item/storage/keyring/hand = 1, /obj/item/lockpickring/mundane)
	if(H.dna.species.type in NON_DWARVEN_RACE_TYPES)
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
		cloak = /obj/item/clothing/cloak/half/shadowcloak
		gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
		mask = /obj/item/clothing/mask/rogue/shepherd/shadowmask
		r_hand = /obj/item/rogueweapon/sword/rapier/dec
		pants = /obj/item/clothing/under/roguetown/trou/shadowpants
		id = /obj/item/scomstone/garrison
		backr =  /obj/item/storage/backpack/rogue/satchel/otavan
		backpack_contents = list(
		/obj/item/lockpickring/mundane = 1,
		/obj/item/rogueweapon/huntingknife/idagger/silver/psydagger,
		/obj/item/clothing/head/inqarticles/blackbag = 1,
		/obj/item/inqarticles/garrote = 1,
		/obj/item/rope/inqarticles/inquirycord = 1,
		/obj/item/grapplinghook = 1,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 1,
		/obj/item/paper/inqslip/arrival/inq = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		)
	else
		cloak = /obj/item/clothing/cloak/raincloak/mortus //cool spymaster cloak
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		backr = /obj/item/storage/backpack/rogue/satchel/black
		r_hand = /obj/item/rogueweapon/sword/rapier/dec
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
		pants = /obj/item/clothing/under/roguetown/tights/black
		id = /obj/item/scomstone/garrison
		backr =  /obj/item/storage/backpack/rogue/satchel/otavan
		backpack_contents = list(
		/obj/item/lockpickring/mundane = 1,
		/obj/item/rogueweapon/huntingknife/idagger/silver/psydagger,
		/obj/item/clothing/head/inqarticles/blackbag = 1,
		/obj/item/inqarticles/garrote = 1,
		/obj/item/rope/inqarticles/inquirycord = 1,
		/obj/item/grapplinghook = 1,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 1,
		/obj/item/paper/inqslip/arrival/inq = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		)

/*
/datum/advclass/hand/advisor
	name = "Advisor"
	tutorial = "You serve as both scholar and advisor to the Noble-Family, wielding knowledge and magicks with potent ability. Let no man forget whose ear you whisper into, your sage advice has saved more lives than any strategist's orders or spymaster's schemes could ever claim to."
	outfit = /datum/outfit/job/hand/advisor
	category_tags = list(CTAG_HAND)

	traits_applied = list(TRAIT_MAGEARMOR, TRAIT_ARCYNE_T2, TRAIT_INTELLECTUAL, TRAIT_SEEPRICES_SHITTY)
	subclass_stats = list(
		STATKEY_INT = 4,
		STATKEY_PER = 3,
	)

	subclass_spellpoints = 15

	subclass_skills = list(
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_EXPERT,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
	)

//Advisor start. Trades combat skills for more knowledge and skills - for older hands, hands that don't do combat - people who wanna play wizened old advisors.
/datum/outfit/job/hand/advisor/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = new /datum/voicepack/male/tyrant()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/dtace = 1, /obj/item/storage/keyring/hand = 1, /obj/item/lockpickring/mundane = 1, /obj/item/reagent_containers/glass/bottle/rogue/poison = 1) //starts with a vial of poison, like all wizened evil advisors do!
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	pants = /obj/item/clothing/under/roguetown/tights/black
	id = /obj/item/scomstone/garrison

	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
		H?.mind.adjust_spellpoints(3) */
