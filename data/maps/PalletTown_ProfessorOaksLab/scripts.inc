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
	savebgm MUS_OHKIDO
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
	clearflag FLAG_HIDE_OAK_IN_HIS_LAB
	applymovement 255, Movement_1692B7
	waitmovement 0
	goto EventScript_169035
	end

EventScript_169035:: @ 8169035
	msgbox gUnknown_818EE60
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169174
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_1691BB
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169194
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169194
	msgbox gUnknown_818EF59
	fadedefaultbgm
	msgbox gUnknown_818F004
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_1691DB
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_1691E6
	textcolor 3
	msgbox gUnknown_818F062
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
	msgbox gUnknown_818F085
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
	playfanfare MUS_FAN5
	message Text_18F0E8
	waitmessage
	waitfanfare
	call EventScript_1A6675
	special EnableNationalPokedex
	msgbox gUnknown_818F103
	msgbox gUnknown_818F1DB
	closemessage
	playbgm MUS_RIVAL2, 0
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
	playbgm MUS_RIVAL1, 0
	applymovement 255, Movement_169B94
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_169194:: @ 8169194
	setobjectxyperm 8, 6, 10
	addobject 8
	playbgm MUS_RIVAL1, 0
	applymovement 4, Movement_1A75ED
	applymovement 255, Movement_169B91
	applymovement 8, Movement_169B9D
	waitmovement 0
	return

EventScript_1691BB:: @ 81691BB
	setobjectxyperm 8, 6, 10
	addobject 8
	playbgm MUS_RIVAL1, 0
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
	clearflag FLAG_HIDE_OAK_IN_HIS_LAB
	applymovement 255, Movement_1692B7
	waitmovement 0
	applymovement 8, Movement_1A75E9
	waitmovement 0
	clearflag FLAG_SPECIAL_FLAG_0x4001
	savebgm SE_STOP
	fadedefaultbgm
	msgbox gUnknown_818DC94
	closemessage
	delay 60
	msgbox gUnknown_818DFBC
	closemessage
	delay 30
	applymovement 8, Movement_1692C0
	waitmovement 0
	msgbox gUnknown_818DCB9
	msgbox gUnknown_818E0EA
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
	msgbox gUnknown_818E177
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
	playbgm MUS_RIVAL1, 0
	applymovement 8, Movement_1A75ED
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_818DDA4
	closemessage
	applymovement 4, Movement_1A75F1
	waitmovement 0
	compare_var_to_value VAR_STARTER_MON, 0
	goto_if_eq EventScript_1693D2
	compare_var_to_value VAR_STARTER_MON, 1
	goto_if_eq EventScript_16944D
	compare_var_to_value VAR_STARTER_MON, 2
	goto_if_eq EventScript_16935A
	end

EventScript_16935A:: @ 816935A
	compare_var_to_value VAR_0x4002, 1
	goto_if_eq EventScript_16937C
	compare_var_to_value VAR_0x4002, 2
	goto_if_eq EventScript_16938C
	compare_var_to_value VAR_0x4002, 3
	goto_if_eq EventScript_16939C
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
	trainerbattle 9, TRAINER_RIVAL_TERRY, 3, Text_18DDEA, Text_18DE1A
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
	goto_if_eq EventScript_1693F4
	compare_var_to_value VAR_0x4002, 2
	goto_if_eq EventScript_169404
	compare_var_to_value VAR_0x4002, 3
	goto_if_eq EventScript_169414
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
	trainerbattle 9, TRAINER_RIVAL_TERRY_3, 3, Text_18DDEA, Text_18DE1A
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
	goto_if_eq EventScript_16946F
	compare_var_to_value VAR_0x4002, 2
	goto_if_eq EventScript_16947F
	compare_var_to_value VAR_0x4002, 3
	goto_if_eq EventScript_16948F
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
	trainerbattle 9, TRAINER_RIVAL_TERRY_2, 3, Text_18DDEA, Text_18DE1A
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
	msgbox gUnknown_818DE38
	closemessage
	playbgm MUS_RIVAL2, 0
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
	goto_if_eq EventScript_16958B
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if_eq EventScript_169581
	msgbox gUnknown_818DC67
	release
	end

EventScript_169581:: @ 8169581
	msgbox gUnknown_818DCE2
	release
	end

EventScript_16958B:: @ 816958B
	msgbox gUnknown_818DD75
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169595:: @ 8169595
	lock
	faceplayer
	checkflag FLAG_TEMP_2
	goto_if_eq EventScript_169600
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 9
	goto_if_eq EventScript_169903
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 8
	goto_if_eq EventScript_169A6E
	checkflag FLAG_SYS_GAME_CLEAR
	goto_if_eq EventScript_1699CE
	compare_var_to_value VAR_MAP_SCENE_CERULEAN_CITY_RIVAL, 1
	goto_if_eq EventScript_169903
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
	goto_if_eq EventScript_1698D6
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	goto_if 4, EventScript_16961E
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 4
	goto_if_eq EventScript_169614
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if_eq EventScript_16960A
	msgbox gUnknown_818E116
	release
	end

EventScript_169600:: @ 8169600
	msgbox gUnknown_81A72AD
	release
	end

EventScript_16960A:: @ 816960A
	msgbox gUnknown_818E330
	release
	end

EventScript_169614:: @ 8169614
	msgbox gUnknown_818E3AD
	release
	end

EventScript_16961E:: @ 816961E
	msgbox gUnknown_818E405
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_18E4AF
	waitmessage
	waitfanfare
	call EventScript_1A6675
	removeitem ITEM_OAKS_PARCEL, 1
	msgbox gUnknown_818E4CA
	playbgm MUS_RIVAL1, 0
	msgbox gUnknown_818DE8D
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
	msgbox gUnknown_818DE99
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
	msgbox gUnknown_818E508
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169882
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_16988D
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_1698A6
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_1698B8
	msgbox gUnknown_818E536
	closemessage
	delay 40
	msgbox gUnknown_818E5C5
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
	playfanfare MUS_FAN5
	message Text_18E5EA
	waitmessage
	waitfanfare
	call EventScript_1A6675
	setflag FLAG_SYS_POKEDEX_GET
	special sub_810B810
	setvar VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 1
	msgbox gUnknown_818E612
	additem ITEM_POKE_BALL, 5
	giveitemfanfaremsg gUnknown_818E6B3, ITEM_POKE_BALL, 5
	msgbox gUnknown_818E6D0
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_818E784
	msgbox gUnknown_818DEC8
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_169B33
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_169B45
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_169B57
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_169B57
	msgbox gUnknown_818DEF3
	closemessage
	playbgm MUS_RIVAL2, 0
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
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	setvar VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 1
	setvar VAR_MAP_SCENE_ROUTE22, 1
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
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	compare_var_to_value VAR_0x8009, 1
	goto_if_eq EventScript_1699FB
	goto EventScript_169903
	end

EventScript_169903:: @ 8169903
	call EventScript_1A737B
	checkflag FLAG_0x2F4
	goto_if_eq EventScript_169913
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
	msgbox gUnknown_81A72AD
	setflag FLAG_TEMP_2
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
	checkflag FLAG_WORLD_MAP_ONE_ISLAND
	goto_if 0, EventScript_1699F9
	delay 30
	msgbox gUnknown_818EDF5
	goto EventScript_169035
	end

EventScript_1699F9:: @ 81699F9
	release
	end

EventScript_1699FB:: @ 81699FB
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	checkflag FLAG_0x24F
	goto_if_eq EventScript_169A6E
	checkflag FLAG_0x247
	goto_if_eq EventScript_169A78
	checkitem ITEM_POKE_BALL, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_169A34
	goto EventScript_169A6E
	end

EventScript_169A34:: @ 8169A34
	compare_var_to_value VAR_MAP_SCENE_ROUTE22, 2
	goto_if 4, EventScript_169A45
	goto EventScript_169A6E
	end

EventScript_169A45:: @ 8169A45
	msgbox gUnknown_818E89C
	additem ITEM_POKE_BALL, 5
	giveitemfanfaremsg gUnknown_818E6B3, ITEM_POKE_BALL, 5
	setflag FLAG_0x247
	release
	end

EventScript_169A6E:: @ 8169A6E
	msgbox gUnknown_818E871
	release
	end

EventScript_169A78:: @ 8169A78
	msgbox gUnknown_818E98E
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

	.equ VAR_OAKSLAB_PLAYER_STARTER_NO,       VAR_0x4001
	.equ VAR_OAKSLAB_PLAYER_STARTER_SPECIES,  VAR_0x4002
	.equ VAR_OAKSLAB_RIVAL_STARTER_SPECIES,   VAR_0x4003
	.equ VAR_OAKSLAB_RIVAL_STARTER_OBJID,     VAR_0x4004

PalletTown_ProfessorOaksLab_EventScript_169BAB:: @ 8169BAB
	lock
	faceplayer
	setvar VAR_OAKSLAB_PLAYER_STARTER_NO, 0
	setvar VAR_OAKSLAB_PLAYER_STARTER_SPECIES, SPECIES_BULBASAUR
	setvar VAR_OAKSLAB_RIVAL_STARTER_SPECIES, SPECIES_CHARMANDER
	setvar VAR_OAKSLAB_RIVAL_STARTER_OBJID, 7
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if_eq EventScript_169BE1
	msgbox gUnknown_818EA19
	release
	end

EventScript_169BE1:: @ 8169BE1
	applymovement 4, Movement_1A75EF
	waitmovement 0
	drawmonpic VAR_OAKSLAB_PLAYER_STARTER_SPECIES, 10, 3
	textcolor 0
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 0
	goto_if_eq EventScript_OakDescribesBulbasaur
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 1
	goto_if_eq EventScript_OakDescribesCharmander
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 2
	goto_if_eq EventScript_OakDescribesSquirtle
	end

EventScript_OakDescribesBulbasaur:: @ 8169C14
	msgbox gUnknown_818E272, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_ThisPokeIsRealyEnergetic
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_DeclinedStarter
	end

EventScript_OakDescribesCharmander:: @ 8169C33
	msgbox gUnknown_818E207, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_ThisPokeIsRealyEnergetic
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_DeclinedStarter
	end

EventScript_OakDescribesSquirtle:: @ 8169C52
	msgbox gUnknown_818E194, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_ThisPokeIsRealyEnergetic
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_DeclinedStarter
	end

EventScript_DeclinedStarter:: @ 8169C71
	erasemonpic
	release
	end

EventScript_ThisPokeIsRealyEnergetic:: @ 8169C74
	erasemonpic
	removeobject VAR_LAST_TALKED
	msgbox gUnknown_818E2E5
	call EventScript_1A6675
	setflag FLAG_SYS_POKEMON_GET
	setflag FLAG_0x291
	givemon VAR_OAKSLAB_PLAYER_STARTER_SPECIES, 5, ITEM_NONE, 0, 0, 0
	copyvar VAR_STARTER_MON, VAR_OAKSLAB_PLAYER_STARTER_NO
	getspeciesname 0, VAR_OAKSLAB_PLAYER_STARTER_SPECIES
	message Text_18E30D
	waitmessage
	playfanfare MUS_FAN5
	waitfanfare
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_GiveNicknameToStarter
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_SkipGiveNicknameToStarter
	end

EventScript_GiveNicknameToStarter:: @ 8169CCC
	setvar VAR_0x8004, 0
	call EventScript_1A74EB
	goto EventScript_SkipGiveNicknameToStarter
	end

EventScript_SkipGiveNicknameToStarter:: @ 8169CDC
	closemessage
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 0
	goto_if_eq EventScript_RivalWalksToCharmander
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 1
	goto_if_eq EventScript_RivalWalksToSquirtle
	compare_var_to_value VAR_OAKSLAB_PLAYER_STARTER_NO, 2
	goto_if_eq EventScript_RivalWalksToBulbasaur
	end

EventScript_RivalWalksToCharmander:: @ 8169CFF
	applymovement 8, Movement_RivalWalksToCharmander
	waitmovement 0
	goto Movement_RivalTakesHisStarter
	end

EventScript_RivalWalksToBulbasaur:: @ 8169D0F
	applymovement 8, Movement_RivalWalksToBulbasaur
	waitmovement 0
	goto Movement_RivalTakesHisStarter
	end

EventScript_RivalWalksToSquirtle:: @ 8169D1F
	applymovement 8, Movement_RivalWalksToSquirtle
	waitmovement 0
	goto Movement_RivalTakesHisStarter
	end

Movement_RivalTakesHisStarter:: @ 8169D2F
	textcolor 0
	msgbox gUnknown_818DD34
	removeobject VAR_OAKSLAB_RIVAL_STARTER_OBJID
	textcolor 3
	getspeciesname 0, VAR_OAKSLAB_RIVAL_STARTER_SPECIES
	message Text_18DD52
	waitmessage
	playfanfare MUS_FAN5
	waitfanfare
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	checkflag FLAG_PALLET_TOWN_LADY_MOVED_FROM_SIGN
	call_if 1, EventScript_169D5C
	release
	end

EventScript_169D5C:: @ 8169D5C
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1
	return

Movement_RivalWalksToCharmander:: @ 8169D62
	step_10
	step_10
	step_13
	step_13
	step_13
	step_13
	step_13
	step_11
	step_end

Movement_RivalWalksToBulbasaur:: @ 8169D6B
	step_10
	step_13
	step_13
	step_13
	step_13
	step_2e
	step_end

Movement_RivalWalksToSquirtle:: @ 8169D72
	step_10
	step_13
	step_13
	step_13
	step_2e
	step_end

PalletTown_ProfessorOaksLab_EventScript_169D78:: @ 8169D78
	lock
	faceplayer
	setvar VAR_OAKSLAB_PLAYER_STARTER_NO, 1
	setvar VAR_OAKSLAB_PLAYER_STARTER_SPECIES, SPECIES_SQUIRTLE
	setvar VAR_OAKSLAB_RIVAL_STARTER_SPECIES, SPECIES_BULBASAUR
	setvar VAR_OAKSLAB_RIVAL_STARTER_OBJID, 5
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if_eq EventScript_169BE1
	msgbox gUnknown_818EA19
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169DAE:: @ 8169DAE
	lock
	faceplayer
	setvar VAR_OAKSLAB_PLAYER_STARTER_NO, 2
	setvar VAR_OAKSLAB_PLAYER_STARTER_SPECIES, SPECIES_CHARMANDER
	setvar VAR_OAKSLAB_RIVAL_STARTER_SPECIES, SPECIES_SQUIRTLE
	setvar VAR_OAKSLAB_RIVAL_STARTER_OBJID, 6
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 3
	goto_if 4, EventScript_169DE4
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 2
	goto_if_eq EventScript_169BE1
	msgbox gUnknown_818EA19
	release
	end

EventScript_169DE4:: @ 8169DE4
	msgbox gUnknown_818EA45
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169DEE:: @ 8169DEE
	lock
	faceplayer
	checkflag FLAG_SYS_GAME_CLEAR
	goto_if_eq EventScript_169E03
	msgbox gUnknown_818EBE6
	release
	end

EventScript_169E03:: @ 8169E03
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 5
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_818ED15
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E1A:: @ 8169E1A
	lock
	faceplayer
	checkflag FLAG_SYS_GAME_CLEAR
	goto_if_eq EventScript_169E2F
	msgbox gUnknown_818EBE6
	release
	end

EventScript_169E2F:: @ 8169E2F
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_818EC0B
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E46:: @ 8169E46
	lock
	faceplayer
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 2
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_818ED81
	release
	end

PalletTown_ProfessorOaksLab_EventScript_169E5F:: @ 8169E5F
	msgbox gUnknown_818E9E5, 2
	end

PalletTown_ProfessorOaksLab_EventScript_169E68:: @ 8169E68
	msgbox gUnknown_818EAF4, 3
	end

PalletTown_ProfessorOaksLab_EventScript_169E71:: @ 8169E71
	msgbox gUnknown_818EA66, 3
	end

PalletTown_ProfessorOaksLab_EventScript_169E7A:: @ 8169E7A
	lockall
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 6
	goto_if 4, EventScript_169E90
	msgbox gUnknown_818EA84
	releaseall
	end

EventScript_169E90:: @ 8169E90
	msgbox gUnknown_818EAB6
	releaseall
	end
