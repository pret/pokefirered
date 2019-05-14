Route12_MapScripts:: @ 8168000
	map_script 5, Route12_MapScript1_168006
	.byte 0

Route12_MapScript1_168006:: @ 8168006
	checkflag FLAG_0x807
	call_if 1, EventScript_168010
	end

EventScript_168010:: @ 8168010
	removeobject VAR_LAST_TALKED
	return

Route12_EventScript_168014:: @ 8168014
	lock
	faceplayer
	checkflag FLAG_0x23D
	goto_if 0, EventScript_168099
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	loadword 0, gUnknown_81853CC
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16808D
	call EventScript_1A924B
	setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_SNORLAX, 2
	delay 40
	waitmoncry
	setflag FLAG_0x054
	setflag FLAG_0x807
	setflag FLAG_0x253
	dowildbattle
	clearflag FLAG_0x807
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16808F
	compare_var_to_value VAR_RESULT, 4
	goto_if 1, EventScript_16808F
	compare_var_to_value VAR_RESULT, 5
	goto_if 1, EventScript_16808F
	release
	end

EventScript_16808D:: @ 816808D
	release
	end

EventScript_16808F:: @ 816808F
	loadword 0, gUnknown_8185383
	callstd 4
	release
	end

EventScript_168099:: @ 8168099
	loadword 0, gUnknown_8185317
	callstd 4
	release
	end

Route12_EventScript_1680A3:: @ 81680A3
	loadword 0, gUnknown_8185797
	callstd 3
	end

Route12_EventScript_1680AC:: @ 81680AC
	loadword 0, gUnknown_81857B3
	callstd 3
	end
