Route16_NorthEntrance_1F_MapScripts:: @ 81701C2
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_NorthEntrance_1F_OnTransition
	.byte 0

Route16_NorthEntrance_1F_OnTransition:: @ 81701C8
	clearflag FLAG_SYS_ON_CYCLING_ROAD
	call_if_set FLAG_GOT_BICYCLE, EventScript_1701D5
	end

EventScript_1701D5:: @ 81701D5
	setvar VAR_TEMP_1, 1
	return

Route16_NorthEntrance_1F_EventScript_1701DB:: @ 81701DB
	msgbox gUnknown_819F98B, 2
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
	msgbox gUnknown_819F9CC
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	compare VAR_0x8008, 1
	call_if_eq EventScript_170279
	compare VAR_0x8008, 2
	call_if_eq EventScript_170284
	compare VAR_0x8008, 3
	call_if_eq EventScript_17028F
	compare VAR_0x8008, 4
	call_if_eq EventScript_17029A
	msgbox gUnknown_819F95F
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1702B3
	waitmovement 0
	releaseall
	end

EventScript_170279:: @ 8170279
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1702A5
	waitmovement 0
	return

EventScript_170284:: @ 8170284
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1702A7
	waitmovement 0
	return

EventScript_17028F:: @ 817028F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1702AA
	waitmovement 0
	return

EventScript_17029A:: @ 817029A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1702AE
	waitmovement 0
	return

Movement_1702A5:: @ 81702A5
	walk_up
	step_end

Movement_1702A7:: @ 81702A7
	walk_up
	walk_up
	step_end

Movement_1702AA:: @ 81702AA
	walk_up
	walk_up
	walk_up
	step_end

Movement_1702AE:: @ 81702AE
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

Movement_1702B3:: @ 81702B3
	walk_right
	step_end

Route16_NorthEntrance_1F_EventScript_1702B5:: @ 81702B5
	msgbox gUnknown_819F9E8, 2
	end
