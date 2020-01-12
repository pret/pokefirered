NavelRock_Exterior_MapScripts:: @ 81646AE
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Exterior_OnTransition
	.byte 0

NavelRock_Exterior_OnTransition:: @ 81646B4
	setworldmapflag FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR
	end
