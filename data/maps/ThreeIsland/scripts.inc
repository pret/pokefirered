ThreeIsland_MapScripts:: @ 81677AD
	map_script 3, ThreeIsland_MapScript1_1677B3
	.byte 0

ThreeIsland_MapScript1_1677B3:: @ 81677B3
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND
	checkflag FLAG_0x2A3
	call_if 1, EventScript_1677CB
	compare_var_to_value VAR_0x407B, 4
	call_if 1, EventScript_1677CF
	end

EventScript_1677CB:: @ 81677CB
	setflag FLAG_0x07E
	return

EventScript_1677CF:: @ 81677CF
	setobjectmovementtype 1, 1
	setobjectmovementtype 2, 1
	return

ThreeIsland_EventScript_1677D8:: @ 81677D8
	lock
	setvar VAR_0x4001, 2
	call EventScript_16786F
	release
	end

ThreeIsland_EventScript_1677E5:: @ 81677E5
	lock
	checkflag FLAG_0x2FC
	goto_if 1, EventScript_167806
	compare_var_to_value VAR_0x407B, 4
	goto_if 1, EventScript_16781A
	setvar VAR_0x4001, 0
	call EventScript_16786F
	release
	end

EventScript_167806:: @ 8167806
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81827F1
	release
	end

EventScript_16781A:: @ 816781A
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_818275A
	checkitemspace ITEM_FULL_RESTORE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_167865
	giveitemfanfaremsg gUnknown_81827BE, ITEM_FULL_RESTORE
	additem ITEM_FULL_RESTORE, 1
	setflag FLAG_0x2FC
	msgbox gUnknown_81827F1
	release
	end

EventScript_167865:: @ 8167865
	msgbox gUnknown_81827DB
	release
	end

EventScript_16786F:: @ 816786F
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_167947
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_167947
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81820C0
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_167952
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_167952
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_16795D
	applymovement 5, Movement_167A19
	waitmovement 0
	msgbox gUnknown_8182125
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_167931
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_167931
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_167973
	applymovement 2, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81821A9
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_167952
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_167952
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_16795D
	applymovement 4, Movement_167A19
	waitmovement 0
	msgbox gUnknown_81821DC
	return

EventScript_167931:: @ 8167931
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

EventScript_16793C:: @ 816793C
	applymovement 255, Movement_1A75ED
	waitmovement 0
	return

EventScript_167947:: @ 8167947
	applymovement 255, Movement_1A75E7
	waitmovement 0
	return

EventScript_167952:: @ 8167952
	applymovement 255, Movement_1A75EB
	waitmovement 0
	return

EventScript_16795D:: @ 816795D
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 9
	goto_if 4, EventScript_167931
	goto EventScript_167952
	end

EventScript_167973:: @ 8167973
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 9
	goto_if 4, EventScript_167947
	goto EventScript_167931
	end

ThreeIsland_EventScript_167989:: @ 8167989
	lock
	compare_var_to_value VAR_0x407B, 4
	goto_if 1, EventScript_1679A1
	setvar VAR_0x4001, 1
	call EventScript_16786F
	release
	end

EventScript_1679A1:: @ 81679A1
	applymovement 2, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8182823
	release
	end

ThreeIsland_EventScript_1679B5:: @ 81679B5
	lockall
	textcolor 0
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81821F1
	applymovement 3, Movement_167A19
	waitmovement 0
	msgbox gUnknown_818221F
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_8182275
	applymovement 3, Movement_167A19
	waitmovement 0
	msgbox gUnknown_81822FB
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81823C7
	setvar VAR_0x407B, 3
	releaseall
	end

Movement_167A19:: @ 8167A19
	step_27
	step_end

Movement_167A1B:: @ 8167A1B
	step_28
	step_end

ThreeIsland_EventScript_167A1D:: @ 8167A1D
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A29:: @ 8167A29
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A35:: @ 8167A35
	lockall
	setvar VAR_0x4001, 2
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A41:: @ 8167A41
	lockall
	setvar VAR_0x4001, 3
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A4D:: @ 8167A4D
	lockall
	setvar VAR_0x4001, 4
	goto EventScript_167A59
	end

EventScript_167A59:: @ 8167A59
	textcolor 0
	applymovement 5, Movement_1A75ED
	waitmovement 0
	playse SE_PIN
	applymovement 5, Movement_1A75DB
	waitmovement 0
	applymovement 5, Movement_1A75DD
	waitmovement 0
	applymovement 5, Movement_167C57
	waitmovement 0
	playbgm BGM_FRLG_BOY_EYE, 0
	msgbox gUnknown_81823ED, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_167C35
	msgbox gUnknown_818247D
	setvar VAR_LAST_TALKED, 5
	trainerbattle 3, 527, 0, Text_1824B7
	applymovement 5, Movement_167C5C
	waitmovement 0
	msgbox gUnknown_81824CF
	closemessage
	applymovement 7, Movement_167C57
	waitmovement 0
	playbgm BGM_FRLG_BOY_EYE, 0
	msgbox gUnknown_81824EF
	setvar VAR_LAST_TALKED, 7
	trainerbattle 3, 528, 0, Text_182521
	applymovement 7, Movement_167C5C
	waitmovement 0
	msgbox gUnknown_8182536
	closemessage
	applymovement 4, Movement_167C57
	waitmovement 0
	playbgm BGM_FRLG_BOY_EYE, 0
	msgbox gUnknown_8182582
	setvar VAR_LAST_TALKED, 4
	trainerbattle 3, 529, 0, Text_1825D4
	applymovement 4, Movement_1A75E7
	waitmovement 0
	applymovement 6, Movement_1A75ED
	applymovement 8, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_81825E2
	closemessage
	delay 45
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_167BC6
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_167BD8
	compare_var_to_value VAR_0x4001, 2
	call_if 1, EventScript_167BEA
	compare_var_to_value VAR_0x4001, 3
	call_if 1, EventScript_167C03
	compare_var_to_value VAR_0x4001, 4
	call_if 1, EventScript_167C1C
	playbgm BGM_FRLG_BOY_EYE, 0
	msgbox gUnknown_8182623
	setvar VAR_LAST_TALKED, 3
	trainerbattle 3, 742, 0, Text_1826B7
	msgbox gUnknown_818271D
	closemessage
	fadescreen 1
	removeobject 3
	removeobject 5
	removeobject 7
	removeobject 4
	removeobject 6
	removeobject 8
	removeobject 14
	fadescreen 0
	setvar VAR_0x407B, 4
	releaseall
	end

EventScript_167BC6:: @ 8167BC6
	applymovement 4, Movement_1A75ED
	applymovement 3, Movement_167C5E
	waitmovement 0
	return

EventScript_167BD8:: @ 8167BD8
	applymovement 4, Movement_1A75ED
	applymovement 3, Movement_167C62
	waitmovement 0
	return

EventScript_167BEA:: @ 8167BEA
	applymovement 4, Movement_1A75ED
	applymovement 3, Movement_167C64
	applymovement 255, Movement_167C68
	waitmovement 0
	return

EventScript_167C03:: @ 8167C03
	applymovement 4, Movement_1A75ED
	applymovement 255, Movement_167C68
	applymovement 3, Movement_167C6C
	waitmovement 0
	return

EventScript_167C1C:: @ 8167C1C
	applymovement 4, Movement_1A75ED
	applymovement 255, Movement_167C68
	applymovement 3, Movement_167C71
	waitmovement 0
	return

EventScript_167C35:: @ 8167C35
	msgbox gUnknown_8182453
	closemessage
	applymovement 255, Movement_167C55
	waitmovement 0
	applymovement 5, Movement_167C59
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

Movement_167C55:: @ 8167C55
	step_10
	step_end

Movement_167C57:: @ 8167C57
	step_10
	step_end

Movement_167C59:: @ 8167C59
	step_11
	step_2f
	step_end

Movement_167C5C:: @ 8167C5C
	step_25
	step_end

Movement_167C5E:: @ 8167C5E
	step_10
	step_12
	step_2d
	step_end

Movement_167C62:: @ 8167C62
	step_10
	step_end

Movement_167C64:: @ 8167C64
	step_10
	step_10
	step_30
	step_end

Movement_167C68:: @ 8167C68
	step_1c
	step_1c
	step_2f
	step_end

Movement_167C6C:: @ 8167C6C
	step_10
	step_10
	step_13
	step_30
	step_end

Movement_167C71:: @ 8167C71
	step_10
	step_10
	step_13
	step_13
	step_30
	step_end

ThreeIsland_EventScript_167C77:: @ 8167C77
	msgbox gUnknown_81828EB, 2
	end

ThreeIsland_EventScript_167C80:: @ 8167C80
	msgbox gUnknown_818298A, 2
	end

ThreeIsland_EventScript_167C89:: @ 8167C89
	lock
	faceplayer
	waitse
	playmoncry SPECIES_DODUO, 0
	msgbox gUnknown_81829F4
	waitmoncry
	release
	end

ThreeIsland_EventScript_167C9C:: @ 8167C9C
	msgbox gUnknown_8182061, 3
	end

ThreeIsland_EventScript_167CA5:: @ 8167CA5
	msgbox gUnknown_818208B, 2
	end
