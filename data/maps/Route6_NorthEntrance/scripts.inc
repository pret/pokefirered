Route6_NorthEntrance_MapScripts:: @ 816F9C6
	.byte 0

Route6_NorthEntrance_EventScript_16F9C7:: @ 816F9C7
	msgbox gUnknown_819E2A3, 2
	end

Route6_NorthEntrance_EventScript_16F9D0:: @ 816F9D0
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16F9F4
	end

Route6_NorthEntrance_EventScript_16F9DC:: @ 816F9DC
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16F9F4
	end

Route6_NorthEntrance_EventScript_16F9E8:: @ 816F9E8
	lockall
	setvar VAR_0x4001, 2
	goto EventScript_16F9F4
	end

EventScript_16F9F4:: @ 816F9F4
	textcolor 0
	applymovement 255, Movement_1A75EB
	waitmovement 0
	checkflag FLAG_0x2A6
	goto_if 1, EventScript_16FA1E
	msgbox gUnknown_819E181
	closemessage
	applymovement 255, Movement_16FA8A
	waitmovement 0
	releaseall
	end

EventScript_16FA1E:: @ 816FA1E
	removeitem ITEM_TEA, 1
	goto EventScript_16FA29
	end

EventScript_16FA29:: @ 816FA29
	msgbox gUnknown_819E1D1
	closemessage
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_16FA62
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_16FA6D
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_16FA78
	msgbox gUnknown_819E1F7
	setvar VAR_0x4062, 1
	releaseall
	end

EventScript_16FA62:: @ 816FA62
	applymovement 255, Movement_16FA83
	waitmovement 0
	return

EventScript_16FA6D:: @ 816FA6D
	applymovement 255, Movement_16FA86
	waitmovement 0
	return

EventScript_16FA78:: @ 816FA78
	applymovement 255, Movement_16FA88
	waitmovement 0
	return

Movement_16FA83:: @ 816FA83
	step_13
	step_13
	step_end

Movement_16FA86:: @ 816FA86
	step_13
	step_end

Movement_16FA88:: @ 816FA88
	step_28
	step_end

Movement_16FA8A:: @ 816FA8A
	step_10
	step_end
