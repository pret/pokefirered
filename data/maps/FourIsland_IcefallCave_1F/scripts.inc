FourIsland_IcefallCave_1F_MapScripts:: @ 8163D44
	map_script MAP_SCRIPT_ON_RESUME, FourIsland_IcefallCave_1F_OnResume
	map_script MAP_SCRIPT_ON_LOAD, FourIsland_IcefallCave_1F_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FourIsland_IcefallCave_1F_OnFrame
	.byte 0

FourIsland_IcefallCave_1F_OnResume:: @ 8163D54
	setstepcallback STEP_CB_ICE
	end

FourIsland_IcefallCave_1F_OnLoad:: @ 8163D57
	special SetIcefallCaveCrackedIceMetatiles
	end

FourIsland_IcefallCave_1F_OnFrame:: @ 8163D5B
	map_script_2 VAR_TEMP_1, 1, FourIsland_IcefallCave_1F_EventScript_FallDownHole
	.2byte 0

FourIsland_IcefallCave_1F_EventScript_FallDownHole:: @ 8163D65
	lockall
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, FourIsland_IcefallCave_1F_Movement_SetInvisible
	waitmovement 0
	playse SE_FALL
	delay 60
	warphole MAP_FOUR_ISLAND_ICEFALL_CAVE_B1F
	waitstate
	releaseall
	end

FourIsland_IcefallCave_1F_Movement_SetInvisible:: @ 8163D7F
	set_invisible
	step_end
