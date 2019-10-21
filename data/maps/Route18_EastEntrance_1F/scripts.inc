Route18_EastEntrance_1F_MapScripts:: @ 8170378
	map_script 3, Route18_EastEntrance_1F_MapScript1_17037E
	.byte 0

Route18_EastEntrance_1F_MapScript1_17037E:: @ 817037E
	clearflag FLAG_0x830
	checkflag FLAG_GOT_BICYCLE
	call_if TRUE, EventScript_17038B
	end

EventScript_17038B:: @ 817038B
	setvar VAR_0x4001, 1
	return

Route18_EastEntrance_1F_EventScript_170391:: @ 8170391
	msgbox gUnknown_819FD3A, 2
	end

Route18_EastEntrance_1F_EventScript_17039A:: @ 817039A
	lockall
	setvar VAR_0x8008, 0
	goto EventScript_1703D6
	end

Route18_EastEntrance_1F_EventScript_1703A6:: @ 81703A6
	lockall
	setvar VAR_0x8008, 1
	goto EventScript_1703D6
	end

Route18_EastEntrance_1F_EventScript_1703B2:: @ 81703B2
	lockall
	setvar VAR_0x8008, 2
	goto EventScript_1703D6
	end

Route18_EastEntrance_1F_EventScript_1703BE:: @ 81703BE
	lockall
	setvar VAR_0x8008, 3
	goto EventScript_1703D6
	end

Route18_EastEntrance_1F_EventScript_1703CA:: @ 81703CA
	lockall
	setvar VAR_0x8008, 4
	goto EventScript_1703D6
	end

EventScript_1703D6:: @ 81703D6
	textcolor 0
	msgbox gUnknown_819FD60
	closemessage
	applymovement 255, Movement_1A75E9
	waitmovement 0
	delay 20
	compare_var_to_value VAR_0x8008, 1
	call_if eq, EventScript_17042F
	compare_var_to_value VAR_0x8008, 2
	call_if eq, EventScript_17043A
	compare_var_to_value VAR_0x8008, 3
	call_if eq, EventScript_170445
	compare_var_to_value VAR_0x8008, 4
	call_if eq, EventScript_170450
	msgbox gUnknown_819FD0C
	closemessage
	applymovement 255, Movement_170469
	waitmovement 0
	releaseall
	end

EventScript_17042F:: @ 817042F
	applymovement 255, Movement_17045B
	waitmovement 0
	return

EventScript_17043A:: @ 817043A
	applymovement 255, Movement_17045D
	waitmovement 0
	return

EventScript_170445:: @ 8170445
	applymovement 255, Movement_170460
	waitmovement 0
	return

EventScript_170450:: @ 8170450
	applymovement 255, Movement_170464
	waitmovement 0
	return

Movement_17045B:: @ 817045B
	step_11
	step_end

Movement_17045D:: @ 817045D
	step_11
	step_11
	step_end

Movement_170460:: @ 8170460
	step_11
	step_11
	step_11
	step_end

Movement_170464:: @ 8170464
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_170469:: @ 8170469
	step_13
	step_end
