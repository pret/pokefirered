# 1 "data/maps/Route25_SeaCottage/scripts.pory"

# 2 "data/maps/Route25_SeaCottage/scripts.pory"
.equ LOCALID_BILL_HUMAN,    1
# 3 "data/maps/Route25_SeaCottage/scripts.pory"
.equ LOCALID_BILL_CLEFAIRY, 2
# 4 "data/maps/Route25_SeaCottage/scripts.pory"

# 5 "data/maps/Route25_SeaCottage/scripts.pory"
.equ BILL_IN_TELEPORTER,     FLAG_TEMP_2
# 6 "data/maps/Route25_SeaCottage/scripts.pory"
.equ RETURN_AFTER_SS_TICKET, FLAG_TEMP_3
# 7 "data/maps/Route25_SeaCottage/scripts.pory"

# 8 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_MapScripts::
# 9 "data/maps/Route25_SeaCottage/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route25_SeaCottage_OnTransition
# 10 "data/maps/Route25_SeaCottage/scripts.pory"
	.byte 0
# 11 "data/maps/Route25_SeaCottage/scripts.pory"

# 12 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_OnTransition::
# 13 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_unset FLAG_HELPED_BILL_IN_SEA_COTTAGE, Route25_SeaCottage_EventScript_HideClefairyBill
# 14 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_set FLAG_GOT_SS_TICKET, Route25_SeaCottage_EventScript_SetReturnedAfterSSTicket
# 15 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 16 "data/maps/Route25_SeaCottage/scripts.pory"

# 17 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_HideClefairyBill::
# 18 "data/maps/Route25_SeaCottage/scripts.pory"
	clearflag FLAG_HIDE_BILL_CLEFAIRY
# 19 "data/maps/Route25_SeaCottage/scripts.pory"
	setobjectxyperm LOCALID_BILL_HUMAN, 3, 3
# 20 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 21 "data/maps/Route25_SeaCottage/scripts.pory"

# 22 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_SetReturnedAfterSSTicket::
# 23 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag RETURN_AFTER_SS_TICKET
# 24 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 25 "data/maps/Route25_SeaCottage/scripts.pory"

# 26 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_Bill::
# 27 "data/maps/Route25_SeaCottage/scripts.pory"
	lock
# 28 "data/maps/Route25_SeaCottage/scripts.pory"
	faceplayer
# 29 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_set RETURN_AFTER_SS_TICKET, Route25_SeaCottage_EventScript_BillGoLookAtPC
# 30 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_set FLAG_GOT_SS_TICKET, Route25_SeaCottage_EventScript_BillGoToSSAnne
# 31 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_set FLAG_HELPED_BILL_IN_SEA_COTTAGE, Route25_SeaCottage_EventScript_BillGiveSSTicket
# 32 "data/maps/Route25_SeaCottage/scripts.pory"
	checkplayergender
# 33 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_eq VAR_RESULT, MALE, Route25_SeaCottage_EventScript_BillAskForHelpMale
# 34 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_eq VAR_RESULT, FEMALE, Route25_SeaCottage_EventScript_BillAskForHelpFemale
# 35 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 36 "data/maps/Route25_SeaCottage/scripts.pory"

# 37 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillAskForHelpMale::
# 38 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_ImBillHelpMeOutPal, MSGBOX_YESNO
# 39 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillAskForHelp
# 40 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 41 "data/maps/Route25_SeaCottage/scripts.pory"

# 42 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillAskForHelpFemale::
# 43 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_ImBillHelpMeOutLady, MSGBOX_YESNO
# 44 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillAskForHelp
# 45 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 46 "data/maps/Route25_SeaCottage/scripts.pory"

# 47 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillAskForHelp::
# 48 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_RESULT, NO, Route25_SeaCottage_EventScript_DeclineHelpBill
# 49 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_RunCellSeparationOnPC
# 50 "data/maps/Route25_SeaCottage/scripts.pory"
	closemessage
# 51 "data/maps/Route25_SeaCottage/scripts.pory"
	delay 10
# 52 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, Route25_SeaCottage_EventScript_BillWalkToTeleporterSouth
# 53 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, Route25_SeaCottage_EventScript_BillWalkToTeleporter
# 54 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, Route25_SeaCottage_EventScript_BillWalkToTeleporter
# 55 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, Route25_SeaCottage_EventScript_BillWalkToTeleporter
# 56 "data/maps/Route25_SeaCottage/scripts.pory"
	opendoor 10, 3
# 57 "data/maps/Route25_SeaCottage/scripts.pory"
	waitdooranim
# 58 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillEnterTeleporter
# 59 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 60 "data/maps/Route25_SeaCottage/scripts.pory"
	removeobject LOCALID_BILL_CLEFAIRY
# 61 "data/maps/Route25_SeaCottage/scripts.pory"
	playse SE_CONTEST_CURTAIN_FALL
# 62 "data/maps/Route25_SeaCottage/scripts.pory"
	closedoor 10, 3
# 63 "data/maps/Route25_SeaCottage/scripts.pory"
	waitdooranim
# 64 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag BILL_IN_TELEPORTER
# 65 "data/maps/Route25_SeaCottage/scripts.pory"
	release
# 66 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 67 "data/maps/Route25_SeaCottage/scripts.pory"

# 68 "data/maps/Route25_SeaCottage/scripts.pory"
@ Just returns after message, execution continues as if player had said yes
# 69 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_DeclineHelpBill::
# 70 "data/maps/Route25_SeaCottage/scripts.pory"
	checkplayergender
# 71 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_RESULT, MALE, Route25_SeaCottage_EventScript_DeclineHelpBillMale
# 72 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_RESULT, FEMALE, Route25_SeaCottage_EventScript_DeclineHelpBillFemale
# 73 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 74 "data/maps/Route25_SeaCottage/scripts.pory"

# 75 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_DeclineHelpBillMale::
# 76 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_NoPleaseChief
# 77 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 78 "data/maps/Route25_SeaCottage/scripts.pory"

# 79 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_DeclineHelpBillFemale::
# 80 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_NoPleaseBeautiful
# 81 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 82 "data/maps/Route25_SeaCottage/scripts.pory"

# 83 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillWalkToTeleporterSouth::
# 84 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillWalkToTeleporterSouth
# 85 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 86 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 87 "data/maps/Route25_SeaCottage/scripts.pory"

# 88 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillWalkToTeleporter::
# 89 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement LOCALID_BILL_CLEFAIRY, Route25_SeaCottage_Movement_BillWalkToTeleporter
# 90 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 91 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 92 "data/maps/Route25_SeaCottage/scripts.pory"

# 93 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillGoToSSAnne::
# 94 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_SSAnnePartyYouGoInstead
# 95 "data/maps/Route25_SeaCottage/scripts.pory"
	release
# 96 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 97 "data/maps/Route25_SeaCottage/scripts.pory"

# 98 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillGiveSSTicket::
# 99 "data/maps/Route25_SeaCottage/scripts.pory"
	famechecker FAMECHECKER_BILL, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 100 "data/maps/Route25_SeaCottage/scripts.pory"
	checkplayergender
# 101 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_RESULT, MALE, Route25_SeaCottage_EventScript_BillThanksMale
# 102 "data/maps/Route25_SeaCottage/scripts.pory"
	call_if_eq VAR_RESULT, FEMALE, Route25_SeaCottage_EventScript_BillThanksFemale
# 103 "data/maps/Route25_SeaCottage/scripts.pory"
	checkitemspace ITEM_SS_TICKET
# 104 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route25_SeaCottage_EventScript_NoRoomForSSTicket
# 105 "data/maps/Route25_SeaCottage/scripts.pory"
	giveitem_msg Route25_SeaCottage_Text_ReceivedSSTicketFromBill, ITEM_SS_TICKET, 1, MUS_OBTAIN_KEY_ITEM
# 106 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag FLAG_GOT_SS_TICKET_DUP
# 107 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag FLAG_HIDE_NUGGET_BRIDGE_ROCKET
# 108 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag FLAG_GOT_SS_TICKET
# 109 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag FLAG_SYS_NOT_SOMEONES_PC
# 110 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillGoToSSAnne
# 111 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 112 "data/maps/Route25_SeaCottage/scripts.pory"

# 113 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillThanksMale::
# 114 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_ThanksBudTakeThis
# 115 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 116 "data/maps/Route25_SeaCottage/scripts.pory"

# 117 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillThanksFemale::
# 118 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_ThanksLadyTakeThis
# 119 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 120 "data/maps/Route25_SeaCottage/scripts.pory"

# 121 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_NoRoomForSSTicket::
# 122 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_YouveGotTooMuchStuff
# 123 "data/maps/Route25_SeaCottage/scripts.pory"
	release
# 124 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 125 "data/maps/Route25_SeaCottage/scripts.pory"

# 126 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillGoLookAtPC::
# 127 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_CheckOutRareMonsOnPC
# 128 "data/maps/Route25_SeaCottage/scripts.pory"
	release
# 129 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 130 "data/maps/Route25_SeaCottage/scripts.pory"

# 131 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_BillWalkToTeleporter::
# 132 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 133 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 134 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 135 "data/maps/Route25_SeaCottage/scripts.pory"

# 136 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_BillWalkToTeleporterSouth::
# 137 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 138 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 139 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 140 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_left
# 141 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_in_place_faster_up
# 142 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 143 "data/maps/Route25_SeaCottage/scripts.pory"

# 144 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_BillEnterTeleporter::
# 145 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 146 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 147 "data/maps/Route25_SeaCottage/scripts.pory"

# 148 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_Computer::
# 149 "data/maps/Route25_SeaCottage/scripts.pory"
	lockall
# 150 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_set RETURN_AFTER_SS_TICKET, Route25_SeaCottage_EventScript_OpenBillsMonList
# 151 "data/maps/Route25_SeaCottage/scripts.pory"
	goto_if_set BILL_IN_TELEPORTER, Route25_SeaCottage_EventScript_RunCellSeparator
# 152 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_TeleporterIsDisplayed
# 153 "data/maps/Route25_SeaCottage/scripts.pory"
	releaseall
# 154 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 155 "data/maps/Route25_SeaCottage/scripts.pory"

# 156 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_RunCellSeparator::
# 157 "data/maps/Route25_SeaCottage/scripts.pory"
	fadeoutbgm 0
# 158 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_InitiatedTeleportersCellSeparator
# 159 "data/maps/Route25_SeaCottage/scripts.pory"
	closemessage
# 160 "data/maps/Route25_SeaCottage/scripts.pory"
	clearflag BILL_IN_TELEPORTER
# 161 "data/maps/Route25_SeaCottage/scripts.pory"
	setflag FLAG_HELPED_BILL_IN_SEA_COTTAGE
# 162 "data/maps/Route25_SeaCottage/scripts.pory"
	special SpawnCameraObject
# 163 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement OBJ_EVENT_ID_CAMERA, Route25_SeaCottage_Movement_CameraPanToTeleporters
# 164 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 165 "data/maps/Route25_SeaCottage/scripts.pory"
	delay 35
# 166 "data/maps/Route25_SeaCottage/scripts.pory"
	playse SE_PIN
# 167 "data/maps/Route25_SeaCottage/scripts.pory"
	waitse
# 168 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, 0
# 169 "data/maps/Route25_SeaCottage/scripts.pory"
	special AnimateTeleporterHousing
# 170 "data/maps/Route25_SeaCottage/scripts.pory"
	delay 10
# 171 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 172 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 173 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 174 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 175 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 176 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 177 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 178 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, 1
# 179 "data/maps/Route25_SeaCottage/scripts.pory"
	special AnimateTeleporterHousing
# 180 "data/maps/Route25_SeaCottage/scripts.pory"
	playse SE_WARP_IN
# 181 "data/maps/Route25_SeaCottage/scripts.pory"
	special AnimateTeleporterCable
# 182 "data/maps/Route25_SeaCottage/scripts.pory"
	waitse
# 183 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 184 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 185 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 186 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 187 "data/maps/Route25_SeaCottage/scripts.pory"
	call Route25_SeaCottage_EventScript_PlayTeleporterBeepSE
# 188 "data/maps/Route25_SeaCottage/scripts.pory"
	opendoor 3, 3
# 189 "data/maps/Route25_SeaCottage/scripts.pory"
	waitdooranim
# 190 "data/maps/Route25_SeaCottage/scripts.pory"
	fadeinbgm 0
# 191 "data/maps/Route25_SeaCottage/scripts.pory"
	addobject LOCALID_BILL_HUMAN
# 192 "data/maps/Route25_SeaCottage/scripts.pory"
	clearflag FLAG_HIDE_BILL_HUMAN_SEA_COTTAGE
# 193 "data/maps/Route25_SeaCottage/scripts.pory"
	delay 50
# 194 "data/maps/Route25_SeaCottage/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 195 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement LOCALID_BILL_HUMAN, Route25_SeaCottage_Movement_BillExitTeleporter
# 196 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 197 "data/maps/Route25_SeaCottage/scripts.pory"
	waitfanfare
# 198 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement OBJ_EVENT_ID_CAMERA, Route25_SeaCottage_Movement_CameraPanBackFromTeleporters
# 199 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 200 "data/maps/Route25_SeaCottage/scripts.pory"
	playse SE_CONTEST_CURTAIN_FALL
# 201 "data/maps/Route25_SeaCottage/scripts.pory"
	closedoor 3, 3
# 202 "data/maps/Route25_SeaCottage/scripts.pory"
	waitdooranim
# 203 "data/maps/Route25_SeaCottage/scripts.pory"
	applymovement LOCALID_BILL_HUMAN, Route25_SeaCottage_Movement_BillWalkToMiddleOfRoom
# 204 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmovement 0
# 205 "data/maps/Route25_SeaCottage/scripts.pory"
	special RemoveCameraObject
# 206 "data/maps/Route25_SeaCottage/scripts.pory"
	releaseall
# 207 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 208 "data/maps/Route25_SeaCottage/scripts.pory"

# 209 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_PlayTeleporterBeepSE::
# 210 "data/maps/Route25_SeaCottage/scripts.pory"
	playse SE_BALL
# 211 "data/maps/Route25_SeaCottage/scripts.pory"
	waitse
# 212 "data/maps/Route25_SeaCottage/scripts.pory"
	delay 20
# 213 "data/maps/Route25_SeaCottage/scripts.pory"
	return
# 214 "data/maps/Route25_SeaCottage/scripts.pory"

# 215 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_CameraPanToTeleporters::
# 216 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 217 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_up
# 218 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 219 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 220 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 221 "data/maps/Route25_SeaCottage/scripts.pory"

# 222 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_CameraPanBackFromTeleporters::
# 223 "data/maps/Route25_SeaCottage/scripts.pory"
	delay_16
# 224 "data/maps/Route25_SeaCottage/scripts.pory"
	delay_16
# 225 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_down
# 226 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_down
# 227 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_left
# 228 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_left
# 229 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 230 "data/maps/Route25_SeaCottage/scripts.pory"

# 231 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_OpenBillsMonList::
# 232 "data/maps/Route25_SeaCottage/scripts.pory"
	msgbox Route25_SeaCottage_Text_BillsFavoriteMonList
# 233 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillsMonList
# 234 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 235 "data/maps/Route25_SeaCottage/scripts.pory"

# 236 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_BillsMonList::
# 237 "data/maps/Route25_SeaCottage/scripts.pory"
	message Route25_SeaCottage_Text_SeeWhichMon
# 238 "data/maps/Route25_SeaCottage/scripts.pory"
	waitmessage
# 239 "data/maps/Route25_SeaCottage/scripts.pory"
	multichoice 0, 0, MULTICHOICE_EEVEELUTIONS, FALSE
# 240 "data/maps/Route25_SeaCottage/scripts.pory"
	switch VAR_RESULT
# 241 "data/maps/Route25_SeaCottage/scripts.pory"
	case 0, Route25_SeaCottage_EventScript_ViewEevee
# 242 "data/maps/Route25_SeaCottage/scripts.pory"
	case 1, Route25_SeaCottage_EventScript_ViewFlareon
# 243 "data/maps/Route25_SeaCottage/scripts.pory"
	case 2, Route25_SeaCottage_EventScript_ViewJolteon
# 244 "data/maps/Route25_SeaCottage/scripts.pory"
	case 3, Route25_SeaCottage_EventScript_ViewVaporeon
# 245 "data/maps/Route25_SeaCottage/scripts.pory"
	case 4, Route25_SeaCottage_EventScript_ExitBillsMonList
# 246 "data/maps/Route25_SeaCottage/scripts.pory"
	case 127, Route25_SeaCottage_EventScript_ExitBillsMonList
# 247 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 248 "data/maps/Route25_SeaCottage/scripts.pory"

# 249 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_ViewEevee::
# 250 "data/maps/Route25_SeaCottage/scripts.pory"
	showmonpic SPECIES_EEVEE, 10, 3
# 251 "data/maps/Route25_SeaCottage/scripts.pory"
	waitbuttonpress
# 252 "data/maps/Route25_SeaCottage/scripts.pory"
	hidemonpic
# 253 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, SPECIES_EEVEE
# 254 "data/maps/Route25_SeaCottage/scripts.pory"
	special SetSeenMon
# 255 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillsMonList
# 256 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 257 "data/maps/Route25_SeaCottage/scripts.pory"

# 258 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_ViewFlareon::
# 259 "data/maps/Route25_SeaCottage/scripts.pory"
	showmonpic SPECIES_FLAREON, 10, 3
# 260 "data/maps/Route25_SeaCottage/scripts.pory"
	waitbuttonpress
# 261 "data/maps/Route25_SeaCottage/scripts.pory"
	hidemonpic
# 262 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, SPECIES_FLAREON
# 263 "data/maps/Route25_SeaCottage/scripts.pory"
	special SetSeenMon
# 264 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillsMonList
# 265 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 266 "data/maps/Route25_SeaCottage/scripts.pory"

# 267 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_ViewJolteon::
# 268 "data/maps/Route25_SeaCottage/scripts.pory"
	showmonpic SPECIES_JOLTEON, 10, 3
# 269 "data/maps/Route25_SeaCottage/scripts.pory"
	waitbuttonpress
# 270 "data/maps/Route25_SeaCottage/scripts.pory"
	hidemonpic
# 271 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, SPECIES_JOLTEON
# 272 "data/maps/Route25_SeaCottage/scripts.pory"
	special SetSeenMon
# 273 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillsMonList
# 274 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 275 "data/maps/Route25_SeaCottage/scripts.pory"

# 276 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_ViewVaporeon::
# 277 "data/maps/Route25_SeaCottage/scripts.pory"
	showmonpic SPECIES_VAPOREON, 10, 3
# 278 "data/maps/Route25_SeaCottage/scripts.pory"
	waitbuttonpress
# 279 "data/maps/Route25_SeaCottage/scripts.pory"
	hidemonpic
# 280 "data/maps/Route25_SeaCottage/scripts.pory"
	setvar VAR_0x8004, SPECIES_VAPOREON
# 281 "data/maps/Route25_SeaCottage/scripts.pory"
	special SetSeenMon
# 282 "data/maps/Route25_SeaCottage/scripts.pory"
	goto Route25_SeaCottage_EventScript_BillsMonList
# 283 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 284 "data/maps/Route25_SeaCottage/scripts.pory"

# 285 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_EventScript_ExitBillsMonList::
# 286 "data/maps/Route25_SeaCottage/scripts.pory"
	releaseall
# 287 "data/maps/Route25_SeaCottage/scripts.pory"
	end
# 288 "data/maps/Route25_SeaCottage/scripts.pory"

# 289 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_BillWalkToMiddleOfRoom::
# 290 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 291 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 292 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 293 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_right
# 294 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_down
# 295 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_down
# 296 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
# 297 "data/maps/Route25_SeaCottage/scripts.pory"

# 298 "data/maps/Route25_SeaCottage/scripts.pory"
Route25_SeaCottage_Movement_BillExitTeleporter::
# 299 "data/maps/Route25_SeaCottage/scripts.pory"
	walk_down
# 300 "data/maps/Route25_SeaCottage/scripts.pory"
	step_end
