# 1 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 2 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_MapScripts::
# 3 "data/maps/SevenIsland_House_Room2/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_House_Room2_OnTransition
# 4 "data/maps/SevenIsland_House_Room2/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_House_Room2_OnFrame
# 5 "data/maps/SevenIsland_House_Room2/scripts.pory"
	.byte 0
# 6 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 7 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_OnTransition::
# 8 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special SetEReaderTrainerGfxId
# 9 "data/maps/SevenIsland_House_Room2/scripts.pory"
	end
# 10 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 11 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_OnFrame::
# 12 "data/maps/SevenIsland_House_Room2/scripts.pory"
	map_script_2 VAR_TEMP_1, 0, SevenIsland_House_Room2_EventScript_BattleVisitingTrainer
# 13 "data/maps/SevenIsland_House_Room2/scripts.pory"
	.2byte 0
# 14 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 15 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_EventScript_BattleVisitingTrainer::
# 16 "data/maps/SevenIsland_House_Room2/scripts.pory"
	lockall
# 17 "data/maps/SevenIsland_House_Room2/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room2_Movement_PlayerEnterRoom
# 18 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitmovement 0
# 19 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special BufferEReaderTrainerGreeting
# 20 "data/maps/SevenIsland_House_Room2/scripts.pory"
	msgbox gStringVar4
# 21 "data/maps/SevenIsland_House_Room2/scripts.pory"
	closemessage
# 22 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_0x8004, 2
# 23 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_0x8005, 0
# 24 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special StartSpecialBattle
# 25 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitstate
# 26 "data/maps/SevenIsland_House_Room2/scripts.pory"
	call_if_eq VAR_RESULT, 3, SevenIsland_House_Room2_EventScript_BattleTie
# 27 "data/maps/SevenIsland_House_Room2/scripts.pory"
	call_if_eq VAR_RESULT, 1, SevenIsland_House_Room2_EventScript_BattleWon
# 28 "data/maps/SevenIsland_House_Room2/scripts.pory"
	call_if_eq VAR_RESULT, 2, SevenIsland_House_Room2_EventScript_BattleLost
# 29 "data/maps/SevenIsland_House_Room2/scripts.pory"
	closemessage
# 30 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special HealPlayerParty
# 31 "data/maps/SevenIsland_House_Room2/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room2_Movement_PlayerExitRoom
# 32 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitmovement 0
# 33 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special LoadPlayerParty
# 34 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_TEMP_1, 1
# 35 "data/maps/SevenIsland_House_Room2/scripts.pory"
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM1, 4, 1
# 36 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitstate
# 37 "data/maps/SevenIsland_House_Room2/scripts.pory"
	releaseall
# 38 "data/maps/SevenIsland_House_Room2/scripts.pory"
	end
# 39 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 40 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_EventScript_BattleTie::
# 41 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3
# 42 "data/maps/SevenIsland_House_Room2/scripts.pory"
	msgbox SevenIsland_House_Room2_Text_MatchEndedUpDraw
# 43 "data/maps/SevenIsland_House_Room2/scripts.pory"
	return
# 44 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 45 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_EventScript_BattleWon::
# 46 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1
# 47 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special ShowFieldMessageStringVar4
# 48 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitmessage
# 49 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitbuttonpress
# 50 "data/maps/SevenIsland_House_Room2/scripts.pory"
	return
# 51 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 52 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_EventScript_BattleLost::
# 53 "data/maps/SevenIsland_House_Room2/scripts.pory"
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2
# 54 "data/maps/SevenIsland_House_Room2/scripts.pory"
	special ShowFieldMessageStringVar4
# 55 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitmessage
# 56 "data/maps/SevenIsland_House_Room2/scripts.pory"
	waitbuttonpress
# 57 "data/maps/SevenIsland_House_Room2/scripts.pory"
	return
# 58 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 59 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_Movement_PlayerEnterRoom::
# 60 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_down
# 61 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_down
# 62 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_down
# 63 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_right
# 64 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_right
# 65 "data/maps/SevenIsland_House_Room2/scripts.pory"
	step_end
# 66 "data/maps/SevenIsland_House_Room2/scripts.pory"

# 67 "data/maps/SevenIsland_House_Room2/scripts.pory"
SevenIsland_House_Room2_Movement_PlayerExitRoom::
# 68 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_left
# 69 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_left
# 70 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_up
# 71 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_up
# 72 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_up
# 73 "data/maps/SevenIsland_House_Room2/scripts.pory"
	walk_up
# 74 "data/maps/SevenIsland_House_Room2/scripts.pory"
	delay_8
# 75 "data/maps/SevenIsland_House_Room2/scripts.pory"
	step_end
