SevenIsland_House_Room2_MapScripts:: @ 8170A7E
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_House_Room2_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_House_Room2_OnFrame
	.byte 0

SevenIsland_House_Room2_OnTransition:: @ 8170A89
	special SetEReaderTrainerGfxId
	end

SevenIsland_House_Room2_OnFrame:: @ 8170A8D
	map_script_2 VAR_TEMP_1, 0, SevenIsland_House_Room2_EventScript_BattleVisitingTrainer
	.2byte 0

SevenIsland_House_Room2_EventScript_BattleVisitingTrainer:: @ 8170A97
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room2_Movement_PlayerEnterRoom
	waitmovement 0
	special BufferEReaderTrainerGreeting
	msgbox gStringVar4
	closemessage
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	compare VAR_RESULT, 3
	call_if_eq SevenIsland_House_Room2_EventScript_BattleTie
	compare VAR_RESULT, 1
	call_if_eq SevenIsland_House_Room2_EventScript_BattleWon
	compare VAR_RESULT, 2
	call_if_eq SevenIsland_House_Room2_EventScript_BattleLost
	closemessage
	special HealPlayerParty
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room2_Movement_PlayerExitRoom
	waitmovement 0
	special LoadPlayerParty
	setvar VAR_TEMP_1, 1
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM1, 255, 4, 1
	waitstate
	releaseall
	end

SevenIsland_House_Room2_EventScript_BattleTie:: @ 8170AFE
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3
	msgbox SevenIsland_House_Room2_Text_MatchEndedUpDraw
	return

SevenIsland_House_Room2_EventScript_BattleWon:: @ 8170B0C
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1
	special ShowFieldMessageStringVar4
	waitmessage
	waitbuttonpress
	return

SevenIsland_House_Room2_EventScript_BattleLost:: @ 8170B17
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2
	special ShowFieldMessageStringVar4
	waitmessage
	waitbuttonpress
	return

SevenIsland_House_Room2_Movement_PlayerEnterRoom:: @ 8170B22
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

SevenIsland_House_Room2_Movement_PlayerExitRoom:: @ 8170B28
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	step_end
