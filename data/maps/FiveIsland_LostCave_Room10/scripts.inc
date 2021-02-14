.set LOCALID_SELPHY, 1

FiveIsland_LostCave_Room10_MapScripts:: @ 8164C2D
	map_script MAP_SCRIPT_ON_RESUME, FiveIsland_LostCave_Room10_OnResume
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FiveIsland_LostCave_Room10_OnFrame
	.byte 0

FiveIsland_LostCave_Room10_OnResume:: @ 8164C38
	call_if_defeated TRAINER_LADY_SELPHY, FiveIsland_LostCave_Room10_EventScript_StopSelphySceneTrigger
	end

FiveIsland_LostCave_Room10_EventScript_StopSelphySceneTrigger:: @ 8164C42
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
	return

FiveIsland_LostCave_Room10_OnFrame:: @ 8164C48
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 0, FiveIsland_LostCave_Room10_EventScript_FindSelphyScene
	.2byte 0

FiveIsland_LostCave_Room10_EventScript_FindSelphyScene:: @ 8164C52
	lockall
	textcolor 1
	applymovement LOCALID_SELPHY, FiveIsland_LostCave_Room10_Movement_SelphyWander
	waitmovement 0
	delay 100
	applymovement LOCALID_SELPHY, FiveIsland_LostCave_Room10_Movement_SelphyApproach
	waitmovement 0
	msgbox FiveIsland_LostCave_Room10_Text_SelphyIntro
	goto_if_questlog FiveIsland_LostCave_Room10_EventScript_SelphyQuestLog
	trainerbattle_no_intro TRAINER_LADY_SELPHY, FiveIsland_LostCave_Room10_Text_SelphyDefeat
	msgbox FiveIsland_LostCave_Room10_Text_MayIAskYouToTakeMeHome
	closemessage
	call FiveIsland_LostCave_Room10_EventScript_SetSelphyFound
	warp MAP_FIVE_ISLAND_RESORT_GORGEOUS, 255, 39, 10
	waitstate
	releaseall
	end

FiveIsland_LostCave_Room10_EventScript_SetSelphyFound:: @ 8164CA5
	setflag FLAG_HIDE_LOST_CAVE_SELPHY
	clearflag FLAG_HIDE_RESORT_GORGEOUS_SELPHY
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
	setvar VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1
	return

FiveIsland_LostCave_Room10_EventScript_SelphyQuestLog:: @ 8164CB6
	settrainerflag TRAINER_LADY_SELPHY
	call FiveIsland_LostCave_Room10_EventScript_SetSelphyFound
	releaseall
	end

FiveIsland_LostCave_Room10_Movement_SelphyWander:: @ 8164CC0
	walk_left
	delay_16
	walk_right
	delay_16
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_down
	step_end

FiveIsland_LostCave_Room10_Movement_SelphyApproach:: @ 8164CC8
	walk_down
	walk_down
	step_end
