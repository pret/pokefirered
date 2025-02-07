# 1 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 2 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_PROF_OAK,        4
# 3 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_BULBASAUR_BALL,  5
# 4 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_SQUIRTLE_BALL,   6
# 5 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_CHARMANDER_BALL, 7
# 6 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_RIVAL,           8
# 7 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_POKEDEX_1,       9
# 8 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ LOCALID_POKEDEX_2,       10
# 9 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 10 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ PLAYER_STARTER_NUM,      VAR_TEMP_1
# 11 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ PLAYER_STARTER_SPECIES,  VAR_TEMP_2
# 12 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ RIVAL_STARTER_SPECIES,   VAR_TEMP_3
# 13 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ RIVAL_STARTER_ID,        VAR_TEMP_4
# 14 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 15 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
.equ SHOWED_OAK_COMPLETE_DEX, FLAG_TEMP_2
# 16 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 17 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_MapScripts::
# 18 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_ProfessorOaksLab_OnTransition
# 19 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PalletTown_ProfessorOaksLab_OnWarp
# 20 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PalletTown_ProfessorOaksLab_OnFrame
# 21 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	.byte 0
# 22 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 23 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_OnTransition::
# 24 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_VISITED_OAKS_LAB
# 25 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, PalletTown_ProfessorOaksLab_EventScript_ReadyOakForStarterScene
# 26 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 7, PalletTown_ProfessorOaksLab_EventScript_ReadyOakForNationalDexScene
# 27 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8, PalletTown_ProfessorOaksLab_EventScript_SetNationalDexSceneFinished
# 28 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_set FLAG_GOT_POKEBALLS_FROM_OAK_AFTER_22_RIVAL, PalletTown_ProfessorOaksLab_EventScript_SetSkipPokeBallCheck
# 29 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 30 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 31 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_SetSkipPokeBallCheck::
# 32 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_OAK_SKIP_22_RIVAL_CHECK
# 33 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 34 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 35 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_SetNationalDexSceneFinished::
# 36 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 9
# 37 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 38 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 39 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ReadyOakForStarterScene::
# 40 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_PROF_OAK, 6, 11
# 41 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectmovementtype LOCALID_PROF_OAK, MOVEMENT_TYPE_FACE_UP
# 42 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	savebgm MUS_OAK
# 43 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 44 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 45 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ReadyOakForNationalDexScene::
# 46 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_PROF_OAK, 6, 11
# 47 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectmovementtype LOCALID_PROF_OAK, MOVEMENT_TYPE_FACE_UP
# 48 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 49 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 50 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_OnWarp::
# 51 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, PalletTown_ProfessorOaksLab_EventScript_ReadyPlayerForStarterScene
# 52 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	.2byte 0
# 53 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 54 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ReadyPlayerForStarterScene::
# 55 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 56 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 57 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 58 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_OnFrame::
# 59 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, PalletTown_ProfessorOaksLab_ChooseStarterScene
# 60 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 7, PalletTown_ProfessorOaksLab_EventScript_EnterForNationalDexScene
# 61 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	.2byte 0
# 62 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 63 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_EnterForNationalDexScene:: @ 8169002 
# 64 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 65 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_FACING, DIR_NORTH
# 66 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 67 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakEnter
# 68 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 69 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_PROF_OAK
# 70 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_PROF_OAK, 6, 3
# 71 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectmovementtype LOCALID_PROF_OAK, MOVEMENT_TYPE_FACE_DOWN
# 72 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	clearflag FLAG_HIDE_OAK_IN_HIS_LAB
# 73 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerEnter
# 74 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 75 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_NationalDexScene
# 76 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 77 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 78 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_NationalDexScene::
# 79 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakSightingsOfRareMons
# 80 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 81 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterNorth
# 82 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterSouth
# 83 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterEastWest
# 84 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterEastWest
# 85 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalJustLetMeHandleEverything
# 86 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 87 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakNeedYourHelpTooNeedToSeePokedexes
# 88 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_PlayerFaceOakNorth
# 89 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_PlayerFaceOakWest
# 90 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 91 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakTookBothPokedexUnits
# 92 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 93 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_RestorePrevTextColor
# 94 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskNorth
# 95 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskSouth
# 96 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskEast
# 97 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskWest
# 98 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_POKEDEX_1
# 99 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_POKEDEX_2
# 100 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 30
# 101 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakNowTheseUnitsCanRecordMoreData
# 102 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 103 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_POKEDEX_1
# 104 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_POKEDEX_2
# 105 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 30
# 106 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverNorth
# 107 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverSouth
# 108 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverEast
# 109 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverWest
# 110 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 111 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 112 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PalletTown_ProfessorOaksLab_Text_PlayersPokedexWasUpgraded
# 113 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 114 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitfanfare
# 115 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_RestorePrevTextColor
# 116 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	special EnableNationalPokedex
# 117 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakMustReallyWorkToFillPokedex
# 118 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalIllCompleteThePokedex
# 119 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 120 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 121 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_RivalExitNorth
# 122 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 123 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 124 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 125 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_RIVAL
# 126 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 127 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8
# 128 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 129 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 130 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 131 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterNorth::
# 132 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 5, 10
# 133 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 134 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 135 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterNorth
# 136 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 137 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 138 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 139 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 140 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterEastWest::
# 141 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 6, 10
# 142 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 143 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 144 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 145 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterEastWest
# 146 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 147 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 148 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 149 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 150 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_NationalDexSceneRivalEnterSouth::
# 151 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 6, 10
# 152 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 153 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 154 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 155 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 156 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 157 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 158 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 159 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_PlayerFaceOakNorth::
# 160 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 161 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 162 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 163 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 164 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_PlayerFaceOakWest::
# 165 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 166 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 167 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 168 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 169 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskNorth::
# 170 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDesk
# 171 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 172 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 173 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 174 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskSouth::
# 175 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDeskSouth
# 176 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDesk
# 177 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDesk
# 178 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_PROF_OAK
# 179 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 180 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 181 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskEast::
# 182 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDesk
# 183 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDeskEast
# 184 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_PROF_OAK
# 185 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 186 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 187 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesToDeskWest::
# 188 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDesk
# 189 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 190 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 191 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 192 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDesk::
# 193 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 194 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 195 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 196 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 197 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_4
# 198 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 199 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 200 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakBringDexesToDeskSouth::
# 201 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 202 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 203 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 204 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 205 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_4
# 206 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 207 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 208 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_ChooseStarterScene::
# 209 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 210 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 211 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakEnter
# 212 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 213 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_PROF_OAK
# 214 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_PROF_OAK, 6, 3
# 215 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectmovementtype LOCALID_PROF_OAK, MOVEMENT_TYPE_FACE_DOWN
# 216 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	clearflag FLAG_HIDE_OAK_IN_HIS_LAB
# 217 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerEnter
# 218 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 219 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterUp
# 220 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 221 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	clearflag FLAG_DONT_TRANSITION_MUSIC
# 222 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	savebgm MUS_DUMMY
# 223 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 224 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalFedUpWithWaiting
# 225 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 226 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 60
# 227 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakThreeMonsChooseOne
# 228 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 229 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 30
# 230 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalReact
# 231 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 232 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalNoFairWhatAboutMe
# 233 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakBePatientRival
# 234 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
# 235 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 236 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 237 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 238 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakEnter::
# 239 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 240 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 241 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 242 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 243 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 244 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 245 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 246 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 247 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_PlayerEnter::
# 248 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 249 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 250 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 251 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 252 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 253 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 254 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 255 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 256 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 257 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 258 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalReact::
# 259 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 260 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 261 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 262 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 263 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_LeaveStarterSceneTrigger::
# 264 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 265 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 266 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FaceDown
# 267 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 268 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakHeyDontGoAwayYet
# 269 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 270 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerWalkUp
# 271 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 272 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 273 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 274 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 275 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_PlayerWalkUp::
# 276 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 277 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 278 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 279 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleTriggerLeft::
# 280 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 281 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_TEMP_2, 1
# 282 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattle
# 283 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 284 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 285 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleTriggerMid::
# 286 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 287 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_TEMP_2, 2
# 288 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattle
# 289 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 290 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 291 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleTriggerRight::
# 292 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 293 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_TEMP_2, 3
# 294 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattle
# 295 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 296 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 297 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattle::
# 298 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 299 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 300 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterDown
# 301 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 302 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 303 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 304 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalLetsCheckOutMons
# 305 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 306 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FaceDown
# 307 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 308 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_STARTER_MON, 0, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmander
# 309 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_STARTER_MON, 1, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaur
# 310 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_STARTER_MON, 2, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtle
# 311 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 312 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 313 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
@ The scripts for the rival approaching the player for battle are a bit bloated because
# 314 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
@ both the player and rival can be in 3 different positions, so theres 9 different approaches
# 315 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
@ NOTE: Names below refer to the Rival's mon (e.g. for RivalBattleSquirtle, player has Charmander)
# 316 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 317 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtle::
# 318 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 1, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleLeft
# 319 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 2, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleMid
# 320 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 3, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleRight
# 321 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 322 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 323 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleLeft::
# 324 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleLeft
# 325 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 326 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleSquirtle
# 327 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 328 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 329 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleMid::
# 330 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleMid
# 331 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 332 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleSquirtle
# 333 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 334 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 335 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleSquirtleRight::
# 336 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleRight
# 337 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 338 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleSquirtle
# 339 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 340 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 341 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleSquirtle::
# 342 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_OAKS_LAB_SQUIRTLE, RIVAL_BATTLE_TUTORIAL, PalletTown_ProfessorOaksLab_Text_RivalDefeat, Text_RivalVictory
# 343 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_EndRivalBattle
# 344 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 345 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 346 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleLeft::
# 347 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 348 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 349 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 350 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 351 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 352 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 353 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 354 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 355 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleMid::
# 356 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 357 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 358 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 359 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 360 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 361 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 362 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 363 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleSquirtleRight::
# 364 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 365 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 366 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 367 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 368 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 369 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 370 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmander::
# 371 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 1, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderLeft
# 372 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 2, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderMid
# 373 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 3, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderRight
# 374 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 375 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 376 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderLeft::
# 377 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderLeft
# 378 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 379 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleCharmander
# 380 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 381 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 382 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderMid::
# 383 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderMid
# 384 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 385 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleCharmander
# 386 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 387 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 388 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleCharmanderRight::
# 389 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderRight
# 390 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 391 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleCharmander
# 392 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 393 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 394 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleCharmander::
# 395 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_OAKS_LAB_CHARMANDER, RIVAL_BATTLE_TUTORIAL, PalletTown_ProfessorOaksLab_Text_RivalDefeat, Text_RivalVictory
# 396 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_EndRivalBattle
# 397 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 398 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 399 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderLeft::
# 400 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 401 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 402 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 403 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 404 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 405 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 406 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 407 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 408 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 409 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderMid::
# 410 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 411 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 412 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 413 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 414 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 415 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 416 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 417 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 418 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_ApproachForBattleCharmanderRight::
# 419 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 420 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 421 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 422 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 423 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 424 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 425 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 426 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaur::
# 427 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 1, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurLeft
# 428 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 2, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurMid
# 429 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_TEMP_2, 3, PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurRight
# 430 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 431 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 432 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurLeft::
# 433 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurLeft
# 434 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 435 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleBulbasaur
# 436 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 437 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 438 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurMid::
# 439 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurMid
# 440 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 441 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleBulbasaur
# 442 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 443 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 444 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalApproachForBattleBulbasaurRight::
# 445 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurRight
# 446 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 447 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalBattleBulbasaur
# 448 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 449 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 450 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalBattleBulbasaur::
# 451 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	trainerbattle_earlyrival TRAINER_RIVAL_OAKS_LAB_BULBASAUR, RIVAL_BATTLE_TUTORIAL, PalletTown_ProfessorOaksLab_Text_RivalDefeat, Text_RivalVictory
# 452 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_EndRivalBattle
# 453 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 454 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 455 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurLeft::
# 456 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 457 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 458 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 459 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 460 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 461 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 462 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 463 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurMid::
# 464 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 465 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 466 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 467 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 468 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 469 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 470 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalApproachForBattleBulbasaurRight::
# 471 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 472 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 473 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 474 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 475 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 476 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_EndRivalBattle::
# 477 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	special HealPlayerParty
# 478 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalGoToughenMyMon
# 479 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 480 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 481 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_TEMP_2, 1, PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleLeft
# 482 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_TEMP_2, 2, PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleMid
# 483 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_TEMP_2, 3, PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleRight
# 484 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_RIVAL
# 485 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playse SE_EXIT
# 486 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 487 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 4
# 488 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_BEAT_RIVAL_IN_OAKS_LAB
# 489 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 490 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 491 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 492 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleLeft::
# 493 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleLeft
# 494 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerWatchRivalExitAfterBattle
# 495 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_RIVAL
# 496 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 497 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 498 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleMid::
# 499 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleMid
# 500 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerWatchRivalExitAfterBattle
# 501 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_RIVAL
# 502 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 503 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 504 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalExitAfterBattleRight::
# 505 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleRight
# 506 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerWatchRivalExitAfterBattleRight
# 507 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_RIVAL
# 508 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 509 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 510 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleLeft::
# 511 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 512 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 513 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 514 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 515 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 516 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 517 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 518 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 519 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 520 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleRight::
# 521 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 522 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 523 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 524 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 525 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 526 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 527 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 528 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 529 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 530 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalExitAfterBattleMid::
# 531 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 532 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 533 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 534 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 535 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 536 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 537 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 538 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 539 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 540 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 541 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_PlayerWatchRivalExitAfterBattle::
# 542 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 543 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 544 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_right
# 545 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 546 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 547 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 548 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 549 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_PlayerWatchRivalExitAfterBattleRight::
# 550 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 551 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 552 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_left
# 553 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 554 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 555 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 556 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 557 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Rival::
# 558 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 559 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 560 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3, PalletTown_ProfessorOaksLab_EventScript_RivalChoseStarter
# 561 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2, PalletTown_ProfessorOaksLab_EventScript_RivalWaitingForStarter
# 562 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalGrampsIsntAround
# 563 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 564 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 565 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 566 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalWaitingForStarter::
# 567 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalGoChoosePlayer
# 568 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 569 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 570 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 571 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalChoseStarter::
# 572 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalMyMonLooksTougher
# 573 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 574 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 575 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 576 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ProfOak::
# 577 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 578 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 579 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set SHOWED_OAK_COMPLETE_DEX, PalletTown_ProfessorOaksLab_EventScript_OakJustShownCompleteDex
# 580 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 9, PalletTown_ProfessorOaksLab_EventScript_RatePokedex
# 581 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8, PalletTown_ProfessorOaksLab_EventScript_MonsAroundWorldWait
# 582 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, PalletTown_ProfessorOaksLab_EventScript_TryStartNationalDexScene
# 583 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CERULEAN_CITY_RIVAL, 1, PalletTown_ProfessorOaksLab_EventScript_RatePokedex
# 584 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6, PalletTown_ProfessorOaksLab_EventScript_RatePokedexOrTryGiveBalls
# 585 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1, PalletTown_ProfessorOaksLab_EventScript_ReceiveDexScene
# 586 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 4, PalletTown_ProfessorOaksLab_EventScript_OakBattleMonForItToGrow
# 587 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3, PalletTown_ProfessorOaksLab_EventScript_OakCanReachNextTownWithMon
# 588 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakWhichOneWillYouChoose
# 589 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 590 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 591 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 592 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakJustShownCompleteDex::
# 593 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PokedexRating_Text_ThankYouMadeDreamReality
# 594 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 595 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 596 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 597 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakCanReachNextTownWithMon::
# 598 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakCanReachNextTownWithMon
# 599 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 600 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 601 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 602 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBattleMonForItToGrow::
# 603 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakBattleMonForItToGrow
# 604 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 605 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 606 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 607 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ReceiveDexScene::
# 608 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakHaveSomethingForMe
# 609 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 610 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playfanfare MUS_OBTAIN_TMHM
# 611 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PalletTown_ProfessorOaksLab_Text_DeliveredOaksParcel
# 612 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 613 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitfanfare
# 614 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_RestorePrevTextColor
# 615 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeitem ITEM_OAKS_PARCEL
# 616 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakCustomBallIOrdered
# 617 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 618 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalGramps
# 619 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 620 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterNorth
# 621 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterSouth
# 622 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterEastWest
# 623 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterEastWest
# 624 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 625 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalWhatDidYouCallMeFor
# 626 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 627 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 30
# 628 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playse SE_PIN
# 629 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_ExclamationMark
# 630 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 631 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_Delay48
# 632 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 633 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalSouth
# 634 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalEast
# 635 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalWest
# 636 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalNorth
# 637 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakHaveRequestForYouTwo
# 638 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 639 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskNorth
# 640 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskSouth
# 641 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskEast
# 642 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskWest
# 643 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakPokedexOnDesk
# 644 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 645 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 40
# 646 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakTakeTheseWithYou
# 647 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 648 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterUp
# 649 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 650 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_POKEDEX_1
# 651 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 10
# 652 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_POKEDEX_2
# 653 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 25
# 654 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverNorth
# 655 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverSouth
# 656 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverEast
# 657 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverWest
# 658 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 10
# 659 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 660 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 661 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PalletTown_ProfessorOaksLab_Text_ReceivedPokedexFromOak
# 662 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 663 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitfanfare
# 664 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_RestorePrevTextColor
# 665 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_SYS_POKEDEX_GET
# 666 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	special SetUnlockedPokedexFlags
# 667 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 1
# 668 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakCatchMonsForDataTakeThese
# 669 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	giveitem_msg PalletTown_ProfessorOaksLab_Text_ReceivedFivePokeBalls, ITEM_POKE_BALL, 5
# 670 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakExplainCatching
# 671 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	famechecker FAMECHECKER_OAK, 1
# 672 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakCompleteMonGuideWasMyDream
# 673 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalLeaveItToMeGramps
# 674 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerNorth
# 675 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerSouth
# 676 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerEastWest
# 677 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerEastWest
# 678 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalTellSisNotToGiveYouMap
# 679 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 680 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 681 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_RivalExitNorth
# 682 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 683 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 684 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_RivalExit
# 685 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject LOCALID_RIVAL
# 686 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	fadedefaultbgm
# 687 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
# 688 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 2
# 689 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
# 690 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 1
# 691 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE22, 1
# 692 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 693 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 694 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 695 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverNorth::
# 696 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesOver
# 697 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 698 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 699 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 700 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverSouth::
# 701 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesOverSouth
# 702 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 703 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 704 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 705 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverEast::
# 706 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesOver
# 707 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_PlayerFaceOakForDexEast
# 708 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 709 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 710 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 711 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakBringDexesOverWest::
# 712 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakBringDexesOver
# 713 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 714 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 715 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 716 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_PlayerFaceOakForDexEast::
# 717 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 718 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 719 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_right
# 720 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 721 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 722 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakBringDexesOver::
# 723 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 724 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 725 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 726 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 727 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakBringDexesOverSouth::
# 728 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 729 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 730 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 731 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 732 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskNorth::
# 733 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakWalkToDesk
# 734 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 735 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 736 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 737 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskSouth::
# 738 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakWalkToDeskSouth
# 739 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDesk
# 740 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDesk
# 741 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_PROF_OAK
# 742 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 743 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 744 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskEast::
# 745 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakWalkToDesk
# 746 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDeskEast
# 747 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement LOCALID_PROF_OAK
# 748 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 749 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 750 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakWalkToDeskWest::
# 751 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakWalkToDesk
# 752 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 753 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 754 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 755 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDeskEast::
# 756 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 757 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 758 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 759 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 760 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 761 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_WatchOakWalkToDesk::
# 762 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 763 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 764 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_left
# 765 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 766 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 767 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakWalkToDesk::
# 768 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 769 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 770 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 771 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 772 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 773 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 774 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakWalkToDeskSouth::
# 775 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 776 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 777 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 778 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 779 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_right
# 780 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 781 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 782 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RatePokedexOrTryGiveBalls::
# 783 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_0x8004, 0
# 784 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	specialvar VAR_RESULT, GetPokedexCount
# 785 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	copyvar VAR_0x8008, VAR_0x8005
# 786 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	copyvar VAR_0x8009, VAR_0x8006
# 787 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	buffernumberstring STR_VAR_1, VAR_0x8008
# 788 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	buffernumberstring STR_VAR_2, VAR_0x8009
# 789 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_0x8009, 1, PalletTown_ProfessorOaksLab_EventScript_CheckIfPlayerNeedsBalls  @ Player only has starter
# 790 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RatePokedex
# 791 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 792 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 793 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RatePokedex::
# 794 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call PokedexRating_EventScript_RateInPerson
# 795 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_OAK_SAW_DEX_COMPLETION, PalletTown_ProfessorOaksLab_EventScript_DexCompleted
# 796 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 797 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 798 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 799 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexCompleted::
# 800 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 801 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 40
# 802 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PokedexRating_Text_Wroooaaarrr
# 803 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 804 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, PalletTown_ProfessorOaksLab_EventScript_OakExcitedNorth
# 805 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, PalletTown_ProfessorOaksLab_EventScript_OakExcitedSouth
# 806 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_ProfessorOaksLab_EventScript_OakExcitedEast
# 807 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, PalletTown_ProfessorOaksLab_EventScript_OakExcitedWest
# 808 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FacePlayer
# 809 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 810 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 811 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 70
# 812 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PokedexRating_Text_ThankYouMadeDreamReality
# 813 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag SHOWED_OAK_COMPLETE_DEX
# 814 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 815 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 816 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 817 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakExcitedNorth::
# 818 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakExcitedNorth
# 819 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 820 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 821 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 822 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakExcitedSouth::
# 823 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakExcitedSouth
# 824 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 825 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 826 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 827 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakExcitedEast::
# 828 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakExcitedEast
# 829 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 830 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 831 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 832 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_OakExcitedWest::
# 833 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, PalletTown_ProfessorOaksLab_Movement_OakExcitedWest
# 834 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 835 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 836 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 837 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakExcitedNorth::
# 838 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_down
# 839 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_down
# 840 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_down
# 841 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_down
# 842 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_down
# 843 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_down
# 844 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 845 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 846 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakExcitedSouth::
# 847 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 848 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_up
# 849 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 850 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 851 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_up
# 852 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_up
# 853 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 854 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 855 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakExcitedEast::
# 856 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_left
# 857 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_left
# 858 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_left
# 859 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_left
# 860 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_left
# 861 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_left
# 862 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 863 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 864 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_OakExcitedWest::
# 865 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_right
# 866 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_right
# 867 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_right
# 868 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_right
# 869 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_fast_right
# 870 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_right
# 871 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 872 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 873 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
@ Unused
# 874 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_Search:
# 875 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 876 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 877 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 878 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_right
# 879 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 880 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 881 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 882 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_left
# 883 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 884 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 885 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 886 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 887 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 888 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 889 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 890 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_left
# 891 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 892 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 893 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 894 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_right
# 895 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 896 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 897 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 898 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_left
# 899 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 900 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 901 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
@ Unused
# 902 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_VerticalPacing:
# 903 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 904 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 905 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 906 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_down
# 907 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 908 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 909 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 910 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 911 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 912 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 913 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_TryStartNationalDexScene::
# 914 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call PokedexRating_EventScript_RateInPerson
# 915 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 916 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_lt VAR_0x8009, 60, PalletTown_ProfessorOaksLab_EventScript_DontStartNationalDexScene
# 917 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_unset FLAG_WORLD_MAP_ONE_ISLAND, PalletTown_ProfessorOaksLab_EventScript_DontStartNationalDexScene
# 918 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 30
# 919 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakFavorToAskYouPlayer
# 920 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_NationalDexScene
# 921 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 922 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 923 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DontStartNationalDexScene::
# 924 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 925 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 926 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 927 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_CheckIfPlayerNeedsBalls::
# 928 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 929 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	special QuestLog_CutRecording
# 930 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_OAK_SKIP_22_RIVAL_CHECK, PalletTown_ProfessorOaksLab_EventScript_MonsAroundWorldWait
# 931 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_GOT_POKEBALLS_FROM_OAK_AFTER_22_RIVAL, PalletTown_ProfessorOaksLab_EventScript_PlayerAlreadyGotBalls
# 932 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	checkitem ITEM_POKE_BALL
# 933 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PalletTown_ProfessorOaksLab_EventScript_PlayerOutOfBalls
# 934 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_MonsAroundWorldWait
# 935 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 936 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 937 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_PlayerOutOfBalls::
# 938 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_ROUTE22, 2, PalletTown_ProfessorOaksLab_EventScript_GivePlayerMoreBalls
# 939 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_MonsAroundWorldWait
# 940 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 941 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 942 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_GivePlayerMoreBalls::
# 943 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakAddedNothingToPokedex
# 944 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	giveitem_msg PalletTown_ProfessorOaksLab_Text_ReceivedFivePokeBalls, ITEM_POKE_BALL, 5
# 945 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_GOT_POKEBALLS_FROM_OAK_AFTER_22_RIVAL
# 946 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 947 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 948 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 949 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_MonsAroundWorldWait::
# 950 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakMonsAroundWorldWait
# 951 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 952 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 953 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 954 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_PlayerAlreadyGotBalls::
# 955 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakComeSeeMeSometime
# 956 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 957 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 958 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 959 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterNorth::
# 960 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 5, 10
# 961 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 962 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterNorth
# 963 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 964 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 965 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 966 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 967 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterEastWest::
# 968 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 6, 10
# 969 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 970 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 971 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterEastWest
# 972 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 973 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 974 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 975 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 976 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalEnterSouth::
# 977 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setobjectxyperm LOCALID_RIVAL, 6, 10
# 978 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	addobject LOCALID_RIVAL
# 979 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 980 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalEnter
# 981 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 982 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 983 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 984 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalSouth::
# 985 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FacePlayer
# 986 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 987 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 15
# 988 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 989 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 990 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 991 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 992 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalWest::
# 993 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FacePlayer
# 994 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 995 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 15
# 996 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 997 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 998 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 999 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1000 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1001 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalEast::
# 1002 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FacePlayer
# 1003 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1004 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay 15
# 1005 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 1006 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterDown
# 1007 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1008 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1009 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1010 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerNorth::
# 1011 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_FacePlayer
# 1012 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 1013 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1014 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1015 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1016 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerSouth::
# 1017 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterUp
# 1018 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 1019 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1020 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1021 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1022 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneRivalFacePlayerEastWest::
# 1023 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_FacePlayer
# 1024 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 1025 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1026 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1027 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1028 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalExitNorth::
# 1029 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterEastWest
# 1030 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalExit
# 1031 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1032 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1033 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1034 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalExit::
# 1035 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalExit
# 1036 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1037 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1038 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1039 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DexSceneOakFacePlayerAndRivalNorth::
# 1040 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 1041 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1042 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1043 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1044 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterEastWest::
# 1045 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_4
# 1046 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 1047 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1048 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1049 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_WatchRivalEnterNorth::
# 1050 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_down
# 1051 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 1052 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 1053 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 1054 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 1055 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_16
# 1056 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	delay_8
# 1057 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_left
# 1058 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1059 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1060 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalEnter::
# 1061 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1062 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1063 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1064 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1065 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1066 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1067 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1068 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1069 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalExit::
# 1070 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1071 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1072 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1073 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1074 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1075 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1076 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1077 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1078 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_BulbasaurBall::
# 1079 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1080 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1081 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_NUM, 0
# 1082 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_SPECIES, SPECIES_CHIKORITA
# 1083 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_SPECIES, SPECIES_FLAMEBEAR
# 1084 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_ID, LOCALID_CHARMANDER_BALL
# 1085 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3, PalletTown_ProfessorOaksLab_EventScript_LastPokeBall
# 1086 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2, PalletTown_ProfessorOaksLab_EventScript_ConfirmStarterChoice
# 1087 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_ThoseArePokeBalls
# 1088 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1089 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1090 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1091 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ConfirmStarterChoice::
# 1092 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_FaceRight
# 1093 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1094 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	showmonpic PLAYER_STARTER_SPECIES, 10, 3
# 1095 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 1096 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 0, PalletTown_ProfessorOaksLab_EventScript_ConfirmBulbasaur
# 1097 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 1, PalletTown_ProfessorOaksLab_EventScript_ConfirmSquirtle
# 1098 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 2, PalletTown_ProfessorOaksLab_EventScript_ConfirmCharmander
# 1099 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1100 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1101 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ConfirmBulbasaur::
# 1102 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakChoosingBulbasaur, MSGBOX_YESNO
# 1103 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PalletTown_ProfessorOaksLab_EventScript_ChoseStarter
# 1104 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PalletTown_ProfessorOaksLab_EventScript_DeclinedStarter
# 1105 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1106 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1107 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ConfirmSquirtle::
# 1108 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakChoosingSquirtle, MSGBOX_YESNO
# 1109 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PalletTown_ProfessorOaksLab_EventScript_ChoseStarter
# 1110 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PalletTown_ProfessorOaksLab_EventScript_DeclinedStarter
# 1111 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1112 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1113 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ConfirmCharmander::
# 1114 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakChoosingCharmander, MSGBOX_YESNO
# 1115 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PalletTown_ProfessorOaksLab_EventScript_ChoseStarter
# 1116 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PalletTown_ProfessorOaksLab_EventScript_DeclinedStarter
# 1117 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1118 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1119 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_DeclinedStarter::
# 1120 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	hidemonpic
# 1121 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1122 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1123 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1124 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ChoseStarter::
# 1125 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	hidemonpic
# 1126 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject VAR_LAST_TALKED
# 1127 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakThisMonIsEnergetic
# 1128 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_RestorePrevTextColor
# 1129 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_SYS_POKEMON_GET
# 1130 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setflag FLAG_PALLET_LADY_NOT_BLOCKING_SIGN
# 1131 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	givemon PLAYER_STARTER_SPECIES, 5
# 1132 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	copyvar VAR_STARTER_MON, PLAYER_STARTER_NUM
# 1133 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	bufferspeciesname STR_VAR_1, PLAYER_STARTER_SPECIES
# 1134 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PalletTown_ProfessorOaksLab_Text_ReceivedMonFromOak
# 1135 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 1136 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 1137 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitfanfare
# 1138 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 1139 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, YES, EventScript_GiveNicknameToStarter
# 1140 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PalletTown_ProfessorOaksLab_EventScript_RivalPicksStarter
# 1141 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1142 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1143 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
EventScript_GiveNicknameToStarter::
# 1144 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_0x8004, 0
# 1145 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call EventScript_ChangePokemonNickname
# 1146 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalPicksStarter
# 1147 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1148 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1149 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalPicksStarter::
# 1150 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	closemessage
# 1151 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 0, PalletTown_ProfessorOaksLab_EventScript_RivalWalksToCharmander
# 1152 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 1, PalletTown_ProfessorOaksLab_EventScript_RivalWalksToBulbasaur
# 1153 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq PLAYER_STARTER_NUM, 2, PalletTown_ProfessorOaksLab_EventScript_RivalWalksToSquirtle
# 1154 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1155 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1156 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalWalksToCharmander::
# 1157 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalWalksToCharmander
# 1158 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1159 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalTakesStarter
# 1160 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1161 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1162 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalWalksToSquirtle::
# 1163 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalWalksToSquirtle
# 1164 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1165 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalTakesStarter
# 1166 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1167 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1168 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalWalksToBulbasaur::
# 1169 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	applymovement LOCALID_RIVAL, PalletTown_ProfessorOaksLab_Movement_RivalWalksToBulbasaur
# 1170 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmovement 0
# 1171 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto PalletTown_ProfessorOaksLab_EventScript_RivalTakesStarter
# 1172 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1173 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1174 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RivalTakesStarter::
# 1175 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 1176 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_RivalIllTakeThisOneThen
# 1177 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	removeobject RIVAL_STARTER_ID
# 1178 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 1179 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	bufferspeciesname STR_VAR_1, RIVAL_STARTER_SPECIES
# 1180 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	message PalletTown_ProfessorOaksLab_Text_RivalReceivedMonFromOak
# 1181 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitmessage
# 1182 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 1183 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	waitfanfare
# 1184 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
# 1185 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	call_if_set FLAG_OPENED_START_MENU, PalletTown_ProfessorOaksLab_EventScript_ReadyEndSignLadyScene
# 1186 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1187 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1188 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1189 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_ReadyEndSignLadyScene::
# 1190 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1
# 1191 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	return
# 1192 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1193 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalWalksToCharmander::
# 1194 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1195 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1196 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1197 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1198 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1199 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1200 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1201 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_up
# 1202 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1203 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1204 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalWalksToSquirtle::
# 1205 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1206 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1207 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1208 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1209 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1210 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 1211 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1212 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1213 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_Movement_RivalWalksToBulbasaur::
# 1214 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_down
# 1215 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1216 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1217 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_right
# 1218 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	walk_in_place_faster_up
# 1219 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	step_end
# 1220 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1221 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_SquirtleBall::
# 1222 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1223 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1224 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_NUM, 1
# 1225 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_SPECIES, SPECIES_CRUISE
# 1226 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_SPECIES, SPECIES_CHIKORITA
# 1227 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_ID, LOCALID_BULBASAUR_BALL
# 1228 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3, PalletTown_ProfessorOaksLab_EventScript_LastPokeBall
# 1229 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2, PalletTown_ProfessorOaksLab_EventScript_ConfirmStarterChoice
# 1230 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_ThoseArePokeBalls
# 1231 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1232 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1233 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1234 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_CharmanderBall::
# 1235 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1236 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1237 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_NUM, 2
# 1238 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar PLAYER_STARTER_SPECIES, SPECIES_FLAMEBEAR
# 1239 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_SPECIES, SPECIES_CRUISE
# 1240 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	setvar RIVAL_STARTER_ID, LOCALID_SQUIRTLE_BALL
# 1241 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3, PalletTown_ProfessorOaksLab_EventScript_LastPokeBall
# 1242 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2, PalletTown_ProfessorOaksLab_EventScript_ConfirmStarterChoice
# 1243 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_ThoseArePokeBalls
# 1244 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1245 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1246 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1247 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_LastPokeBall::
# 1248 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OaksLastMon
# 1249 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1250 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1251 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1252 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Aide1::
# 1253 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1254 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1255 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, PalletTown_ProfessorOaksLab_EventScript_Aide1GameClear
# 1256 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_StudyAsOaksAide
# 1257 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1258 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1259 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1260 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Aide1GameClear::
# 1261 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	famechecker FAMECHECKER_OAK, 5
# 1262 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakIsGoingToHaveRadioShow
# 1263 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1264 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1265 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1266 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Aide2::
# 1267 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1268 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1269 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, PalletTown_ProfessorOaksLab_EventScript_Aide2GameClear
# 1270 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_StudyAsOaksAide
# 1271 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1272 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1273 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1274 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Aide2GameClear::
# 1275 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	famechecker FAMECHECKER_DAISY, 0
# 1276 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_DaisyWillGroomMons
# 1277 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1278 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1279 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1280 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Aide3::
# 1281 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lock
# 1282 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	faceplayer
# 1283 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	famechecker FAMECHECKER_OAK, 2
# 1284 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_OakIsAuthorityOnMons
# 1285 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	release
# 1286 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1287 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1288 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Pokedex::
# 1289 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_BlankEncyclopedia, MSGBOX_NPC
# 1290 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1291 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1292 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_Computer::
# 1293 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_EmailMessage, MSGBOX_SIGN
# 1294 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1295 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1296 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_LeftSign::
# 1297 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_PressStartToOpenMenu, MSGBOX_SIGN
# 1298 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1299 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1300 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RightSign::
# 1301 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	lockall
# 1302 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6, PalletTown_ProfessorOaksLab_EventScript_RightSignAlt
# 1303 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_SaveOptionInMenu
# 1304 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 1305 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
# 1306 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"

# 1307 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
PalletTown_ProfessorOaksLab_EventScript_RightSignAlt::
# 1308 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	msgbox PalletTown_ProfessorOaksLab_Text_AllMonTypesHaveStrongAndWeakPoints
# 1309 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	releaseall
# 1310 "data/maps/PalletTown_ProfessorOaksLab/scripts.pory"
	end
