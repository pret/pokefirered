CeruleanCity_MapScripts:: @ 8166471
	map_script 3, CeruleanCity_MapScript1_166477
	.byte 0

CeruleanCity_MapScript1_166477:: @ 8166477
	setworldmapflag FLAG_WORLD_MAP_CERULEAN_CITY
	checkflag FLAG_0x234
	call_if 0, EventScript_166484
	end

EventScript_166484:: @ 8166484
	setobjectxyperm 1, 30, 12
	setobjectxyperm 5, 26, 31
	setobjectxyperm 6, 27, 31
	return

CeruleanCity_EventScript_16649A:: @ 816649A
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_1664CC
	end

CeruleanCity_EventScript_1664A6:: @ 81664A6
	lockall
	setvar VAR_0x4001, 1
	setobjectxyperm 8, 23, 0
	goto EventScript_1664CC
	end

CeruleanCity_EventScript_1664B9:: @ 81664B9
	lockall
	setvar VAR_0x4001, 2
	setobjectxyperm 8, 24, 0
	goto EventScript_1664CC
	end

EventScript_1664CC:: @ 81664CC
	textcolor 0
	setvar VAR_0x4054, 2
	playbgm BGM_FRLG_RIVAL, 0
	addobject 8
	applymovement 8, Movement_1665D3
	waitmovement 0
	loadword 0, gUnknown_817EAD7
	callstd 4
	setvar VAR_LAST_TALKED, 8
	compare_var_to_value VAR_STARTER_MON, 2
	call_if 1, EventScript_166582
	compare_var_to_value VAR_STARTER_MON, 1
	call_if 1, EventScript_16658D
	compare_var_to_value VAR_STARTER_MON, 0
	call_if 1, EventScript_166598
	setvar VAR_0x8004, 13
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_817EB95
	callstd 4
	closemessage
	playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_1665A3
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_1665A3
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_1665B5
	loadword 0, gUnknown_817ECD4
	callstd 4
	setvar VAR_0x4052, 1
	setflag FLAG_0x29B
	setorcopyvar VAR_0x8000, 363
	setorcopyvar VAR_0x8001, 1
	callstd 0
	loadword 0, gUnknown_817ED5D
	callstd 4
	closemessage
	applymovement 8, Movement_1665FB
	waitmovement 0
	fadedefaultbgm
	removeobject 8
	releaseall
	end

EventScript_166582:: @ 8166582
	trainerbattle 3, 332, 0, Text_17EB71
	return

EventScript_16658D:: @ 816658D
	trainerbattle 3, 333, 0, Text_17EB71
	return

EventScript_166598:: @ 8166598
	trainerbattle 3, 334, 0, Text_17EB71
	return

EventScript_1665A3:: @ 81665A3
	applymovement 255, Movement_1665C7
	applymovement 8, Movement_1665D9
	waitmovement 0
	return

EventScript_1665B5:: @ 81665B5
	applymovement 255, Movement_1665CD
	applymovement 8, Movement_1665EA
	waitmovement 0
	return

Movement_1665C7:: @ 81665C7
	step_1c
	step_1b
	step_30
	step_1c
	step_2d
	step_end

Movement_1665CD:: @ 81665CD
	step_1c
	step_1b
	step_2f
	step_1c
	step_2d
	step_end

Movement_1665D3:: @ 81665D3
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_1665D9:: @ 81665D9
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_1c
	step_1c
	step_12
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1665EA:: @ 81665EA
	step_12
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_1c
	step_1c
	step_13
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1665FB:: @ 81665FB
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

CeruleanCity_EventScript_166603:: @ 8166603
	lock
	faceplayer
	checktrainerflag FLAG_0x163
	goto_if 1, EventScript_16662E
	message Text_17EE0E
	waitmessage
	playbgm BGM_FRLG_SUSPICIOUS_EYE, 0
	waitbuttonpress
	trainerbattle 3, 355, 0, Text_17EE70
	setvar VAR_0x407D, 1
	goto EventScript_16662E
	end

EventScript_16662E:: @ 816662E
	loadword 0, gUnknown_817EE9C
	callstd 4
	checkitemspace ITEM_TM28, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_166677
	additem ITEM_TM28, 1
	loadword 0, gUnknown_817EEBF
	setorcopyvar VAR_0x8000, 316
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	loadword 0, gUnknown_817EEED
	callstd 4
	closemessage
	fadescreen 1
	removeobject 2
	fadescreen 0
	setflag FLAG_0x23F
	release
	end

EventScript_166677:: @ 8166677
	textcolor 0
	loadword 0, gUnknown_817EF07
	callstd 4
	release
	end

CeruleanCity_EventScript_166683:: @ 8166683
	lockall
	setvar VAR_0x4001, 0
	applymovement 2, Movement_1A75E9
	waitmovement 0
	applymovement 255, Movement_1A75ED
	waitmovement 0
	goto EventScript_1666C3
	end

CeruleanCity_EventScript_1666A3:: @ 81666A3
	lockall
	setvar VAR_0x4001, 1
	applymovement 2, Movement_1A75ED
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	goto EventScript_1666C3
	end

EventScript_1666C3:: @ 81666C3
	textcolor 0
	loadword 0, Text_17EE0E
	callstd 4
	setvar VAR_LAST_TALKED, 2
	trainerbattle 3, 355, 0, Text_17EE70
	setvar VAR_0x407D, 1
	goto EventScript_16662E
	end

CeruleanCity_EventScript_1666E7:: @ 81666E7
	lock
	faceplayer
	loadword 0, gUnknown_817F0F1
	callstd 4
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

CeruleanCity_EventScript_1666FE:: @ 81666FE
	lock
	faceplayer
	checkflag FLAG_0x234
	goto_if 1, EventScript_166713
	loadword 0, gUnknown_817F01D
	callstd 4
	release
	end

EventScript_166713:: @ 8166713
	loadword 0, gUnknown_817EF89
	callstd 4
	release
	end

CeruleanCity_EventScript_16671D:: @ 816671D
	loadword 0, gUnknown_817F0B2
	callstd 2
	end

CeruleanCity_EventScript_166726:: @ 8166726
	loadword 0, gUnknown_817EF3F
	callstd 2
	end

CeruleanCity_EventScript_16672F:: @ 816672F
	loadword 0, gUnknown_817F319
	callstd 2
	end

CeruleanCity_EventScript_166738:: @ 8166738
	lock
	faceplayer
	loadword 0, gUnknown_817F2CF
	callstd 4
	closemessage
	applymovement 11, Movement_1A75E5
	waitmovement 0
	release
	end

CeruleanCity_EventScript_16674F:: @ 816674F
	lock
	random 3
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8008, 0
	call_if 1, EventScript_1667B0
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_1667B6
	compare_var_to_value VAR_0x8008, 2
	call_if 1, EventScript_1667BC
	waitmessage
	delay 40
	playse SE_PIN
	applymovement 5, Movement_1A75D9
	waitmovement 0
	delay 30
	compare_var_to_value VAR_0x8008, 0
	call_if 1, EventScript_1667C2
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_1667CB
	compare_var_to_value VAR_0x8008, 2
	call_if 1, EventScript_1667D4
	release
	end

EventScript_1667B0:: @ 81667B0
	message Text_17F183
	return

EventScript_1667B6:: @ 81667B6
	message Text_17F1C2
	return

EventScript_1667BC:: @ 81667BC
	message Text_17F1E9
	return

EventScript_1667C2:: @ 81667C2
	loadword 0, gUnknown_817F1A1
	callstd 4
	return

EventScript_1667CB:: @ 81667CB
	loadword 0, gUnknown_817F1D2
	callstd 4
	return

EventScript_1667D4:: @ 81667D4
	loadword 0, gUnknown_817F1FC
	callstd 4
	return

CeruleanCity_EventScript_1667DD:: @ 81667DD
	lock
	random 4
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8008, 0
	call_if 1, EventScript_166814
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_16681D
	compare_var_to_value VAR_0x8008, 2
	call_if 1, EventScript_166826
	compare_var_to_value VAR_0x8008, 3
	call_if 1, EventScript_16682F
	release
	end

EventScript_166814:: @ 8166814
	loadword 0, gUnknown_817F270
	callstd 4
	return

EventScript_16681D:: @ 816681D
	loadword 0, gUnknown_817F287
	callstd 4
	return

EventScript_166826:: @ 8166826
	loadword 0, gUnknown_817F2A2
	callstd 4
	return

EventScript_16682F:: @ 816682F
	loadword 0, gUnknown_817F2B7
	callstd 4
	return

CeruleanCity_EventScript_166838:: @ 8166838
	loadword 0, gUnknown_817F420
	callstd 3
	end

CeruleanCity_EventScript_166841:: @ 8166841
	loadword 0, gUnknown_817F453
	callstd 3
	end

CeruleanCity_EventScript_16684A:: @ 816684A
	loadword 0, gUnknown_817F4C5
	callstd 3
	end

CeruleanCity_EventScript_166853:: @ 8166853
	lockall
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_817F4EF
	callstd 4
	releaseall
	end
