SevenIsland_House_Room1_MapScripts:: @ 817088A
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_House_Room1_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_House_Room1_OnFrame
	.byte 0

SevenIsland_House_Room1_OnTransition:: @ 8170895
	special ValidateEReaderTrainer
	compare VAR_RESULT, 0
	call_if eq, EventScript_1708AF
	compare VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 0
	call_if ne, EventScript_1708C3
	end

EventScript_1708AF:: @ 81708AF
	setvar VAR_0x4001, 1
	setobjectxyperm 1, 4, 2
	setobjectmovementtype 1, 8
	setmaplayoutindex LAYOUT_UNUSED_LAYOUT_8338B4C
	return

EventScript_1708C3:: @ 81708C3
	setobjectxyperm 1, 3, 2
	setobjectmovementtype 1, 10
	return

SevenIsland_House_Room1_OnFrame:: @ 81708CF
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1, EventScript_1708E9
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2, EventScript_1708E9
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3, EventScript_1708E9
	.2byte 0

EventScript_1708E9:: @ 1708E9
	lockall
	textcolor 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170953
	waitmovement 0
	applymovement 1, Movement_170955
	waitmovement 0
	moveobjectoffscreen 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	compare VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1
	call_if eq, EventScript_170938
	compare VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2
	call_if eq, EventScript_170941
	compare VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3
	call_if eq, EventScript_17094A
	special LoadPlayerParty
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 0
	releaseall
	end

EventScript_170938:: @ 8170938
	msgbox gUnknown_81A088C
	return

EventScript_170941:: @ 8170941
	msgbox gUnknown_81A0971
	return

EventScript_17094A:: @ 817094A
	msgbox gUnknown_81A0807
	return

Movement_170953:: @ 8170953
	walk_down
	step_end

Movement_170955:: @ 8170955
	walk_right
	walk_in_place_fastest_down
	step_end

SevenIsland_House_Room1_EventScript_170958:: @ 8170958
	lock
	faceplayer
	special ValidateEReaderTrainer
	compare VAR_RESULT, 1
	call_if eq, EventScript_17097D
	compare VAR_0x4001, 1
	goto_if eq, EventScript_170987
	msgbox gUnknown_81A049B
	release
	end

EventScript_17097D:: @ 817097D
	msgbox gUnknown_81A049B
	release
	end

EventScript_170987:: @ 8170987
	special SavePlayerParty
	special Special_BufferEReaderTrainerName5
	msgbox gUnknown_81A0598, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_170A11
	call EventScript_170A1E
	compare VAR_RESULT, 0
	goto_if eq, EventScript_170A11
	msgbox gUnknown_81A0788, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_170A11
	special LoadPlayerParty
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_170A11
	special SavePlayerParty
	special ReducePlayerPartyToThree
	msgbox gUnknown_81A07C4
	closemessage
	compare VAR_FACING, DIR_NORTH
	call_if eq, EventScript_170A2D
	compare VAR_FACING, DIR_EAST
	call_if eq, EventScript_170A3F
	compare VAR_FACING, DIR_WEST
	call_if eq, EventScript_170A51
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM2, 255, 3, 1
	waitstate
	release
	end

EventScript_170A11:: @ 8170A11
	special LoadPlayerParty
	msgbox gUnknown_81A064E
	release
	end

EventScript_170A1E:: @ 8170A1E
	msgbox gUnknown_81A06AB
	fadescreen 1
	special sub_80A0334
	waitstate
	return

EventScript_170A2D:: @ 8170A2D
	applymovement VAR_LAST_TALKED, Movement_170A6F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170A63
	waitmovement 0
	return

EventScript_170A3F:: @ 8170A3F
	applymovement VAR_LAST_TALKED, Movement_170A72
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170A67
	waitmovement 0
	return

EventScript_170A51:: @ 8170A51
	applymovement VAR_LAST_TALKED, Movement_170A6F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170A6B
	waitmovement 0
	return

Movement_170A63:: @ 8170A63
	delay_16
	walk_up
	walk_up
	step_end

Movement_170A67:: @ 8170A67
	delay_16
	walk_right
	walk_up
	step_end

Movement_170A6B:: @ 8170A6B
	delay_16
	walk_left
	walk_up
	step_end

Movement_170A6F:: @ 8170A6F
	walk_left
	walk_in_place_fastest_right
	step_end

Movement_170A72:: @ 8170A72
	walk_right
	walk_in_place_fastest_left
	step_end

SevenIsland_House_Room1_EventScript_170A75:: @ 8170A75
	msgbox gUnknown_81A0567, 3
	end
