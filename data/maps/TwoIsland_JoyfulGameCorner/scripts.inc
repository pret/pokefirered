# 1 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 2 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
.equ LOCALID_DADDY,    1
# 3 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
.equ LOCALID_BIKER,    2
# 4 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
.equ LOCALID_LOSTELLE, 3
# 5 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 6 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_MapScripts::
# 7 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_JoyfulGameCorner_OnTransition
# 8 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, TwoIsland_JoyfulGameCorner_OnWarp
# 9 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TwoIsland_JoyfulGameCorner_OnFrame
# 10 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
# 11 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	.byte 0
# 12 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 13 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_OnTransition::
# 14 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	call_if_set FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER, TwoIsland_JoyfulGameCorner_EventScript_SetLostelleReturnedPos
# 15 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 16 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 17 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_SetLostelleReturnedPos::
# 18 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setobjectxyperm LOCALID_DADDY, 6, 2
# 19 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setobjectmovementtype LOCALID_DADDY, MOVEMENT_TYPE_FACE_DOWN
# 20 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setobjectmovementtype LOCALID_LOSTELLE, MOVEMENT_TYPE_LOOK_AROUND
# 21 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
# 22 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	return
# 23 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 24 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_OnWarp::
# 25 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, TwoIsland_JoyfulGameCorner_EventScript_TurnPlayerNorth
# 26 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, EventScript_CheckTurnAttendant
# 27 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	.2byte 0
# 28 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 29 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_TurnPlayerNorth::
# 30 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 31 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 32 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 33 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_OnFrame::
# 34 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 0, TwoIsland_JoyfulGameCorner_EventScript_HelpFindLostelleScene
# 35 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, TwoIsland_JoyfulGameCorner_EventScript_FoundLostelleScene
# 36 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, CableClub_EventScript_ExitMinigameRoom
# 37 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	.2byte 0
# 38 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 39 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_FoundLostelleScene::
# 40 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	lockall
# 41 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 42 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_YouRescuedLostelle
# 43 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 44 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	special BufferBigGuyOrBigGirlString
# 45 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_LostelleItsOkayDaddy
# 46 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	closemessage
# 47 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_LOSTELLE, Common_Movement_WalkInPlaceFasterDown
# 48 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 49 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 3
# 50 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	releaseall
# 51 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 52 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 53 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_HelpFindLostelleScene::
# 54 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	lockall
# 55 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 56 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_DADDY, TwoIsland_JoyfulGameCorner_Movement_DaddyPacing
# 57 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 58 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_WhereHasLostelleGottenTo
# 59 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	closemessage
# 60 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_DADDY, Common_Movement_WalkInPlaceFasterDown
# 61 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 62 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	playse SE_PIN
# 63 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_DADDY, Common_Movement_ExclamationMark
# 64 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 65 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_DADDY, Common_Movement_Delay48
# 66 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 67 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_DADDY, TwoIsland_JoyfulGameCorner_Movement_DaddyApproachPlayer
# 68 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 69 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 70 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 71 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_PleaseHelpFindLostelle
# 72 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	closemessage
# 73 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	playse SE_RS_DOOR
# 74 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitse
# 75 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TwoIsland_JoyfulGameCorner_Movement_PlayerFaceDaddy
# 76 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 77 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	playbgm MUS_ENCOUNTER_BOY, 0
# 78 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	addobject LOCALID_BIKER
# 79 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_BIKER, TwoIsland_JoyfulGameCorner_Movement_BikerLookAround
# 80 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 81 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_IsThisOnlyThreeIsland
# 82 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_BIKER, Common_Movement_WalkInPlaceFasterRight
# 83 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 84 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_ThisIsTwoIslandMoveIt
# 85 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_TheseIslandsAreConfusing
# 86 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	closemessage
# 87 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	applymovement LOCALID_BIKER, Common_Movement_WalkInPlaceFasterDown
# 88 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmovement 0
# 89 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	playse SE_EXIT
# 90 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	removeobject LOCALID_BIKER
# 91 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	fadedefaultbgm
# 92 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	delay 60
# 93 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_PunkScuffedUpMyFloor
# 94 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	clearflag FLAG_HIDE_THREE_ISLAND_LONE_BIKER
# 95 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setvar VAR_MAP_SCENE_THREE_ISLAND, 2
# 96 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 1
# 97 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	releaseall
# 98 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 99 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 100 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_Movement_DaddyPacing::
# 101 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_left
# 102 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_right
# 103 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_right
# 104 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	delay_8
# 105 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_up
# 106 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	delay_16
# 107 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	step_end
# 108 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 109 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_Movement_DaddyApproachPlayer::
# 110 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_down
# 111 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_down
# 112 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_down
# 113 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_left
# 114 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	step_end
# 115 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 116 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_Movement_PlayerFaceDaddy::
# 117 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_left
# 118 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_right
# 119 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	step_end
# 120 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 121 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_Movement_BikerLookAround::
# 122 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_left
# 123 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	delay_8
# 124 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_right
# 125 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	delay_8
# 126 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	walk_in_place_faster_up
# 127 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	step_end
# 128 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 129 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_InfoMan::
# 130 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	lock
# 131 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	faceplayer
# 132 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4, JoyfulGameCorner_EventScript_InfoMan2
# 133 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_set FLAG_RESCUED_LOSTELLE, TwoIsland_JoyfulGameCorner_EventScript_GetGamesGoingSoon
# 134 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_NotRunningAnyGamesToday
# 135 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 136 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 137 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 138 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_GetGamesGoingSoon::
# 139 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_GetGamesGoingSoon
# 140 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 141 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 142 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 143 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
@ Only referred to as Lostelles Daddy in text
# 144 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_LostellesDaddy::
# 145 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	lock
# 146 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	faceplayer
# 147 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4, JoyfulGameCorner_EventScript_MinigameAttendant
# 148 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_set FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER, TwoIsland_JoyfulGameCorner_EventScript_GetGameCornerRunning
# 149 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 3, TwoIsland_JoyfulGameCorner_EventScript_GiveDaddyMeteorite
# 150 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_PleaseGoToThreeIsland
# 151 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 152 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 153 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 154 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_GiveDaddyMeteorite::
# 155 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_set FLAG_NO_ROOM_FOR_JOYFUL_GAME_CORNER_MOON_STONE, TwoIsland_JoyfulGameCorner_EventScript_ReceiveMoonStone
# 156 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_ThisIsForMe
# 157 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 2
# 158 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 159 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	playfanfare MUS_OBTAIN_TMHM
# 160 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	message TwoIsland_JoyfulGameCorner_Text_HandedMeteoriteToLostellesDaddy
# 161 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitmessage
# 162 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	waitfanfare
# 163 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	call EventScript_RestorePrevTextColor
# 164 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	removeitem ITEM_METEORITE
# 165 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_OhThisIsFromBill
# 166 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto TwoIsland_JoyfulGameCorner_EventScript_ReceiveMoonStone
# 167 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 168 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 169 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_ReceiveMoonStone::
# 170 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	checkitemspace ITEM_MOON_STONE
# 171 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, TwoIsland_JoyfulGameCorner_EventScript_NoRoomForMoonStone
# 172 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	additem ITEM_MOON_STONE
# 173 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setflag FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER
# 174 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgreceiveditem TwoIsland_JoyfulGameCorner_Text_ReceivedMoonStoneFromLostellesDaddy, ITEM_MOON_STONE
# 175 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 176 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 177 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 178 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_GetGameCornerRunning::
# 179 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_IllGetGameCornerRunning
# 180 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 181 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 182 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 183 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_NoRoomForMoonStone::
# 184 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	setflag FLAG_NO_ROOM_FOR_JOYFUL_GAME_CORNER_MOON_STONE
# 185 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_NotGoingToFitInBag
# 186 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 187 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
# 188 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"

# 189 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
TwoIsland_JoyfulGameCorner_EventScript_Lostelle::
# 190 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	lock
# 191 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	faceplayer
# 192 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	msgbox TwoIsland_JoyfulGameCorner_Text_PleaseShowMeYouBeingCool
# 193 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	release
# 194 "data/maps/TwoIsland_JoyfulGameCorner/scripts.pory"
	end
