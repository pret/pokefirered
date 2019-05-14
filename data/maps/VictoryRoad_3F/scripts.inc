VictoryRoad_3F_MapScripts:: @ 81610AA
	map_script 1, VictoryRoad_3F_MapScript1_1610B0
	.byte 0

VictoryRoad_3F_MapScript1_1610B0:: @ 81610B0
	compare_var_to_value VAR_0x4067, 100
	call_if 5, EventScript_1610BC
	end

EventScript_1610BC:: @ 81610BC
	setmetatile 12, 12, 775, 1
	setmetatile 12, 13, 791, 1
	return

VictoryRoad_3F_EventScript_1610CF:: @ 81610CF
	lockall
	compare_var_to_value VAR_0x4067, 100
	goto_if 1, EventScript_161101
	setmetatile 12, 12, 721, 0
	setmetatile 12, 13, 737, 0
	playse SE_MU_PACHI
	special DrawWholeMapView
	waitse
	moveobjectoffscreen 7
	moveobjectoffscreen 10
	setvar VAR_0x4067, 100
	releaseall
	end

EventScript_161101:: @ 8161101
	releaseall
	end

VictoryRoad_3F_EventScript_161103:: @ 8161103
	trainerbattle 0, 393, 0, Text_174B60, Text_174B83
	loadword 0, gUnknown_8174B99
	callstd 6
	end

VictoryRoad_3F_EventScript_16111A:: @ 816111A
	trainerbattle 0, 394, 0, Text_174C8A, Text_174CA9
	loadword 0, gUnknown_8174CBD
	callstd 6
	end

VictoryRoad_3F_EventScript_161131:: @ 8161131
	trainerbattle 0, 403, 0, Text_174C30, Text_174C5A
	loadword 0, gUnknown_8174C67
	callstd 6
	end

VictoryRoad_3F_EventScript_161148:: @ 8161148
	trainerbattle 0, 404, 0, Text_174BCA, Text_174BF4
	loadword 0, gUnknown_8174C03
	callstd 6
	end

VictoryRoad_3F_EventScript_16115F:: @ 816115F
	trainerbattle 4, 485, 0, Text_174D0C, Text_174D45, Text_174D96
	loadword 0, gUnknown_8174D64
	callstd 6
	end

VictoryRoad_3F_EventScript_16117A:: @ 816117A
	trainerbattle 4, 485, 0, Text_174E08, Text_174E39, Text_174E8D
	loadword 0, gUnknown_8174E48
	callstd 6
	end
