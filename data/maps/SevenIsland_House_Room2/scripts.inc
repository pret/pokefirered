SevenIsland_House_Room2_MapScripts:: @ 8170A7E
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_House_Room2_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_House_Room2_OnFrame
	.byte 0

SevenIsland_House_Room2_OnTransition:: @ 8170A89
	special SetEReaderTrainerGfxId
	end

SevenIsland_House_Room2_OnFrame:: @ 8170A8D
	map_script_2 VAR_0x4001, 0, EventScript_170A97
	.2byte 0

EventScript_170A97:: @ 8170A97
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170B22
	waitmovement 0
	special PrintEReaderTrainerGreeting
	msgbox gStringVar4
	closemessage
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	compare VAR_RESULT, 3
	call_if eq, EventScript_170AFE
	compare VAR_RESULT, 1
	call_if eq, EventScript_170B0C
	compare VAR_RESULT, 2
	call_if eq, EventScript_170B17
	closemessage
	special sp000_heal_pokemon
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170B28
	waitmovement 0
	special LoadPlayerParty
	setvar VAR_0x4001, 1
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM1, 255, 4, 1
	waitstate
	releaseall
	end

EventScript_170AFE:: @ 8170AFE
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3
	msgbox gUnknown_81A07EC
	return

EventScript_170B0C:: @ 8170B0C
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1
	special Special_ShowStringVar4AsFieldMessage
	waitmessage
	waitbuttonpress
	return

EventScript_170B17:: @ 8170B17
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2
	special Special_ShowStringVar4AsFieldMessage
	waitmessage
	waitbuttonpress
	return

Movement_170B22:: @ 8170B22
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

Movement_170B28:: @ 8170B28
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	step_end
