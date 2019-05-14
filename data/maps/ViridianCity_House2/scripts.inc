ViridianCity_House2_MapScripts:: @ 816A07C
	.byte 0

ViridianCity_House2_EventScript_16A07D:: @ 816A07D
	lock
	faceplayer
	loadword 0, gUnknown_818FC00
	callstd 4
	closemessage
	applymovement 2, Movement_1A75E9
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_16A094:: @ 816A094
	lock
	faceplayer
	loadword 0, gUnknown_818FC2B
	callstd 4
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_16A0AB:: @ 816A0AB
	lockall
	loadword 0, gUnknown_818FC65
	callstd 4
	loadword 0, gUnknown_818FF19
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16A11B
	loadword 0, gUnknown_818FD23
	callstd 4
	loadword 0, gUnknown_818FF19
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16A11B
	loadword 0, gUnknown_818FDA8
	callstd 4
	loadword 0, gUnknown_818FF19
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16A11B
	loadword 0, gUnknown_818FE5C
	callstd 4
	applymovement 2, Movement_1A75E9
	waitmovement 0
	textcolor 1
	loadword 0, gUnknown_818FF28
	callstd 4
	releaseall
	end

EventScript_16A11B:: @ 816A11B
	releaseall
	end

ViridianCity_House2_EventScript_16A11D:: @ 816A11D
	lockall
	loadword 0, gUnknown_818FF4B
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A12C:: @ 816A12C
	message Text_18FF88
	waitmessage
	multichoicegrid 7, 1, 15, 3, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16A18B
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16A1A7
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16A1C3
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_16A199
	compare_var_to_value VAR_0x8000, 4
	goto_if 1, EventScript_16A1B5
	compare_var_to_value VAR_0x8000, 5
	goto_if 1, EventScript_16A1D1
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16A1D1
	end

EventScript_16A18B:: @ 816A18B
	loadword 0, gUnknown_818FFA9
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A199:: @ 816A199
	loadword 0, gUnknown_8190025
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A1A7:: @ 816A1A7
	loadword 0, gUnknown_819009F
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A1B5:: @ 816A1B5
	loadword 0, gUnknown_819010F
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A1C3:: @ 816A1C3
	loadword 0, gUnknown_8190199
	callstd 4
	goto EventScript_16A12C
	end

EventScript_16A1D1:: @ 816A1D1
	releaseall
	end
