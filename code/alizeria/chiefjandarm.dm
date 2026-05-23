#define FIRE_GUARD_COOLDOWN (30 SECONDS)

/datum/job/roguetown/marshgen
	title = "Prevost of Gendarmes"
	flag = MARSHGEN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "ќтносительно недавно ты прибыл на јлизерию, когда корона решила окончательно превратить остров в своЄ владение. ѕосле подавлени€ беспор€дков именно ты оказалс€ самым вли€тельным двор€нином среди местной знати и вз€л на себ€ брем€ несени€ воли ћонфора. ƒл€ одних ты гарант пор€дка, дл€ других - лицо оккупации. “еперь улицы спокойнее, но покой здесь всегда стоит дорого. —умеешь ли ты удержать власть, когда штормы бушуют не только в море?"
	display_order = JDO_MARSHGEN
	selection_color = JCOLOR_MERCENARY
	always_show_on_latechoices = TRUE
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = CODEX
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/gendarme)

	outfit = /datum/outfit/job/marshgen
	advclass_cat_rolls = list(CTAG_MARSHGEN = 21)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_NOBLE, TRAIT_ANTIMAGIC, TRAIT_JUSTICARSIGHT)
	job_subclasses = list(
		/datum/advclass/marshgen
	)

/datum/job/roguetown/marshgen/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/marshgen
	name = "Prevost of Gendarmes"
	tutorial = "ќтносительно недавно ты прибыл вместе с действующим наместником на этот остров, перед этим дав кл€тву вместе со своими людьми - защищать и оберегать корону, а также еЄ подданых. ”коренившеес€ общество јлизерии было неочень радо вашему прибытию на всЄ готовое и какой-то момент времени вам приходилось подавл€ть народные волнени€. Ѕлаго эти времена прошли и на улицах отныне царит относительный пор€док, однако сможете ли вы его сохранить?"
	category_tags = list(CTAG_MARSHGEN)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
		STATKEY_END = 3,
		STATKEY_LCK = -2,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/combat/guns = SKILL_LEVEL_LEGENDARY,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_LEGENDARY,
	)
	subclass_languages = list(
		/datum/language/otavan
	)

/datum/outfit/job/marshgen
	name = "Prevost of Gendarmes"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/marshgen

/datum/outfit/job/marshgen/pre_equip(mob/living/carbon/human/H)
	..()
	if(should_wear_femme_clothes(H))
		head = /obj/item/clothing/head/roguetown/jandarms/cief
		cloak = /obj/item/clothing/cloak/jandarms/cief
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle
		armor = /obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/armor
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		gloves = /obj/item/clothing/gloves/roguetown/alizeria/noblegloves
		id = /obj/item/scomstone
		beltr = /obj/item/quiver/mpylipistol
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/rogueweapon/sword/rapier/dec
		pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
		shoes = /obj/item/clothing/shoes/roguetown/boots/jandarms/cief
		wrists = /obj/item/storage/keyring/alizeria/janmashall
	if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/jandarms/cief
		cloak = /obj/item/clothing/cloak/jandarms/cief/alt
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/gun/ballistic/revolver/grenadelauncher/aliz/rifle
		armor = /obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/jacket
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
		shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
		beltr = /obj/item/quiver/mpylipistol
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/rogueweapon/sword/rapier/dec
		id = /obj/item/scomstone
		gloves = /obj/item/clothing/gloves/roguetown/angle
		wrists = /obj/item/storage/keyring/alizeria/janmashall
		backpack_contents = list(
						/obj/item/storage/belt/rogue/pouch/coins/mid = 1
						)

	H.verbs |= /mob/proc/haltyell
	H.verbs |= list(/mob/living/carbon/human/proc/cief_announcement)
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw_cf, /mob/living/carbon/human/proc/request_law_cf, /mob/living/carbon/human/proc/request_law_removal_cf, /mob/living/carbon/human/proc/fire_guard_cf)

/mob/living/carbon/human/proc/request_law_cf()
	set name = "Request Law"
	set category = "MARSHALL"
	if(stat)
		return
	var/inputty = input("Write a new law", "MARSHALL") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_law(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_requested_cf), src, lord, inputty)
			else
				make_law(inputty)

/mob/living/carbon/human/proc/request_law_removal_cf()
	set name = "Request Law Removal"
	set category = "MARSHALL"
	if(stat)
		return
	var/inputty = input("Remove a law", "MARSHALL") as text|null
	var/law_index = text2num(inputty) || 0
	if(law_index && GLOB.laws_of_the_land[law_index])
		if(hasomen(OMEN_NOLORD))
			remove_law(law_index)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_removal_requested_cf), src, lord, law_index)
			else
				remove_law(law_index)

/mob/living/carbon/human/proc/request_outlaw_cf()
	set name = "Request Outlaw"
	set category = "MARSHALL"
	if(stat)
		return
	var/inputty = input("Outlaw a person", "MARSHALL") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_outlaw(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_outlaw_requested_cf), src, lord, inputty)
			else
				make_outlaw(inputty)

/proc/find_lord_cf(required_stat = CONSCIOUS)
	var/mob/living/lord
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(!H.mind || H.job != "Landowner" || (H.stat > required_stat))
			continue
		lord = H
		break
	return lord

/proc/lord_law_requested_cf(mob/living/marshgen, mob/living/carbon/human/lord, requested_law)
	var/choice = alert(lord, "The marshal requests a new law!\n[requested_law]", "MARSHAL LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshgen)
			to_chat(span_warning("The lord has denied the request for a new law!"))
		return
	make_law(requested_law)

/proc/lord_law_removal_requested_cf(mob/living/marshgen, mob/living/carbon/human/lord, requested_law)
	if(!requested_law || !GLOB.laws_of_the_land[requested_law])
		return
	var/choice = alert(lord, "The marshal requests the removal of a law!\n[GLOB.laws_of_the_land[requested_law]]", "MARSHAL LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshgen)
			to_chat(span_warning("The lord has denied the request for a law removal!"))
		return
	remove_law(requested_law)

/proc/lord_purge_requested_cf(mob/living/marshgen, mob/living/carbon/human/lord)
	var/choice = alert(lord, "The marshal requests a purge of all laws!", "MARSHAL PURGE REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshgen)
			to_chat(span_warning("The lord has denied the request for a purge of all laws!"))
		return
	purge_laws()

/proc/lord_outlaw_requested_cf(mob/living/marshgen, mob/living/carbon/human/lord, requested_outlaw)
	var/choice = alert(lord, "The marshal requests to outlaw someone!\n[requested_outlaw]", "MARSHAL OUTLAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshgen)
			to_chat(span_warning("The lord has denied the request for declaring an outlaw!"))
		return
	make_outlaw(requested_outlaw)

/mob/proc/haltyell_cf()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")

////////////////////////////////////////////

/mob/living/carbon/human/proc/fire_guard_cf()
	set name = "Fire Gendarme"
	set category = "MARSHALL"

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
	if(!(target.job == "Gendarme"))
		to_chat(src, span_warning("[target.real_name] не жандарм."))
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
	priority_announce("ћаршал уволил [inputty] из жандармерии!", title = "Dismissal", sound = 'sound/misc/bell.ogg')

	return TRUE

//////////////////////////////////////

/obj/effect/proc_holder/spell/self/convertrole/gendarme
	name = "«авербовать жандарма"
	new_role = "Gendarme"
	overlay_state = "recruit_brother"
	recruitment_faction = "Gendarme"
	recruitment_message = "«ащищай власть короны, %RECRUIT!"
	accept_message = "«а корол€!"
	refuse_message = "я отказываюсь."

/obj/effect/proc_holder/spell/self/convertrole/gendarme/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
	if(HAS_TRAIT(recruit, TRAIT_OUTLANDER))
		to_chat(recruiter, span_warning("»ноземец в жандармы?... ѕускай пройдЄт хот€ бы год обучени€!"))
		return FALSE
	if(HAS_TRAIT(recruit, TRAIT_INQUISITION))
		to_chat(recruiter, span_warning("Their loyalty is to Psydon alone! They can't join the militia!"))
		return FALSE
	//If you're reading this, please refactor this once we have TRAIT_CLERGY thanks
	if(recruit.job in list("Priest", "Priestess", "Templar", "Acolyte"))
		to_chat(recruiter, span_warning("—ильно религиозным люд€м не место в жандармерии."))
		return FALSE
	..()

/////////////////////////////////////////
GLOBAL_VAR_INIT(last_cief_announcement, -50000) // Inits variable for later, copied from guildmaster

/mob/living/carbon/human/proc/cief_announcement()
	set name = "Announcement"
	set category = "MARSHALL"
	if(stat)
		return
	if(!src.can_speak_vocal())
		to_chat(src,span_warning("я не могу говорить!"))
		return FALSE
	if(world.time < GLOB.last_elder_announcement + 450 SECONDS)
		to_chat(src, span_warning("You must wait [round((GLOB.last_elder_announcement + 450 SECONDS - world.time)/600, 0.1)] minutes before making another announcement!"))
		return FALSE
	var/announcementinput = input("Bellow to the Peaks", "Make an Announcement") as text|null
	if(announcementinput)
		visible_message(span_warning("[src] takes a deep breath, preparing to make an announcement.."))
		if(do_after(src, 15 SECONDS, target = src)) // Reduced to 15 seconds from 30 on the original Herald PR. 15 is well enough time for sm1 to shove you.
			say(announcementinput)
			priority_announce("[announcementinput]", "Marshall of Gendarmes Speaks", 'sound/misc/bell.ogg', sender = src)
			GLOB.last_elder_announcement = world.time
			spawn(450 SECONDS)
			to_chat(src, span_notice("I can make an announcement again!"))
		else
			to_chat(src, span_warning("Your announcement was interrupted!"))
			return FALSE