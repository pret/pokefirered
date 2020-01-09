CeruleanCave_1F_MapScripts:: @ 81624B3
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCave_1F_OnTransition
	.byte 0

CeruleanCave_1F_OnTransition:: @ 81624B9
	setworldmapflag FLAG_WORLD_MAP_CERULEAN_CAVE_1F
	end
