DiglettsCave_B1F_MapScripts:: @ 8160EF1
	map_script MAP_SCRIPT_ON_TRANSITION, DiglettsCave_B1F_OnTransition
	.byte 0

DiglettsCave_B1F_OnTransition:: @ 8160EF7
	setworldmapflag FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F
	end
