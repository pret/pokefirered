UndergroundPath_NorthEntrance_MapScripts:: @ 8160E38
	.byte 0

UndergroundPath_NorthEntrance_EventScript_160E39:: @ 8160E39
	lock
	faceplayer
	setvar VAR_0x8008, 2
	call EventScript_1A8CAD
	checkflag FLAG_0x24B
	goto_if 1, EventScript_160EAB
	loadword 0, gUnknown_81A5AD6
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_160E93
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_160E93
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_160E9D
	call EventScript_1A8CD9
	loadword 0, gUnknown_81A5B4A
	callstd 4
	setflag FLAG_0x24B
	release
	end

EventScript_160E93:: @ 8160E93
	loadword 0, gUnknown_81A5B08
	callstd 4
	release
	end

EventScript_160E9D:: @ 8160E9D
	getspeciesname 0, 32777
	loadword 0, gUnknown_81A5B18
	callstd 4
	release
	end

EventScript_160EAB:: @ 8160EAB
	loadword 0, gUnknown_81A5B60
	callstd 4
	release
	end
