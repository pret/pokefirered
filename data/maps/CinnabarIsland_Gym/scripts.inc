.set LOCALID_QUINN, 1
.set LOCALID_AVERY, 3
.set LOCALID_RAMON, 4
.set LOCALID_DEREK, 5
.set LOCALID_DUSTY, 6
.set LOCALID_ZAC,   7

CinnabarIsland_Gym_MapScripts:: @ 816D94B
	map_script MAP_SCRIPT_ON_LOAD, CinnabarIsland_Gym_OnLoad
	.byte 0

CinnabarIsland_Gym_OnLoad:: @ 816D951
	goto_if_set FLAG_DEFEATED_BLAINE, CinnabarIsland_Gym_OnLoadOpenAllDoors
	call_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_OnLoadOpenDoor1
	call_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_OnLoadOpenDoor2
	call_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_OnLoadOpenDoor3
	call_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_OnLoadOpenDoor4
	call_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_OnLoadOpenDoor5
	call_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_OnLoadOpenDoor6
	end

CinnabarIsland_Gym_OnLoadOpenAllDoors:: @ 816D991
	call CinnabarIsland_Gym_EventScript_OpenDoor1
	call CinnabarIsland_Gym_EventScript_OpenDoor2
	call CinnabarIsland_Gym_EventScript_OpenDoor3
	call CinnabarIsland_Gym_EventScript_OpenDoor4
	call CinnabarIsland_Gym_EventScript_OpenDoor5
	call CinnabarIsland_Gym_EventScript_OpenDoor6
	end

CinnabarIsland_Gym_OnLoadOpenDoor1:: @ 816D9B0
	call CinnabarIsland_Gym_EventScript_OpenDoor1
	return

CinnabarIsland_Gym_OnLoadOpenDoor2:: @ 816D9B6
	call CinnabarIsland_Gym_EventScript_OpenDoor2
	return

CinnabarIsland_Gym_OnLoadOpenDoor3:: @ 816D9BC
	call CinnabarIsland_Gym_EventScript_OpenDoor3
	return

CinnabarIsland_Gym_OnLoadOpenDoor4:: @ 816D9C2
	call CinnabarIsland_Gym_EventScript_OpenDoor4
	return

CinnabarIsland_Gym_OnLoadOpenDoor5:: @ 816D9C8
	call CinnabarIsland_Gym_EventScript_OpenDoor5
	return

CinnabarIsland_Gym_OnLoadOpenDoor6:: @ 816D9CE
	call CinnabarIsland_Gym_EventScript_OpenDoor6
	return

CinnabarIsland_Gym_EventScript_Blaine:: @ 816D9D4
	famechecker FAMECHECKER_BLAINE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_BLAINE, CinnabarIsland_Gym_Text_BlaineIntro, CinnabarIsland_Gym_Text_BlaineDefeat, CinnabarIsland_Gym_EventScript_DefeatedBlaine, NO_MUSIC
	goto_if_unset FLAG_GOT_TM38_FROM_BLAINE, CinnabarIsland_Gym_EventScript_GiveTM38
	msgbox CinnabarIsland_Gym_Text_BlainePostBattle
	release
	end

CinnabarIsland_Gym_EventScript_DefeatedBlaine:: @ 816DA06
	famechecker FAMECHECKER_BLAINE, 1
	setflag FLAG_DEFEATED_BLAINE
	setflag FLAG_BADGE07_GET
	setrespawn SPAWN_CINNABAR_ISLAND
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 1
	clearflag FLAG_HIDE_CINNABAR_BILL
	set_gym_trainers 7
	goto CinnabarIsland_Gym_EventScript_GiveTM38
	end

CinnabarIsland_Gym_EventScript_GiveTM38:: @ 816DA34
	msgbox CinnabarIsland_Gym_Text_ExplainVolcanoBadge
	checkitemspace ITEM_TM38, 1
	compare VAR_RESULT, FALSE
	goto_if_eq CinnabarIsland_Gym_EventScript_NoRoomForTM38
	giveitem_msg CinnabarIsland_Gym_Text_ReceivedTM38FromBlaine, ITEM_TM38
	setflag FLAG_GOT_TM38_FROM_BLAINE
	msgbox CinnabarIsland_Gym_Text_FireBlastIsUltimateFireMove
	release
	end

CinnabarIsland_Gym_EventScript_NoRoomForTM38:: @ 816DA75
	msgbox CinnabarIsland_Gym_Text_MakeSpaceForThis
	release
	end

CinnabarIsland_Gym_EventScript_Erik:: @ 816DA7F
	trainerbattle_single TRAINER_SUPER_NERD_ERIK, CinnabarIsland_Gym_Text_ErikIntro, CinnabarIsland_Gym_Text_ErikDefeat
	msgbox CinnabarIsland_Gym_Text_ErikPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_Avery:: @ 816DA96
	trainerbattle_single TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_Text_AveryIntro, CinnabarIsland_Gym_Text_AveryDefeat, CinnabarIsland_Gym_EventScript_DefeatedAvery
	msgbox CinnabarIsland_Gym_Text_AveryPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedAvery:: @ 816DAB1
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_Quiz2CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz2CompleteTrainer:: @ 816DABC
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
	return

CinnabarIsland_Gym_EventScript_Derek:: @ 816DAC2
	trainerbattle_single TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekIntro, CinnabarIsland_Gym_Text_DerekDefeat, CinnabarIsland_Gym_EventScript_DefeatedDerek
	famechecker FAMECHECKER_BLAINE, 2
	msgbox CinnabarIsland_Gym_Text_DerekPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedDerek:: @ 816DAEA
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_Quiz4CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz4CompleteTrainer:: @ 816DAF5
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
	return

CinnabarIsland_Gym_EventScript_Zac:: @ 816DAFB
	trainerbattle_single TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacIntro, CinnabarIsland_Gym_Text_ZacDefeat, CinnabarIsland_Gym_EventScript_DefeatedZac
	msgbox CinnabarIsland_Gym_Text_ZacPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedZac:: @ 816DB16
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_Quiz6CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz6CompleteTrainer:: @ 816DB21
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	return

CinnabarIsland_Gym_EventScript_Quinn:: @ 816DB27
	trainerbattle_single TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnIntro, CinnabarIsland_Gym_Text_QuinnDefeat, CinnabarIsland_Gym_EventScript_DefeatedQuinn
	msgbox CinnabarIsland_Gym_Text_QuinnPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedQuinn:: @ 816DB42
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_Quiz1CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz1CompleteTrainer:: @ 816DB4D
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
	return

CinnabarIsland_Gym_EventScript_Ramon:: @ 816DB53
	trainerbattle_single TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonIntro, CinnabarIsland_Gym_Text_RamonDefeat, CinnabarIsland_Gym_EventScript_DefeatedRamon
	msgbox CinnabarIsland_Gym_Text_RamonPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedRamon:: @ 816DB6E
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_Quiz3CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz3CompleteTrainer:: @ 816DB79
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
	return

CinnabarIsland_Gym_EventScript_Dusty:: @ 816DB7F
	trainerbattle_single TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyIntro, CinnabarIsland_Gym_Text_DustyDefeat, CinnabarIsland_Gym_EventScript_DefeatedDusty
	msgbox CinnabarIsland_Gym_Text_DustyPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedDusty:: @ 816DB9A
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_Quiz5CompleteTrainer
	release
	end

CinnabarIsland_Gym_EventScript_Quiz5CompleteTrainer:: @ 816DBA5
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
	return

CinnabarIsland_Gym_EventScript_GymGuy:: @ 816DBAB
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_BLAINE, CinnabarIsland_Gym_EventScript_GymGuyPostVictory
	msgbox CinnabarIsland_Gym_Text_GymGuyAdvice
	release
	end

CinnabarIsland_Gym_EventScript_GymGuyPostVictory:: @ 816DBC0
	msgbox CinnabarIsland_Gym_Text_GymGuyPostVictory
	release
	end

CinnabarIsland_Gym_EventScript_GymStatue:: @ 816DBCA
	lockall
	goto_if_set FLAG_BADGE07_GET, CinnabarIsland_Gym_EventScript_GymStatuePostVictory
	msgbox CinnabarIsland_Gym_Text_GymStatue
	releaseall
	end

CinnabarIsland_Gym_EventScript_GymStatuePostVictory:: @ 816DBDE
	msgbox CinnabarIsland_Gym_Text_GymStatuePlayerWon
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quz1Left:: @ 816DBE8
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz1
	end

CinnabarIsland_Gym_EventScript_Quz1Right:: @ 816DBF4
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz1
	end

CinnabarIsland_Gym_EventScript_Quiz1:: @ 816DC00
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion1, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz1Correct
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz1Incorrect
	end

CinnabarIsland_Gym_EventScript_CorrectAnswer:: @ 816DC27
	playfanfare MUS_LEVEL_UP
	waitfanfare
	msgbox CinnabarIsland_Gym_Text_CorrectGoOnThrough
	return

CinnabarIsland_Gym_EventScript_IncorrectAnswer:: @ 816DC34
	waitse
	playse SE_BOO
	waitse
	msgbox CinnabarIsland_Gym_Text_SorryBadCall
	closemessage
	return

CinnabarIsland_Gym_EventScript_Quiz1Correct:: @ 816DC43
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz1Complete:: @ 816DC58
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor1
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_1
	return

CinnabarIsland_Gym_EventScript_DoorAlreadyOpen:: @ 816DC68
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz1Incorrect:: @ 816DC6A
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_EventScript_BattleQuinn
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleQuinn:: @ 816DC7A
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_QuinnApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_QuinnApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_QuinnIntro
	trainerbattle_no_intro TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_QuinnApproachLeft:: @ 816DCB4
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_QUINN, CinnabarIsland_Gym_Movement_QuinnApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_QuinnApproachRight:: @ 816DCC6
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_QUINN, CinnabarIsland_Gym_Movement_QuinnApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_QuinnApproachLeft:: @ 816DCD8
	walk_left
	walk_left
	step_end

CinnabarIsland_Gym_Movement_QuinnApproachRight:: @ 816DCDB
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_Quiz2Left:: @ 816DCDD
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz2
	end

CinnabarIsland_Gym_EventScript_Quiz2Right:: @ 816DCE9
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz2
	end

CinnabarIsland_Gym_EventScript_Quiz2:: @ 816DCF5
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion2, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz2Incorrect
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz2Correct
	end

CinnabarIsland_Gym_EventScript_Quiz2Correct:: @ 816DD1C
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz2Complete:: @ 816DD31
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor2
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_2
	return

CinnabarIsland_Gym_EventScript_Quiz2Incorrect:: @ 816DD41
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_EventScript_BattleAvery
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleAvery:: @ 816DD51
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_AveryApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_AveryApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_AveryIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_Text_AveryDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_AveryApproachLeft:: @ 816DD8B
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Gym_Movement_PlayerFaceAvery
	applymovement LOCALID_AVERY, CinnabarIsland_Gym_Movement_AveryApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_AveryApproachRight:: @ 816DD9D
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Gym_Movement_PlayerFaceAvery
	applymovement LOCALID_AVERY, CinnabarIsland_Gym_Movement_AveryApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_AveryApproachLeft:: @ 816DDAF
	walk_up
	walk_up
	walk_left
	step_end

CinnabarIsland_Gym_Movement_AveryApproachRight:: @ 816DDB3
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

CinnabarIsland_Gym_Movement_PlayerFaceAvery:: @ 816DDB7
	delay_16
	delay_16
	walk_in_place_fastest_right
	step_end

CinnabarIsland_Gym_EventScript_Quiz3Left:: @ 816DDBB
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz3
	end

CinnabarIsland_Gym_EventScript_Quiz3Right:: @ 816DDC7
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz3
	end

CinnabarIsland_Gym_EventScript_Quiz3:: @ 816DDD3
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion3, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz3Incorrect
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz3Correct
	end

CinnabarIsland_Gym_EventScript_Quiz3Correct:: @ 816DDFA
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz3Complete:: @ 816DE0F
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor3
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_3
	return

CinnabarIsland_Gym_EventScript_Quiz3Incorrect:: @ 816DE1F
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_EventScript_BattleRamon
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleRamon:: @ 816DE2F
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_RamonApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_RamonApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_RamonIntro
	trainerbattle_no_intro TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_RamonApproachLeft:: @ 816DE69
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_RAMON, CinnabarIsland_Gym_Movement_RamonApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_RamonApproachRight:: @ 816DE7B
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_RAMON, CinnabarIsland_Gym_Movement_RamonApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_RamonApproachLeft:: @ 816DE8D
	walk_left
	walk_left
	step_end

CinnabarIsland_Gym_Movement_RamonApproachRight:: @ 816DE90
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_Quiz4Left:: @ 816DE92
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz4
	end

CinnabarIsland_Gym_EventScript_Quiz4Right:: @ 816DE9E
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz4
	end

CinnabarIsland_Gym_EventScript_Quiz4:: @ 816DEAA
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion4, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz4Incorrect
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz4Correct
	end

CinnabarIsland_Gym_EventScript_Quiz4Correct:: @ 816DED1
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz4Complete:: @ 816DEE6
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor4
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_4
	return

CinnabarIsland_Gym_EventScript_Quiz4Incorrect:: @ 816DEF6
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_EventScript_BattleDerek
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleDerek:: @ 816DF06
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_DerekApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_DerekApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_DerekIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_DerekApproachLeft:: @ 816DF40
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_DEREK, CinnabarIsland_Gym_Movement_DerekApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_DerekApproachRight:: @ 816DF52
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_DEREK, CinnabarIsland_Gym_Movement_DerekApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_DerekApproachLeft:: @ 816DF64
	walk_left
	walk_left
	step_end

CinnabarIsland_Gym_Movement_DerekApproachRight:: @ 816DF67
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_Quiz5Left:: @ 816DF69
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz5
	end

CinnabarIsland_Gym_EventScript_Quiz5Right:: @ 816DF75
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz5
	end

CinnabarIsland_Gym_EventScript_Quiz5:: @ 816DF81
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion5, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz5Correct
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz5Incorrect
	end

CinnabarIsland_Gym_EventScript_Quiz5Correct:: @ 816DFA8
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz5Complete:: @ 816DFBD
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor5
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_5
	return

CinnabarIsland_Gym_EventScript_Quiz5Incorrect:: @ 816DFCD
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_EventScript_BattleDusty
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleDusty:: @ 816DFDD
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_DustyApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_DustyApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_DustyIntro
	trainerbattle_no_intro TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_DustyApproachLeft:: @ 816E017
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_DUSTY, CinnabarIsland_Gym_Movement_DustyApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_DustyApproachRight:: @ 816E029
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_DUSTY, CinnabarIsland_Gym_Movement_DustyApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_DustyApproachLeft:: @ 816E03B
	walk_left
	walk_left
	step_end

CinnabarIsland_Gym_Movement_DustyApproachRight:: @ 816E03E
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_Quiz6Left:: @ 816E040
	lockall
	setvar VAR_TEMP_1, 0
	goto CinnabarIsland_Gym_EventScript_Quiz6
	end

CinnabarIsland_Gym_EventScript_Quiz6Right:: @ 816E04C
	lockall
	setvar VAR_TEMP_1, 1
	goto CinnabarIsland_Gym_EventScript_Quiz6
	end

CinnabarIsland_Gym_EventScript_Quiz6:: @ 816E058
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion6, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz6Incorrect
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_Gym_EventScript_Quiz6Correct
	end

CinnabarIsland_Gym_EventScript_Quiz6Correct:: @ 816E07F
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz6Complete:: @ 816E094
	playse SE_UNLOCK
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor6
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_6
	return

CinnabarIsland_Gym_EventScript_Quiz6Incorrect:: @ 816E0A4
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_EventScript_BattleZac
	releaseall
	end

CinnabarIsland_Gym_EventScript_BattleZac:: @ 816E0B4
	compare VAR_TEMP_1, 0
	call_if_eq CinnabarIsland_Gym_EventScript_ZacApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq CinnabarIsland_Gym_EventScript_ZacApproachRight
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_ZacIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_ZacApproachLeft:: @ 816E0EE
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_ZAC, CinnabarIsland_Gym_Movement_ZacApproachLeft
	waitmovement 0
	return

CinnabarIsland_Gym_EventScript_ZacApproachRight:: @ 816E100
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement LOCALID_ZAC, CinnabarIsland_Gym_Movement_ZacApproachRight
	waitmovement 0
	return

CinnabarIsland_Gym_Movement_ZacApproachLeft:: @ 816E112
	walk_left
	walk_left
	step_end

CinnabarIsland_Gym_Movement_ZacApproachRight:: @ 816E115
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_OpenDoor1:: @ 816E117
	setmetatile 26,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
	setmetatile 27,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
	setmetatile 26,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
	setmetatile 27,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
	setmetatile 26, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile 27, 10, METATILE_CinnabarGym_Floor, 0
	setmetatile 28, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor2:: @ 816E157
	setmetatile 17,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
	setmetatile 18,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
	setmetatile 17,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
	setmetatile 18,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
	setmetatile 17, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile 18, 10, METATILE_CinnabarGym_Floor, 0
	setmetatile 19, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor3:: @ 816E197
	setmetatile 17, 15, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
	setmetatile 18, 15, METATILE_CinnabarGym_Floor_WallRightCorner, 0
	setmetatile 17, 16, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
	setmetatile 18, 16, METATILE_CinnabarGym_Floor_WallRightEdge, 0
	setmetatile 17, 17, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile 18, 17, METATILE_CinnabarGym_Floor, 0
	setmetatile 19, 17, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor4:: @ 816E1D7
	setmetatile 11, 21, METATILE_CinnabarGym_Wall_RetractedBarrier, 1
	setmetatile 11, 22, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile 11, 23, METATILE_CinnabarGym_Floor, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor5:: @ 816E1F3
	setmetatile  5, 16, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
	setmetatile  6, 16, METATILE_CinnabarGym_Floor_WallRightCorner, 0
	setmetatile  5, 17, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
	setmetatile  6, 17, METATILE_CinnabarGym_Floor_WallRightEdge, 0
	setmetatile  5, 18, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile  6, 18, METATILE_CinnabarGym_Floor, 0
	setmetatile  7, 18, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor6:: @ 816E233
	setmetatile  5,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
	setmetatile  6,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
	setmetatile  5,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
	setmetatile  6,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
	setmetatile  5, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
	setmetatile  6, 10, METATILE_CinnabarGym_Floor, 0
	setmetatile  7, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
	return
