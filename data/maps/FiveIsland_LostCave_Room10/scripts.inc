FiveIsland_LostCave_Room10_MapScripts:: @ 8164C2D
	map_script 5, FiveIsland_LostCave_Room10_MapScript1_164C38
	map_script 2, FiveIsland_LostCave_Room10_MapScript2_164C48
	.byte 0

FiveIsland_LostCave_Room10_MapScript1_164C38:: @ 8164C38
	checktrainerflag TRAINER_LADY_SELPHY
	call_if 1, EventScript_164C42
	end

EventScript_164C42:: @ 8164C42
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
	return

FiveIsland_LostCave_Room10_MapScript2_164C48:: @ 8164C48
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 0, EventScript_164C52
	.2byte 0

EventScript_164C52:: @ 8164C52
	lockall
	textcolor 1
	applymovement 1, Movement_164CC0
	waitmovement 0
	delay 100
	applymovement 1, Movement_164CC8
	waitmovement 0
	msgbox gUnknown_817D062
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_164CB6
	trainerbattle 3, TRAINER_LADY_SELPHY, 0, Text_17D086
	msgbox gUnknown_817D0B2
	closemessage
	call EventScript_164CA5
	warp MAP_FIVE_ISLAND_RESORT_GORGEOUS, 255, 39, 10
	waitstate
	releaseall
	end

EventScript_164CA5:: @ 8164CA5
	setflag FLAG_HIDE_LOST_CAVE_SELPHY
	clearflag FLAG_HIDE_RESORT_GORGEOUS_SELPHY
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
	setvar VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1
	return

EventScript_164CB6:: @ 8164CB6
	settrainerflag TRAINER_LADY_SELPHY
	call EventScript_164CA5
	releaseall
	end

Movement_164CC0:: @ 8164CC0
	step_12
	step_1c
	step_13
	step_1c
	step_2e
	step_1c
	step_2d
	step_end

Movement_164CC8:: @ 8164CC8
	step_10
	step_10
	step_end
