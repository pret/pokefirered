ThreeIsland_Port_MapScripts:: @ 8168789
	map_script 3, ThreeIsland_Port_MapScript1_16878F
	.byte 0

ThreeIsland_Port_MapScript1_16878F:: @ 816878F
	clearflag 2113
	setflag FLAG_0x2A1
	end

ThreeIsland_Port_EventScript_168796:: @ 8168796
	lock
	faceplayer
	compare_var_to_value VAR_0x4079, 2
	goto_if 4, EventScript_1687B8
	compare_var_to_value VAR_0x407B, 4
	goto_if 4, EventScript_1687C2
	loadword 0, gUnknown_818A307
	callstd 4
	release
	end

EventScript_1687B8:: @ 81687B8
	loadword 0, gUnknown_818A38B
	callstd 4
	release
	end

EventScript_1687C2:: @ 81687C2
	loadword 0, gUnknown_818A339
	callstd 4
	release
	end

ThreeIsland_Port_EventScript_1687CC:: @ 81687CC
	loadword 0, gUnknown_818A261
	callstd 2
	end

ThreeIsland_Port_EventScript_1687D5:: @ 81687D5
	lock
	loadword 0, gUnknown_818A2D8
	callstd 4
	release
	end
