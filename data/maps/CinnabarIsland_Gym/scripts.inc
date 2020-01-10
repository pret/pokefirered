CinnabarIsland_Gym_MapScripts:: @ 816D94B
	map_script MAP_SCRIPT_ON_LOAD, CinnabarIsland_Gym_OnLoad
	.byte 0

CinnabarIsland_Gym_OnLoad:: @ 816D951
	goto_if_set FLAG_DEFEATED_BLAINE, EventScript_16D991
	call_if_set FLAG_CINNABAR_GYM_QUIZ_1, EventScript_16D9B0
	call_if_set FLAG_CINNABAR_GYM_QUIZ_2, EventScript_16D9B6
	call_if_set FLAG_CINNABAR_GYM_QUIZ_3, EventScript_16D9BC
	call_if_set FLAG_CINNABAR_GYM_QUIZ_4, EventScript_16D9C2
	call_if_set FLAG_CINNABAR_GYM_QUIZ_5, EventScript_16D9C8
	call_if_set FLAG_CINNABAR_GYM_QUIZ_6, EventScript_16D9CE
	end

EventScript_16D991:: @ 816D991
	call EventScript_16E117
	call EventScript_16E157
	call EventScript_16E197
	call EventScript_16E1D7
	call EventScript_16E1F3
	call EventScript_16E233
	end

EventScript_16D9B0:: @ 816D9B0
	call EventScript_16E117
	return

EventScript_16D9B6:: @ 816D9B6
	call EventScript_16E157
	return

EventScript_16D9BC:: @ 816D9BC
	call EventScript_16E197
	return

EventScript_16D9C2:: @ 816D9C2
	call EventScript_16E1D7
	return

EventScript_16D9C8:: @ 816D9C8
	call EventScript_16E1F3
	return

EventScript_16D9CE:: @ 816D9CE
	call EventScript_16E233
	return

CinnabarIsland_Gym_EventScript_16D9D4:: @ 816D9D4
	famechecker FAMECHECKER_BLAINE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_BLAINE, Text_199543, Text_1995FA, EventScript_16DA06, NO_MUSIC
	goto_if_unset FLAG_GOT_TM38_FROM_BLAINE, EventScript_16DA34
	msgbox gUnknown_819971D
	release
	end

EventScript_16DA06:: @ 816DA06
	famechecker FAMECHECKER_BLAINE, 1
	setflag FLAG_DEFEATED_BLAINE
	setflag FLAG_BADGE07_GET
	setrespawn SPAWN_CINNABAR_ISLAND
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 1
	clearflag FLAG_HIDE_CINNABAR_BILL
	set_gym_trainers 7
	goto EventScript_16DA34
	end

EventScript_16DA34:: @ 816DA34
	msgbox gUnknown_819969E
	checkitemspace ITEM_TM38, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DA75
	giveitem_msg gUnknown_81996FF, ITEM_TM38
	setflag FLAG_GOT_TM38_FROM_BLAINE
	msgbox gUnknown_8199652
	release
	end

EventScript_16DA75:: @ 816DA75
	msgbox gUnknown_8199789
	release
	end

CinnabarIsland_Gym_EventScript_16DA7F:: @ 816DA7F
	trainerbattle_single TRAINER_SUPER_NERD_ERIK, Text_1997A5, Text_1997D6
	msgbox gUnknown_81997EA, 6
	end

CinnabarIsland_Gym_EventScript_16DA96:: @ 816DA96
	trainerbattle_single TRAINER_SUPER_NERD_AVERY, Text_1998BD, Text_1998ED, EventScript_16DAB1
	msgbox gUnknown_8199911, 6
	end

EventScript_16DAB1:: @ 816DAB1
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_2, EventScript_16DABC
	release
	end

EventScript_16DABC:: @ 816DABC
	call EventScript_16DD31
	return

CinnabarIsland_Gym_EventScript_16DAC2:: @ 816DAC2
	trainerbattle_single TRAINER_SUPER_NERD_DEREK, Text_1999B7, Text_1999DB, EventScript_16DAEA
	famechecker FAMECHECKER_BLAINE, 2
	msgbox gUnknown_81999DF, 6
	end

EventScript_16DAEA:: @ 816DAEA
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_4, EventScript_16DAF5
	release
	end

EventScript_16DAF5:: @ 816DAF5
	call EventScript_16DEE6
	return

CinnabarIsland_Gym_EventScript_16DAFB:: @ 816DAFB
	trainerbattle_single TRAINER_SUPER_NERD_ZAC, Text_199AFC, Text_199B16, EventScript_16DB16
	msgbox gUnknown_8199B27, 6
	end

EventScript_16DB16:: @ 816DB16
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_6, EventScript_16DB21
	release
	end

EventScript_16DB21:: @ 816DB21
	call EventScript_16E094
	return

CinnabarIsland_Gym_EventScript_16DB27:: @ 816DB27
	trainerbattle_single TRAINER_BURGLAR_QUINN, Text_19983F, Text_199870, EventScript_16DB42
	msgbox gUnknown_819987D, 6
	end

EventScript_16DB42:: @ 816DB42
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_1, EventScript_16DB4D
	release
	end

EventScript_16DB4D:: @ 816DB4D
	call EventScript_16DC58
	return

CinnabarIsland_Gym_EventScript_16DB53:: @ 816DB53
	trainerbattle_single TRAINER_BURGLAR_RAMON, Text_199948, Text_199973, EventScript_16DB6E
	msgbox gUnknown_8199986, 6
	end

EventScript_16DB6E:: @ 816DB6E
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_3, EventScript_16DB79
	release
	end

EventScript_16DB79:: @ 816DB79
	call EventScript_16DE0F
	return

CinnabarIsland_Gym_EventScript_16DB7F:: @ 816DB7F
	trainerbattle_single TRAINER_BURGLAR_DUSTY, Text_199A7F, Text_199AB9, EventScript_16DB9A
	msgbox gUnknown_8199AC9, 6
	end

EventScript_16DB9A:: @ 816DB9A
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_5, EventScript_16DBA5
	release
	end

EventScript_16DBA5:: @ 816DBA5
	call EventScript_16DFBD
	return

CinnabarIsland_Gym_EventScript_16DBAB:: @ 816DBAB
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_BLAINE, EventScript_16DBC0
	msgbox gUnknown_8199B81
	release
	end

EventScript_16DBC0:: @ 816DBC0
	msgbox gUnknown_8199C0C
	release
	end

CinnabarIsland_Gym_EventScript_16DBCA:: @ 816DBCA
	lockall
	goto_if_set FLAG_BADGE07_GET, EventScript_16DBDE
	msgbox gUnknown_8199C29
	releaseall
	end

EventScript_16DBDE:: @ 816DBDE
	msgbox gUnknown_8199C62
	releaseall
	end

CinnabarIsland_Gym_EventScript_16DBE8:: @ 816DBE8
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_16DC00
	end

CinnabarIsland_Gym_EventScript_16DBF4:: @ 816DBF4
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_16DC00
	end

EventScript_16DC00:: @ 816DC00
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199D5A, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16DC43
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DC6A
	end

EventScript_16DC27:: @ 816DC27
	playfanfare MUS_FANFA1
	waitfanfare
	msgbox gUnknown_8199E4F
	return

EventScript_16DC34:: @ 816DC34
	waitse
	playse SE_BOO
	waitse
	msgbox gUnknown_8199E79
	closemessage
	return

EventScript_16DC43:: @ 816DC43
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, EventScript_16DC68
	call EventScript_16DC58
	releaseall
	end

EventScript_16DC58:: @ 816DC58
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E117
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_1
	return

EventScript_16DC68:: @ 816DC68
	releaseall
	end

EventScript_16DC6A:: @ 816DC6A
	call EventScript_16DC34
	checktrainerflag TRAINER_BURGLAR_QUINN
	goto_if_lt EventScript_16DC7A
	releaseall
	end

EventScript_16DC7A:: @ 816DC7A
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DCB4
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DCC6
	textcolor 0
	msgbox gUnknown_819983F
	trainerbattle_no_intro TRAINER_BURGLAR_QUINN, Text_199870
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, EventScript_16DC68
	call EventScript_16DC58
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
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199D79, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16DD41
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DD1C
	end

EventScript_16DD1C:: @ 816DD1C
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, EventScript_16DC68
	call EventScript_16DD31
	releaseall
	end

EventScript_16DD31:: @ 816DD31
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E157
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_2
	return

EventScript_16DD41:: @ 816DD41
	call EventScript_16DC34
	checktrainerflag TRAINER_SUPER_NERD_AVERY
	goto_if_lt EventScript_16DD51
	releaseall
	end

EventScript_16DD51:: @ 816DD51
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DD8B
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DD9D
	textcolor 0
	msgbox gUnknown_81998BD
	trainerbattle_no_intro TRAINER_SUPER_NERD_AVERY, Text_1998ED
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, EventScript_16DC68
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
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199DA9, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16DE1F
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DDFA
	end

EventScript_16DDFA:: @ 816DDFA
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, EventScript_16DC68
	call EventScript_16DE0F
	releaseall
	end

EventScript_16DE0F:: @ 816DE0F
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E197
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_3
	return

EventScript_16DE1F:: @ 816DE1F
	call EventScript_16DC34
	checktrainerflag TRAINER_BURGLAR_RAMON
	goto_if_lt EventScript_16DE2F
	releaseall
	end

EventScript_16DE2F:: @ 816DE2F
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DE69
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DE7B
	textcolor 0
	msgbox gUnknown_8199948
	trainerbattle_no_intro TRAINER_BURGLAR_RAMON, Text_199973
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, EventScript_16DC68
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
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199DC6, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16DEF6
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DED1
	end

EventScript_16DED1:: @ 816DED1
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, EventScript_16DC68
	call EventScript_16DEE6
	releaseall
	end

EventScript_16DEE6:: @ 816DEE6
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E1D7
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_4
	return

EventScript_16DEF6:: @ 816DEF6
	call EventScript_16DC34
	checktrainerflag TRAINER_SUPER_NERD_DEREK
	goto_if_lt EventScript_16DF06
	releaseall
	end

EventScript_16DF06:: @ 816DF06
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16DF40
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16DF52
	textcolor 0
	msgbox gUnknown_81999B7
	trainerbattle_no_intro TRAINER_SUPER_NERD_DEREK, Text_1999DB
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, EventScript_16DC68
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
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199E00, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16DFA8
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16DFCD
	end

EventScript_16DFA8:: @ 816DFA8
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, EventScript_16DC68
	call EventScript_16DFBD
	releaseall
	end

EventScript_16DFBD:: @ 816DFBD
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E1F3
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_5
	return

EventScript_16DFCD:: @ 816DFCD
	call EventScript_16DC34
	checktrainerflag TRAINER_BURGLAR_DUSTY
	goto_if_lt EventScript_16DFDD
	releaseall
	end

EventScript_16DFDD:: @ 816DFDD
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16E017
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16E029
	textcolor 0
	msgbox gUnknown_8199A7F
	trainerbattle_no_intro TRAINER_BURGLAR_DUSTY, Text_199AB9
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, EventScript_16DC68
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
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199E36, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16E0A4
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16E07F
	end

EventScript_16E07F:: @ 816E07F
	call EventScript_16DC27
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, EventScript_16DC68
	call EventScript_16E094
	releaseall
	end

EventScript_16E094:: @ 816E094
	playse SE_KI_GASYAN
	waitse
	call EventScript_16E233
	special DrawWholeMapView
	setflag FLAG_CINNABAR_GYM_QUIZ_6
	return

EventScript_16E0A4:: @ 816E0A4
	call EventScript_16DC34
	checktrainerflag TRAINER_SUPER_NERD_ZAC
	goto_if_lt EventScript_16E0B4
	releaseall
	end

EventScript_16E0B4:: @ 816E0B4
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_16E0EE
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_16E100
	textcolor 0
	msgbox gUnknown_8199AFC
	trainerbattle_no_intro TRAINER_SUPER_NERD_ZAC, Text_199B16
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, EventScript_16DC68
	call EventScript_16E094
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

EventScript_16E117:: @ 816E117
	setmetatile 26, 8, 711, 0
	setmetatile 27, 8, 710, 0
	setmetatile 26, 9, 719, 0
	setmetatile 27, 9, 718, 0
	setmetatile 26, 10, 649, 0
	setmetatile 27, 10, 641, 0
	setmetatile 28, 10, 642, 0
	return

EventScript_16E157:: @ 816E157
	setmetatile 17, 8, 711, 0
	setmetatile 18, 8, 710, 0
	setmetatile 17, 9, 719, 0
	setmetatile 18, 9, 718, 0
	setmetatile 17, 10, 649, 0
	setmetatile 18, 10, 641, 0
	setmetatile 19, 10, 642, 0
	return

EventScript_16E197:: @ 816E197
	setmetatile 17, 15, 711, 0
	setmetatile 18, 15, 710, 0
	setmetatile 17, 16, 719, 0
	setmetatile 18, 16, 718, 0
	setmetatile 17, 17, 649, 0
	setmetatile 18, 17, 641, 0
	setmetatile 19, 17, 642, 0
	return

EventScript_16E1D7:: @ 816E1D7
	setmetatile 11, 21, 721, 1
	setmetatile 11, 22, 649, 0
	setmetatile 11, 23, 641, 0
	return

EventScript_16E1F3:: @ 816E1F3
	setmetatile 5, 16, 711, 0
	setmetatile 6, 16, 710, 0
	setmetatile 5, 17, 719, 0
	setmetatile 6, 17, 718, 0
	setmetatile 5, 18, 649, 0
	setmetatile 6, 18, 641, 0
	setmetatile 7, 18, 642, 0
	return

EventScript_16E233:: @ 816E233
	setmetatile 5, 8, 711, 0
	setmetatile 6, 8, 710, 0
	setmetatile 5, 9, 719, 0
	setmetatile 6, 9, 718, 0
	setmetatile 5, 10, 649, 0
	setmetatile 6, 10, 641, 0
	setmetatile 7, 10, 642, 0
	return
