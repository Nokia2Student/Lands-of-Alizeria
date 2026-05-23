/turf/open/floor/rogue/alizeria/tiles/ice
	name = "ice"
	desc = "Толстый лёд без намёка наличия воды под собой."
	icon_state = "ice"
	icon = 'icons/roguetown/alizeria/tiles.dmi'
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/alizeria/tiles/ice.wav'
	slowdown = 0
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred,
						/turf/open/floor/rogue/grassyel,
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snowrough,
						/turf/open/floor/rogue/dirt,
						/turf/open/floor/rogue/dirt/road,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/AzureSand)
	spread_chance = 0

/turf/open/floor/rogue/alizeria/tiles/ice/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/alizeria/tiles/ice/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)