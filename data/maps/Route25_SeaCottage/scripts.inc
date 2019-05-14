Route25_SeaCottage_MapScripts:: @ 8170523
	map_script 3, Route25_SeaCottage_MapScript1_170529
	.byte 0

Route25_SeaCottage_MapScript1_170529:: @ 8170529
	checkflag FLAG_0x233
	call_if 0, EventScript_17053C
	checkflag FLAG_0x234
	call_if 1, EventScript_170547
	end

EventScript_17053C:: @ 817053C
	clearflag FLAG_0x032
	setobjectxyperm 1, 3, 3
	return

EventScript_170547:: @ 8170547
	setflag FLAG_0x003
	return

Route25_SeaCottage_EventScript_17054B:: @ 817054B
	lock
	faceplayer
	checkflag FLAG_0x003
	goto_if 1, EventScript_1706C8
	checkflag FLAG_0x234
	goto_if 1, EventScript_170640
	checkflag FLAG_0x233
	goto_if 1, EventScript_17064A
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_170580
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_17058E
	end

EventScript_170580:: @ 8170580
	loadword 0, gUnknown_819FDFA
	callstd 5
	goto EventScript_17059C
	end

EventScript_17058E:: @ 817058E
	loadword 0, gUnknown_819FEE6
	callstd 5
	goto EventScript_17059C
	end

EventScript_17059C:: @ 817059C
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_170600
	loadword 0, gUnknown_819FFD3
	callstd 4
	closemessage
	delay 10
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_17062A
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_170635
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_170635
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_170635
	opendoor 10, 3
	waitdooranim
	applymovement 2, Movement_1706DB
	waitmovement 0
	removeobject 2
	playse SE_EXPMAX
	closedoor 10, 3
	waitdooranim
	setflag FLAG_0x002
	release
	end

EventScript_170600:: @ 8170600
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_170618
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_170621
	return

EventScript_170618:: @ 8170618
	loadword 0, gUnknown_81A0035
	callstd 4
	return

EventScript_170621:: @ 8170621
	loadword 0, gUnknown_81A00B6
	callstd 4
	return

EventScript_17062A:: @ 817062A
	applymovement 2, Movement_1706D5
	waitmovement 0
	return

EventScript_170635:: @ 8170635
	applymovement 2, Movement_1706D2
	waitmovement 0
	return

EventScript_170640:: @ 8170640
	loadword 0, gUnknown_81A02CF
	callstd 4
	release
	end

EventScript_17064A:: @ 817064A
	setvar VAR_0x8004, 13
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_1706AC
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_1706B5
	checkitemspace ITEM_SS_TICKET, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1706BE
	additem ITEM_SS_TICKET, 1
	loadword 0, gUnknown_81A028E
	setorcopyvar VAR_0x8000, 265
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 318
	callstd 9
	setflag FLAG_0x235
	setflag FLAG_0x031
	setflag FLAG_0x234
	setflag FLAG_0x834
	goto EventScript_170640
	end

EventScript_1706AC:: @ 81706AC
	loadword 0, gUnknown_81A013B
	callstd 4
	return

EventScript_1706B5:: @ 81706B5
	loadword 0, gUnknown_81A01E4
	callstd 4
	return

EventScript_1706BE:: @ 81706BE
	loadword 0, gUnknown_81A02B4
	callstd 4
	release
	end

EventScript_1706C8:: @ 81706C8
	loadword 0, gUnknown_81A03AB
	callstd 4
	release
	end

Movement_1706D2:: @ 81706D2
	step_11
	step_11
	step_end

Movement_1706D5:: @ 81706D5
	step_13
	step_11
	step_11
	step_12
	step_2e
	step_end

Movement_1706DB:: @ 81706DB
	step_11
	step_end

Route25_SeaCottage_EventScript_1706DD:: @ 81706DD
	lockall
	checkflag FLAG_0x003
	goto_if 1, EventScript_1707CA
	checkflag FLAG_0x002
	goto_if 1, EventScript_1706FA
	loadword 0, gUnknown_81A0402
	callstd 4
	releaseall
	end

EventScript_1706FA:: @ 81706FA
	fadeoutbgm 0
	loadword 0, gUnknown_81A042D
	callstd 4
	closemessage
	clearflag FLAG_0x002
	setflag FLAG_0x233
	special SpawnScriptFieldObject
	applymovement 127, Movement_1707BE
	waitmovement 0
	delay 35
	playse SE_PIN
	waitse
	setvar VAR_0x8004, 0
	special sub_809C4A8
	delay 10
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	setvar VAR_0x8004, 1
	special sub_809C4A8
	playse SE_FU_ZUZUZU
	special sub_809C5FC
	waitse
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	call EventScript_1707B6
	opendoor 3, 3
	waitdooranim
	fadeinbgm 0
	addobject 1
	clearflag FLAG_0x033
	delay 50
	playfanfare MUS_FANFA1
	applymovement 1, Movement_170888
	waitmovement 0
	waitfanfare
	applymovement 127, Movement_1707C3
	waitmovement 0
	playse SE_EXPMAX
	closedoor 3, 3
	waitdooranim
	applymovement 1, Movement_170881
	waitmovement 0
	special RemoveScriptFieldObject
	releaseall
	end

EventScript_1707B6:: @ 81707B6
	playse SE_BOWA
	waitse
	delay 20
	return

Movement_1707BE:: @ 81707BE
	step_11
	step_11
	step_13
	step_13
	step_end

Movement_1707C3:: @ 81707C3
	step_1c
	step_1c
	step_10
	step_10
	step_12
	step_12
	step_end

EventScript_1707CA:: @ 81707CA
	loadword 0, gUnknown_81A045B
	callstd 4
	goto EventScript_1707D8
	end

EventScript_1707D8:: @ 81707D8
	message Text_1A0479
	waitmessage
	multichoice 0, 0, 1, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_17082B
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_170840
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_170855
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_17086A
	compare_var_to_value VAR_0x8000, 4
	goto_if 1, EventScript_17087F
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_17087F
	end

EventScript_17082B:: @ 817082B
	drawmonpic SPECIES_EEVEE, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, 133
	special sub_80CBDCC
	goto EventScript_1707D8
	end

EventScript_170840:: @ 8170840
	drawmonpic SPECIES_FLAREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, 136
	special sub_80CBDCC
	goto EventScript_1707D8
	end

EventScript_170855:: @ 8170855
	drawmonpic SPECIES_JOLTEON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, 135
	special sub_80CBDCC
	goto EventScript_1707D8
	end

EventScript_17086A:: @ 817086A
	drawmonpic SPECIES_VAPOREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, 134
	special sub_80CBDCC
	goto EventScript_1707D8
	end

EventScript_17087F:: @ 817087F
	releaseall
	end

Movement_170881:: @ 8170881
	step_13
	step_13
	step_13
	step_13
	step_10
	step_10
	step_end

Movement_170888:: @ 8170888
	step_10
	step_end
