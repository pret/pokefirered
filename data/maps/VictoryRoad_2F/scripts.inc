VictoryRoad_2F_MapScripts:: @ 8160F92
	map_script 1, VictoryRoad_2F_MapScript1_160F98
	.byte 0

VictoryRoad_2F_MapScript1_160F98:: @ 8160F98
	compare_var_to_value VAR_0x4065, 100
	call_if 5, EventScript_160FAF
	compare_var_to_value VAR_0x4066, 100
	call_if 5, EventScript_160FC2
	end

EventScript_160FAF:: @ 8160FAF
	setmetatile 13, 10, 775, 1
	setmetatile 13, 11, 791, 1
	return

EventScript_160FC2:: @ 8160FC2
	setmetatile 33, 16, 775, 1
	setmetatile 33, 17, 791, 1
	return

VictoryRoad_2F_EventScript_160FD5:: @ 8160FD5
	lockall
	compare_var_to_value VAR_0x4065, 100
	goto_if_eq EventScript_161004
	setmetatile 13, 10, 721, 0
	setmetatile 13, 11, 737, 0
	playse SE_MU_PACHI
	special DrawWholeMapView
	waitse
	moveobjectoffscreen 11
	setvar VAR_0x4065, 100
	releaseall
	end

EventScript_161004:: @ 8161004
	releaseall
	end

VictoryRoad_2F_EventScript_161006:: @ 8161006
	lockall
	compare_var_to_value VAR_0x4066, 100
	goto_if_eq EventScript_161035
	setmetatile 33, 16, 721, 0
	setmetatile 33, 17, 737, 0
	playse SE_MU_PACHI
	special DrawWholeMapView
	waitse
	moveobjectoffscreen 12
	setvar VAR_0x4066, 100
	releaseall
	end

EventScript_161035:: @ 8161035
	releaseall
	end

VictoryRoad_2F_EventScript_161037:: @ 8161037
	trainerbattle 0, 167, 0, Text_1747EF, Text_17482C
	msgbox gUnknown_817483E, 6
	end

VictoryRoad_2F_EventScript_16104E:: @ 816104E
	trainerbattle 0, 325, 0, Text_174877, Text_1748B4
	msgbox gUnknown_81748BB, 6
	end

VictoryRoad_2F_EventScript_161065:: @ 8161065
	trainerbattle 0, 287, 0, Text_1748EE, Text_17491B
	msgbox gUnknown_8174927, 6
	end

VictoryRoad_2F_EventScript_16107C:: @ 816107C
	trainerbattle 0, 290, 0, Text_174995, Text_1749B0
	msgbox gUnknown_81749BB, 6
	end

VictoryRoad_2F_EventScript_161093:: @ 8161093
	trainerbattle 0, 298, 0, Text_174942, Text_17495A
	msgbox gUnknown_8174969, 6
	end
