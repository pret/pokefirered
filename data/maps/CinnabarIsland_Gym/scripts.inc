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
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_2, EventScript_16DABC
	release
	end

EventScript_16DABC:: @ 816DABC
	call EventScript_16DD31
	return

CinnabarIsland_Gym_EventScript_Derek:: @ 816DAC2
	trainerbattle_single TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekIntro, CinnabarIsland_Gym_Text_DerekDefeat, CinnabarIsland_Gym_EventScript_DefeatedDerek
	famechecker FAMECHECKER_BLAINE, 2
	msgbox CinnabarIsland_Gym_Text_DerekPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedDerek:: @ 816DAEA
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_4, EventScript_16DAF5
	release
	end

EventScript_16DAF5:: @ 816DAF5
	call EventScript_16DEE6
	return

CinnabarIsland_Gym_EventScript_Zac:: @ 816DAFB
	trainerbattle_single TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacIntro, CinnabarIsland_Gym_Text_ZacDefeat, EventScript_16DB16
	msgbox CinnabarIsland_Gym_Text_ZacPostBattle, MSGBOX_AUTOCLOSE
	end

EventScript_16DB16:: @ 816DB16
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_6, EventScript_16DB21
	release
	end

EventScript_16DB21:: @ 816DB21
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	return

CinnabarIsland_Gym_EventScript_Quinn:: @ 816DB27
	trainerbattle_single TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnIntro, CinnabarIsland_Gym_Text_QuinnDefeat, CinnabarIsland_Gym_EventScript_DefeatedQuinn
	msgbox CinnabarIsland_Gym_Text_QuinnPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedQuinn:: @ 816DB42
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_1, EventScript_16DB4D
	release
	end

EventScript_16DB4D:: @ 816DB4D
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
	return

CinnabarIsland_Gym_EventScript_Ramon:: @ 816DB53
	trainerbattle_single TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonIntro, CinnabarIsland_Gym_Text_RamonDefeat, CinnabarIsland_Gym_EventScript_DefeatedRamon
	msgbox CinnabarIsland_Gym_Text_RamonPostBattle, MSGBOX_AUTOCLOSE
	end

CinnabarIsland_Gym_EventScript_DefeatedRamon:: @ 816DB6E
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_3, EventScript_16DB79
	release
	end

EventScript_16DB79:: @ 816DB79
	call EventScript_16DE0F
	return

CinnabarIsland_Gym_EventScript_Dusty:: @ 816DB7F
	trainerbattle_single TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyIntro, CinnabarIsland_Gym_Text_DustyDefeat, EventScript_16DB9A
	msgbox CinnabarIsland_Gym_Text_DustyPostBattle, MSGBOX_AUTOCLOSE
	end

EventScript_16DB9A:: @ 816DB9A
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_5, EventScript_16DBA5
	release
	end

EventScript_16DBA5:: @ 816DBA5
	call EventScript_16DFBD
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
	playfanfare MUS_FANFA1
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
	playse SE_KI_GASYAN
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
	call_if_eq EventScript_16DCB4
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DCC6
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_QuinnIntro
	trainerbattle_no_intro TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
	releaseall
	end

EventScript_16DCB4:: @ 816DCB4
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 1, Movement_16DCD8
	waitmovement 0
	return

EventScript_16DCC6:: @ 816DCC6
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 1, Movement_16DCDB
	waitmovement 0
	return

Movement_16DCD8:: @ 816DCD8
	walk_left
	walk_left
	step_end

Movement_16DCDB:: @ 816DCDB
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_16DCDD:: @ 816DCDD
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16DCF5
	end

CinnabarIsland_Gym_EventScript_16DCE9:: @ 816DCE9
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16DCF5
	end

EventScript_16DCF5:: @ 816DCF5
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion2, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16DD41
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16DD1C
	end

EventScript_16DD1C:: @ 816DD1C
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DD31
	releaseall
	end

EventScript_16DD31:: @ 816DD31
	playse SE_KI_GASYAN
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor2
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_2
	return

EventScript_16DD41:: @ 816DD41
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_AVERY, EventScript_16DD51
	releaseall
	end

EventScript_16DD51:: @ 816DD51
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DD8B
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DD9D
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_AveryIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_Text_AveryDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DD31
	releaseall
	end

EventScript_16DD8B:: @ 816DD8B
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16DDB7
	applymovement 3, Movement_16DDAF
	waitmovement 0
	return

EventScript_16DD9D:: @ 816DD9D
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16DDB7
	applymovement 3, Movement_16DDB3
	waitmovement 0
	return

Movement_16DDAF:: @ 816DDAF
	walk_up
	walk_up
	walk_left
	step_end

Movement_16DDB3:: @ 816DDB3
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

Movement_16DDB7:: @ 816DDB7
	delay_16
	delay_16
	walk_in_place_fastest_right
	step_end

CinnabarIsland_Gym_EventScript_16DDBB:: @ 816DDBB
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16DDD3
	end

CinnabarIsland_Gym_EventScript_16DDC7:: @ 816DDC7
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16DDD3
	end

EventScript_16DDD3:: @ 816DDD3
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion3, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16DE1F
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16DDFA
	end

EventScript_16DDFA:: @ 816DDFA
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DE0F
	releaseall
	end

EventScript_16DE0F:: @ 816DE0F
	playse SE_KI_GASYAN
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor3
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_3
	return

EventScript_16DE1F:: @ 816DE1F
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_BURGLAR_RAMON, EventScript_16DE2F
	releaseall
	end

EventScript_16DE2F:: @ 816DE2F
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DE69
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DE7B
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_RamonIntro
	trainerbattle_no_intro TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DE0F
	releaseall
	end

EventScript_16DE69:: @ 816DE69
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 4, Movement_16DE8D
	waitmovement 0
	return

EventScript_16DE7B:: @ 816DE7B
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 4, Movement_16DE90
	waitmovement 0
	return

Movement_16DE8D:: @ 816DE8D
	walk_left
	walk_left
	step_end

Movement_16DE90:: @ 816DE90
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_16DE92:: @ 816DE92
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16DEAA
	end

CinnabarIsland_Gym_EventScript_16DE9E:: @ 816DE9E
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16DEAA
	end

EventScript_16DEAA:: @ 816DEAA
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion4, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16DEF6
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16DED1
	end

EventScript_16DED1:: @ 816DED1
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DEE6
	releaseall
	end

EventScript_16DEE6:: @ 816DEE6
	playse SE_KI_GASYAN
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor4
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_4
	return

EventScript_16DEF6:: @ 816DEF6
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_DEREK, EventScript_16DF06
	releaseall
	end

EventScript_16DF06:: @ 816DF06
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DF40
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DF52
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_DerekIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DEE6
	releaseall
	end

EventScript_16DF40:: @ 816DF40
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 5, Movement_16DF64
	waitmovement 0
	return

EventScript_16DF52:: @ 816DF52
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 5, Movement_16DF67
	waitmovement 0
	return

Movement_16DF64:: @ 816DF64
	walk_left
	walk_left
	step_end

Movement_16DF67:: @ 816DF67
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_16DF69:: @ 816DF69
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16DF81
	end

CinnabarIsland_Gym_EventScript_16DF75:: @ 816DF75
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16DF81
	end

EventScript_16DF81:: @ 816DF81
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion5, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16DFA8
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16DFCD
	end

EventScript_16DFA8:: @ 816DFA8
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DFBD
	releaseall
	end

EventScript_16DFBD:: @ 816DFBD
	playse SE_KI_GASYAN
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor5
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_5
	return

EventScript_16DFCD:: @ 816DFCD
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_BURGLAR_DUSTY, EventScript_16DFDD
	releaseall
	end

EventScript_16DFDD:: @ 816DFDD
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16E017
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16E029
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_DustyIntro
	trainerbattle_no_intro TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call EventScript_16DFBD
	releaseall
	end

EventScript_16E017:: @ 816E017
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 6, Movement_16E03B
	waitmovement 0
	return

EventScript_16E029:: @ 816E029
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 6, Movement_16E03E
	waitmovement 0
	return

Movement_16E03B:: @ 816E03B
	walk_left
	walk_left
	step_end

Movement_16E03E:: @ 816E03E
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_16E040:: @ 816E040
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16E058
	end

CinnabarIsland_Gym_EventScript_16E04C:: @ 816E04C
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16E058
	end

EventScript_16E058:: @ 816E058
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
	msgbox CinnabarIsland_Gym_Text_QuizQuestion6, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16E0A4
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16E07F
	end

EventScript_16E07F:: @ 816E07F
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	releaseall
	end

CinnabarIsland_Gym_EventScript_Quiz6Complete:: @ 816E094
	playse SE_KI_GASYAN
	waitse
	call CinnabarIsland_Gym_EventScript_OpenDoor6
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_6
	return

EventScript_16E0A4:: @ 816E0A4
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
	goto_if_not_defeated TRAINER_SUPER_NERD_ZAC, EventScript_16E0B4
	releaseall
	end

EventScript_16E0B4:: @ 816E0B4
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16E0EE
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16E100
	textcolor 0
	msgbox CinnabarIsland_Gym_Text_ZacIntro
	trainerbattle_no_intro TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacDefeat
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
	releaseall
	end

EventScript_16E0EE:: @ 816E0EE
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 7, Movement_16E112
	waitmovement 0
	return

EventScript_16E100:: @ 816E100
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	applymovement 7, Movement_16E115
	waitmovement 0
	return

Movement_16E112:: @ 816E112
	walk_left
	walk_left
	step_end

Movement_16E115:: @ 816E115
	walk_left
	step_end

CinnabarIsland_Gym_EventScript_OpenDoor1:: @ 816E117
	setmetatile 26, 8, 711, 0
	setmetatile 27, 8, 710, 0
	setmetatile 26, 9, 719, 0
	setmetatile 27, 9, 718, 0
	setmetatile 26, 10, 649, 0
	setmetatile 27, 10, 641, 0
	setmetatile 28, 10, 642, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor2:: @ 816E157
	setmetatile 17, 8, 711, 0
	setmetatile 18, 8, 710, 0
	setmetatile 17, 9, 719, 0
	setmetatile 18, 9, 718, 0
	setmetatile 17, 10, 649, 0
	setmetatile 18, 10, 641, 0
	setmetatile 19, 10, 642, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor3:: @ 816E197
	setmetatile 17, 15, 711, 0
	setmetatile 18, 15, 710, 0
	setmetatile 17, 16, 719, 0
	setmetatile 18, 16, 718, 0
	setmetatile 17, 17, 649, 0
	setmetatile 18, 17, 641, 0
	setmetatile 19, 17, 642, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor4:: @ 816E1D7
	setmetatile 11, 21, 721, 1
	setmetatile 11, 22, 649, 0
	setmetatile 11, 23, 641, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor5:: @ 816E1F3
	setmetatile 5, 16, 711, 0
	setmetatile 6, 16, 710, 0
	setmetatile 5, 17, 719, 0
	setmetatile 6, 17, 718, 0
	setmetatile 5, 18, 649, 0
	setmetatile 6, 18, 641, 0
	setmetatile 7, 18, 642, 0
	return

CinnabarIsland_Gym_EventScript_OpenDoor6:: @ 816E233
	setmetatile 5, 8, 711, 0
	setmetatile 6, 8, 710, 0
	setmetatile 5, 9, 719, 0
	setmetatile 6, 9, 718, 0
	setmetatile 5, 10, 649, 0
	setmetatile 6, 10, 641, 0
	setmetatile 7, 10, 642, 0
	return
