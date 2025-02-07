# 1 "data/maps/TrainerTower_Lobby/scripts.pory"

# 2 "data/maps/TrainerTower_Lobby/scripts.pory"
.set LOCALID_NURSE,         1
# 3 "data/maps/TrainerTower_Lobby/scripts.pory"
.set LOCALID_MART_CLERK,    2
# 4 "data/maps/TrainerTower_Lobby/scripts.pory"
.set LOCALID_RECEPTIONIST,  3
# 5 "data/maps/TrainerTower_Lobby/scripts.pory"
.set LOCALID_COOLTRAINER_F, 4
# 6 "data/maps/TrainerTower_Lobby/scripts.pory"
.set LOCALID_BALDING_MAN,   5
# 7 "data/maps/TrainerTower_Lobby/scripts.pory"

# 8 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_MapScripts::
# 9 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_Lobby_OnResume
# 10 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, TrainerTower_Lobby_OnReturnToField
# 11 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_Lobby_OnTransition
# 12 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, TrainerTower_Lobby_OnLoad
# 13 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_Lobby_OnFrame
# 14 "data/maps/TrainerTower_Lobby/scripts.pory"
	.byte 0
# 15 "data/maps/TrainerTower_Lobby/scripts.pory"

# 16 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnResume::
# 17 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_TEMP_2, 0
# 18 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_resumetimer
# 19 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_shouldexit
# 20 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, TrainerTower_Lobby_OnResumeEnd
# 21 "data/maps/TrainerTower_Lobby/scripts.pory"
	@ Never reached, above always FALSE
# 22 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_TEMP_0, 0
# 23 "data/maps/TrainerTower_Lobby/scripts.pory"
	setobjectxy OBJ_EVENT_ID_PLAYER, 9, 7
# 24 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
# 25 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnResumeEnd::
# 26 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 27 "data/maps/TrainerTower_Lobby/scripts.pory"

# 28 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnReturnToField::
# 29 "data/maps/TrainerTower_Lobby/scripts.pory"
	addobject LOCALID_NURSE
# 30 "data/maps/TrainerTower_Lobby/scripts.pory"
	addobject LOCALID_MART_CLERK
# 31 "data/maps/TrainerTower_Lobby/scripts.pory"
	addobject LOCALID_RECEPTIONIST
# 32 "data/maps/TrainerTower_Lobby/scripts.pory"
	addobject LOCALID_COOLTRAINER_F
# 33 "data/maps/TrainerTower_Lobby/scripts.pory"
	addobject LOCALID_BALDING_MAN
# 34 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 35 "data/maps/TrainerTower_Lobby/scripts.pory"

# 36 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnLoad::
# 37 "data/maps/TrainerTower_Lobby/scripts.pory"
	call_if_eq VAR_TEMP_D, 17, TrainerTower_Lobby_OpenCounterBarrier
# 38 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 39 "data/maps/TrainerTower_Lobby/scripts.pory"

# 40 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OpenCounterBarrier::
# 41 "data/maps/TrainerTower_Lobby/scripts.pory"
	setmetatile 17, 10, METATILE_TrainerTower_Floor_ShadeBottomLeft, 0
# 42 "data/maps/TrainerTower_Lobby/scripts.pory"
	return
# 43 "data/maps/TrainerTower_Lobby/scripts.pory"

# 44 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnTransition::
# 45 "data/maps/TrainerTower_Lobby/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_TRAINER_TOWER_LOBBY
# 46 "data/maps/TrainerTower_Lobby/scripts.pory"
	getplayerxy VAR_TEMP_D, VAR_RESULT
# 47 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 48 "data/maps/TrainerTower_Lobby/scripts.pory"

# 49 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_OnFrame::
# 50 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script_2 VAR_TEMP_0, 0, TrainerTower_Lobby_EventScript_Enter
# 51 "data/maps/TrainerTower_Lobby/scripts.pory"
	map_script_2 VAR_TEMP_D, 17, TrainerTower_Lobby_EventScript_ExitElevator
# 52 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte 0
# 53 "data/maps/TrainerTower_Lobby/scripts.pory"

# 54 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ExitElevator::
# 55 "data/maps/TrainerTower_Lobby/scripts.pory"
	lockall
# 56 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_ExitElevator
# 57 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitmovement 0
# 58 "data/maps/TrainerTower_Lobby/scripts.pory"
	setmetatile 17, 10, METATILE_TrainerTower_CounterBarrier, 1
# 59 "data/maps/TrainerTower_Lobby/scripts.pory"
	special DrawWholeMapView
# 60 "data/maps/TrainerTower_Lobby/scripts.pory"
	playse SE_CLICK
# 61 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitse
# 62 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_TEMP_D, 0
# 63 "data/maps/TrainerTower_Lobby/scripts.pory"
	releaseall
# 64 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 65 "data/maps/TrainerTower_Lobby/scripts.pory"

# 66 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_Movement_ExitElevator::
# 67 "data/maps/TrainerTower_Lobby/scripts.pory"
	walk_down
# 68 "data/maps/TrainerTower_Lobby/scripts.pory"
	walk_down
# 69 "data/maps/TrainerTower_Lobby/scripts.pory"
	step_end
# 70 "data/maps/TrainerTower_Lobby/scripts.pory"

# 71 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_Enter::
# 72 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_TEMP_0, 1
# 73 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_getchallengestatus
# 74 "data/maps/TrainerTower_Lobby/scripts.pory"
	switch VAR_RESULT
# 75 "data/maps/TrainerTower_Lobby/scripts.pory"
	case CHALLENGE_STATUS_LOST, TrainerTower_Lobby_EventScript_LostChallenge
# 76 "data/maps/TrainerTower_Lobby/scripts.pory"
	case CHALLENGE_STATUS_UNK, TrainerTower_Lobby_EventScript_ExitChallengeSpeakToReceptionist
# 77 "data/maps/TrainerTower_Lobby/scripts.pory"
	case CHALLENGE_STATUS_NORMAL, TrainerTower_Lobby_EventScript_EnterEnd
# 78 "data/maps/TrainerTower_Lobby/scripts.pory"

# 79 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_LostChallenge::
# 80 "data/maps/TrainerTower_Lobby/scripts.pory"
	lock
# 81 "data/maps/TrainerTower_Lobby/scripts.pory"
	faceplayer
# 82 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
# 83 "data/maps/TrainerTower_Lobby/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 84 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_TooBadComeBackTryAgain
# 85 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto TrainerTower_Lobby_EventScript_ExitChallenge
# 86 "data/maps/TrainerTower_Lobby/scripts.pory"

# 87 "data/maps/TrainerTower_Lobby/scripts.pory"
@ Presumably E-Reader related
# 88 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ExitChallengeSpeakToReceptionist::
# 89 "data/maps/TrainerTower_Lobby/scripts.pory"
	lock
# 90 "data/maps/TrainerTower_Lobby/scripts.pory"
	faceplayer
# 91 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
# 92 "data/maps/TrainerTower_Lobby/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 93 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_MoveCounterHereWhenTrainersSwitch
# 94 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ExitChallenge::
# 95 "data/maps/TrainerTower_Lobby/scripts.pory"
	closemessage
# 96 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_WalkDown
# 97 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitmovement 0
# 98 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 0
# 99 "data/maps/TrainerTower_Lobby/scripts.pory"
	release
# 100 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_EnterEnd::
# 101 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 102 "data/maps/TrainerTower_Lobby/scripts.pory"

# 103 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_Nurse::
# 104 "data/maps/TrainerTower_Lobby/scripts.pory"
	lock
# 105 "data/maps/TrainerTower_Lobby/scripts.pory"
	faceplayer
# 106 "data/maps/TrainerTower_Lobby/scripts.pory"
	call EventScript_PkmnCenterNurse
# 107 "data/maps/TrainerTower_Lobby/scripts.pory"
	release
# 108 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 109 "data/maps/TrainerTower_Lobby/scripts.pory"

# 110 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_Receptionist::
# 111 "data/maps/TrainerTower_Lobby/scripts.pory"
	lock
# 112 "data/maps/TrainerTower_Lobby/scripts.pory"
	faceplayer
# 113 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_getbeatchallenge
# 114 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, TrainerTower_Lobby_EventScript_ThanksForCompeting
# 115 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_GiveItYourBest
# 116 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto TrainerTower_Lobby_EventScript_ReceptionistEnd
# 117 "data/maps/TrainerTower_Lobby/scripts.pory"

# 118 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ThanksForCompeting::
# 119 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_ThanksForCompeting
# 120 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ReceptionistEnd::
# 121 "data/maps/TrainerTower_Lobby/scripts.pory"
	release
# 122 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 123 "data/maps/TrainerTower_Lobby/scripts.pory"

# 124 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_MartClerk::
# 125 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 126 "data/maps/TrainerTower_Lobby/scripts.pory"
	lock
# 127 "data/maps/TrainerTower_Lobby/scripts.pory"
	faceplayer
# 128 "data/maps/TrainerTower_Lobby/scripts.pory"
	message Text_MayIHelpYou
# 129 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitmessage
# 130 "data/maps/TrainerTower_Lobby/scripts.pory"
	pokemart TrainerTower_Lobby_Mart_Items
# 131 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox Text_PleaseComeAgain
# 132 "data/maps/TrainerTower_Lobby/scripts.pory"
	release
# 133 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 134 "data/maps/TrainerTower_Lobby/scripts.pory"

# 135 "data/maps/TrainerTower_Lobby/scripts.pory"
	.align 2
# 136 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_Mart_Items::
# 137 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 138 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 139 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_FULL_RESTORE
# 140 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_MAX_POTION
# 141 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_HYPER_POTION
# 142 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_REVIVE
# 143 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 144 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 145 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 146 "data/maps/TrainerTower_Lobby/scripts.pory"
	.2byte ITEM_NONE
# 147 "data/maps/TrainerTower_Lobby/scripts.pory"
	release
# 148 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 149 "data/maps/TrainerTower_Lobby/scripts.pory"

# 150 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_EntryTrigger::
# 151 "data/maps/TrainerTower_Lobby/scripts.pory"
	lockall
# 152 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
# 153 "data/maps/TrainerTower_Lobby/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 154 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_WelcomeToTrainerTower
# 155 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_getnumfloors
# 156 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, TrainerTower_Lobby_EventScript_AllFloorsUsed
# 157 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_TrainersUpToFloorNum
# 158 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto TrainerTower_Lobby_EventScript_AskEnterChallenge
# 159 "data/maps/TrainerTower_Lobby/scripts.pory"

# 160 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_AllFloorsUsed::
# 161 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_TrainersUpEighthFloor
# 162 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_AskEnterChallenge::
# 163 "data/maps/TrainerTower_Lobby/scripts.pory"
	message TrainerTower_Lobby_Text_LikeToChallengeTrainers
# 164 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitmessage
# 165 "data/maps/TrainerTower_Lobby/scripts.pory"
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
# 166 "data/maps/TrainerTower_Lobby/scripts.pory"
	switch VAR_RESULT
# 167 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 0, TrainerTower_Lobby_EventScript_ChooseChallenge
# 168 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 1, TrainerTower_Lobby_EventScript_DeclineChallenge
# 169 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 2, TrainerTower_Lobby_EventScript_ChallengeInfo
# 170 "data/maps/TrainerTower_Lobby/scripts.pory"
	case SCR_MENU_CANCEL, TrainerTower_Lobby_EventScript_DeclineChallenge
# 171 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 172 "data/maps/TrainerTower_Lobby/scripts.pory"

# 173 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ChallengeInfo::
# 174 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_ExplainTrainerTower
# 175 "data/maps/TrainerTower_Lobby/scripts.pory"
	goto TrainerTower_Lobby_EventScript_AskEnterChallenge
# 176 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 177 "data/maps/TrainerTower_Lobby/scripts.pory"

# 178 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ChooseChallenge::
# 179 "data/maps/TrainerTower_Lobby/scripts.pory"
	multichoice 13, 3, MULTICHOICE_TRAINER_TOWER_MODE, FALSE
# 180 "data/maps/TrainerTower_Lobby/scripts.pory"
	switch VAR_RESULT
# 181 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 0, TrainerTower_Lobby_EventScript_BeginChallenge
# 182 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 1, TrainerTower_Lobby_EventScript_BeginChallenge
# 183 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 2, TrainerTower_Lobby_EventScript_BeginChallenge
# 184 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 3, TrainerTower_Lobby_EventScript_BeginChallenge
# 185 "data/maps/TrainerTower_Lobby/scripts.pory"
	case 4, TrainerTower_Lobby_EventScript_DeclineChallenge
# 186 "data/maps/TrainerTower_Lobby/scripts.pory"
	case SCR_MENU_CANCEL, TrainerTower_Lobby_EventScript_DeclineChallenge
# 187 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 188 "data/maps/TrainerTower_Lobby/scripts.pory"

# 189 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_BeginChallenge::
# 190 "data/maps/TrainerTower_Lobby/scripts.pory"
	copyvar VAR_0x8005, VAR_RESULT
# 191 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 1
# 192 "data/maps/TrainerTower_Lobby/scripts.pory"
	special HealPlayerParty
# 193 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_StartClockGetSetGo
# 194 "data/maps/TrainerTower_Lobby/scripts.pory"
	ttower_startchallenge
# 195 "data/maps/TrainerTower_Lobby/scripts.pory"
	releaseall
# 196 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 197 "data/maps/TrainerTower_Lobby/scripts.pory"

# 198 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_DeclineChallenge::
# 199 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_PleaseVisitUsAgain
# 200 "data/maps/TrainerTower_Lobby/scripts.pory"
	closemessage
# 201 "data/maps/TrainerTower_Lobby/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_WalkDown
# 202 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitmovement 0
# 203 "data/maps/TrainerTower_Lobby/scripts.pory"
	releaseall
# 204 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 205 "data/maps/TrainerTower_Lobby/scripts.pory"

# 206 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_Movement_FaceReceptionist::
# 207 "data/maps/TrainerTower_Lobby/scripts.pory"
	face_right
# 208 "data/maps/TrainerTower_Lobby/scripts.pory"
	step_end
# 209 "data/maps/TrainerTower_Lobby/scripts.pory"

# 210 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_Movement_WalkDown::
# 211 "data/maps/TrainerTower_Lobby/scripts.pory"
	walk_down
# 212 "data/maps/TrainerTower_Lobby/scripts.pory"
	step_end
# 213 "data/maps/TrainerTower_Lobby/scripts.pory"

# 214 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_ShowRecords::
# 215 "data/maps/TrainerTower_Lobby/scripts.pory"
	lockall
# 216 "data/maps/TrainerTower_Lobby/scripts.pory"
	fadescreen FADE_TO_BLACK
# 217 "data/maps/TrainerTower_Lobby/scripts.pory"
	setvar VAR_0x8004, 1
# 218 "data/maps/TrainerTower_Lobby/scripts.pory"
	special ShowBattleRecords
# 219 "data/maps/TrainerTower_Lobby/scripts.pory"
	waitstate
# 220 "data/maps/TrainerTower_Lobby/scripts.pory"
	releaseall
# 221 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 222 "data/maps/TrainerTower_Lobby/scripts.pory"

# 223 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_CooltrainerF::
# 224 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_WonderWhatKindsOfTrainers, MSGBOX_NPC
# 225 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
# 226 "data/maps/TrainerTower_Lobby/scripts.pory"

# 227 "data/maps/TrainerTower_Lobby/scripts.pory"
TrainerTower_Lobby_EventScript_BaldingMan::
# 228 "data/maps/TrainerTower_Lobby/scripts.pory"
	msgbox TrainerTower_Lobby_Text_StairsTougherThanAnyBattle, MSGBOX_NPC
# 229 "data/maps/TrainerTower_Lobby/scripts.pory"
	end
