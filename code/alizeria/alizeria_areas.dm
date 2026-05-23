/area/rogue/outdoors/alizeria/vport
	name = "vport"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "v_port"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/alizeria/vport
	first_time_text = "¬≈–’Õ»… œŒ–“"
	town_area = TRUE

/area/rogue/indoors/shelter/alizeria/vport
	icon_state = "v_port_in"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


/area/rogue/outdoors/alizeria/nport
	name = "nport"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "n_port"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/alizeria/nport
	first_time_text = "Õ»∆Õ»… œŒ–“"
	town_area = TRUE

/area/rogue/indoors/shelter/alizeria/nport
	icon_state = "n_port_in"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


/area/rogue/outdoors/alizeria/jan
	name = "jan"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "jandar"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/alizeria/jan
	first_time_text = " –≈œŒ—“‹ ∆¿Õƒ¿–ÃŒ¬"
	town_area = TRUE

/area/rogue/indoors/shelter/alizeria/jan
	icon_state = "jandar_in"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


/area/rogue/outdoors/alizeria/town
	name = "town"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/alizeria/jan
	first_time_text = "√Œ–Œƒ"
	town_area = TRUE

/area/rogue/indoors/shelter/alizeria/town
	icon_state = "town_in"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/rogue/outdoors/alizeria/most
	name = "most"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "most"
	soundenv = 5
	droning_sound = 'sound/alizeria/areas/most.ogg'
	droning_sound_dusk = 'sound/alizeria/areas/most.ogg'
	droning_sound_night = 'sound/alizeria/areas/most.ogg'
	first_time_text = "œ¿¬ÿ»… ÃŒ—“"

/area/rogue/outdoors/alizeria/yshel
	name = "yshel"
	icon_state = "yshel"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/carbon/human/species/skeleton/npc/easy = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30,
				/mob/living/carbon/human/species/human/northern/highwayman/ambush = 30)
	first_time_text = "”Ÿ≈À‹≈"
	converted_type = /area/rogue/indoors/shelter/woods

/area/rogue/indoors/shelter/alizeria/iceland
	icon = 'icons/roguetown/alizeria/areas.dmi'
	icon_state = "ice_in"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/alizeria/areas/iceland.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'

/area/rogue/indoors/shelter/alizeria/niztown
	icon_state = "ntown"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/areas/ntowno.ogg'
	droning_sound_dusk = 'sound/alizeria/areas/ntownt.ogg'
	droning_sound_night = 'sound/alizeria/areas/ntowno.ogg'
	first_time_text = "Õ»∆Õ»… √Œ–Œƒ"

/area/rogue/indoors/shelter/alizeria/kabare
	icon_state = "kab"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = " ¿¡¿–≈"

/area/rogue/indoors/shelter/alizeria/kykolmain
	icon_state = "kykol1"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/kykol/main.ogg'
	droning_sound_dusk = 'sound/alizeria/kykol/main.ogg'
	droning_sound_night = 'sound/alizeria/kykol/main.ogg'
	first_time_text = " ” ŒÀ‹Õ€… ƒŒÃ"

/area/rogue/indoors/shelter/alizeria/kykolroom
	icon_state = "kykol2"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/kykol/room.ogg'
	droning_sound_dusk = 'sound/alizeria/kykol/room.ogg'
	droning_sound_night = 'sound/alizeria/kykol/room.ogg'

/area/rogue/indoors/shelter/alizeria/kykoltreasure
	icon_state = "kykol3"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/kykol/treasure.ogg'
	droning_sound_dusk = 'sound/alizeria/kykol/treasure.ogg'
	droning_sound_night = 'sound/alizeria/kykol/treasure.ogg'

/area/rogue/indoors/shelter/alizeria/kykolunder
	icon_state = "kykol4"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/kykol/under.ogg'
	droning_sound_dusk = 'sound/alizeria/kykol/under.ogg'
	droning_sound_night = 'sound/alizeria/kykol/under.ogg'

/area/rogue/indoors/shelter/alizeria/podzem
	icon_state = "podzem"
	icon = 'icons/roguetown/alizeria/areas.dmi'
	droning_sound = 'sound/alizeria/sklep.ogg'
	droning_sound_dusk = 'sound/alizeria/sklep.ogg'
	droning_sound_night = 'sound/alizeria/sklep.ogg'
	first_time_text = "«¿¡–Œÿ≈ÕÕ€… — À≈œ"