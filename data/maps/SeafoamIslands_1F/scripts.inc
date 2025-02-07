# 1 "data/maps/SeafoamIslands_1F/scripts.pory"

# 2 "data/maps/SeafoamIslands_1F/scripts.pory"
SeafoamIslands_1F_MapScripts::
# 3 "data/maps/SeafoamIslands_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_1F_OnTransition
# 4 "data/maps/SeafoamIslands_1F/scripts.pory"
	.byte 0
# 5 "data/maps/SeafoamIslands_1F/scripts.pory"

# 6 "data/maps/SeafoamIslands_1F/scripts.pory"
SeafoamIslands_1F_OnTransition::
# 7 "data/maps/SeafoamIslands_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F
# 8 "data/maps/SeafoamIslands_1F/scripts.pory"
	end
