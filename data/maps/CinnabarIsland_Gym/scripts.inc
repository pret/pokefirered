CinnabarIsland_Gym_MapScripts:: @ 816D94B
	map_script 1, CinnabarIsland_Gym_MapScript1_16D951
	.byte 0

CinnabarIsland_Gym_MapScript1_16D951:: @ 816D951
	checkflag FLAG_DEFEATED_BLAINE
	goto_if TRUE, EventScript_16D991
	checkflag FLAG_CINNABAR_GYM_QUIZ_1
	call_if TRUE, EventScript_16D9B0
	checkflag FLAG_CINNABAR_GYM_QUIZ_2
	call_if TRUE, EventScript_16D9B6
	checkflag FLAG_CINNABAR_GYM_QUIZ_3
	call_if TRUE, EventScript_16D9BC
	checkflag FLAG_CINNABAR_GYM_QUIZ_4
	call_if TRUE, EventScript_16D9C2
	checkflag FLAG_CINNABAR_GYM_QUIZ_5
	call_if TRUE, EventScript_16D9C8
	checkflag FLAG_CINNABAR_GYM_QUIZ_6
	call_if TRUE, EventScript_16D9CE
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
	trainerbattle 1, TRAINER_LEADER_BLAINE, 0, Text_199543, Text_1995FA, EventScript_16DA06
	checkflag FLAG_GOT_TM38_FROM_BLAINE
	goto_if FALSE, EventScript_16DA34
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
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DA75
	additem ITEM_TM38, 1
	giveitemfanfaremsg gUnknown_81996FF, ITEM_TM38
	setflag FLAG_GOT_TM38_FROM_BLAINE
	msgbox gUnknown_8199652
	release
	end

EventScript_16DA75:: @ 816DA75
	msgbox gUnknown_8199789
	release
	end

CinnabarIsland_Gym_EventScript_16DA7F:: @ 816DA7F
	trainerbattle 0, TRAINER_SUPER_NERD_ERIK, 0, Text_1997A5, Text_1997D6
	msgbox gUnknown_81997EA, 6
	end

CinnabarIsland_Gym_EventScript_16DA96:: @ 816DA96
	trainerbattle 2, TRAINER_SUPER_NERD_AVERY, 0, Text_1998BD, Text_1998ED, EventScript_16DAB1
	msgbox gUnknown_8199911, 6
	end

EventScript_16DAB1:: @ 816DAB1
	checkflag FLAG_CINNABAR_GYM_QUIZ_2
	call_if FALSE, EventScript_16DABC
	release
	end

EventScript_16DABC:: @ 816DABC
	call EventScript_16DD31
	return

CinnabarIsland_Gym_EventScript_16DAC2:: @ 816DAC2
	trainerbattle 2, TRAINER_SUPER_NERD_DEREK, 0, Text_1999B7, Text_1999DB, EventScript_16DAEA
	famechecker FAMECHECKER_BLAINE, 2
	msgbox gUnknown_81999DF, 6
	end

EventScript_16DAEA:: @ 816DAEA
	checkflag FLAG_CINNABAR_GYM_QUIZ_4
	call_if FALSE, EventScript_16DAF5
	release
	end

EventScript_16DAF5:: @ 816DAF5
	call EventScript_16DEE6
	return

CinnabarIsland_Gym_EventScript_16DAFB:: @ 816DAFB
	trainerbattle 2, TRAINER_SUPER_NERD_ZAC, 0, Text_199AFC, Text_199B16, EventScript_16DB16
	msgbox gUnknown_8199B27, 6
	end

EventScript_16DB16:: @ 816DB16
	checkflag FLAG_CINNABAR_GYM_QUIZ_6
	call_if FALSE, EventScript_16DB21
	release
	end

EventScript_16DB21:: @ 816DB21
	call EventScript_16E094
	return

CinnabarIsland_Gym_EventScript_16DB27:: @ 816DB27
	trainerbattle 2, TRAINER_BURGLAR_QUINN, 0, Text_19983F, Text_199870, EventScript_16DB42
	msgbox gUnknown_819987D, 6
	end

EventScript_16DB42:: @ 816DB42
	checkflag FLAG_CINNABAR_GYM_QUIZ_1
	call_if FALSE, EventScript_16DB4D
	release
	end

EventScript_16DB4D:: @ 816DB4D
	call EventScript_16DC58
	return

CinnabarIsland_Gym_EventScript_16DB53:: @ 816DB53
	trainerbattle 2, TRAINER_BURGLAR_RAMON, 0, Text_199948, Text_199973, EventScript_16DB6E
	msgbox gUnknown_8199986, 6
	end

EventScript_16DB6E:: @ 816DB6E
	checkflag FLAG_CINNABAR_GYM_QUIZ_3
	call_if FALSE, EventScript_16DB79
	release
	end

EventScript_16DB79:: @ 816DB79
	call EventScript_16DE0F
	return

CinnabarIsland_Gym_EventScript_16DB7F:: @ 816DB7F
	trainerbattle 2, TRAINER_BURGLAR_DUSTY, 0, Text_199A7F, Text_199AB9, EventScript_16DB9A
	msgbox gUnknown_8199AC9, 6
	end

EventScript_16DB9A:: @ 816DB9A
	checkflag FLAG_CINNABAR_GYM_QUIZ_5
	call_if FALSE, EventScript_16DBA5
	release
	end

EventScript_16DBA5:: @ 816DBA5
	call EventScript_16DFBD
	return

CinnabarIsland_Gym_EventScript_16DBAB:: @ 816DBAB
	lock
	faceplayer
	checkflag FLAG_DEFEATED_BLAINE
	goto_if TRUE, EventScript_16DBC0
	msgbox gUnknown_8199B81
	release
	end

EventScript_16DBC0:: @ 816DBC0
	msgbox gUnknown_8199C0C
	release
	end

CinnabarIsland_Gym_EventScript_16DBCA:: @ 816DBCA
	lockall
	checkflag FLAG_BADGE07_GET
	goto_if TRUE, EventScript_16DBDE
	msgbox gUnknown_8199C29
	releaseall
	end

EventScript_16DBDE:: @ 816DBDE
	msgbox gUnknown_8199C62
	releaseall
	end

CinnabarIsland_Gym_EventScript_16DBE8:: @ 816DBE8
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16DC00
	end

CinnabarIsland_Gym_EventScript_16DBF4:: @ 816DBF4
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16DC00
	end

EventScript_16DC00:: @ 816DC00
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199D5A, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16DC43
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DC6A
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
	checkflag FLAG_CINNABAR_GYM_QUIZ_1
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16DC7A
	releaseall
	end

EventScript_16DC7A:: @ 816DC7A
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16DCB4
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16DCC6
	textcolor 0
	msgbox gUnknown_819983F
	trainerbattle 3, TRAINER_BURGLAR_QUINN, 0, Text_199870
	checkflag FLAG_CINNABAR_GYM_QUIZ_1
	goto_if TRUE, EventScript_16DC68
	call EventScript_16DC58
	releaseall
	end

EventScript_16DCB4:: @ 816DCB4
	applymovement 255, Movement_1A75EB
	applymovement 1, Movement_16DCD8
	waitmovement 0
	return

EventScript_16DCC6:: @ 816DCC6
	applymovement 255, Movement_1A75EB
	applymovement 1, Movement_16DCDB
	waitmovement 0
	return

Movement_16DCD8:: @ 816DCD8
	step_12
	step_12
	step_end

Movement_16DCDB:: @ 816DCDB
	step_12
	step_end

CinnabarIsland_Gym_EventScript_16DCDD:: @ 816DCDD
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16DCF5
	end

CinnabarIsland_Gym_EventScript_16DCE9:: @ 816DCE9
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16DCF5
	end

EventScript_16DCF5:: @ 816DCF5
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199D79, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16DD41
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DD1C
	end

EventScript_16DD1C:: @ 816DD1C
	call EventScript_16DC27
	checkflag FLAG_CINNABAR_GYM_QUIZ_2
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16DD51
	releaseall
	end

EventScript_16DD51:: @ 816DD51
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16DD8B
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16DD9D
	textcolor 0
	msgbox gUnknown_81998BD
	trainerbattle 3, TRAINER_SUPER_NERD_AVERY, 0, Text_1998ED
	checkflag FLAG_CINNABAR_GYM_QUIZ_2
	goto_if TRUE, EventScript_16DC68
	call EventScript_16DD31
	releaseall
	end

EventScript_16DD8B:: @ 816DD8B
	applymovement 255, Movement_16DDB7
	applymovement 3, Movement_16DDAF
	waitmovement 0
	return

EventScript_16DD9D:: @ 816DD9D
	applymovement 255, Movement_16DDB7
	applymovement 3, Movement_16DDB3
	waitmovement 0
	return

Movement_16DDAF:: @ 816DDAF
	step_11
	step_11
	step_12
	step_end

Movement_16DDB3:: @ 816DDB3
	step_11
	step_11
	step_2f
	step_end

Movement_16DDB7:: @ 816DDB7
	step_1c
	step_1c
	step_30
	step_end

CinnabarIsland_Gym_EventScript_16DDBB:: @ 816DDBB
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16DDD3
	end

CinnabarIsland_Gym_EventScript_16DDC7:: @ 816DDC7
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16DDD3
	end

EventScript_16DDD3:: @ 816DDD3
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199DA9, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16DE1F
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DDFA
	end

EventScript_16DDFA:: @ 816DDFA
	call EventScript_16DC27
	checkflag FLAG_CINNABAR_GYM_QUIZ_3
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16DE2F
	releaseall
	end

EventScript_16DE2F:: @ 816DE2F
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16DE69
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16DE7B
	textcolor 0
	msgbox gUnknown_8199948
	trainerbattle 3, TRAINER_BURGLAR_RAMON, 0, Text_199973
	checkflag FLAG_CINNABAR_GYM_QUIZ_3
	goto_if TRUE, EventScript_16DC68
	call EventScript_16DE0F
	releaseall
	end

EventScript_16DE69:: @ 816DE69
	applymovement 255, Movement_1A75EB
	applymovement 4, Movement_16DE8D
	waitmovement 0
	return

EventScript_16DE7B:: @ 816DE7B
	applymovement 255, Movement_1A75EB
	applymovement 4, Movement_16DE90
	waitmovement 0
	return

Movement_16DE8D:: @ 816DE8D
	step_12
	step_12
	step_end

Movement_16DE90:: @ 816DE90
	step_12
	step_end

CinnabarIsland_Gym_EventScript_16DE92:: @ 816DE92
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16DEAA
	end

CinnabarIsland_Gym_EventScript_16DE9E:: @ 816DE9E
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16DEAA
	end

EventScript_16DEAA:: @ 816DEAA
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199DC6, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16DEF6
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DED1
	end

EventScript_16DED1:: @ 816DED1
	call EventScript_16DC27
	checkflag FLAG_CINNABAR_GYM_QUIZ_4
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16DF06
	releaseall
	end

EventScript_16DF06:: @ 816DF06
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16DF40
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16DF52
	textcolor 0
	msgbox gUnknown_81999B7
	trainerbattle 3, TRAINER_SUPER_NERD_DEREK, 0, Text_1999DB
	checkflag FLAG_CINNABAR_GYM_QUIZ_4
	goto_if TRUE, EventScript_16DC68
	call EventScript_16DEE6
	releaseall
	end

EventScript_16DF40:: @ 816DF40
	applymovement 255, Movement_1A75EB
	applymovement 5, Movement_16DF64
	waitmovement 0
	return

EventScript_16DF52:: @ 816DF52
	applymovement 255, Movement_1A75EB
	applymovement 5, Movement_16DF67
	waitmovement 0
	return

Movement_16DF64:: @ 816DF64
	step_12
	step_12
	step_end

Movement_16DF67:: @ 816DF67
	step_12
	step_end

CinnabarIsland_Gym_EventScript_16DF69:: @ 816DF69
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16DF81
	end

CinnabarIsland_Gym_EventScript_16DF75:: @ 816DF75
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16DF81
	end

EventScript_16DF81:: @ 816DF81
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199E00, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16DFA8
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16DFCD
	end

EventScript_16DFA8:: @ 816DFA8
	call EventScript_16DC27
	checkflag FLAG_CINNABAR_GYM_QUIZ_5
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16DFDD
	releaseall
	end

EventScript_16DFDD:: @ 816DFDD
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16E017
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16E029
	textcolor 0
	msgbox gUnknown_8199A7F
	trainerbattle 3, TRAINER_BURGLAR_DUSTY, 0, Text_199AB9
	checkflag FLAG_CINNABAR_GYM_QUIZ_5
	goto_if TRUE, EventScript_16DC68
	call EventScript_16DFBD
	releaseall
	end

EventScript_16E017:: @ 816E017
	applymovement 255, Movement_1A75EB
	applymovement 6, Movement_16E03B
	waitmovement 0
	return

EventScript_16E029:: @ 816E029
	applymovement 255, Movement_1A75EB
	applymovement 6, Movement_16E03E
	waitmovement 0
	return

Movement_16E03B:: @ 816E03B
	step_12
	step_12
	step_end

Movement_16E03E:: @ 816E03E
	step_12
	step_end

CinnabarIsland_Gym_EventScript_16E040:: @ 816E040
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16E058
	end

CinnabarIsland_Gym_EventScript_16E04C:: @ 816E04C
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_16E058
	end

EventScript_16E058:: @ 816E058
	msgbox gUnknown_8199C9F
	msgbox gUnknown_8199E36, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if eq, EventScript_16E0A4
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16E07F
	end

EventScript_16E07F:: @ 816E07F
	call EventScript_16DC27
	checkflag FLAG_CINNABAR_GYM_QUIZ_6
	goto_if TRUE, EventScript_16DC68
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
	goto_if lt, EventScript_16E0B4
	releaseall
	end

EventScript_16E0B4:: @ 816E0B4
	compare_var_to_value VAR_0x4001, 0
	call_if eq, EventScript_16E0EE
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_16E100
	textcolor 0
	msgbox gUnknown_8199AFC
	trainerbattle 3, TRAINER_SUPER_NERD_ZAC, 0, Text_199B16
	checkflag FLAG_CINNABAR_GYM_QUIZ_6
	goto_if TRUE, EventScript_16DC68
	call EventScript_16E094
	releaseall
	end

EventScript_16E0EE:: @ 816E0EE
	applymovement 255, Movement_1A75EB
	applymovement 7, Movement_16E112
	waitmovement 0
	return

EventScript_16E100:: @ 816E100
	applymovement 255, Movement_1A75EB
	applymovement 7, Movement_16E115
	waitmovement 0
	return

Movement_16E112:: @ 816E112
	step_12
	step_12
	step_end

Movement_16E115:: @ 816E115
	step_12
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
