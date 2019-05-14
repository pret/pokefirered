FourIsland_IcefallCave_Back_MapScripts:: @ 8163D82
	map_script 3, FourIsland_IcefallCave_Back_MapScript1_163D88
	.byte 0

FourIsland_IcefallCave_Back_MapScript1_163D88:: @ 8163D88
	compare_var_to_value VAR_0x4080, 1
	call_if 1, EventScript_163D94
	end

EventScript_163D94:: @ 8163D94
	setflag FLAG_0x08B
	return

FourIsland_IcefallCave_Back_EventScript_163D98:: @ 8163D98
	lockall
	textcolor 1
	loadword 0, gUnknown_817B04F
	callstd 4
	applymovement 1, Movement_163EE8
	waitmovement 0
	textcolor 0
	loadword 0, gUnknown_817B0B9
	callstd 4
	closemessage
	playse SE_PIN
	applymovement 3, Movement_1A75DB
	waitmovement 0
	applymovement 3, Movement_1A75ED
	waitmovement 0
	applymovement 3, Movement_1A75DD
	waitmovement 0
	textcolor 1
	loadword 0, gUnknown_817B109
	callstd 4
	closemessage
	applymovement 3, Movement_1A75EB
	waitmovement 0
	delay 18
	applymovement 3, Movement_1A75ED
	waitmovement 0
	delay 35
	applymovement 4, Movement_163F11
	applymovement 3, Movement_163F18
	applymovement 255, Movement_163EDD
	waitmovement 0
	applymovement 2, Movement_163EE8
	waitmovement 0
	playbgm BGM_FRLG_SUSPICIOUS_EYE, 0
	textcolor 0
	loadword 0, gUnknown_817B20B
	callstd 4
	setvar VAR_LAST_TALKED, 4
	trainerbattle 3, 539, 0, Text_17B251
	applymovement 3, Movement_163F1B
	waitmovement 0
	textcolor 1
	loadword 0, gUnknown_817B269
	callstd 4
	textcolor 0
	loadword 0, gUnknown_817B2EF
	callstd 4
	textcolor 1
	message Text_17B313
	waitmessage
	waitse
	playmoncry SPECIES_LAPRAS, 2
	waitbuttonpress
	waitmoncry
	applymovement 1, Movement_163EEE
	waitmovement 0
	textcolor 0
	loadword 0, gUnknown_817B399
	callstd 4
	closemessage
	applymovement 3, Movement_163F1D
	applymovement 255, Movement_163EE2
	applymovement 1, Movement_163EF0
	applymovement 2, Movement_163EFA
	applymovement 4, Movement_163F05
	waitmovement 0
	removeobject 1
	removeobject 2
	removeobject 4
	delay 50
	applymovement 3, Movement_163F23
	waitmovement 0
	applymovement 255, Movement_1A75E7
	waitmovement 0
	textcolor 1
	loadword 0, gUnknown_817B457
	callstd 4
	setflag FLAG_0x08E
	clearflag FLAG_0x08C
	setvar VAR_0x4080, 1
	releaseall
	end

Movement_163EDD:: @ 8163EDD
	step_11
	step_11
	step_13
	step_11
	step_end

Movement_163EE2:: @ 8163EE2
	step_1c
	step_2f
	step_1c
	step_1c
	step_2d
	step_end

Movement_163EE8:: @ 8163EE8
	step_25
	step_end

gUnknown_163EEA:: @ 8163EEA
	step_4c
	step_13
	step_4d
	step_end

Movement_163EEE:: @ 8163EEE
	step_29
	step_end

Movement_163EF0:: @ 8163EF0
	step_13
	step_10
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end

Movement_163EFA:: @ 8163EFA
	step_1c
	step_12
	step_10
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end

Movement_163F05:: @ 8163F05
	step_1c
	step_10
	step_1c
	step_10
	step_20
	step_20
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end

Movement_163F11:: @ 8163F11
	step_1c
	step_1b
	step_30
	step_end

Movement_163F15:: @ 8163F15
	step_12
	step_12
	step_end

Movement_163F18:: @ 8163F18
	step_12
	step_11
	step_end

Movement_163F1B:: @ 8163F1B
	step_26
	step_end

Movement_163F1D:: @ 8163F1D
	step_1b
	step_30
	step_1c
	step_1c
	step_2d
	step_end

Movement_163F23:: @ 8163F23
	step_13
	step_end

FourIsland_IcefallCave_Back_EventScript_163F25:: @ 8163F25
	loadword 0, gUnknown_817B457
	callstd 2
	end
