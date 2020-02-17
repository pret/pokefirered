FiveIsland_LostCave_Room10_MapScripts:: @ 8164C2D
	map_script MAP_SCRIPT_ON_RESUME, FiveIsland_LostCave_Room10_OnResume
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FiveIsland_LostCave_Room10_OnFrame
	.byte 0

FiveIsland_LostCave_Room10_OnResume:: @ 8164C38
	call_if_defeated TRAINER_LADY_SELPHY, EventScript_164C42
	end

EventScript_164C42:: @ 8164C42
	setvar VAR_MAP_SCENE_FIVE_ISLAND_LOST_CAVE_ROOM10, 1
	return

FiveIsland_LostCave_Room10_OnFrame:: @ 8164C48
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
	goto_if_questlog EventScript_164CB6
	trainerbattle_no_intro TRAINER_LADY_SELPHY, Text_17D086
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
	walk_left
	delay_16
	walk_right
	delay_16
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_down
	step_end

Movement_164CC8:: @ 8164CC8
	walk_down
	walk_down
	step_end
