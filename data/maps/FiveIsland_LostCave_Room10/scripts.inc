# 1 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 2 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
.set LOCALID_SELPHY, 1
# 3 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 4 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_MapScripts::
# 5 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, FiveIsland_LostCave_Room10_OnResume
# 6 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FiveIsland_LostCave_Room10_OnFrame
# 7 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	.byte 0
# 8 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 9 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_OnResume::
# 10 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	call_if_defeated TRAINER_LADY_SELPHY, FiveIsland_LostCave_Room10_EventScript_StopSelphySceneTrigger
# 11 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	end
# 12 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 13 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_EventScript_StopSelphySceneTrigger::
# 14 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
# 15 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	return
# 16 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 17 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_OnFrame::
# 18 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 0, FiveIsland_LostCave_Room10_EventScript_FindSelphyScene
# 19 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	.2byte 0
# 20 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 21 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_EventScript_FindSelphyScene::
# 22 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	lockall
# 23 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 24 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	applymovement LOCALID_SELPHY, FiveIsland_LostCave_Room10_Movement_SelphyWander
# 25 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	waitmovement 0
# 26 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	delay 100
# 27 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	applymovement LOCALID_SELPHY, FiveIsland_LostCave_Room10_Movement_SelphyApproach
# 28 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	waitmovement 0
# 29 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	msgbox FiveIsland_LostCave_Room10_Text_SelphyIntro
# 30 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	goto_if_questlog FiveIsland_LostCave_Room10_EventScript_SelphyQuestLog
# 31 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	trainerbattle_no_intro TRAINER_LADY_SELPHY, FiveIsland_LostCave_Room10_Text_SelphyDefeat
# 32 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	msgbox FiveIsland_LostCave_Room10_Text_MayIAskYouToTakeMeHome
# 33 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	closemessage
# 34 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	call FiveIsland_LostCave_Room10_EventScript_SetSelphyFound
# 35 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	warp MAP_FIVE_ISLAND_RESORT_GORGEOUS, 39, 10
# 36 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	waitstate
# 37 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	releaseall
# 38 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	end
# 39 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 40 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_EventScript_SetSelphyFound::
# 41 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	setflag FLAG_HIDE_LOST_CAVE_SELPHY
# 42 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	clearflag FLAG_HIDE_RESORT_GORGEOUS_SELPHY
# 43 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
# 44 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	setvar VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1
# 45 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	return
# 46 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 47 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_EventScript_SelphyQuestLog::
# 48 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	settrainerflag TRAINER_LADY_SELPHY
# 49 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	call FiveIsland_LostCave_Room10_EventScript_SetSelphyFound
# 50 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	releaseall
# 51 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	end
# 52 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 53 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_Movement_SelphyWander::
# 54 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_left
# 55 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	delay_16
# 56 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_right
# 57 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	delay_16
# 58 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_in_place_faster_up
# 59 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	delay_16
# 60 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_in_place_faster_down
# 61 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	step_end
# 62 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"

# 63 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
FiveIsland_LostCave_Room10_Movement_SelphyApproach::
# 64 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_down
# 65 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	walk_down
# 66 "data/maps/FiveIsland_LostCave_Room10/scripts.pory"
	step_end
