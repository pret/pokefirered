# 1 "data/maps/DiglettsCave_B1F/scripts.pory"

# 2 "data/maps/DiglettsCave_B1F/scripts.pory"
DiglettsCave_B1F_MapScripts::
# 3 "data/maps/DiglettsCave_B1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, DiglettsCave_B1F_OnTransition
# 4 "data/maps/DiglettsCave_B1F/scripts.pory"
	.byte 0
# 5 "data/maps/DiglettsCave_B1F/scripts.pory"

# 6 "data/maps/DiglettsCave_B1F/scripts.pory"
DiglettsCave_B1F_OnTransition::
# 7 "data/maps/DiglettsCave_B1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F
# 8 "data/maps/DiglettsCave_B1F/scripts.pory"
	end
