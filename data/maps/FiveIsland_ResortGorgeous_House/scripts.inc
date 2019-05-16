FiveIsland_ResortGorgeous_House_MapScripts:: @ 8171EBD
	.byte 0

FiveIsland_ResortGorgeous_House_EventScript_171EBE:: @ 8171EBE
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	checkflag FLAG_0x002
	goto_if_eq EventScript_172043
	compare_var_to_value VAR_STORAGE_UNKNOWN, 65535
	goto_if_eq EventScript_171F0B
	compare_var_to_value VAR_STORAGE_UNKNOWN, 0
	goto_if 5, EventScript_171F19
	msgbox gUnknown_81A42A0
	goto EventScript_171EFE
	end

EventScript_171EFE:: @ 8171EFE
	special sub_80CB0A8
	msgbox gUnknown_81A4315
	release
	end

EventScript_171F0B:: @ 8171F0B
	msgbox gUnknown_81A437A
	goto EventScript_171EFE
	end

EventScript_171F19:: @ 8171F19
	copyvar VAR_0x8004, VAR_STORAGE_UNKNOWN
	specialvar VAR_RESULT, sub_80CC48C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_171F34
	goto EventScript_171EFE
	end

EventScript_171F34:: @ 8171F34
	special sub_80CB0A8
	msgbox gUnknown_81A43F7
	addobject 2
	applymovement 2, Movement_172060
	waitmovement 0
	textcolor 0
	msgbox gUnknown_81A450B
	applymovement 1, Movement_1A75E9
	waitmovement 0
	textcolor 1
	msgbox gUnknown_81A4521
	textcolor 0
	msgbox gUnknown_81A4566
	closemessage
	compare_var_to_value VAR_FACING, 2
	call_if 1, EventScript_171FCD
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_171FE9
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_171FFE
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_17201A
	moveobjectoffscreen 2
	msgbox gUnknown_81A458E
	giveitem VAR_0x403B
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_172025
	setflag FLAG_0x002
	setvar VAR_STORAGE_UNKNOWN, 0
	release
	end

EventScript_171FCD:: @ 8171FCD
	applymovement 1, Movement_1A75ED
	applymovement 2, Movement_17204D
	waitmovement 0
	applymovement 255, Movement_1A75E7
	waitmovement 0
	return

EventScript_171FE9:: @ 8171FE9
	applymovement 2, Movement_172055
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

EventScript_171FFE:: @ 8171FFE
	applymovement 1, Movement_1A75E7
	applymovement 2, Movement_172059
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

EventScript_17201A:: @ 817201A
	applymovement 2, Movement_17205E
	waitmovement 0
	return

EventScript_172025:: @ 8172025
	textcolor 0
	msgbox gUnknown_81A45E8
	textcolor 1
	msgbox gUnknown_81A461B
	setflag FLAG_0x002
	setvar VAR_STORAGE_UNKNOWN, 0
	release
	end

EventScript_172043:: @ 8172043
	msgbox gUnknown_81A4632
	release
	end

Movement_17204D:: @ 817204D
	step_12
	step_12
	step_12
	step_10
	step_10
	step_10
	step_30
	step_end

Movement_172055:: @ 8172055
	step_12
	step_12
	step_2d
	step_end

Movement_172059:: @ 8172059
	step_12
	step_12
	step_12
	step_10
	step_end

Movement_17205E:: @ 817205E
	step_11
	step_end

Movement_172060:: @ 8172060
	step_25
	step_end

FiveIsland_ResortGorgeous_House_EventScript_172062:: @ 8172062
	msgbox gUnknown_81A4657, 2
	end
