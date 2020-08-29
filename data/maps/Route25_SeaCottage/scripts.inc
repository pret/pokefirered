.equ LOCALID_BILL_HUMAN,    1
.equ LOCALID_BILL_CLEFAIRY, 2

.equ BILL_IN_TELEPORTER,     FLAG_TEMP_2
.equ RETURN_AFTER_SS_TICKET, FLAG_TEMP_3

Route25_SeaCottage_MapScripts:: @ 8170523
	map_script MAP_SCRIPT_ON_TRANSITION, Route25_SeaCottage_OnTransition
	.byte 0

Route25_SeaCottage_OnTransition:: @ 8170529
	call_if_unset FLAG_HELPED_BILL_IN_SEA_COTTAGE, Route25_SeaCottage_EventScript_HideClefairyBill
	call_if_set FLAG_GOT_SS_TICKET, Route25_SeaCottage_EventScript_SetReturnedAfterSSTicket
	end

Route25_SeaCottage_EventScript_HideClefairyBill:: @ 817053C
	clearflag FLAG_HIDE_BILL_CLEFAIRY
	setobjectxyperm LOCALID_BILL_HUMAN, 3, 3
	return

Route25_SeaCottage_EventScript_SetReturnedAfterSSTicket:: @ 8170547
	setflag RETURN_AFTER_SS_TICKET
	return

Route25_SeaCottage_EventScript_Bill:: @ 817054B
	lock
	faceplayer
	goto_if_set RETURN_AFTER_SS_TICKET, Route25_SeaCottage_EventScript_BillGoLookAtPC
	goto_if_set FLAG_GOT_SS_TICKET, Route25_SeaCottage_EventScript_BillGoToSSAnne
	goto_if_set FLAG_HELPED_BILL_IN_SEA_COTTAGE, Route25_SeaCottage_EventScript_BillGiveSSTicket
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq Route25_SeaCottage_EventScript_BillAskForHelpMale
	compare VAR_RESULT, FEMALE
	goto_if_eq Route25_SeaCottage_EventScript_BillAskForHelpFemale
	end

Route25_SeaCottage_EventScript_BillAskForHelpMale:: @ 8170580
	msgbox Route25_SeaCottage_Text_ImBillHelpMeOutPal, MSGBOX_YESNO
	goto Route25_SeaCottage_EventScript_BillAskForHelp
	end

Route25_SeaCottage_EventScript_BillAskForHelpFemale:: @ 817058E
	msgbox Route25_SeaCottage_Text_ImBillHelpMeOutLady, MSGBOX_YESNO
	goto Route25_SeaCottage_EventScript_BillAskForHelp
	end

Route25_SeaCottage_EventScript_BillAskForHelp:: @ 817059C
	compare VAR_RESULT, NO
	call_if_eq Route25_SeaCottage_EventScript_DeclineHelpBill
	msgbox Route25_SeaCottage_Text_RunCellSeparationOnPC
	closemessage
	delay 10
	compare VAR_FACING, DIR_SOUTH
	call_if_eq Route25_SeaCottage_EventScript_BillWalkToTeleporterSouth
	compare VAR_FACING, DIR_NORTH
	call_if_eq Route25_SeaCottage_EventScript_BillWalkToTeleporter
	compare VAR_FACING, DIR_WEST
	call_if_eq Route25_SeaCottage_EventScript_BillWalkToTeleporter
	compare VAR_FACING, DIR_EAST
	call_if_eq Route25_SeaCottage_EventScript_BillWalkToTeleporter
	opendoor 10, 3
	waitdooranim
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillEnterTeleporter
	waitmovement 0
	removeobject LOCALID_BILL_CLEFAIRY
	playse SE_CONTEST_CURTAIN_FALL
	closedoor 10, 3
	waitdooranim
	setflag BILL_IN_TELEPORTER
	release
	end

@ Just returns after message, execution continues as if player had said yes
Route25_SeaCottage_EventScript_DeclineHelpBill:: @ 8170600
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq Route25_SeaCottage_EventScript_DeclineHelpBillMale
	compare VAR_RESULT, FEMALE
	call_if_eq Route25_SeaCottage_EventScript_DeclineHelpBillFemale
	return

Route25_SeaCottage_EventScript_DeclineHelpBillMale:: @ 8170618
	msgbox Route25_SeaCottage_Text_NoPleaseChief
	return

Route25_SeaCottage_EventScript_DeclineHelpBillFemale:: @ 8170621
	msgbox Route25_SeaCottage_Text_NoPleaseBeautiful
	return

Route25_SeaCottage_EventScript_BillWalkToTeleporterSouth:: @ 817062A
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillWalkToTeleporterSouth
	waitmovement 0
	return

Route25_SeaCottage_EventScript_BillWalkToTeleporter:: @ 8170635
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillWalkToTeleporter
	waitmovement 0
	return

Route25_SeaCottage_EventScript_BillGoToSSAnne:: @ 8170640
	msgbox Route25_SeaCottage_Text_SSAnnePartyYouGoInstead
	release
	end

Route25_SeaCottage_EventScript_BillGiveSSTicket:: @ 817064A
	famechecker FAMECHECKER_BILL, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq Route25_SeaCottage_EventScript_BillThanksMale
	compare VAR_RESULT, FEMALE
	call_if_eq Route25_SeaCottage_EventScript_BillThanksFemale
	checkitemspace ITEM_SS_TICKET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq Route25_SeaCottage_EventScript_NoRoomForSSTicket
	giveitem_msg Route25_SeaCottage_Text_ReceivedSSTicketFromBill, ITEM_SS_TICKET, 1, MUS_OBTAIN_KEY_ITEM
	setflag FLAG_GOT_SS_TICKET_DUP
	setflag FLAG_HIDE_NUGGET_BRIDGE_ROCKET
	setflag FLAG_GOT_SS_TICKET
	setflag FLAG_SYS_NOT_SOMEONES_PC
	goto Route25_SeaCottage_EventScript_BillGoToSSAnne
	end

Route25_SeaCottage_EventScript_BillThanksMale:: @ 81706AC
	msgbox Route25_SeaCottage_Text_ThanksBudTakeThis
	return

Route25_SeaCottage_EventScript_BillThanksFemale:: @ 81706B5
	msgbox Route25_SeaCottage_Text_ThanksLadyTakeThis
	return

Route25_SeaCottage_EventScript_NoRoomForSSTicket:: @ 81706BE
	msgbox Route25_SeaCottage_Text_YouveGotTooMuchStuff
	release
	end

Route25_SeaCottage_EventScript_BillGoLookAtPC:: @ 81706C8
	msgbox Route25_SeaCottage_Text_CheckOutRareMonsOnPC
	release
	end

Route25_SeaCottage_Movement_BillWalkToTeleporter:: @ 81706D2
	walk_up
	walk_up
	step_end

Route25_SeaCottage_Movement_BillWalkToTeleporterSouth:: @ 81706D5
	walk_right
	walk_up
	walk_up
	walk_left
	walk_in_place_fastest_up
	step_end

Route25_SeaCottage_Movement_BillEnterTeleporter:: @ 81706DB
	walk_up
	step_end

Route25_SeaCottage_EventScript_Computer:: @ 81706DD
	lockall
	goto_if_set RETURN_AFTER_SS_TICKET, Route25_SeaCottage_EventScript_OpenBillsMonList
	goto_if_set BILL_IN_TELEPORTER, Route25_SeaCottage_EventScript_RunCellSeparator
	msgbox Route25_SeaCottage_Text_TeleporterIsDisplayed
	releaseall
	end

Route25_SeaCottage_EventScript_RunCellSeparator:: @ 81706FA
	fadeoutbgm 0
	msgbox Route25_SeaCottage_Text_InitiatedTeleportersCellSeparator
	closemessage
	clearflag BILL_IN_TELEPORTER
	setflag FLAG_HELPED_BILL_IN_SEA_COTTAGE
	special SpawnCameraObject
	applymovement OBJ_EVENT_ID_CAMERA, Route25_SeaCottage_Movement_CameraPanToTeleporters
	waitmovement 0
	delay 35
	playse SE_PIN
	waitse
	setvar VAR_0x8004, 0
	special AnimateTeleporterHousing
	delay 10
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	setvar VAR_0x8004, 1
	special AnimateTeleporterHousing
	playse SE_WARP_IN
	special AnimateTeleporterCable
	waitse
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
	opendoor 3, 3
	waitdooranim
	fadeinbgm 0
	addobject LOCALID_BILL_HUMAN
	clearflag FLAG_HIDE_BILL_HUMAN_SEA_COTTAGE
	delay 50
	playfanfare MUS_LEVEL_UP
	applymovement LOCALID_BILL_HUMAN, Route25_SeaCottage_Movement_BillExitTeleporter
	waitmovement 0
	waitfanfare
	applymovement OBJ_EVENT_ID_CAMERA, Route25_SeaCottage_Movement_CameraPanBackFromTeleporters
	waitmovement 0
	playse SE_CONTEST_CURTAIN_FALL
	closedoor 3, 3
	waitdooranim
	applymovement LOCALID_BILL_HUMAN, Route25_SeaCottage_Movement_BillWalkToMiddleOfRoom
	waitmovement 0
	special RemoveCameraObject
	releaseall
	end

Route25_SeaCottage_EventScript_PlayTeleporterBeepSE:: @ 81707B6
	playse SE_BALL
	waitse
	delay 20
	return

Route25_SeaCottage_Movement_CameraPanToTeleporters:: @ 81707BE
	walk_up
	walk_up
	walk_right
	walk_right
	step_end

Route25_SeaCottage_Movement_CameraPanBackFromTeleporters:: @ 81707C3
	delay_16
	delay_16
	walk_down
	walk_down
	walk_left
	walk_left
	step_end

Route25_SeaCottage_EventScript_OpenBillsMonList:: @ 81707CA
	msgbox Route25_SeaCottage_Text_BillsFavoriteMonList
	goto Route25_SeaCottage_EventScript_BillsMonList
	end

Route25_SeaCottage_EventScript_BillsMonList:: @ 81707D8
	message Route25_SeaCottage_Text_SeeWhichMon
	waitmessage
	multichoice 0, 0, MULTICHOICE_EEVEELUTIONS, FALSE
	switch VAR_RESULT
	case 0, Route25_SeaCottage_EventScript_ViewEevee
	case 1, Route25_SeaCottage_EventScript_ViewFlareon
	case 2, Route25_SeaCottage_EventScript_ViewJolteon
	case 3, Route25_SeaCottage_EventScript_ViewVaporeon
	case 4, Route25_SeaCottage_EventScript_ExitBillsMonList
	case 127, Route25_SeaCottage_EventScript_ExitBillsMonList
	end

Route25_SeaCottage_EventScript_ViewEevee:: @ 817082B
	drawmonpic SPECIES_EEVEE, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_EEVEE
	special SetSeenMon
	goto Route25_SeaCottage_EventScript_BillsMonList
	end

Route25_SeaCottage_EventScript_ViewFlareon:: @ 8170840
	drawmonpic SPECIES_FLAREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_FLAREON
	special SetSeenMon
	goto Route25_SeaCottage_EventScript_BillsMonList
	end

Route25_SeaCottage_EventScript_ViewJolteon:: @ 8170855
	drawmonpic SPECIES_JOLTEON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_JOLTEON
	special SetSeenMon
	goto Route25_SeaCottage_EventScript_BillsMonList
	end

Route25_SeaCottage_EventScript_ViewVaporeon:: @ 817086A
	drawmonpic SPECIES_VAPOREON, 10, 3
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_VAPOREON
	special SetSeenMon
	goto Route25_SeaCottage_EventScript_BillsMonList
	end

Route25_SeaCottage_EventScript_ExitBillsMonList:: @ 817087F
	releaseall
	end

Route25_SeaCottage_Movement_BillWalkToMiddleOfRoom:: @ 8170881
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	step_end

Route25_SeaCottage_Movement_BillExitTeleporter:: @ 8170888
	walk_down
	step_end
