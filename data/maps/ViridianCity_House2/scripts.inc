ViridianCity_House2_MapScripts:: @ 816A07C
	.byte 0

ViridianCity_House2_EventScript_16A07D:: @ 816A07D
	lock
	faceplayer
	msgbox gUnknown_818FC00
	closemessage
	applymovement 2, Movement_1A75E9
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_16A094:: @ 816A094
	lock
	faceplayer
	msgbox gUnknown_818FC2B
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_16A0AB:: @ 816A0AB
	lockall
	msgbox gUnknown_818FC65
	msgbox gUnknown_818FF19, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16A11B
	msgbox gUnknown_818FD23
	msgbox gUnknown_818FF19, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16A11B
	msgbox gUnknown_818FDA8
	msgbox gUnknown_818FF19, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16A11B
	msgbox gUnknown_818FE5C
	applymovement 2, Movement_1A75E9
	waitmovement 0
	textcolor 1
	msgbox gUnknown_818FF28
	releaseall
	end

EventScript_16A11B:: @ 816A11B
	releaseall
	end

ViridianCity_House2_EventScript_16A11D:: @ 816A11D
	lockall
	msgbox gUnknown_818FF4B
	goto EventScript_16A12C
	end

EventScript_16A12C:: @ 816A12C
	message Text_18FF88
	waitmessage
	multichoicegrid 7, 1, 15, 3, 0
	switch VAR_RESULT
	case 0, EventScript_16A18B
	case 1, EventScript_16A1A7
	case 2, EventScript_16A1C3
	case 3, EventScript_16A199
	case 4, EventScript_16A1B5
	case 5, EventScript_16A1D1
	case 127, EventScript_16A1D1
	end

EventScript_16A18B:: @ 816A18B
	msgbox gUnknown_818FFA9
	goto EventScript_16A12C
	end

EventScript_16A199:: @ 816A199
	msgbox gUnknown_8190025
	goto EventScript_16A12C
	end

EventScript_16A1A7:: @ 816A1A7
	msgbox gUnknown_819009F
	goto EventScript_16A12C
	end

EventScript_16A1B5:: @ 816A1B5
	msgbox gUnknown_819010F
	goto EventScript_16A12C
	end

EventScript_16A1C3:: @ 816A1C3
	msgbox gUnknown_8190199
	goto EventScript_16A12C
	end

EventScript_16A1D1:: @ 816A1D1
	releaseall
	end
