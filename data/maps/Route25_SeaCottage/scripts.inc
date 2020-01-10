Route25_SeaCottage_MapScripts:: @ 8170523
	map_script MAP_SCRIPT_ON_TRANSITION, Route25_SeaCottage_OnTransition
	.byte 0

Route25_SeaCottage_OnTransition:: @ 8170529
	call_if_unset FLAG_HELPED_BILL_IN_SEA_COTTAGE, EventScript_17053C
	call_if_set FLAG_GOT_SS_TICKET, EventScript_170547
	end

EventScript_17053C:: @ 817053C
	clearflag FLAG_HIDE_BILL_CLEFAIRY
	setobjectxyperm 1, 3, 3
	return

EventScript_170547:: @ 8170547
	setflag FLAG_TEMP_3
	return

Route25_SeaCottage_EventScript_17054B:: @ 817054B
	lock
	faceplayer
	goto_if_set FLAG_TEMP_3, EventScript_1706C8
	goto_if_set FLAG_GOT_SS_TICKET, EventScript_170640
	goto_if_set FLAG_HELPED_BILL_IN_SEA_COTTAGE, EventScript_17064A
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq EventScript_170580
	compare VAR_RESULT, 1
	goto_if_eq EventScript_17058E
	end

EventScript_170580:: @ 8170580
	msgbox gUnknown_819FDFA, MSGBOX_YESNO
	goto EventScript_17059C
	end

EventScript_17058E:: @ 817058E
	msgbox gUnknown_819FEE6, MSGBOX_YESNO
	goto EventScript_17059C
	end

EventScript_17059C:: @ 817059C
	compare VAR_RESULT, 0
	call_if_eq EventScript_170600
	msgbox gUnknown_819FFD3
	closemessage
	delay 10
	compare VAR_FACING, DIR_SOUTH
	call_if_eq EventScript_17062A
	compare VAR_FACING, DIR_NORTH
	call_if_eq EventScript_170635
	compare VAR_FACING, DIR_WEST
	call_if_eq EventScript_170635
	compare VAR_FACING, DIR_EAST
	call_if_eq EventScript_170635
	opendoor 10, 3
	waitdooranim
	applymovement 2, Movement_1706DB
	waitmovement 0
	removeobject 2
	playse SE_C_MAKU_D
	closedoor 10, 3
	waitdooranim
	setflag FLAG_TEMP_2
	release
	end

EventScript_170600:: @ 8170600
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EventScript_170618
	compare VAR_RESULT, 1
	call_if_eq EventScript_170621
	return

EventScript_170618:: @ 8170618
	msgbox gUnknown_81A0035
	return

EventScript_170621:: @ 8170621
	msgbox gUnknown_81A00B6
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
	msgbox gUnknown_81A02CF
	release
	end

EventScript_17064A:: @ 817064A
	famechecker FAMECHECKER_BILL, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EventScript_1706AC
	compare VAR_RESULT, 1
	call_if_eq EventScript_1706B5
	checkitemspace ITEM_SS_TICKET, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1706BE
	giveitem_msg gUnknown_81A028E, ITEM_SS_TICKET, 1, MUS_FAN5
	setflag FLAG_GOT_SS_TICKET_DUP
	setflag FLAG_HIDE_NUGGET_BRIDGE_ROCKET
	setflag FLAG_GOT_SS_TICKET
	setflag FLAG_SYS_NOT_SOMEONES_PC
	goto EventScript_170640
	end

EventScript_1706AC:: @ 81706AC
	msgbox gUnknown_81A013B
	return

EventScript_1706B5:: @ 81706B5
	msgbox gUnknown_81A01E4
	return

EventScript_1706BE:: @ 81706BE
	msgbox gUnknown_81A02B4
	release
	end

EventScript_1706C8:: @ 81706C8
	msgbox gUnknown_81A03AB
	release
	end

Movement_1706D2:: @ 81706D2
	walk_up
	walk_up
	step_end

Movement_1706D5:: @ 81706D5
	walk_right
	walk_up
	walk_up
	walk_left
	walk_in_place_fastest_up
	step_end

Movement_1706DB:: @ 81706DB
	walk_up
	step_end

Route25_SeaCottage_EventScript_1706DD:: @ 81706DD
	lockall
	goto_if_set FLAG_TEMP_3, EventScript_1707CA
	goto_if_set FLAG_TEMP_2, EventScript_1706FA
	msgbox gUnknown_81A0402
	releaseall
	end

EventScript_1706FA:: @ 81706FA
	fadeoutbgm 0
	msgbox gUnknown_81A042D
	closemessage
	clearflag FLAG_TEMP_2
	setflag FLAG_HELPED_BILL_IN_SEA_COTTAGE
	special SpawnCameraObject
	applymovement OBJ_EVENT_ID_CAMERA, Movement_1707BE
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
	playse SE_TK_WARPIN
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
	clearflag FLAG_HIDE_BILL_HUMAN_SEA_COTTAGE
	delay 50
	playfanfare MUS_FANFA1
	applymovement 1, Movement_170888
	waitmovement 0
	waitfanfare
	applymovement OBJ_EVENT_ID_CAMERA, Movement_1707C3
	waitmovement 0
	playse SE_C_MAKU_D
	closedoor 3, 3
	waitdooranim
	applymovement 1, Movement_170881
	waitmovement 0
	special RemoveCameraObject
	releaseall
	end

EventScript_1707B6:: @ 81707B6
	playse SE_BOWA
	waitse
	delay 20
	return

Movement_1707BE:: @ 81707BE
	walk_up
	walk_up
	walk_right
	walk_right
	step_end

Movement_1707C3:: @ 81707C3
	delay_16
	delay_16
	walk_down
	walk_down
	walk_left
	walk_left
	step_end

EventScript_1707CA:: @ 81707CA
	msgbox gUnknown_81A045B
	goto EventScript_1707D8
	end

EventScript_1707D8:: @ 81707D8
	message Text_1A0479
	waitmessage
	multichoice 0, 0, MULTICHOICE_EEVEELUTIONS, FALSE
	switch VAR_RESULT
	case 0, EventScript_17082B
	case 1, EventScript_170840
	case 2, EventScript_170855
	case 3, EventScript_17086A
	case 4, EventScript_17087F
	case 127, EventScript_17087F
	end

EventScript_17082B:: @ 817082B
	drawmonpic SPECIES_EEVEE, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_EEVEE
	special Special_SetSeenMon
	goto EventScript_1707D8
	end

EventScript_170840:: @ 8170840
	drawmonpic SPECIES_FLAREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_FLAREON
	special Special_SetSeenMon
	goto EventScript_1707D8
	end

EventScript_170855:: @ 8170855
	drawmonpic SPECIES_JOLTEON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_JOLTEON
	special Special_SetSeenMon
	goto EventScript_1707D8
	end

EventScript_17086A:: @ 817086A
	drawmonpic SPECIES_VAPOREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_VAPOREON
	special Special_SetSeenMon
	goto EventScript_1707D8
	end

EventScript_17087F:: @ 817087F
	releaseall
	end

Movement_170881:: @ 8170881
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	step_end

Movement_170888:: @ 8170888
	walk_down
	step_end
