GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 40 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/roguetown/adventurer
	title = "Adventurer"
	flag = ADVENTURER
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	allowed_races = ALIZ_ALL_RACES
	disallowed_races = /datum/species/ogre
	tutorial = "Ты - путешественник. Один из многих, что возможно найдёт свою кончину в пьяной драке или на опасных дорогах. Мало кто ценит твоё ремесло, но есть один плюс - ты полностью предоставлен сам себе."

	virtue_restrictions = list(
		/datum/virtue/utility/noble,
		/datum/virtue/utility/blueblooded,
	)

	class_categories = TRUE

	outfit = null
	outfit_female = null

	display_order = JDO_ADVENTURER
	show_in_credits = FALSE
	min_pq = 0
	max_pq = null

	advclass_cat_rolls = list(CTAG_ADVENTURER = 20)
	PQ_boost_divider = 0

	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 1 MINUTES

	cmode_music = 'sound/music/combat.ogg'

	job_traits = list(TRAIT_OUTLANDER)

	job_subclasses = list(
		/datum/advclass/sfighter,
		/datum/advclass/sfighter/barbarian,
		/datum/advclass/sfighter/duelist,
		/datum/advclass/sfighter/monster_hunter,
		/datum/advclass/sfighter/flagellant,
		/datum/advclass/sfighter/amazon,
		/datum/advclass/rogue,
		/datum/advclass/rogue/thief,
		/datum/advclass/rogue/bard,
		/datum/advclass/rogue/swashbuckler,
		/datum/advclass/mage,
		/datum/advclass/mage/spellblade,
		/datum/advclass/mage/spellsinger,
		/datum/advclass/mage/spellthief,
		/datum/advclass/ranger,
		/datum/advclass/ranger/assassin,
		/datum/advclass/ranger/bombadier,
		/datum/advclass/ranger/bwanderer,
		/datum/advclass/trader,
		/datum/advclass/trader/doomsayer,
		/datum/advclass/trader/scholar,
		/datum/advclass/trader/harlequin,
		/datum/advclass/trader/peddler,
		/datum/advclass/trader/brewer,
		/datum/advclass/trader/cuisiner,
		/datum/advclass/foreigner,
		/datum/advclass/foreigner/custodian,
		/datum/advclass/foreigner/yoruku,
	)

/mob/living/carbon/human/proc/adv_hugboxing_start()
	to_chat(src, span_warning("I will be in danger once I start moving."))
	status_flags |= GODMODE
	ADD_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(adv_hugboxing_moved))
	//Lies, it goes away even if you don't move after enough time
	if(GLOB.adventurer_hugbox_duration_still)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration_still)

/mob/living/carbon/human/proc/adv_hugboxing_moved()
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	to_chat(src, span_danger("I have [DisplayTimeText(GLOB.adventurer_hugbox_duration)] to begone!"))
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration)

/mob/living/carbon/human/proc/adv_hugboxing_end()
	if(QDELETED(src))
		return
	//hugbox already ended
	if(!(status_flags & GODMODE))
		return
	status_flags &= ~GODMODE
	REMOVE_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	to_chat(src, span_danger("My joy is gone! Danger surrounds me."))
