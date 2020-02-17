SeafoamIslands_1F_MapScripts:: @ 8162F43
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_1F_OnTransition
	.byte 0

SeafoamIslands_1F_OnTransition:: @ 8162F49
	setworldmapflag FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F
	end
