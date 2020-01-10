Route6_NorthEntrance_MapScripts:: @ 816F9C6
	.byte 0

Route6_NorthEntrance_EventScript_16F9C7:: @ 816F9C7
	msgbox gUnknown_819E2A3, 2
	end

Route6_NorthEntrance_EventScript_16F9D0:: @ 816F9D0
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16F9F4
	end

Route6_NorthEntrance_EventScript_16F9DC:: @ 816F9DC
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16F9F4
	end

Route6_NorthEntrance_EventScript_16F9E8:: @ 816F9E8
	lockall
	setvar VAR_TEMP_1, 2
	goto EventScript_16F9F4
	end

EventScript_16F9F4:: @ 816F9F4
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	goto_if_set FLAG_GOT_TEA, EventScript_16FA1E
	msgbox gUnknown_819E181
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16FA8A
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
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16FA62
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16FA6D
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_16FA78
	msgbox gUnknown_819E1F7
	setvar VAR_MAP_SCENE_ROUTE5_ROUTE6_ROUTE7_ROUTE8_GATES, 1
	releaseall
	end

EventScript_16FA62:: @ 816FA62
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16FA83
	waitmovement 0
	return

EventScript_16FA6D:: @ 816FA6D
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16FA86
	waitmovement 0
	return

EventScript_16FA78:: @ 816FA78
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16FA88
	waitmovement 0
	return

Movement_16FA83:: @ 816FA83
	walk_right
	walk_right
	step_end

Movement_16FA86:: @ 816FA86
	walk_right
	step_end

Movement_16FA88:: @ 816FA88
	walk_in_place_right
	step_end

Movement_16FA8A:: @ 816FA8A
	walk_down
	step_end
