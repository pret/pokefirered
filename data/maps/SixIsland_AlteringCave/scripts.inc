SixIsland_AlteringCave_MapScripts:: @ 81646A4
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_AlteringCave_OnTransition
	.byte 0

SixIsland_AlteringCave_OnTransition:: @ 81646AA
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_ALTERING_CAVE
	end
