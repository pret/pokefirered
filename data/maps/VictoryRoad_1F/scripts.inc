VictoryRoad_1F_MapScripts:: @ 8160F05
	map_script 1, VictoryRoad_1F_MapScript1_160F10
	map_script 3, VictoryRoad_1F_MapScript2_160F2F
	.byte 0

VictoryRoad_1F_MapScript1_160F10:: @ 8160F10
	compare_var_to_value VAR_MAP_SCENE_VICTORY_ROAD_1F, 100
	call_if ne, EventScript_160F1C
	end

EventScript_160F1C:: @ 8160F1C
	setmetatile 12, 14, 775, 1
	setmetatile 12, 15, 791, 1
	return

VictoryRoad_1F_MapScript2_160F2F:: @ 8160F2F
	setworldmapflag FLAG_WORLD_MAP_VICTORY_ROAD_1F
	end

VictoryRoad_1F_EventScript_160F33:: @ 8160F33
	lockall
	compare_var_to_value VAR_MAP_SCENE_VICTORY_ROAD_1F, 100
	goto_if eq, EventScript_160F62
	setmetatile 12, 14, 721, 0
	setmetatile 12, 15, 737, 0
	playse SE_RU_GASYAN
	special DrawWholeMapView
	waitse
	moveobjectoffscreen 5
	setvar VAR_MAP_SCENE_VICTORY_ROAD_1F, 100
	releaseall
	end

EventScript_160F62:: @ 8160F62
	releaseall
	end

VictoryRoad_1F_EventScript_160F64:: @ 8160F64
	trainerbattle 0, TRAINER_COOLTRAINER_NAOMI, 0, Text_174710, Text_174738
	msgbox gUnknown_8174744, 6
	end

VictoryRoad_1F_EventScript_160F7B:: @ 8160F7B
	trainerbattle 0, TRAINER_COOLTRAINER_ROLANDO, 0, Text_174784, Text_1747B8
	msgbox gUnknown_81747C8, 6
	end
