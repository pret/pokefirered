# 1 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 2 "data/maps/SevenIsland_House_Room1/scripts.pory"
.equ LOCALID_OLD_WOMAN, 1
# 3 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 4 "data/maps/SevenIsland_House_Room1/scripts.pory"
.equ TRAINER_VISITING, VAR_TEMP_1
# 5 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 6 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_MapScripts::
# 7 "data/maps/SevenIsland_House_Room1/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_House_Room1_OnTransition
# 8 "data/maps/SevenIsland_House_Room1/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_House_Room1_OnFrame
# 9 "data/maps/SevenIsland_House_Room1/scripts.pory"
	.byte 0
# 10 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 11 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_OnTransition::
# 12 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special ValidateEReaderTrainer
# 13 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_RESULT, 0, SevenIsland_House_Room1_EventScript_SetTrainerVisitingLayout
# 14 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_ne VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 0, SevenIsland_House_Room1_EventScript_MoveOldWomanToDoor
# 15 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 16 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 17 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_SetTrainerVisitingLayout::
# 18 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setvar TRAINER_VISITING, TRUE
# 19 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setobjectxyperm LOCALID_OLD_WOMAN, 4, 2
# 20 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setobjectmovementtype LOCALID_OLD_WOMAN, MOVEMENT_TYPE_FACE_DOWN
# 21 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setmaplayoutindex LAYOUT_SEVEN_ISLAND_HOUSE_ROOM1_DOOR_OPEN
# 22 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 23 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 24 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_MoveOldWomanToDoor::
# 25 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setobjectxyperm LOCALID_OLD_WOMAN, 3, 2
# 26 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setobjectmovementtype LOCALID_OLD_WOMAN, MOVEMENT_TYPE_FACE_RIGHT
# 27 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 28 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 29 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_OnFrame::
# 30 "data/maps/SevenIsland_House_Room1/scripts.pory"
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1, SevenIsland_House_Room1_EventScript_OldWomanCommentOnBattle
# 31 "data/maps/SevenIsland_House_Room1/scripts.pory"
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2, SevenIsland_House_Room1_EventScript_OldWomanCommentOnBattle
# 32 "data/maps/SevenIsland_House_Room1/scripts.pory"
	map_script_2 VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3, SevenIsland_House_Room1_EventScript_OldWomanCommentOnBattle
# 33 "data/maps/SevenIsland_House_Room1/scripts.pory"
	.2byte 0
# 34 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 35 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_OldWomanCommentOnBattle::
# 36 "data/maps/SevenIsland_House_Room1/scripts.pory"
	lockall
# 37 "data/maps/SevenIsland_House_Room1/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 38 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room1_Movement_PlayerReEnterRoom
# 39 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 40 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement LOCALID_OLD_WOMAN, SevenIsland_House_Room1_Movement_OldWomanWalkBehindPlayer
# 41 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 42 "data/maps/SevenIsland_House_Room1/scripts.pory"
	copyobjectxytoperm LOCALID_OLD_WOMAN
# 43 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 44 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 45 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1, SevenIsland_House_Room1_EventScript_BattleWonComment
# 46 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2, SevenIsland_House_Room1_EventScript_BattleLostComment
# 47 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3, SevenIsland_House_Room1_EventScript_BattleTiedComment
# 48 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special LoadPlayerParty
# 49 "data/maps/SevenIsland_House_Room1/scripts.pory"
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 0
# 50 "data/maps/SevenIsland_House_Room1/scripts.pory"
	releaseall
# 51 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 52 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 53 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_BattleWonComment::
# 54 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_AstoundingBattle
# 55 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 56 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 57 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_BattleLostComment::
# 58 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_FeelYourDisappointment
# 59 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 60 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 61 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_BattleTiedComment::
# 62 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_DrawWasIt
# 63 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 64 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 65 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_PlayerReEnterRoom::
# 66 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_down
# 67 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 68 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 69 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_OldWomanWalkBehindPlayer::
# 70 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_right
# 71 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_in_place_faster_down
# 72 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 73 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 74 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_OldWoman::
# 75 "data/maps/SevenIsland_House_Room1/scripts.pory"
	lock
# 76 "data/maps/SevenIsland_House_Room1/scripts.pory"
	faceplayer
# 77 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special ValidateEReaderTrainer
# 78 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_RESULT, 1, SevenIsland_House_Room1_EventScript_InvalidVisitingTrainer
# 79 "data/maps/SevenIsland_House_Room1/scripts.pory"
	goto_if_eq TRAINER_VISITING, TRUE, SevenIsland_House_Room1_EventScript_TrainerVisiting
# 80 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_OnlyEnjoymentWatchingBattles
# 81 "data/maps/SevenIsland_House_Room1/scripts.pory"
	release
# 82 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 83 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 84 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_InvalidVisitingTrainer::
# 85 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_OnlyEnjoymentWatchingBattles
# 86 "data/maps/SevenIsland_House_Room1/scripts.pory"
	release
# 87 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 88 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 89 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_TrainerVisiting::
# 90 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special SavePlayerParty
# 91 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special BufferEReaderTrainerName
# 92 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_ChallengeVisitingTrainer, MSGBOX_YESNO
# 93 "data/maps/SevenIsland_House_Room1/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SevenIsland_House_Room1_EventScript_DeclineBattle
# 94 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call SevenIsland_House_Room1_EventScript_ChooseParty
# 95 "data/maps/SevenIsland_House_Room1/scripts.pory"
	goto_if_eq VAR_RESULT, 0, SevenIsland_House_Room1_EventScript_DeclineBattle
# 96 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_SaveProgressBeforeBattle, MSGBOX_YESNO
# 97 "data/maps/SevenIsland_House_Room1/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SevenIsland_House_Room1_EventScript_DeclineBattle
# 98 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special LoadPlayerParty
# 99 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call EventScript_AskSaveGame
# 100 "data/maps/SevenIsland_House_Room1/scripts.pory"
	goto_if_eq VAR_RESULT, 0, SevenIsland_House_Room1_EventScript_DeclineBattle
# 101 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special SavePlayerParty
# 102 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special ReducePlayerPartyToThree
# 103 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_DontHoldAnythingBack
# 104 "data/maps/SevenIsland_House_Room1/scripts.pory"
	closemessage
# 105 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SevenIsland_House_Room1_EventScript_EnterBattleRoomNorth
# 106 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SevenIsland_House_Room1_EventScript_EnterBattleRoomEast
# 107 "data/maps/SevenIsland_House_Room1/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SevenIsland_House_Room1_EventScript_EnterBattleRoomWest
# 108 "data/maps/SevenIsland_House_Room1/scripts.pory"
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM2, 3, 1
# 109 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitstate
# 110 "data/maps/SevenIsland_House_Room1/scripts.pory"
	release
# 111 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 112 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 113 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_DeclineBattle::
# 114 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special LoadPlayerParty
# 115 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_OhYouWontBattle
# 116 "data/maps/SevenIsland_House_Room1/scripts.pory"
	release
# 117 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
# 118 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 119 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_ChooseParty::
# 120 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_LimitThreeMonsPerSide
# 121 "data/maps/SevenIsland_House_Room1/scripts.pory"
	fadescreen FADE_TO_BLACK
# 122 "data/maps/SevenIsland_House_Room1/scripts.pory"
	special ChooseHalfPartyForBattle
# 123 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitstate
# 124 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 125 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 126 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_EnterBattleRoomNorth::
# 127 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement VAR_LAST_TALKED, SevenIsland_House_Room1_Movement_OldWomanMoveAsideLeft
# 128 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomNorth
# 129 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 130 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 131 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 132 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_EnterBattleRoomEast::
# 133 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement VAR_LAST_TALKED, SevenIsland_House_Room1_Movement_OldWomanMoveAsideRight
# 134 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomEast
# 135 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 136 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 137 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 138 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_EnterBattleRoomWest::
# 139 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement VAR_LAST_TALKED, SevenIsland_House_Room1_Movement_OldWomanMoveAsideLeft
# 140 "data/maps/SevenIsland_House_Room1/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomWest
# 141 "data/maps/SevenIsland_House_Room1/scripts.pory"
	waitmovement 0
# 142 "data/maps/SevenIsland_House_Room1/scripts.pory"
	return
# 143 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 144 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomNorth::
# 145 "data/maps/SevenIsland_House_Room1/scripts.pory"
	delay_16
# 146 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_up
# 147 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_up
# 148 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 149 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 150 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomEast::
# 151 "data/maps/SevenIsland_House_Room1/scripts.pory"
	delay_16
# 152 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_right
# 153 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_up
# 154 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 155 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 156 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_PlayerEnterBattleRoomWest::
# 157 "data/maps/SevenIsland_House_Room1/scripts.pory"
	delay_16
# 158 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_left
# 159 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_up
# 160 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 161 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 162 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_OldWomanMoveAsideLeft::
# 163 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_left
# 164 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_in_place_faster_right
# 165 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 166 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 167 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_Movement_OldWomanMoveAsideRight::
# 168 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_right
# 169 "data/maps/SevenIsland_House_Room1/scripts.pory"
	walk_in_place_faster_left
# 170 "data/maps/SevenIsland_House_Room1/scripts.pory"
	step_end
# 171 "data/maps/SevenIsland_House_Room1/scripts.pory"

# 172 "data/maps/SevenIsland_House_Room1/scripts.pory"
SevenIsland_House_Room1_EventScript_Box::
# 173 "data/maps/SevenIsland_House_Room1/scripts.pory"
	msgbox SevenIsland_House_Room1_Text_SlightBreezeAroundBox, MSGBOX_SIGN
# 174 "data/maps/SevenIsland_House_Room1/scripts.pory"
	end
