.set LOCALID_NURSE,         1
.set LOCALID_MART_CLERK,    2
.set LOCALID_RECEPTIONIST,  3
.set LOCALID_COOLTRAINER_F, 4
.set LOCALID_BALDING_MAN,   5

TrainerTower_Lobby_MapScripts:: @ 8164839
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_Lobby_OnResume
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, TrainerTower_Lobby_OnReturnToField
	map_script MAP_SCRIPT_ON_TRANSITION, TrainerTower_Lobby_OnTransition
	map_script MAP_SCRIPT_ON_LOAD, TrainerTower_Lobby_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_Lobby_OnFrame
	.byte 0

TrainerTower_Lobby_OnResume:: @ 8164853
	setvar VAR_TEMP_2, 0
	ttower_resumetimer
	ttower_shouldexit
	compare VAR_RESULT, FALSE
	goto_if_eq TrainerTower_Lobby_OnResumeEnd
	@ Never reached, above always FALSE
	setvar VAR_TEMP_0, 0
	setobjectxy OBJ_EVENT_ID_PLAYER, 9, 7
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
TrainerTower_Lobby_OnResumeEnd:: @ 8164886
	end

TrainerTower_Lobby_OnReturnToField:: @ 8164887
	addobject LOCALID_NURSE
	addobject LOCALID_MART_CLERK
	addobject LOCALID_RECEPTIONIST
	addobject LOCALID_COOLTRAINER_F
	addobject LOCALID_BALDING_MAN
	end

TrainerTower_Lobby_OnLoad:: @ 8164897
	compare VAR_TEMP_D, 17
	call_if_eq TrainerTower_Lobby_OpenCounterBarrier
	end

TrainerTower_Lobby_OpenCounterBarrier:: @ 81648A3
	setmetatile 17, 10, METATILE_TrainerTower_Floor_ShadeBottomLeft, 0
	return

TrainerTower_Lobby_OnTransition:: @ 81648AD
	setworldmapflag FLAG_WORLD_MAP_TRAINER_TOWER_LOBBY
	getplayerxy VAR_TEMP_D, VAR_RESULT
	end

TrainerTower_Lobby_OnFrame:: @ 81648B6
	map_script_2 VAR_TEMP_0, 0, TrainerTower_Lobby_EventScript_Enter
	map_script_2 VAR_TEMP_D, 17, TrainerTower_Lobby_EventScript_ExitElevator
	.2byte 0

TrainerTower_Lobby_EventScript_ExitElevator:: @ 81648C8
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_ExitElevator
	waitmovement 0
	setmetatile 17, 10, METATILE_TrainerTower_CounterBarrier, 1
	special DrawWholeMapView
	playse SE_CLICK
	waitse
	setvar VAR_TEMP_D, 0
	releaseall
	end

TrainerTower_Lobby_Movement_ExitElevator:: @ 81648EA
	walk_down
	walk_down
	step_end

TrainerTower_Lobby_EventScript_Enter:: @ 81648ED
	setvar VAR_TEMP_0, 1
	ttower_getchallengestatus
	switch VAR_RESULT
	case CHALLENGE_STATUS_LOST, TrainerTower_Lobby_EventScript_LostChallenge
	case CHALLENGE_STATUS_UNK, TrainerTower_Lobby_EventScript_164938
	case CHALLENGE_STATUS_NORMAL, TrainerTower_Lobby_EventScript_EnterEnd

TrainerTower_Lobby_EventScript_LostChallenge:: @ 8164920
	lock
	faceplayer
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
	textcolor 1
	msgbox TrainerTower_Lobby_Text_TooBadComeBackTryAgain
	goto TrainerTower_Lobby_EventScript_ExitChallenge

@ Presumably E-Reader related
TrainerTower_Lobby_EventScript_164938:: @ 8164938
	lock
	faceplayer
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
	textcolor 1
	msgbox TrainerTower_Lobby_Text_MoveCounterHereWhenTrainersSwitch
TrainerTower_Lobby_EventScript_ExitChallenge:: @ 816494B
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_WalkDown
	waitmovement 0
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 0
	release
TrainerTower_Lobby_EventScript_EnterEnd:: @ 816495C
	end

TrainerTower_Lobby_EventScript_Nurse:: @ 816495D
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

TrainerTower_Lobby_EventScript_Receptionist:: @ 8164966
	lock
	faceplayer
	ttower_getbeatchallenge
	compare VAR_RESULT, TRUE
	goto_if_eq TrainerTower_Lobby_EventScript_ThanksForCompeting
	msgbox TrainerTower_Lobby_Text_GiveItYourBest
	goto TrainerTower_Lobby_EventScript_ReceptionistEnd

TrainerTower_Lobby_EventScript_ThanksForCompeting:: @ 8164988
	msgbox TrainerTower_Lobby_Text_ThanksForCompeting
TrainerTower_Lobby_EventScript_ReceptionistEnd:: @ 8164990
	release
	end

TrainerTower_Lobby_EventScript_MartClerk:: @ 8164992
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart TrainerTower_Lobby_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
TrainerTower_Lobby_Mart_Items:: @ 81649B8
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

TrainerTower_Lobby_EventScript_EntryTrigger:: @ 81649CE
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_FaceReceptionist
	textcolor 1
	msgbox TrainerTower_Lobby_Text_WelcomeToTrainerTower
	ttower_getnumfloors
	compare VAR_RESULT, FALSE
	goto_if_eq TrainerTower_Lobby_EventScript_AllFloorsUsed
	msgbox TrainerTower_Lobby_Text_TrainersUpToFloorNum
	goto TrainerTower_Lobby_EventScript_AskEnterChallenge

TrainerTower_Lobby_EventScript_AllFloorsUsed:: @ 8164A00
	msgbox TrainerTower_Lobby_Text_TrainersUpEighthFloor
TrainerTower_Lobby_EventScript_AskEnterChallenge:: @ 8164A08
	message TrainerTower_Lobby_Text_LikeToChallengeTrainers
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, TrainerTower_Lobby_EventScript_ChooseChallenge
	case 1, TrainerTower_Lobby_EventScript_DeclineChallenge
	case 2, TrainerTower_Lobby_EventScript_ChallengeInfo
	case SCR_MENU_CANCEL, TrainerTower_Lobby_EventScript_DeclineChallenge
	end

TrainerTower_Lobby_EventScript_ChallengeInfo:: @ 8164A45
	msgbox TrainerTower_Lobby_Text_ExplainTrainerTower
	goto TrainerTower_Lobby_EventScript_AskEnterChallenge
	end

TrainerTower_Lobby_EventScript_ChooseChallenge:: @ 8164A53
	multichoice 13, 3, MULTICHOICE_TRAINER_TOWER_MODE, FALSE
	switch VAR_RESULT
	case 0, TrainerTower_Lobby_EventScript_BeginChallenge
	case 1, TrainerTower_Lobby_EventScript_BeginChallenge
	case 2, TrainerTower_Lobby_EventScript_BeginChallenge
	case 3, TrainerTower_Lobby_EventScript_BeginChallenge
	case 4, TrainerTower_Lobby_EventScript_DeclineChallenge
	case SCR_MENU_CANCEL, TrainerTower_Lobby_EventScript_DeclineChallenge
	end

TrainerTower_Lobby_EventScript_BeginChallenge:: @ 8164AA0
	copyvar VAR_0x8005, VAR_RESULT
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 1
	special HealPlayerParty
	msgbox TrainerTower_Lobby_Text_StartClockGetSetGo
	ttower_startchallenge
	releaseall
	end

TrainerTower_Lobby_EventScript_DeclineChallenge:: @ 8164ABF
	msgbox TrainerTower_Lobby_Text_PleaseVisitUsAgain
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Lobby_Movement_WalkDown
	waitmovement 0
	releaseall
	end

TrainerTower_Lobby_Movement_FaceReceptionist:: @ 8164AD4
	face_right
	step_end

TrainerTower_Lobby_Movement_WalkDown:: @ 8164AD6
	walk_down
	step_end

TrainerTower_Lobby_EventScript_ShowRecords:: @ 8164AD8
	lockall
	fadescreen FADE_TO_BLACK
	setvar VAR_0x8004, 1
	special ShowBattleRecords
	waitstate
	releaseall
	end

TrainerTower_Lobby_EventScript_CooltrainerF:: @ 8164AE6
	msgbox TrainerTower_Lobby_Text_WonderWhatKindsOfTrainers, MSGBOX_NPC
	end

TrainerTower_Lobby_EventScript_BaldingMan:: @ 8164AEF
	msgbox TrainerTower_Lobby_Text_StairsTougherThanAnyBattle, MSGBOX_NPC
	end
