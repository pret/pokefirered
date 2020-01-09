FourIsland_IcefallCave_1F_MapScripts:: @ 8163D44
	map_script MAP_SCRIPT_ON_RESUME, FourIsland_IcefallCave_1F_OnResume
	map_script MAP_SCRIPT_ON_LOAD, FourIsland_IcefallCave_1F_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FourIsland_IcefallCave_1F_OnFrame
	.byte 0

FourIsland_IcefallCave_1F_OnResume:: @ 8163D54
	setstepcallback 4
	end

FourIsland_IcefallCave_1F_OnLoad:: @ 8163D57
	special Special_SetIcefallCaveCrackedIceMetatiles
	end

FourIsland_IcefallCave_1F_OnFrame:: @ 8163D5B
	map_script_2 VAR_0x4001, 1, EventScript_163D65
	.2byte 0

EventScript_163D65:: @ 8163D65
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163D7F
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	warphole MAP_FOUR_ISLAND_ICEFALL_CAVE_B1F
	waitstate
	releaseall
	end

Movement_163D7F:: @ 8163D7F
	set_invisible
	step_end
