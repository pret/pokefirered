VictoryRoad_3F_MapScripts:: @ 81610AA
	map_script 1, VictoryRoad_3F_MapScript1_1610B0
	.byte 0

VictoryRoad_3F_MapScript1_1610B0:: @ 81610B0
	compare_var_to_value VAR_MAP_SCENE_VICTORY_ROAD_3F, 100
	call_if ne, EventScript_1610BC
	end

EventScript_1610BC:: @ 81610BC
	setmetatile 12, 12, 775, 1
	setmetatile 12, 13, 791, 1
	return

VictoryRoad_3F_EventScript_1610CF:: @ 81610CF
	lockall
	compare_var_to_value VAR_MAP_SCENE_VICTORY_ROAD_3F, 100
	goto_if eq, EventScript_161101
	setmetatile 12, 12, 721, 0
	setmetatile 12, 13, 737, 0
	playse SE_RU_GASYAN
	special DrawWholeMapView
	waitse
	moveobjectoffscreen 7
	moveobjectoffscreen 10
	setvar VAR_MAP_SCENE_VICTORY_ROAD_3F, 100
	releaseall
	end

EventScript_161101:: @ 8161101
	releaseall
	end

VictoryRoad_3F_EventScript_161103:: @ 8161103
	trainerbattle 0, TRAINER_COOLTRAINER_GEORGE, 0, Text_174B60, Text_174B83
	msgbox gUnknown_8174B99, 6
	end

VictoryRoad_3F_EventScript_16111A:: @ 816111A
	trainerbattle 0, TRAINER_COOLTRAINER_COLBY, 0, Text_174C8A, Text_174CA9
	msgbox gUnknown_8174CBD, 6
	end

VictoryRoad_3F_EventScript_161131:: @ 8161131
	trainerbattle 0, TRAINER_COOLTRAINER_CAROLINE, 0, Text_174C30, Text_174C5A
	msgbox gUnknown_8174C67, 6
	end

VictoryRoad_3F_EventScript_161148:: @ 8161148
	trainerbattle 0, TRAINER_COOLTRAINER_ALEXA, 0, Text_174BCA, Text_174BF4
	msgbox gUnknown_8174C03, 6
	end

VictoryRoad_3F_EventScript_16115F:: @ 816115F
	trainerbattle 4, TRAINER_COOL_COUPLE_RAY_TYRA, 0, Text_174D0C, Text_174D45, Text_174D96
	msgbox gUnknown_8174D64, 6
	end

VictoryRoad_3F_EventScript_16117A:: @ 816117A
	trainerbattle 4, TRAINER_COOL_COUPLE_RAY_TYRA, 0, Text_174E08, Text_174E39, Text_174E8D
	msgbox gUnknown_8174E48, 6
	end
