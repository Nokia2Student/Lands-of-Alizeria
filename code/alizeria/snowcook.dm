/datum/reagent/water/snow
	taste_description = "cold water"
	color = "#e8f4f8"  // очень холодный голубой

/datum/chemical_reaction/snowmelt  //кипячение снега превращает его в воду
	name = "снег"
	id = /datum/reagent/water
	results = list(/datum/reagent/water = 1)
	required_reagents = list(/datum/reagent/water/snow = 1)
	required_temp = 375

/datum/reagent/snow
	name = "Снег"
	description = "Melted snow, cold and pure. However, drinking raw snow can cause mild poisoning."
	color = "#e8f4f8"
	taste_description = "cold water"
	glass_icon_state = "glass_clear"
	glass_name = "glass of melted snow"
	glass_desc = ""
	shot_glass_icon_state = "shotglassclear"
	var/hydration = 12
	alpha = 100
	taste_mult = 0.1

/datum/reagent/snow/reaction_mob(mob/living/L, method=TOUCH, reac_volume)
	if(method == INGEST) // Make sure you DRANK the snow before giving damage
		..()

/datum/reagent/snow/on_mob_life(mob/living/carbon/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(hydration)
	M.adjustToxLoss(1) // 1 poison damage per life tick
	..()

/datum/chemical_reaction/snowboil //boiling snow turns it into water
	name = "snow melting"
	id = /datum/reagent/water
	results = list(/datum/reagent/water = 1)
	required_reagents = list(/datum/reagent/snow = 1)
	required_temp = 375