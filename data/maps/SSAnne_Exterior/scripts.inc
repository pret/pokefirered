# 1 "data/maps/SSAnne_Exterior/scripts.pory"

# 2 "data/maps/SSAnne_Exterior/scripts.pory"
.set LOCALID_SS_ANNE, 1
# 3 "data/maps/SSAnne_Exterior/scripts.pory"

# 4 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_MapScripts::
# 5 "data/maps/SSAnne_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SSAnne_Exterior_OnTransition
# 6 "data/maps/SSAnne_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SSAnne_Exterior_OnFrame
# 7 "data/maps/SSAnne_Exterior/scripts.pory"
	.byte 0
# 8 "data/maps/SSAnne_Exterior/scripts.pory"

# 9 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_OnTransition::
# 10 "data/maps/SSAnne_Exterior/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SSANNE_EXTERIOR
# 11 "data/maps/SSAnne_Exterior/scripts.pory"
	end
# 12 "data/maps/SSAnne_Exterior/scripts.pory"

# 13 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_OnFrame::
# 14 "data/maps/SSAnne_Exterior/scripts.pory"
	map_script_2 VAR_MAP_SCENE_VERMILION_CITY, 1, SSAnne_Exterior_ExitSSAnne
# 15 "data/maps/SSAnne_Exterior/scripts.pory"
	.2byte 0
# 16 "data/maps/SSAnne_Exterior/scripts.pory"

# 17 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_ExitSSAnne::
# 18 "data/maps/SSAnne_Exterior/scripts.pory"
	lockall
# 19 "data/maps/SSAnne_Exterior/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 20 "data/maps/SSAnne_Exterior/scripts.pory"
	call_if_le VAR_0x8005, 6, SSAnne_Exterior_WalkDown
# 21 "data/maps/SSAnne_Exterior/scripts.pory"
	call_if_ge VAR_0x8005, 7, SSAnne_Exterior_WalkInPlaceDown
# 22 "data/maps/SSAnne_Exterior/scripts.pory"
	fadenewbgm MUS_SURF
# 23 "data/maps/SSAnne_Exterior/scripts.pory"
	delay 50
# 24 "data/maps/SSAnne_Exterior/scripts.pory"
	special DoSSAnneDepartureCutscene
# 25 "data/maps/SSAnne_Exterior/scripts.pory"
	waitstate
# 26 "data/maps/SSAnne_Exterior/scripts.pory"
	removeobject LOCALID_SS_ANNE
# 27 "data/maps/SSAnne_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_Exterior_Movement_Exit
# 28 "data/maps/SSAnne_Exterior/scripts.pory"
	waitmovement 0
# 29 "data/maps/SSAnne_Exterior/scripts.pory"
	setvar VAR_MAP_SCENE_VERMILION_CITY, 2
# 30 "data/maps/SSAnne_Exterior/scripts.pory"
	setvar VAR_VERMILION_CITY_TICKET_CHECK_TRIGGER, 0
# 31 "data/maps/SSAnne_Exterior/scripts.pory"
	warp MAP_VERMILION_CITY, 23, 34
# 32 "data/maps/SSAnne_Exterior/scripts.pory"
	waitstate
# 33 "data/maps/SSAnne_Exterior/scripts.pory"
	releaseall
# 34 "data/maps/SSAnne_Exterior/scripts.pory"
	end
# 35 "data/maps/SSAnne_Exterior/scripts.pory"

# 36 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_WalkDown::
# 37 "data/maps/SSAnne_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SSAnne_Exterior_Movement_WalkDown
# 38 "data/maps/SSAnne_Exterior/scripts.pory"
	waitmovement 0
# 39 "data/maps/SSAnne_Exterior/scripts.pory"
	return
# 40 "data/maps/SSAnne_Exterior/scripts.pory"

# 41 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_WalkInPlaceDown::
# 42 "data/maps/SSAnne_Exterior/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 43 "data/maps/SSAnne_Exterior/scripts.pory"
	waitmovement 0
# 44 "data/maps/SSAnne_Exterior/scripts.pory"
	return
# 45 "data/maps/SSAnne_Exterior/scripts.pory"

# 46 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_Movement_Exit::
# 47 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 48 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 49 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 50 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 51 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 52 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 53 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 54 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 55 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_up
# 56 "data/maps/SSAnne_Exterior/scripts.pory"
	step_end
# 57 "data/maps/SSAnne_Exterior/scripts.pory"

# 58 "data/maps/SSAnne_Exterior/scripts.pory"
SSAnne_Exterior_Movement_WalkDown::
# 59 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 60 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 61 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 62 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 63 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 64 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 65 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 66 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 67 "data/maps/SSAnne_Exterior/scripts.pory"
	walk_down
# 68 "data/maps/SSAnne_Exterior/scripts.pory"
	step_end
