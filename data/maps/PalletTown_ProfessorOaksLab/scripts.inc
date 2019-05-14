PalletTown_ProfessorOaksLab_MapScripts:: @ 8168F7E
	map_script 3, PalletTown_ProfessorOaksLab_MapScript1_168F8E
	map_script 4, PalletTown_ProfessorOaksLab_MapScript2_168FE1
	map_script 2, PalletTown_ProfessorOaksLab_MapScript3_168FF0
	.byte 0

PalletTown_ProfessorOaksLab_MapScript1_168F8E:: @ 8168F8E
	setflag FLAG_0x2CF
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1
	call_if 1, EventScript_168FC6
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 7
	call_if 1, EventScript_168FD5
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8
	call_if 1, EventScript_168FC0
	checkflag FLAG_0x247
	call_if 1, EventScript_168FBC
	end

EventScript_168FBC:: @ 8168FBC
	setflag FLAG_0x24F
	return

EventScript_168FC0:: @ 8168FC0
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 9
	return

EventScript_168FC6:: @ 8168FC6
	setobjectxyperm 4, 6, 11
	setobjectmovementtype 4, 7
	savebgm BGM_FRLG_PROF_OAK
	return

EventScript_168FD5:: @ 8168FD5
	setobjectxyperm 4, 6, 11
	setobjectmovementtype 4, 7
	return

PalletTown_ProfessorOaksLab_MapScript2_168FE1:: @ 8168FE1
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, EventScript_168FEB
	.2byte 0

EventScript_168FEB:: @ 8168FEB
	turnobject 255, 2
	end

PalletTown_ProfessorOaksLab_MapScript3_168FF0:: @ 8168FF0
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, EventScript_16923E
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 7, EventScript_169002
	.2byte 0

EventScript_169002:: @ 8169002 
	lockall
	setvar VAR_FACING, 2
	textcolor 0
	applymovement 4, Movement_1692B0
	waitmovement 0
	removeobject 4
	setobjectxyperm 4, 6, 3
	setobjectmovementtype 4, 8
	clearflag FLAG_0x02B
	applymovement 255, Movement_1692B7
	waitmovement 0
	goto EventScript_169035
	end

EventScript_169035:: @ 8169035
	loadword 0, gUnknown_818EE60
	callstd 4
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169174
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_1691BB
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169194
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169194
	loadword 0, gUnknown_818EF59
	callstd 4
	fadedefaultbgm
	loadword 0, gUnknown_818F004
	callstd 4
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_1691DB
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_1691E6
	textcolor 3
	loadword 0, gUnknown_818F062
	callstd 4
	closemessage
	call EventScript_1A6675
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_1691F1
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_1691FC
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169215
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169227
	addobject 9
	addobject 10
	delay 30
	loadword 0, gUnknown_818F085
	callstd 4
	closemessage
	removeobject 9
	removeobject 10
	delay 30
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169845
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169850
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_16985B
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_16986D
	textcolor 3
	playfanfare BGM_FRLG_ME_KEYITEM
	message Text_18F0E8
	waitmessage
	waitfanfare
	call EventScript_1A6675
	special EnableNationalPokedex
	loadword 0, gUnknown_818F103
	callstd 4
	loadword 0, gUnknown_818F1DB
	callstd 4
	closemessage
	playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169B69
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169B7B
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169B7B
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169B7B
	removeobject 8
	fadedefaultbgm
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8
	releaseall
	end

EventScript_169174:: @ 8169174
	setobjectxyperm 8, 5, 10
	addobject 8
	playbgm BGM_FRLG_RIVAL, 0
	applymovement 255, Movement_169B94
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_169194:: @ 8169194
	setobjectxyperm 8, 6, 10
	addobject 8
	playbgm BGM_FRLG_RIVAL, 0
	applymovement 4, Movement_1A75ED
	applymovement 255, Movement_169B91
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_1691BB:: @ 81691BB
	setobjectxyperm 8, 6, 10
	addobject 8
	playbgm BGM_FRLG_RIVAL, 0
	applymovement 4, Movement_1A75ED
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_1691DB:: @ 81691DB
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

EventScript_1691E6:: @ 81691E6
	applymovement 255, Movement_1A75E7
	waitmovement 0
	return

EventScript_1691F1:: @ 81691F1
	applymovement 4, Movement_169232
	waitmovement 0
	return

EventScript_1691FC:: @ 81691FC
	applymovement 4, Movement_169238
	applymovement 255, Movement_1698C7
	applymovement 8, Movement_1698C7
	waitmovement 4
	return

EventScript_169215:: @ 8169215
	applymovement 4, Movement_169232
	applymovement 255, Movement_1698C3
	waitmovement 4
	return

EventScript_169227:: @ 8169227
	applymovement 4, Movement_169232
	waitmovement 0
	return

Movement_169232:: @ 8169232
	step_11
	step_12
	step_2e
	step_1c
	step_1a
	step_end

Movement_169238:: @ 8169238
	step_12
	step_12
	step_11
	step_1c
	step_1a
	step_end

EventScript_16923E:: @ 816923E
	lockall
	textcolor 0
	applymovement 4, Movement_1692B0
	waitmovement 0
	removeobject 4
	setobjectxyperm 4, 6, 3
	setobjectmovementtype 4, 8
	clearflag FLAG_0x02B
	applymovement 255, Movement_1692B7
	waitmovement 0
	applymovement 8, Movement_1A75E9
	waitmovement 0
	clearflag FLAG_SPECIAL_FLAG_0x4001
	savebgm SE_STOP
	fadedefaultbgm
	loadword 0, gUnknown_818DC94
	callstd 4
	closemessage
	delay 60
	loadword 0, gUnknown_818DFBC
	callstd 4
	closemessage
	delay 30
	applymovement 8, Movement_1692C0
	waitmovement 0
	loadword 0, gUnknown_818DCB9
	callstd 4
	loadword 0, gUnknown_818E0EA
	callstd 4
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	releaseall
	end

Movement_1692B0:: @ 81692B0
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1692B7:: @ 81692B7
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1692C0:: @ 81692C0
	step_26
	step_26
	step_end

PalletTown_ProfessorOaksLab_EventScript_1692C3:: @ 81692C3
	lockall
	textcolor 0
	applymovement 4, Movement_1A75F1
	waitmovement 0
	loadword 0, gUnknown_818E177
	callstd 4
	closemessage
	applymovement 255, Movement_1692E5
	waitmovement 0
	releaseall
	end

Movement_1692E5:: @ 81692E5
	step_11
	step_end

PalletTown_ProfessorOaksLab_EventScript_1692E7:: @ 81692E7
	lockall
	setvar VAR_0x4002, 1
	goto EventScript_16930B
	end

PalletTown_ProfessorOaksLab_EventScript_1692F3:: @ 81692F3
	lockall
	setvar VAR_0x4002, 2
	goto EventScript_16930B
	end

PalletTown_ProfessorOaksLab_EventScript_1692FF:: @ 81692FF
	lockall
	setvar VAR_0x4002, 3
	goto EventScript_16930B
	end

EventScript_16930B:: @ 816930B
	textcolor 0
	playbgm BGM_FRLG_RIVAL, 0
	applymovement 8, Movement_1A75ED
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	loadword 0, gUnknown_818DDA4
	callstd 4
	closemessage
	applymovement 4, Movement_1A75F1
	waitmovement 0
	compare_var_to_value VAR_STARTER_MON, 0
	goto_if 1, EventScript_1693D2
	compare_var_to_value VAR_STARTER_MON, 1
	goto_if 1, EventScript_16944D
	compare_var_to_value VAR_STARTER_MON, 2
	goto_if 1, EventScript_16935A
	end

EventScript_16935A:: @ 816935A
	compare_var_to_value VAR_0x4002, 1
	goto_if 1, EventScript_16937C
	compare_var_to_value VAR_0x4002, 2
	goto_if 1, EventScript_16938C
	compare_var_to_value VAR_0x4002, 3
	goto_if 1, EventScript_16939C
	end

EventScript_16937C:: @ 816937C
	applymovement 8, Movement_1693C0
	waitmovement 0
	goto EventScript_1693AC
	end

EventScript_16938C:: @ 816938C
	applymovement 8, Movement_1693C7
	waitmovement 0
	goto EventScript_1693AC
	end

EventScript_16939C:: @ 816939C
	applymovement 8, Movement_1693CD
	waitmovement 0
	goto EventScript_1693AC
	end

EventScript_1693AC:: @ 81693AC
	trainerbattle 9, 326, 3, Text_18DDEA, Text_18DE1A
	goto EventScript_1694C2
	end

Movement_1693C0:: @ 81693C0
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_1693C7:: @ 81693C7
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_1693CD:: @ 81693CD
	step_12
	step_12
	step_10
	step_10
	step_end

EventScript_1693D2:: @ 81693D2
	compare_var_to_value VAR_0x4002, 1
	goto_if 1, EventScript_1693F4
	compare_var_to_value VAR_0x4002, 2
	goto_if 1, EventScript_169404
	compare_var_to_value VAR_0x4002, 3
	goto_if 1, EventScript_169414
	end

EventScript_1693F4:: @ 81693F4
	applymovement 8, Movement_169438
	waitmovement 0
	goto EventScript_169424
	end

EventScript_169404:: @ 8169404
	applymovement 8, Movement_169440
	waitmovement 0
	goto EventScript_169424
	end

EventScript_169414:: @ 8169414
	applymovement 8, Movement_169447
	waitmovement 0
	goto EventScript_169424
	end

EventScript_169424:: @ 8169424
	trainerbattle 9, 328, 3, Text_18DDEA, Text_18DE1A
	goto EventScript_1694C2
	end

Movement_169438:: @ 8169438
	step_12
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_169440:: @ 8169440
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_169447:: @ 8169447
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

EventScript_16944D:: @ 816944D
	compare_var_to_value VAR_0x4002, 1
	goto_if 1, EventScript_16946F
	compare_var_to_value VAR_0x4002, 2
	goto_if 1, EventScript_16947F
	compare_var_to_value VAR_0x4002, 3
	goto_if 1, EventScript_16948F
	end

EventScript_16946F:: @ 816946F
	applymovement 8, Movement_1694B3
	waitmovement 0
	goto EventScript_16949F
	end

EventScript_16947F:: @ 816947F
	applymovement 8, Movement_1694B9
	waitmovement 0
	goto EventScript_16949F
	end

EventScript_16948F:: @ 816948F
	applymovement 8, Movement_1694BE
	waitmovement 0
	goto EventScript_16949F
	end

EventScript_16949F:: @ 816949F
	trainerbattle 9, 327, 3, Text_18DDEA, Text_18DE1A
	goto EventScript_1694C2
	end

Movement_1694B3:: @ 81694B3
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_1694B9:: @ 81694B9
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_1694BE:: @ 81694BE
	step_12
	step_10
	step_10
	step_end

EventScript_1694C2:: @ 81694C2
	special sp000_heal_pokemon
	loadword 0, gUnknown_818DE38
	callstd 4
	closemessage
	playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
	compare_var_to_value VAR_0x4002, 1
	call_if 1, EventScript_169504
	compare_var_to_value VAR_0x4002, 2
	call_if 1, EventScript_169516
	compare_var_to_value VAR_0x4002, 3
	call_if 1, EventScript_169528
	removeobject 8
	playse SE_KAIDAN
	fadedefaultbgm
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 4
	setflag FLAG_0x258
	releaseall
	end

EventScript_169504:: @ 8169504
	applymovement 8, Movement_16953A
	applymovement 255, Movement_169553
	waitmovement 8
	return

EventScript_169516:: @ 8169516
	applymovement 8, Movement_16954A
	applymovement 255, Movement_169553
	waitmovement 8
	return

EventScript_169528:: @ 8169528
	applymovement 8, Movement_169542
	applymovement 255, Movement_169559
	waitmovement 8
	return

Movement_16953A:: @ 816953A
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_1b
	step_end

Movement_169542:: @ 8169542
	step_12
	step_10
	step_10
	step_10
	step_10
	step_10
	step_1b
	step_end

Movement_16954A:: @ 816954A
	step_13
	step_10
	step_10
	step_10
	step_12
	step_10
	step_10
	step_1b
	step_end

Movement_169553:: @ 8169553
	step_1c
	step_1b
	step_30
	step_1c
	step_2d
	step_end

Movement_169559:: @ 8169559
	step_1c
	step_1b
	step_2f
	step_1c
	step_2d
	step_end

PalletTown_ProfessorOaksLab_EventScript_16955F:: @ 816955F
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 1, EventScript_16958B
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if 1, EventScript_169581
	loadword 0, gUnknown_818DC67
	callstd 4
	release
	end

EventScript_169581:: @ 8169581
	loadword 0, gUnknown_818DCE2
	callstd 4
	release
	end

EventScript_16958B:: @ 816958B
	loadword 0, gUnknown_818DD75
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169595:: @ 8169595
	lock
	faceplayer
	checkflag FLAG_0x002
	goto_if 1, EventScript_169600
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 9
	goto_if 1, EventScript_169903
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8
	goto_if 1, EventScript_169A6E
	checkflag 2092
	goto_if 1, EventScript_1699CE
	compare_var_to_value VAR_0x4052, 1
	goto_if 1, EventScript_169903
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
	goto_if 1, EventScript_1698D6
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	goto_if 4, EventScript_16961E
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 4
	goto_if 1, EventScript_169614
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 1, EventScript_16960A
	loadword 0, gUnknown_818E116
	callstd 4
	release
	end

EventScript_169600:: @ 8169600
	loadword 0, gUnknown_81A72AD
	callstd 4
	release
	end

EventScript_16960A:: @ 816960A
	loadword 0, gUnknown_818E330
	callstd 4
	release
	end

EventScript_169614:: @ 8169614
	loadword 0, gUnknown_818E3AD
	callstd 4
	release
	end

EventScript_16961E:: @ 816961E
	loadword 0, gUnknown_818E405
	callstd 4
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_18E4AF
	waitmessage
	waitfanfare
	call EventScript_1A6675
	removeitem ITEM_OAKS_PARCEL, 1
	loadword 0, gUnknown_818E4CA
	callstd 4
	playbgm BGM_FRLG_RIVAL, 0
	loadword 0, gUnknown_818DE8D
	callstd 4
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169A82
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169AC1
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169A9E
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169A9E
	fadedefaultbgm
	loadword 0, gUnknown_818DE99
	callstd 4
	closemessage
	delay 30
	playse SE_PIN
	applymovement 4, Movement_1A75DB
	waitmovement 0
	applymovement 4, Movement_1A75DD
	waitmovement 0
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169ADD
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169B14
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169AF5
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169B86
	loadword 0, gUnknown_818E508
	callstd 4
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169882
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_16988D
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_1698A6
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_1698B8
	loadword 0, gUnknown_818E536
	callstd 4
	closemessage
	delay 40
	loadword 0, gUnknown_818E5C5
	callstd 4
	closemessage
	applymovement 4, Movement_1A75E9
	waitmovement 0
	removeobject 9
	delay 10
	removeobject 10
	delay 25
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169845
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169850
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_16985B
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_16986D
	delay 10
	textcolor 3
	playfanfare BGM_FRLG_ME_KEYITEM
	message Text_18E5EA
	waitmessage
	waitfanfare
	call EventScript_1A6675
	setflag 2089
	special sub_810B810
	setvar VAR_0x407C, 1
	loadword 0, gUnknown_818E612
	callstd 4
	additem ITEM_POKE_BALL, 5
	loadword 0, gUnknown_818E6B3
	setorcopyvar VAR_0x8000, 4
	setorcopyvar VAR_0x8001, 5
	setorcopyvar VAR_0x8002, 257
	callstd 9
	loadword 0, gUnknown_818E6D0
	callstd 4
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_818E784
	callstd 4
	loadword 0, gUnknown_818DEC8
	callstd 4
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169B33
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169B45
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169B57
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169B57
	loadword 0, gUnknown_818DEF3
	callstd 4
	closemessage
	playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169B69
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169B7B
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169B7B
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169B7B
	removeobject 8
	fadedefaultbgm
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 2
	setvar VAR_0x4051, 1
	setvar VAR_0x4058, 1
	setvar VAR_0x4054, 1
	release
	end

EventScript_169845:: @ 8169845
	applymovement 4, Movement_16987C
	waitmovement 0
	return

EventScript_169850:: @ 8169850
	applymovement 4, Movement_16987F
	waitmovement 0
	return

EventScript_16985B:: @ 816985B
	applymovement 4, Movement_16987C
	applymovement 255, Movement_169878
	waitmovement 0
	return

EventScript_16986D:: @ 816986D
	applymovement 4, Movement_16987C
	waitmovement 0
	return

Movement_169878:: @ 8169878
	step_1c
	step_1b
	step_30
	step_end

Movement_16987C:: @ 816987C
	step_13
	step_10
	step_end

Movement_16987F:: @ 816987F
	step_10
	step_13
	step_end

EventScript_169882:: @ 8169882
	applymovement 4, Movement_1698CB
	waitmovement 0
	return

EventScript_16988D:: @ 816988D
	applymovement 4, Movement_1698D0
	applymovement 255, Movement_1698C7
	applymovement 8, Movement_1698C7
	waitmovement 4
	return

EventScript_1698A6:: @ 81698A6
	applymovement 4, Movement_1698CB
	applymovement 255, Movement_1698C3
	waitmovement 4
	return

EventScript_1698B8:: @ 81698B8
	applymovement 4, Movement_1698CB
	waitmovement 0
	return

Movement_1698C3:: @ 81698C3
	step_1c
	step_1b
	step_2e
	step_end

Movement_1698C7:: @ 81698C7
	step_1c
	step_1b
	step_2f
	step_end

Movement_1698CB:: @ 81698CB
	step_11
	step_12
	step_1c
	step_2d
	step_end

Movement_1698D0:: @ 81698D0
	step_12
	step_12
	step_11
	step_1c
	step_30
	step_end

EventScript_1698D6:: @ 81698D6
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, sub_80CA3D8
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	compare_var_to_value VAR_0x8009, 1
	goto_if 1, EventScript_1699FB
	goto EventScript_169903
	end

EventScript_169903:: @ 8169903
	call EventScript_1A737B
	checkflag FLAG_0x2F4
	goto_if 1, EventScript_169913
	release
	end

EventScript_169913:: @ 8169913
	closemessage
	delay 40
	message Text_1A7291
	waitmessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169964
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_16996F
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_16997A
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169985
	applymovement 4, Movement_1A75E1
	waitmovement 0
	closemessage
	delay 70
	loadword 0, gUnknown_81A72AD
	callstd 4
	setflag FLAG_0x002
	release
	end

EventScript_169964:: @ 8169964
	applymovement 4, Movement_169990
	waitmovement 0
	return

EventScript_16996F:: @ 816996F
	applymovement 4, Movement_169997
	waitmovement 0
	return

EventScript_16997A:: @ 816997A
	applymovement 4, Movement_16999E
	waitmovement 0
	return

EventScript_169985:: @ 8169985
	applymovement 4, Movement_1699A5
	waitmovement 0
	return

Movement_169990:: @ 8169990
	step_25
	step_29
	step_25
	step_25
	step_29
	step_25
	step_end

Movement_169997:: @ 8169997
	step_26
	step_2a
	step_26
	step_26
	step_2a
	step_26
	step_end

Movement_16999E:: @ 816999E
	step_27
	step_2b
	step_27
	step_27
	step_2b
	step_27
	step_end

Movement_1699A5:: @ 81699A5
	step_28
	step_2c
	step_28
	step_28
	step_2c
	step_28
	step_end

Movement_1699AC:: @ 81699AC
	step_12
	step_2d
	step_1b
	step_30
	step_1b
	step_2e
	step_1b
	step_2f
	step_1b
	step_2d
	step_1b
	step_13
	step_13
	step_2e
	step_1b
	step_2f
	step_1b
	step_2d
	step_1b
	step_30
	step_1b
	step_2e
	step_1b
	step_12
	step_end

Movement_1699C5:
	step_11
	step_10
	step_10
	step_25
	step_11
	step_1c
	step_1c
	step_1c
	step_end

EventScript_1699CE:: @ 81699CE
	call EventScript_1A737B
	closemessage
	compare_var_to_value VAR_0x8009, 60
	goto_if 0, EventScript_1699F9
	checkflag FLAG_SYS_RIBBON_GET
	goto_if 0, EventScript_1699F9
	delay 30
	loadword 0, gUnknown_818EDF5
	callstd 4
	goto EventScript_169035
	end

EventScript_1699F9:: @ 81699F9
	release
	end

EventScript_1699FB:: @ 81699FB
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	checkflag FLAG_0x24F
	goto_if 1, EventScript_169A6E
	checkflag FLAG_0x247
	goto_if 1, EventScript_169A78
	checkitem ITEM_POKE_BALL, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_169A34
	goto EventScript_169A6E
	end

EventScript_169A34:: @ 8169A34
	compare_var_to_value VAR_0x4054, 2
	goto_if 4, EventScript_169A45
	goto EventScript_169A6E
	end

EventScript_169A45:: @ 8169A45
	loadword 0, gUnknown_818E89C
	callstd 4
	additem ITEM_POKE_BALL, 5
	loadword 0, gUnknown_818E6B3
	setorcopyvar VAR_0x8000, 4
	setorcopyvar VAR_0x8001, 5
	setorcopyvar VAR_0x8002, 257
	callstd 9
	setflag FLAG_0x247
	release
	end

EventScript_169A6E:: @ 8169A6E
	loadword 0, gUnknown_818E871
	callstd 4
	release
	end

EventScript_169A78:: @ 8169A78
	loadword 0, gUnknown_818E98E
	callstd 4
	release
	end

EventScript_169A82:: @ 8169A82
	setobjectxyperm 8, 5, 10
	addobject 8
	applymovement 255, Movement_169B94
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_169A9E:: @ 8169A9E
	setobjectxyperm 8, 6, 10
	addobject 8
	applymovement 4, Movement_1A75ED
	applymovement 255, Movement_169B91
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_169AC1:: @ 8169AC1
	setobjectxyperm 8, 6, 10
	addobject 8
	applymovement 4, Movement_1A75ED
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_169ADD:: @ 8169ADD
	applymovement 4, Movement_1A75E1
	waitmovement 0
	delay 15
	applymovement 4, Movement_1A75ED
	waitmovement 0
	return

EventScript_169AF5:: @ 8169AF5
	applymovement 4, Movement_1A75E1
	waitmovement 0
	delay 15
	applymovement 255, Movement_1A75E7
	applymovement 4, Movement_1A75ED
	waitmovement 0
	return

EventScript_169B14:: @ 8169B14
	applymovement 4, Movement_1A75E1
	waitmovement 0
	delay 15
	applymovement 255, Movement_1A75EB
	applymovement 4, Movement_1A75ED
	waitmovement 0
	return

EventScript_169B33:: @ 8169B33
	applymovement 8, Movement_1A75E1
	applymovement 255, Movement_1A75E7
	waitmovement 0
	return

EventScript_169B45:: @ 8169B45
	applymovement 8, Movement_1A75E9
	applymovement 255, Movement_1A75ED
	waitmovement 0
	return

EventScript_169B57:: @ 8169B57
	applymovement 8, Movement_1A75E1
	applymovement 255, Movement_1A75ED
	waitmovement 0
	return

EventScript_169B69:: @ 8169B69
	applymovement 255, Movement_169B91
	applymovement 8, Movement_169BA4
	waitmovement 0
	return

EventScript_169B7B:: @ 8169B7B
	applymovement 8, Movement_169BA4
	waitmovement 0
	return

EventScript_169B86:: @ 8169B86
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

Movement_169B91:: @ 8169B91
	step_1a
	step_2d
	step_end

Movement_169B94:: @ 8169B94
	step_2d
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1b
	step_2f
	step_end

Movement_169B9D:: @ 8169B9D
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_169BA4:: @ 8169BA4
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

PalletTown_ProfessorOaksLab_EventScript_169BAB:: @ 8169BAB
	lock
	faceplayer
	setvar VAR_0x4001, 0
	setvar VAR_0x4002, 1
	setvar VAR_0x4003, 4
	setvar VAR_0x4004, 7
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if 1, EventScript_169BE1
	loadword 0, gUnknown_818EA19
	callstd 4
	release
	end

EventScript_169BE1:: @ 8169BE1
	applymovement 4, Movement_1A75EF
	waitmovement 0
	drawmonpic 16386, 10, 3
	textcolor 0
	compare_var_to_value VAR_0x4001, 0
	goto_if 1, EventScript_169C14
	compare_var_to_value VAR_0x4001, 1
	goto_if 1, EventScript_169C33
	compare_var_to_value VAR_0x4001, 2
	goto_if 1, EventScript_169C52
	end

EventScript_169C14:: @ 8169C14
	loadword 0, gUnknown_818E272
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_169C74
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_169C71
	end

EventScript_169C33:: @ 8169C33
	loadword 0, gUnknown_818E207
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_169C74
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_169C71
	end

EventScript_169C52:: @ 8169C52
	loadword 0, gUnknown_818E194
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_169C74
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_169C71
	end

EventScript_169C71:: @ 8169C71
	erasemonpic
	release
	end

EventScript_169C74:: @ 8169C74
	erasemonpic
	removeobject VAR_LAST_TALKED
	loadword 0, gUnknown_818E2E5
	callstd 4
	call EventScript_1A6675
	setflag 2088
	setflag FLAG_0x291
	givemon 16386, 5, ITEM_NONE, 0, 0, 0
	copyvar VAR_STARTER_MON, VAR_0x4001
	getspeciesname 0, 16386
	message Text_18E30D
	waitmessage
	playfanfare BGM_FRLG_ME_KEYITEM
	waitfanfare
	loadword 0, gUnknown_81A56A7
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_169CCC
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_169CDC
	end

EventScript_169CCC:: @ 8169CCC
	setvar VAR_0x8004, 0
	call EventScript_1A74EB
	goto EventScript_169CDC
	end

EventScript_169CDC:: @ 8169CDC
	closemessage
	compare_var_to_value VAR_0x4001, 0
	goto_if 1, EventScript_169CFF
	compare_var_to_value VAR_0x4001, 1
	goto_if 1, EventScript_169D1F
	compare_var_to_value VAR_0x4001, 2
	goto_if 1, EventScript_169D0F
	end

EventScript_169CFF:: @ 8169CFF
	applymovement 8, Movement_169D62
	waitmovement 0
	goto EventScript_169D2F
	end

EventScript_169D0F:: @ 8169D0F
	applymovement 8, Movement_169D6B
	waitmovement 0
	goto EventScript_169D2F
	end

EventScript_169D1F:: @ 8169D1F
	applymovement 8, Movement_169D72
	waitmovement 0
	goto EventScript_169D2F
	end

EventScript_169D2F:: @ 8169D2F
	textcolor 0
	loadword 0, gUnknown_818DD34
	callstd 4
	removeobject VAR_0x4004
	textcolor 3
	getspeciesname 0, 16387
	message Text_18DD52
	waitmessage
	playfanfare BGM_FRLG_ME_KEYITEM
	waitfanfare
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	checkflag 2110
	call_if 1, EventScript_169D5C
	release
	end

EventScript_169D5C:: @ 8169D5C
	setvar VAR_0x4070, 1
	return

Movement_169D62:: @ 8169D62
	step_10
	step_10
	step_13
	step_13
	step_13
	step_13
	step_13
	step_11
	step_end

Movement_169D6B:: @ 8169D6B
	step_10
	step_13
	step_13
	step_13
	step_13
	step_2e
	step_end

Movement_169D72:: @ 8169D72
	step_10
	step_13
	step_13
	step_13
	step_2e
	step_end

PalletTown_ProfessorOaksLab_EventScript_169D78:: @ 8169D78
	lock
	faceplayer
	setvar VAR_0x4001, 1
	setvar VAR_0x4002, 7
	setvar VAR_0x4003, 1
	setvar VAR_0x4004, 5
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if 1, EventScript_169BE1
	loadword 0, gUnknown_818EA19
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169DAE:: @ 8169DAE
	lock
	faceplayer
	setvar VAR_0x4001, 2
	setvar VAR_0x4002, 4
	setvar VAR_0x4003, 7
	setvar VAR_0x4004, 6
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if 1, EventScript_169BE1
	loadword 0, gUnknown_818EA19
	callstd 4
	release
	end

EventScript_169DE4:: @ 8169DE4
	loadword 0, gUnknown_818EA45
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169DEE:: @ 8169DEE
	lock
	faceplayer
	checkflag 2092
	goto_if 1, EventScript_169E03
	loadword 0, gUnknown_818EBE6
	callstd 4
	release
	end

EventScript_169E03:: @ 8169E03
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 5
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_818ED15
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E1A:: @ 8169E1A
	lock
	faceplayer
	checkflag 2092
	goto_if 1, EventScript_169E2F
	loadword 0, gUnknown_818EBE6
	callstd 4
	release
	end

EventScript_169E2F:: @ 8169E2F
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_818EC0B
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E46:: @ 8169E46
	lock
	faceplayer
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 2
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_818ED81
	callstd 4
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E5F:: @ 8169E5F
	loadword 0, gUnknown_818E9E5
	callstd 2
	end

PalletTown_ProfessorOaksLab_EventScript_169E68:: @ 8169E68
	loadword 0, gUnknown_818EAF4
	callstd 3
	end

PalletTown_ProfessorOaksLab_EventScript_169E71:: @ 8169E71
	loadword 0, gUnknown_818EA66
	callstd 3
	end

PalletTown_ProfessorOaksLab_EventScript_169E7A:: @ 8169E7A
	lockall
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
	goto_if 4, EventScript_169E90
	loadword 0, gUnknown_818EA84
	callstd 4
	releaseall
	end

EventScript_169E90:: @ 8169E90
	loadword 0, gUnknown_818EAB6
	callstd 4
	releaseall
	end
