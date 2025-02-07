# 1 "data/maps/CeruleanCave_1F/scripts.pory"

# 2 "data/maps/CeruleanCave_1F/scripts.pory"
CeruleanCave_1F_MapScripts::
# 3 "data/maps/CeruleanCave_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCave_1F_OnTransition
# 4 "data/maps/CeruleanCave_1F/scripts.pory"
	.byte 0
# 5 "data/maps/CeruleanCave_1F/scripts.pory"

# 6 "data/maps/CeruleanCave_1F/scripts.pory"
CeruleanCave_1F_OnTransition::
# 7 "data/maps/CeruleanCave_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_CERULEAN_CAVE_1F
# 8 "data/maps/CeruleanCave_1F/scripts.pory"
	end
