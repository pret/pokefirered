VictoryRoad_1F_MapScripts:: @ 8160F05
	map_script MAP_SCRIPT_ON_LOAD, VictoryRoad_1F_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, VictoryRoad_1F_OnTransition
	.byte 0

VictoryRoad_1F_OnLoad:: @ 8160F10
	compare VAR_MAP_SCENE_VICTORY_ROAD_1F, 100
	call_if_ne EventScript_160F1C
	end

EventScript_160F1C:: @ 8160F1C
	setmetatile 12, 14, 775, 1
	setmetatile 12, 15, 791, 1
	return

VictoryRoad_1F_OnTransition:: @ 8160F2F
	setworldmapflag FLAG_WORLD_MAP_VICTORY_ROAD_1F
	end

VictoryRoad_1F_EventScript_160F33:: @ 8160F33
	lockall
	compare VAR_MAP_SCENE_VICTORY_ROAD_1F, 100
	goto_if_eq EventScript_160F62
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
	trainerbattle_single TRAINER_COOLTRAINER_NAOMI, Text_174710, Text_174738
	msgbox gUnknown_8174744, 6
	end

VictoryRoad_1F_EventScript_160F7B:: @ 8160F7B
	trainerbattle_single TRAINER_COOLTRAINER_ROLANDO, Text_174784, Text_1747B8
	msgbox gUnknown_81747C8, 6
	end
