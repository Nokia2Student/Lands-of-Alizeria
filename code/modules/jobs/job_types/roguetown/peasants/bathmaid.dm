/datum/job/roguetown/nightmaiden
	title = "Artist"
	f_title = "Artist"
	flag = WENCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0


	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_ALL_RACES
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	tutorial = "Когда-то давно, в тяге за творчеством, либо же желая заработать деньги далеко не самым благородным путём - ты устроился работать в кабаре. Твоя работа подразумевает выступление на сцене, однако в тяжёлой жизненной ситуации, либо просто ради собственного удовольствия - ты также можешь подрабатывать в игорном клубе. Однако помни, что последний вариант - несовсем законен."

	outfit = /datum/outfit/job/nightmaiden
	advclass_cat_rolls = list(CTAG_NIGHTMAIDEN = 20)
	display_order = JDO_WENCH
	give_bank_account = TRUE
	can_random = FALSE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	advjob_examine = TRUE

	virtue_restrictions = list(
		/datum/virtue/utility/noble,
		/datum/virtue/utility/blueblooded,
	)

	job_traits = list(TRAIT_EMPATH, TRAIT_GOODLOVER)
	job_subclasses = list(
		/datum/advclass/nightmaiden/courtesan
	)

/datum/outfit/job/nightmaiden
	name = "Artist"
	// This is just a base outfit, the actual outfits are defined in the advclasses

/datum/advclass/nightmaiden/courtesan
	name = "Artist"
	tutorial = "Overcoming mind games, deceit and competition, you came into your own as one of the bathhouse's most prized moneymakers and socialites. Dressed in lavish gifts left behind by your patrons, not just anyone can have you. Under the matron, you do most of the social heavylifting and provide entertainment of all forms - behind a heavy price tag. "
	outfit = /datum/outfit/job/nightmaiden/courtesan
	category_tags = list(CTAG_NIGHTMAIDEN)
	subclass_social_rank = SOCIAL_RANK_PEASANT

	traits_applied = list(TRAIT_KEENEARS, TRAIT_BEAUTIFUL)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_END = 2,
		STATKEY_INT = -2,
		STATKEY_STR = -4
	)

	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/music = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/nightmaiden/courtesan/pre_equip(mob/living/carbon/human/H)
	..()
	var/pinroll = rand(1, 20)
	switch(pinroll)
		if(1 to 19)
			head = /obj/item/lockpick/goldpin
		if(20)
			head = /obj/item/lockpick/goldpin/silver
	var/ringroll = rand(1, 100)
	switch(ringroll)
		if(1 to 25)
			id = /obj/item/clothing/ring/gold
		if(26 to 50)
			id = /obj/item/clothing/ring/emerald
		if(51 to 80)
			id = /obj/item/clothing/ring/topaz
		if(81 to 95)
			id = /obj/item/clothing/ring/silver
		if(96 to 100)
			id = /obj/item/clothing/ring/diamond
	beltl = /obj/item/storage/keyring/alizeria/whore
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/reagent_containers/powder/moondust = 2,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/toy/cards/deck = 1,
	)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkydress/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/corset
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		shoes = /obj/item/clothing/shoes/roguetown/anklets
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
		belt = /obj/item/storage/belt/rogue/leather/black
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short

	var/weapons = list("Accordion","Bagpipe","Drum","Guitar","Harp","Hurdy-Gurdy","Jaw Harp","Lute","Trumpet","Viola","Vocal Talisman")
	var/weapon_choice = input(H, "Choose your instrument.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Harp")
			backr = /obj/item/rogue/instrument/harp
		if("Lute")
			backr = /obj/item/rogue/instrument/lute
		if("Accordion")
			backr = /obj/item/rogue/instrument/accord
		if("Guitar")
			backr = /obj/item/rogue/instrument/guitar
		if("Hurdy-Gurdy")
			backr = /obj/item/rogue/instrument/hurdygurdy
		if("Viola")
			backr = /obj/item/rogue/instrument/viola
		if("Vocal Talisman")
			backr = /obj/item/rogue/instrument/vocals
		if("Trumpet")
			backr = /obj/item/rogue/instrument/trumpet
		if("Flute")
			backr = /obj/item/rogue/instrument/flute
		if("Bagpipe")
			backr = /obj/item/rogue/instrument/bagpipe
		if("Jaw Harp")
			backr = /obj/item/rogue/instrument/jawharp
		if("Drum")
			backr = /obj/item/rogue/instrument/drum

/obj/item/soap/bath
	name = "herbal soap"
	desc = "A soap made from various herbs"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "soap"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/bath/soap/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 80)
