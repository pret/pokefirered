Route16_NorthEntrance_1F_MapScripts:: @ 81701C2
	map_script 3, Route16_NorthEntrance_1F_MapScript1_1701C8
	.byte 0

Route16_NorthEntrance_1F_MapScript1_1701C8:: @ 81701C8
	clearflag FLAG_0x830
	checkflag FLAG_0x271
	call_if 1, EventScript_1701D5
	end

EventScript_1701D5:: @ 81701D5
	setvar VAR_0x4001, 1
	return

Route16_NorthEntrance_1F_EventScript_1701DB:: @ 81701DB
	loadword 0, gUnknown_819F98B
	callstd 2
	end

Route16_NorthEntrance_1F_EventScript_1701E4:: @ 81701E4
	lockall
	setvar VAR_0x8008, 0
	goto EventScript_170220
	end

Route16_NorthEntrance_1F_EventScript_1701F0:: @ 81701F0
	lockall
	setvar VAR_0x8008, 1
	goto EventScript_170220
	end

Route16_NorthEntrance_1F_EventScript_1701FC:: @ 81701FC
	lockall
	setvar VAR_0x8008, 2
	goto EventScript_170220
	end

Route16_NorthEntrance_1F_EventScript_170208:: @ 8170208
	lockall
	setvar VAR_0x8008, 3
	goto EventScript_170220
	end

Route16_NorthEntrance_1F_EventScript_170214:: @ 8170214
	lockall
	setvar VAR_0x8008, 4
	goto EventScript_170220
	end

EventScript_170220:: @ 8170220
	textcolor 0
	loadword 0, gUnknown_819F9CC
	callstd 4
	closemessage
	applymovement 255, Movement_1A75E9
	waitmovement 0
	delay 20
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_170279
	compare_var_to_value VAR_0x8008, 2
	call_if 1, EventScript_170284
	compare_var_to_value VAR_0x8008, 3
	call_if 1, EventScript_17028F
	compare_var_to_value VAR_0x8008, 4
	call_if 1, EventScript_17029A
	loadword 0, gUnknown_819F95F
	callstd 4
	closemessage
	applymovement 255, Movement_1702B3
	waitmovement 0
	releaseall
	end

EventScript_170279:: @ 8170279
	applymovement 255, Movement_1702A5
	waitmovement 0
	return

EventScript_170284:: @ 8170284
	applymovement 255, Movement_1702A7
	waitmovement 0
	return

EventScript_17028F:: @ 817028F
	applymovement 255, Movement_1702AA
	waitmovement 0
	return

EventScript_17029A:: @ 817029A
	applymovement 255, Movement_1702AE
	waitmovement 0
	return

Movement_1702A5:: @ 81702A5
	step_11
	step_end

Movement_1702A7:: @ 81702A7
	step_11
	step_11
	step_end

Movement_1702AA:: @ 81702AA
	step_11
	step_11
	step_11
	step_end

Movement_1702AE:: @ 81702AE
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1702B3:: @ 81702B3
	step_13
	step_end

Route16_NorthEntrance_1F_EventScript_1702B5:: @ 81702B5
	loadword 0, gUnknown_819F9E8
	callstd 2
	end
