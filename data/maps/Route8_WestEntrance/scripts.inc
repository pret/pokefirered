Route8_WestEntrance_MapScripts:: @ 816FB53
	.byte 0

Route8_WestEntrance_EventScript_16FB54:: @ 816FB54
	msgbox gUnknown_819E50F, 2
	end

Route8_WestEntrance_EventScript_16FB5D:: @ 816FB5D
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16FB81
	end

Route8_WestEntrance_EventScript_16FB69:: @ 816FB69
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16FB81
	end

Route8_WestEntrance_EventScript_16FB75:: @ 816FB75
	lockall
	setvar VAR_0x4001, 2
	goto EventScript_16FB81
	end

EventScript_16FB81:: @ 816FB81
	textcolor 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	checkflag FLAG_0x2A6
	goto_if 1, EventScript_16FBAB
	msgbox gUnknown_819E3ED
	closemessage
	applymovement 255, Movement_16FC2D
	waitmovement 0
	releaseall
	end

EventScript_16FBAB:: @ 816FBAB
	removeitem ITEM_TEA, 1
	goto EventScript_16FBCC
	end

EventScript_16FBB6:: @ 816FBB6
	removeitem ITEM_SODA_POP, 1
	goto EventScript_16FBCC
	end

EventScript_16FBC1:: @ 816FBC1
	removeitem ITEM_LEMONADE, 1
	goto EventScript_16FBCC
	end

EventScript_16FBCC:: @ 816FBCC
	msgbox gUnknown_819E43D
	closemessage
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_16FC05
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_16FC10
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_16FC1B
	msgbox gUnknown_819E463
	setvar VAR_0x4062, 1
	releaseall
	end

EventScript_16FC05:: @ 816FC05
	applymovement 255, Movement_16FC2B
	waitmovement 0
	return

EventScript_16FC10:: @ 816FC10
	applymovement 255, Movement_16FC26
	waitmovement 0
	return

EventScript_16FC1B:: @ 816FC1B
	applymovement 255, Movement_16FC28
	waitmovement 0
	return

Movement_16FC26:: @ 816FC26
	step_11
	step_end

Movement_16FC28:: @ 816FC28
	step_11
	step_11
	step_end

Movement_16FC2B:: @ 816FC2B
	step_26
	step_end

Movement_16FC2D:: @ 816FC2D
	step_13
	step_end
