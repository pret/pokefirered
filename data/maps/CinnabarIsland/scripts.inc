# 1 "data/maps/CinnabarIsland/scripts.pory"

# 2 "data/maps/CinnabarIsland/scripts.pory"
.equ LOCALID_BILL, 3
# 3 "data/maps/CinnabarIsland/scripts.pory"
.equ LOCALID_SEAGALLOP, 4
# 4 "data/maps/CinnabarIsland/scripts.pory"

# 5 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_MapScripts::
# 6 "data/maps/CinnabarIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CinnabarIsland_OnTransition
# 7 "data/maps/CinnabarIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CinnabarIsland_OnFrame
# 8 "data/maps/CinnabarIsland/scripts.pory"
	.byte 0
# 9 "data/maps/CinnabarIsland/scripts.pory"

# 10 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_OnTransition::
# 11 "data/maps/CinnabarIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_CINNABAR_ISLAND
# 12 "data/maps/CinnabarIsland/scripts.pory"
	call CinnabarIsland_EventScript_CheckUnlockGym
# 13 "data/maps/CinnabarIsland/scripts.pory"
	call_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND, 1, CinnabarIsland_EventScript_ReadyObjectsSailToOneIsland
# 14 "data/maps/CinnabarIsland/scripts.pory"
	call_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND, 3, CinnabarIsland_EventScript_ReadyObjectsReturnFromSeviiIslands
# 15 "data/maps/CinnabarIsland/scripts.pory"
	call_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1, CinnabarIsland_EventScript_ReadyObjectsSailToOneIslandFromPokeCenter
# 16 "data/maps/CinnabarIsland/scripts.pory"
	end
# 17 "data/maps/CinnabarIsland/scripts.pory"

# 18 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ReadyObjectsSailToOneIslandFromPokeCenter::
# 19 "data/maps/CinnabarIsland/scripts.pory"
	savebgm MUS_FOLLOW_ME
# 20 "data/maps/CinnabarIsland/scripts.pory"
	setflag FLAG_TEMP_2
# 21 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_BILL, 15, 12
# 22 "data/maps/CinnabarIsland/scripts.pory"
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_LEFT
# 23 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_SEAGALLOP, 30, 12
# 24 "data/maps/CinnabarIsland/scripts.pory"
	return
# 25 "data/maps/CinnabarIsland/scripts.pory"

# 26 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ReadyObjectsSailToOneIsland::
# 27 "data/maps/CinnabarIsland/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 28 "data/maps/CinnabarIsland/scripts.pory"
	goto_if_ge VAR_0x8004, 18, CinnabarIsland_EventScript_MoveSeagallopDown
# 29 "data/maps/CinnabarIsland/scripts.pory"
	setflag FLAG_TEMP_2
# 30 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_BILL, 18, 12
# 31 "data/maps/CinnabarIsland/scripts.pory"
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_UP
# 32 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_SEAGALLOP, 30, 12
# 33 "data/maps/CinnabarIsland/scripts.pory"
	return
# 34 "data/maps/CinnabarIsland/scripts.pory"

# 35 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_MoveSeagallopDown::
# 36 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_SEAGALLOP, 30, 8
# 37 "data/maps/CinnabarIsland/scripts.pory"
	return
# 38 "data/maps/CinnabarIsland/scripts.pory"

# 39 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ReadyObjectsReturnFromSeviiIslands::
# 40 "data/maps/CinnabarIsland/scripts.pory"
	setobjectxyperm LOCALID_BILL, 21, 8
# 41 "data/maps/CinnabarIsland/scripts.pory"
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_UP
# 42 "data/maps/CinnabarIsland/scripts.pory"
	return
# 43 "data/maps/CinnabarIsland/scripts.pory"

# 44 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_CheckUnlockGym::
# 45 "data/maps/CinnabarIsland/scripts.pory"
	goto_if_set FLAG_HIDE_POKEMON_MANSION_B1F_SECRET_KEY, CinnabarIsland_EventScript_UnlockGym
# 46 "data/maps/CinnabarIsland/scripts.pory"
	return
# 47 "data/maps/CinnabarIsland/scripts.pory"

# 48 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_UnlockGym::
# 49 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_TEMP_1, 1
# 50 "data/maps/CinnabarIsland/scripts.pory"
	return
# 51 "data/maps/CinnabarIsland/scripts.pory"

# 52 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_OnFrame::
# 53 "data/maps/CinnabarIsland/scripts.pory"
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1, CinnabarIsland_EventScript_ExitPokeCenterForOneIsland
# 54 "data/maps/CinnabarIsland/scripts.pory"
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND, 1, CinnabarIsland_EventScript_BillScene
# 55 "data/maps/CinnabarIsland/scripts.pory"
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND, 3, CinnabarIsland_EventScript_ReturnFromSeviiIslands
# 56 "data/maps/CinnabarIsland/scripts.pory"
	.2byte 0
# 57 "data/maps/CinnabarIsland/scripts.pory"

# 58 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ExitPokeCenterForOneIsland::
# 59 "data/maps/CinnabarIsland/scripts.pory"
	lockall
# 60 "data/maps/CinnabarIsland/scripts.pory"
	clearflag FLAG_DONT_TRANSITION_MUSIC
# 61 "data/maps/CinnabarIsland/scripts.pory"
	savebgm MUS_DUMMY
# 62 "data/maps/CinnabarIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 63 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_2, 2
# 64 "data/maps/CinnabarIsland/scripts.pory"
	delay 20
# 65 "data/maps/CinnabarIsland/scripts.pory"
	call CinnabarIsland_EventScript_SailToOneIsland
# 66 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 67 "data/maps/CinnabarIsland/scripts.pory"
	end
# 68 "data/maps/CinnabarIsland/scripts.pory"

# 69 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ReturnFromSeviiIslands::
# 70 "data/maps/CinnabarIsland/scripts.pory"
	lockall
# 71 "data/maps/CinnabarIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 72 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_IfYouHaveTriPassYouCanGoAgain
# 73 "data/maps/CinnabarIsland/scripts.pory"
	closemessage
# 74 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillExit
# 75 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 76 "data/maps/CinnabarIsland/scripts.pory"
	removeobject LOCALID_BILL
# 77 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 4
# 78 "data/maps/CinnabarIsland/scripts.pory"
	setflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE
# 79 "data/maps/CinnabarIsland/scripts.pory"
	clearflag FLAG_HIDE_LOSTELLE_IN_HER_HOME
# 80 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 81 "data/maps/CinnabarIsland/scripts.pory"
	end
# 82 "data/maps/CinnabarIsland/scripts.pory"

# 83 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillExit::
# 84 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 85 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 86 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 87 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 88 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 89 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 90 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 91 "data/maps/CinnabarIsland/scripts.pory"

# 92 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillScene::
# 93 "data/maps/CinnabarIsland/scripts.pory"
	lockall
# 94 "data/maps/CinnabarIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 95 "data/maps/CinnabarIsland/scripts.pory"
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillFacePlayer1
# 96 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillFacePlayer2
# 97 "data/maps/CinnabarIsland/scripts.pory"
	playse SE_PIN
# 98 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_ExclamationMark
# 99 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 100 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_Delay48
# 101 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 102 "data/maps/CinnabarIsland/scripts.pory"
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillApproachPlayer1
# 103 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillApproachPlayer2
# 104 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_HeyIfItIsntPlayer
# 105 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_ComeWithMeToOneIsland, MSGBOX_YESNO
# 106 "data/maps/CinnabarIsland/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_EventScript_AgreeSailToOneIsland
# 107 "data/maps/CinnabarIsland/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_EventScript_DeclineSailToOneIsland
# 108 "data/maps/CinnabarIsland/scripts.pory"
	end
# 109 "data/maps/CinnabarIsland/scripts.pory"

# 110 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillFacePlayer1::
# 111 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterUp
# 112 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 113 "data/maps/CinnabarIsland/scripts.pory"
	return
# 114 "data/maps/CinnabarIsland/scripts.pory"

# 115 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillFacePlayer2::
# 116 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterLeft
# 117 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 118 "data/maps/CinnabarIsland/scripts.pory"
	return
# 119 "data/maps/CinnabarIsland/scripts.pory"

# 120 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillApproachPlayer1::
# 121 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachPlayer1
# 122 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 123 "data/maps/CinnabarIsland/scripts.pory"
	return
# 124 "data/maps/CinnabarIsland/scripts.pory"

# 125 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillApproachPlayer2::
# 126 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachPlayer2
# 127 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 128 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 129 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 130 "data/maps/CinnabarIsland/scripts.pory"
	return
# 131 "data/maps/CinnabarIsland/scripts.pory"

# 132 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_AgreeSailToOneIsland::
# 133 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_AllRightLetsGo
# 134 "data/maps/CinnabarIsland/scripts.pory"
	closemessage
# 135 "data/maps/CinnabarIsland/scripts.pory"
	call CinnabarIsland_EventScript_SailToOneIsland
# 136 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 137 "data/maps/CinnabarIsland/scripts.pory"
	end
# 138 "data/maps/CinnabarIsland/scripts.pory"

# 139 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_DeclineSailToOneIsland::
# 140 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_IllBeWaitingInPokeCenter
# 141 "data/maps/CinnabarIsland/scripts.pory"
	closemessage
# 142 "data/maps/CinnabarIsland/scripts.pory"
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillExitToPokeCenter
# 143 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillReturnToPokeCenter
# 144 "data/maps/CinnabarIsland/scripts.pory"
	removeobject LOCALID_BILL
# 145 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 2
# 146 "data/maps/CinnabarIsland/scripts.pory"
	clearflag FLAG_HIDE_CINNABAR_POKECENTER_BILL
# 147 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 148 "data/maps/CinnabarIsland/scripts.pory"
	end
# 149 "data/maps/CinnabarIsland/scripts.pory"

# 150 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillExitToPokeCenter::
# 151 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillExitToPokeCenter
# 152 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 153 "data/maps/CinnabarIsland/scripts.pory"
	return
# 154 "data/maps/CinnabarIsland/scripts.pory"

# 155 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillExitToPokeCenter::
# 156 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 157 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 158 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 159 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 160 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 161 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 162 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 163 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 164 "data/maps/CinnabarIsland/scripts.pory"

# 165 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BillReturnToPokeCenter::
# 166 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerWatchBillExit
# 167 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachDoor
# 168 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 169 "data/maps/CinnabarIsland/scripts.pory"
	opendoor 14, 11
# 170 "data/maps/CinnabarIsland/scripts.pory"
	waitdooranim
# 171 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillReEnterPokeCenter
# 172 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 173 "data/maps/CinnabarIsland/scripts.pory"
	closedoor 14, 11
# 174 "data/maps/CinnabarIsland/scripts.pory"
	waitdooranim
# 175 "data/maps/CinnabarIsland/scripts.pory"
	return
# 176 "data/maps/CinnabarIsland/scripts.pory"

# 177 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_PlayerWatchBillExit::
# 178 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 179 "data/maps/CinnabarIsland/scripts.pory"
	walk_in_place_faster_right
# 180 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 181 "data/maps/CinnabarIsland/scripts.pory"

# 182 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillApproachDoor::
# 183 "data/maps/CinnabarIsland/scripts.pory"
	delay_16
# 184 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 185 "data/maps/CinnabarIsland/scripts.pory"
	walk_in_place_faster_up
# 186 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 187 "data/maps/CinnabarIsland/scripts.pory"

# 188 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillReEnterPokeCenter::
# 189 "data/maps/CinnabarIsland/scripts.pory"
	walk_up
# 190 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 191 "data/maps/CinnabarIsland/scripts.pory"
	set_invisible
# 192 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 193 "data/maps/CinnabarIsland/scripts.pory"

# 194 "data/maps/CinnabarIsland/scripts.pory"
@ Can be triggered outside, or after talking to Bill in the poke center
# 195 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_SailToOneIsland::
# 196 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_ApproachShore
# 197 "data/maps/CinnabarIsland/scripts.pory"
	addobject LOCALID_SEAGALLOP
# 198 "data/maps/CinnabarIsland/scripts.pory"
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BoatArrive
# 199 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BoatArriveExitedPokeCenter
# 200 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_MyPalsBoatArrived
# 201 "data/maps/CinnabarIsland/scripts.pory"
	closemessage
# 202 "data/maps/CinnabarIsland/scripts.pory"
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BoardBoat
# 203 "data/maps/CinnabarIsland/scripts.pory"
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BoardBoatExitedPokeCenter
# 204 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 2
# 205 "data/maps/CinnabarIsland/scripts.pory"
	removeobject LOCALID_BILL
# 206 "data/maps/CinnabarIsland/scripts.pory"
	delay 40
# 207 "data/maps/CinnabarIsland/scripts.pory"
	setflag FLAG_HIDE_CINNABAR_SEAGALLOP
# 208 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1
# 209 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_CINNABAR_ISLAND
# 210 "data/maps/CinnabarIsland/scripts.pory"
	setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
# 211 "data/maps/CinnabarIsland/scripts.pory"
	goto EventScript_SetSail
# 212 "data/maps/CinnabarIsland/scripts.pory"
	end
# 213 "data/maps/CinnabarIsland/scripts.pory"

# 214 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_ApproachShore::
# 215 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_ApproachShore
# 216 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_ApproachShore
# 217 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 218 "data/maps/CinnabarIsland/scripts.pory"
	return
# 219 "data/maps/CinnabarIsland/scripts.pory"

# 220 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BoatArrive::
# 221 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillFaceBoat
# 222 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_SEAGALLOP, CinnabarIsland_Movement_BoatArrive
# 223 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 224 "data/maps/CinnabarIsland/scripts.pory"
	return
# 225 "data/maps/CinnabarIsland/scripts.pory"

# 226 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BoatArriveExitedPokeCenter::
# 227 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_SEAGALLOP, CinnabarIsland_Movement_BoatArrive
# 228 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 229 "data/maps/CinnabarIsland/scripts.pory"
	return
# 230 "data/maps/CinnabarIsland/scripts.pory"

# 231 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BoardBoat::
# 232 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillBoardBoat
# 233 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerBoardBoat
# 234 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 235 "data/maps/CinnabarIsland/scripts.pory"
	return
# 236 "data/maps/CinnabarIsland/scripts.pory"

# 237 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_BoardBoatExitedPokeCenter::
# 238 "data/maps/CinnabarIsland/scripts.pory"
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillBoardBoatFromShore
# 239 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerBoardBoatFromShore
# 240 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 241 "data/maps/CinnabarIsland/scripts.pory"
	return
# 242 "data/maps/CinnabarIsland/scripts.pory"

# 243 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BoatArrive::
# 244 "data/maps/CinnabarIsland/scripts.pory"
	delay_16
# 245 "data/maps/CinnabarIsland/scripts.pory"
	delay_16
# 246 "data/maps/CinnabarIsland/scripts.pory"
	walk_fast_left
# 247 "data/maps/CinnabarIsland/scripts.pory"
	walk_fast_left
# 248 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 249 "data/maps/CinnabarIsland/scripts.pory"
	walk_slower_left
# 250 "data/maps/CinnabarIsland/scripts.pory"
	walk_slower_left
# 251 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 252 "data/maps/CinnabarIsland/scripts.pory"

# 253 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillBoardBoat::
# 254 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 255 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 256 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 257 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 258 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 259 "data/maps/CinnabarIsland/scripts.pory"
	set_invisible
# 260 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 261 "data/maps/CinnabarIsland/scripts.pory"

# 262 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillApproachPlayer1::
# 263 "data/maps/CinnabarIsland/scripts.pory"
	walk_up
# 264 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 265 "data/maps/CinnabarIsland/scripts.pory"

# 266 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillApproachPlayer2::
# 267 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 268 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 269 "data/maps/CinnabarIsland/scripts.pory"
	walk_left
# 270 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 271 "data/maps/CinnabarIsland/scripts.pory"

# 272 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillFaceBoat::
# 273 "data/maps/CinnabarIsland/scripts.pory"
	delay_16
# 274 "data/maps/CinnabarIsland/scripts.pory"
	delay_16
# 275 "data/maps/CinnabarIsland/scripts.pory"
	delay_8
# 276 "data/maps/CinnabarIsland/scripts.pory"
	walk_in_place_faster_right
# 277 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 278 "data/maps/CinnabarIsland/scripts.pory"

# 279 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_ApproachShore::
# 280 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 281 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 282 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 283 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 284 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 285 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 286 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 287 "data/maps/CinnabarIsland/scripts.pory"

# 288 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_BillBoardBoatFromShore::
# 289 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 290 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 291 "data/maps/CinnabarIsland/scripts.pory"
	set_invisible
# 292 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 293 "data/maps/CinnabarIsland/scripts.pory"

# 294 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_PlayerBoardBoat::
# 295 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 296 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 297 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 298 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 299 "data/maps/CinnabarIsland/scripts.pory"
	walk_in_place_faster_right
# 300 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 301 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 302 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 303 "data/maps/CinnabarIsland/scripts.pory"
	set_invisible
# 304 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 305 "data/maps/CinnabarIsland/scripts.pory"

# 306 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_PlayerBoardBoatFromShore::
# 307 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 308 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 309 "data/maps/CinnabarIsland/scripts.pory"
	walk_right
# 310 "data/maps/CinnabarIsland/scripts.pory"
	delay_4
# 311 "data/maps/CinnabarIsland/scripts.pory"
	set_invisible
# 312 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 313 "data/maps/CinnabarIsland/scripts.pory"

# 314 "data/maps/CinnabarIsland/scripts.pory"
@ Triggered when VAR_TEMP_1 is 0
# 315 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_GymDoorLocked::
# 316 "data/maps/CinnabarIsland/scripts.pory"
	lockall
# 317 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 318 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 319 "data/maps/CinnabarIsland/scripts.pory"
	delay 20
# 320 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_DoorIsLocked
# 321 "data/maps/CinnabarIsland/scripts.pory"
	closemessage
# 322 "data/maps/CinnabarIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_ForcePlayerFromDoor
# 323 "data/maps/CinnabarIsland/scripts.pory"
	waitmovement 0
# 324 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 325 "data/maps/CinnabarIsland/scripts.pory"
	end
# 326 "data/maps/CinnabarIsland/scripts.pory"

# 327 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_Movement_ForcePlayerFromDoor::
# 328 "data/maps/CinnabarIsland/scripts.pory"
	walk_down
# 329 "data/maps/CinnabarIsland/scripts.pory"
	step_end
# 330 "data/maps/CinnabarIsland/scripts.pory"

# 331 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_Woman::
# 332 "data/maps/CinnabarIsland/scripts.pory"
	lock
# 333 "data/maps/CinnabarIsland/scripts.pory"
	faceplayer
# 334 "data/maps/CinnabarIsland/scripts.pory"
	famechecker FAMECHECKER_BLAINE, 3
# 335 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_BlaineLivedHereSinceBeforeLab
# 336 "data/maps/CinnabarIsland/scripts.pory"
	release
# 337 "data/maps/CinnabarIsland/scripts.pory"
	end
# 338 "data/maps/CinnabarIsland/scripts.pory"

# 339 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_OldMan::
# 340 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_ScientistsExperimentInMansion, MSGBOX_NPC
# 341 "data/maps/CinnabarIsland/scripts.pory"
	end
# 342 "data/maps/CinnabarIsland/scripts.pory"

# 343 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_IslandSign::
# 344 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_IslandSign, MSGBOX_SIGN
# 345 "data/maps/CinnabarIsland/scripts.pory"
	end
# 346 "data/maps/CinnabarIsland/scripts.pory"

# 347 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_PokemonLabSign::
# 348 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_PokemonLab, MSGBOX_SIGN
# 349 "data/maps/CinnabarIsland/scripts.pory"
	end
# 350 "data/maps/CinnabarIsland/scripts.pory"

# 351 "data/maps/CinnabarIsland/scripts.pory"
CinnabarIsland_EventScript_GymSign::
# 352 "data/maps/CinnabarIsland/scripts.pory"
	lockall
# 353 "data/maps/CinnabarIsland/scripts.pory"
	famechecker FAMECHECKER_BLAINE, 0
# 354 "data/maps/CinnabarIsland/scripts.pory"
	msgbox CinnabarIsland_Text_GymSign
# 355 "data/maps/CinnabarIsland/scripts.pory"
	releaseall
# 356 "data/maps/CinnabarIsland/scripts.pory"
	end
