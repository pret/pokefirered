Route7_EastEntrance_MapScripts:: @ 816FA8D
	.byte 0

Route7_EastEntrance_EventScript_16FA8E:: @ 816FA8E
	msgbox gUnknown_819E3D9, 2
	end

Route7_EastEntrance_EventScript_16FA97:: @ 816FA97
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16FABB
	end

Route7_EastEntrance_EventScript_16FAA3:: @ 816FAA3
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16FABB
	end

Route7_EastEntrance_EventScript_16FAAF:: @ 816FAAF
	lockall
	setvar VAR_0x4001, 2
	goto EventScript_16FABB
	end

EventScript_16FABB:: @ 816FABB
	textcolor 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	checkflag FLAG_GOT_TEA
	goto_if TRUE, EventScript_16FAE5
	msgbox gUnknown_819E2B7
	closemessage
	applymovement 255, Movement_16FB51
	waitmovement 0
	releaseall
	end

EventScript_16FAE5:: @ 816FAE5
	removeitem ITEM_TEA, 1
	goto EventScript_16FAF0
	end

EventScript_16FAF0:: @ 816FAF0
	msgbox gUnknown_819E307
	closemessage
	compare VAR_0x4001, 0
	call_if eq, EventScript_16FB29
	compare VAR_0x4001, 1
	call_if eq, EventScript_16FB34
	compare VAR_0x4001, 2
	call_if eq, EventScript_16FB3F
	msgbox gUnknown_819E32D
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

EventScript_16FB29:: @ 816FB29
	applymovement 255, Movement_16FB4F
	waitmovement 0
	return

EventScript_16FB34:: @ 816FB34
	applymovement 255, Movement_16FB4A
	waitmovement 0
	return

EventScript_16FB3F:: @ 816FB3F
	applymovement 255, Movement_16FB4C
	waitmovement 0
	return

Movement_16FB4A:: @ 816FB4A
	step_11
	step_end

Movement_16FB4C:: @ 816FB4C
	step_11
	step_11
	step_end

Movement_16FB4F:: @ 816FB4F
	step_26
	step_end

Movement_16FB51:: @ 816FB51
	step_12
	step_end
