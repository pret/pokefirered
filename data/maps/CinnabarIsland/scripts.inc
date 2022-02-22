.equ LOCALID_BILL, 3
.equ LOCALID_SEAGALLOP, 4

CinnabarIsland_MapScripts:: @ 8166ED6
	map_script MAP_SCRIPT_ON_TRANSITION, CinnabarIsland_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CinnabarIsland_OnFrame
	.byte 0

CinnabarIsland_OnTransition:: @ 8166EE1
	setworldmapflag FLAG_WORLD_MAP_CINNABAR_ISLAND
	call CinnabarIsland_EventScript_CheckUnlockGym
	compare VAR_MAP_SCENE_CINNABAR_ISLAND, 1
	call_if_eq CinnabarIsland_EventScript_ReadyObjectsSailToOneIsland
	compare VAR_MAP_SCENE_CINNABAR_ISLAND, 3
	call_if_eq CinnabarIsland_EventScript_ReadyObjectsReturnFromSeviiIslands
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1
	call_if_eq CinnabarIsland_EventScript_ReadyObjectsSailToOneIslandFromPokeCenter
	end

CinnabarIsland_EventScript_ReadyObjectsSailToOneIslandFromPokeCenter:: @ 8166F0B
	savebgm MUS_FOLLOW_ME
	setflag FLAG_TEMP_2
	setobjectxyperm LOCALID_BILL, 15, 12
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_LEFT
	setobjectxyperm LOCALID_SEAGALLOP, 30, 12
	return

CinnabarIsland_EventScript_ReadyObjectsSailToOneIsland:: @ 8166F24
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 18
	goto_if_ge CinnabarIsland_EventScript_MoveSeagallopDown
	setflag FLAG_TEMP_2
	setobjectxyperm LOCALID_BILL, 18, 12
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_UP
	setobjectxyperm LOCALID_SEAGALLOP, 30, 12
	return

CinnabarIsland_EventScript_MoveSeagallopDown:: @ 8166F4A
	setobjectxyperm LOCALID_SEAGALLOP, 30, 8
	return

CinnabarIsland_EventScript_ReadyObjectsReturnFromSeviiIslands:: @ 8166F52
	setobjectxyperm LOCALID_BILL, 21, 8
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_UP
	return

CinnabarIsland_EventScript_CheckUnlockGym:: @ 8166F5E
	goto_if_set FLAG_HIDE_POKEMON_MANSION_B1F_SECRET_KEY, CinnabarIsland_EventScript_UnlockGym
	return

CinnabarIsland_EventScript_UnlockGym:: @ 8166F68
	setvar VAR_TEMP_1, 1
	return

CinnabarIsland_OnFrame:: @ 8166F6E
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1, CinnabarIsland_EventScript_ExitPokeCenterForOneIsland
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND, 1, CinnabarIsland_EventScript_BillScene
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND, 3, CinnabarIsland_EventScript_ReturnFromSeviiIslands
	.2byte 0

CinnabarIsland_EventScript_ExitPokeCenterForOneIsland:: @ 8166F88
	lockall
	clearflag FLAG_DONT_TRANSITION_MUSIC
	savebgm MUS_DUMMY
	textcolor 0
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_2, 2
	delay 20
	call CinnabarIsland_EventScript_SailToOneIsland
	releaseall
	end

CinnabarIsland_EventScript_ReturnFromSeviiIslands:: @ 8166FA0
	lockall
	textcolor 0
	msgbox CinnabarIsland_Text_IfYouHaveTriPassYouCanGoAgain
	closemessage
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillExit
	waitmovement 0
	removeobject LOCALID_BILL
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 4
	setflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE
	clearflag FLAG_HIDE_LOSTELLE_IN_HER_HOME
	releaseall
	end

CinnabarIsland_Movement_BillExit:: @ 8166FC6
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

CinnabarIsland_EventScript_BillScene:: @ 8166FCD
	lockall
	textcolor 0
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillFacePlayer1
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillFacePlayer2
	playse SE_PIN
	applymovement LOCALID_BILL, Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_BILL, Movement_Delay48
	waitmovement 0
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillApproachPlayer1
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillApproachPlayer2
	msgbox CinnabarIsland_Text_HeyIfItIsntPlayer
	msgbox CinnabarIsland_Text_ComeWithMeToOneIsland, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_EventScript_AgreeSailToOneIsland
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_EventScript_DeclineSailToOneIsland
	end

CinnabarIsland_EventScript_BillFacePlayer1:: @ 8167032
	applymovement LOCALID_BILL, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

CinnabarIsland_EventScript_BillFacePlayer2:: @ 816703D
	applymovement LOCALID_BILL, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

CinnabarIsland_EventScript_BillApproachPlayer1:: @ 8167048
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachPlayer1
	waitmovement 0
	return

CinnabarIsland_EventScript_BillApproachPlayer2:: @ 8167053
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachPlayer2
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

CinnabarIsland_EventScript_AgreeSailToOneIsland:: @ 8167068
	msgbox CinnabarIsland_Text_AllRightLetsGo
	closemessage
	call CinnabarIsland_EventScript_SailToOneIsland
	releaseall
	end

CinnabarIsland_EventScript_DeclineSailToOneIsland:: @ 8167078
	msgbox CinnabarIsland_Text_IllBeWaitingInPokeCenter
	closemessage
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BillExitToPokeCenter
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BillReturnToPokeCenter
	removeobject LOCALID_BILL
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 2
	clearflag FLAG_HIDE_CINNABAR_POKECENTER_BILL
	releaseall
	end

CinnabarIsland_EventScript_BillExitToPokeCenter:: @ 81670A0
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillExitToPokeCenter
	waitmovement 0
	return

CinnabarIsland_Movement_BillExitToPokeCenter:: @ 81670AB
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

CinnabarIsland_EventScript_BillReturnToPokeCenter:: @ 81670B3
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerWatchBillExit
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillApproachDoor
	waitmovement 0
	opendoor 14, 11
	waitdooranim
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillReEnterPokeCenter
	waitmovement 0
	closedoor 14, 11
	waitdooranim
	return

CinnabarIsland_Movement_PlayerWatchBillExit:: @ 81670DB
	walk_left
	walk_in_place_fastest_right
	step_end

CinnabarIsland_Movement_BillApproachDoor:: @ 81670DE
	delay_16
	walk_left
	walk_in_place_fastest_up
	step_end

CinnabarIsland_Movement_BillReEnterPokeCenter:: @ 81670E2
	walk_up
	delay_4
	set_invisible
	step_end

@ Can be triggered outside, or after talking to Bill in the poke center
CinnabarIsland_EventScript_SailToOneIsland:: @ 81670E6
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_ApproachShore
	addobject LOCALID_SEAGALLOP
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BoatArrive
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BoatArriveExitedPokeCenter
	msgbox CinnabarIsland_Text_MyPalsBoatArrived
	closemessage
	call_if_unset FLAG_TEMP_2, CinnabarIsland_EventScript_BoardBoat
	call_if_set FLAG_TEMP_2, CinnabarIsland_EventScript_BoardBoatExitedPokeCenter
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 2
	removeobject LOCALID_BILL
	delay 40
	setflag FLAG_HIDE_CINNABAR_SEAGALLOP
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1
	setvar VAR_0x8004, SEAGALLOP_CINNABAR_ISLAND
	setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
	goto EventScript_SetSail
	end

CinnabarIsland_EventScript_ApproachShore:: @ 8167142
	applymovement LOCALID_BILL, CinnabarIsland_Movement_ApproachShore
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_ApproachShore
	waitmovement 0
	return

CinnabarIsland_EventScript_BoatArrive:: @ 8167154
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillFaceBoat
	applymovement LOCALID_SEAGALLOP, CinnabarIsland_Movement_BoatArrive
	waitmovement 0
	return

CinnabarIsland_EventScript_BoatArriveExitedPokeCenter:: @ 8167166
	applymovement LOCALID_SEAGALLOP, CinnabarIsland_Movement_BoatArrive
	waitmovement 0
	return

CinnabarIsland_EventScript_BoardBoat:: @ 8167171
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillBoardBoat
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerBoardBoat
	waitmovement 0
	return

CinnabarIsland_EventScript_BoardBoatExitedPokeCenter:: @ 8167183
	applymovement LOCALID_BILL, CinnabarIsland_Movement_BillBoardBoatFromShore
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_PlayerBoardBoatFromShore
	waitmovement 0
	return

CinnabarIsland_Movement_BoatArrive:: @ 8167195
	delay_16
	delay_16
	walk_fast_left
	walk_fast_left
	walk_left
	walk_slower_left
	walk_slower_left
	step_end

CinnabarIsland_Movement_BillBoardBoat:: @ 816719D
	walk_right
	walk_down
	walk_down
	walk_right
	delay_4
	set_invisible
	step_end

CinnabarIsland_Movement_BillApproachPlayer1:: @ 81671A4
	walk_up
	step_end

CinnabarIsland_Movement_BillApproachPlayer2:: @ 81671A6
	walk_left
	walk_left
	walk_left
	step_end

CinnabarIsland_Movement_BillFaceBoat:: @ 81671AA
	delay_16
	delay_16
	delay_8
	walk_in_place_fastest_right
	step_end

CinnabarIsland_Movement_ApproachShore:: @ 81671AF
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

CinnabarIsland_Movement_BillBoardBoatFromShore:: @ 81671B6
	walk_right
	delay_4
	set_invisible
	step_end

CinnabarIsland_Movement_PlayerBoardBoat:: @ 81671BA
	walk_down
	walk_right
	walk_down
	walk_down
	walk_in_place_fastest_right
	delay_4
	walk_right
	delay_4
	set_invisible
	step_end

CinnabarIsland_Movement_PlayerBoardBoatFromShore:: @ 81671C4
	walk_right
	delay_4
	walk_right
	delay_4
	set_invisible
	step_end

@ Triggered when VAR_TEMP_1 is 0
CinnabarIsland_EventScript_GymDoorLocked:: @ 81671CA
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	msgbox CinnabarIsland_Text_DoorIsLocked
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Movement_ForcePlayerFromDoor
	waitmovement 0
	releaseall
	end

CinnabarIsland_Movement_ForcePlayerFromDoor:: @ 81671ED
	walk_down
	step_end

CinnabarIsland_EventScript_Woman:: @ 81671EF
	lock
	faceplayer
	famechecker FAMECHECKER_BLAINE, 3
	msgbox CinnabarIsland_Text_BlaineLivedHereSinceBeforeLab
	release
	end

CinnabarIsland_EventScript_OldMan:: @ 8167208
	msgbox CinnabarIsland_Text_ScientistsExperimentInMansion, MSGBOX_NPC
	end

CinnabarIsland_EventScript_IslandSign:: @ 8167211
	msgbox CinnabarIsland_Text_IslandSign, MSGBOX_SIGN
	end

CinnabarIsland_EventScript_PokemonLabSign:: @ 816721A
	msgbox CinnabarIsland_Text_PokemonLab, MSGBOX_SIGN
	end

CinnabarIsland_EventScript_GymSign:: @ 8167223
	lockall
	famechecker FAMECHECKER_BLAINE, 0
	msgbox CinnabarIsland_Text_GymSign
	releaseall
	end
