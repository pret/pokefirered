SilphCo_11F_MapScripts:: @ 8161DEE
	map_script 1, SilphCo_11F_MapScript1_161DF4
	.byte 0

SilphCo_11F_MapScript1_161DF4:: @ 8161DF4
	checkflag FLAG_0x28D
	call_if 0, EventScript_1A8504
	end

SilphCo_11F_EventScript_161DFE:: @ 8161DFE
	lock
	faceplayer
	checkflag FLAG_0x250
	goto_if 1, EventScript_161E75
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_161E59
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_161E62
	checkitemspace ITEM_MASTER_BALL, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_161E6B
	additem ITEM_MASTER_BALL, 1
	loadword 0, gUnknown_8176FBD
	setorcopyvar VAR_0x8000, 1
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 318
	callstd 9
	loadword 0, gUnknown_8176FEB
	callstd 4
	setflag FLAG_0x250
	release
	end

EventScript_161E59:: @ 8161E59
	loadword 0, gUnknown_8176E12
	callstd 4
	return

EventScript_161E62:: @ 8161E62
	loadword 0, gUnknown_8176EE7
	callstd 4
	return

EventScript_161E6B:: @ 8161E6B
	loadword 0, gUnknown_817708E
	callstd 4
	release
	end

EventScript_161E75:: @ 8161E75
	loadword 0, gUnknown_8176FEB
	callstd 4
	release
	end

SilphCo_11F_EventScript_161E7F:: @ 8161E7F
	loadword 0, gUnknown_81770A9
	callstd 2
	end

SilphCo_11F_EventScript_161E88:: @ 8161E88
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_161EA0

EventScript_161E93:: @ 8161E93
	end

SilphCo_11F_EventScript_161E94:: @ 8161E94
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_161EA0

EventScript_161E9F:: @ 8161E9F
	end

EventScript_161EA0:: @ 8161EA0
	textcolor 0
	applymovement 3, Movement_1A75ED
	waitmovement 0
	delay 25
	loadword 0, gUnknown_8177108
	callstd 4
	closemessage
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_161F00
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_161F12
	setvar VAR_LAST_TALKED, 3
	trainerbattle 3, 349, 0, Text_1771AB
	loadword 0, gUnknown_81771C2
	callstd 4
	closemessage
	fadescreen 1
	removeobject 3
	removeobject 4
	removeobject 6
	fadescreen 0
	setvar VAR_0x4060, 1
	setflag FLAG_0x03E
	clearflag FLAG_0x03F
	releaseall
	end

EventScript_161F00:: @ 8161F00
	applymovement 3, Movement_161F1D
	applymovement 255, Movement_161F27
	waitmovement 0
	return

EventScript_161F12:: @ 8161F12
	applymovement 3, Movement_161F23
	waitmovement 0
	return

Movement_161F1D:: @ 8161F1D
	step_10
	step_10
	step_10
	step_10
	step_2f
	step_end

Movement_161F23:: @ 8161F23
	step_10
	step_10
	step_10
	step_end

Movement_161F27:: @ 8161F27
	step_1c
	step_1c
	step_1c
	step_1b
	step_1a
	step_30
	step_end

EventScript_161F2E:: @ 8161F2E
	loadword 0, gUnknown_817732B
	callstd 3
	end

SilphCo_11F_EventScript_161F37:: @ 8161F37
	loadword 0, gUnknown_817734A
	callstd 3
	end

SilphCo_11F_EventScript_161F40:: @ 8161F40
	trainerbattle 0, 390, 0, Text_1772B8, Text_1772E7
	loadword 0, gUnknown_81772F9
	callstd 6
	end

SilphCo_11F_EventScript_161F57:: @ 8161F57
	trainerbattle 0, 391, 0, Text_17726A, Text_17728C
	loadword 0, gUnknown_817729B
	callstd 6
	end
