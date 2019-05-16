SevenIsland_SevaultCanyon_House_MapScripts:: @ 8172182
	.byte 0

SevenIsland_SevaultCanyon_House_EventScript_172183:: @ 8172183
	lock
	checkflag FLAG_0x002
	goto_if_eq EventScript_172211
	playbgm BGM_FRLG_CHANSEY_DANCE, 0
	applymovement 1, Movement_172231
	waitmovement 0
	fadedefaultbgm
	delay 30
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81A4D72
	textcolor 3
	msgbox gUnknown_81A4DAF, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_172225
	msgbox gUnknown_81A4DD8
	closemessage
	call EventScript_1A6675
	compare_var_to_value VAR_FACING, 1
	call_if 5, EventScript_172206
	delay 30
	playbgm BGM_FRLG_CHANSEY_DANCE, 0
	applymovement 255, Movement_172231
	waitmovement 0
	fadedefaultbgm
	delay 30
	call EventScript_1A6C26
	msgbox gUnknown_81A4DF5
	setflag FLAG_0x002
	release
	end

EventScript_172206:: @ 8172206
	applymovement 255, Movement_1A75ED
	waitmovement 0
	return

EventScript_172211:: @ 8172211
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81A4D72
	release
	end

EventScript_172225:: @ 8172225
	textcolor 0
	msgbox gUnknown_81A4DC8
	release
	end

Movement_172231:: @ 8172231
	step_25
	step_1c
	step_25
	step_1c
	step_25
	step_1c
	step_25
	step_1c
	step_30
	step_1a
	step_2e
	step_1a
	step_2f
	step_1a
	step_2d
	step_1a
	step_end

SevenIsland_SevaultCanyon_House_EventScript_172242:: @ 8172242
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CHANSEY, 0
	msgbox gUnknown_81A4E26
	waitmoncry
	release
	end
