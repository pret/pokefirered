# 1 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 2 "data/maps/PewterCity_Museum_1F/scripts.pory"
.set LOCALID_SCIENTIST1, 1
# 3 "data/maps/PewterCity_Museum_1F/scripts.pory"
.set LOCALID_OLD_AMBER,  4
# 4 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 5 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_MapScripts::
# 6 "data/maps/PewterCity_Museum_1F/scripts.pory"
	.byte 0
# 7 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 8 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_Scientist1::
# 9 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lock
# 10 "data/maps/PewterCity_Museum_1F/scripts.pory"
	faceplayer
# 11 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_FACING, DIR_WEST, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
# 12 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_FACING, DIR_SOUTH, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
# 13 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_FACING, DIR_NORTH, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
# 14 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_PleaseEnjoyYourself
# 15 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 16 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 17 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 18 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_Scientist1BehindCounter::
# 19 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_DoYouKnowWhatAmberIs, MSGBOX_YESNO
# 20 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PewterCity_Museum_1F_EventScript_AmberHasGeneticMatter
# 21 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PewterCity_Museum_1F_EventScript_ExplainAmber
# 22 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 23 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 24 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_AmberHasGeneticMatter::
# 25 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_AmberContainsGeneticMatter
# 26 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement LOCALID_SCIENTIST1, Common_Movement_FaceOriginalDirection
# 27 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 28 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 29 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 30 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 31 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_ExplainAmber::
# 32 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_AmberIsFossilizedSap
# 33 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement LOCALID_SCIENTIST1, Common_Movement_FaceOriginalDirection
# 34 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 35 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 36 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 37 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 38 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_EntranceTriggerLeft::
# 39 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lockall
# 40 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_TEMP_1, 0
# 41 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 42 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 43 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
# 44 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 45 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 46 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_EntranceTriggerMid::
# 47 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lockall
# 48 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_TEMP_1, 1
# 49 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 50 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 51 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
# 52 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 53 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 54 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_EntranceTriggerRight::
# 55 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lockall
# 56 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_TEMP_1, 2
# 57 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 58 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 59 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
# 60 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 61 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 62 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_EntranceTrigger::
# 63 "data/maps/PewterCity_Museum_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 64 "data/maps/PewterCity_Museum_1F/scripts.pory"
	showmoneybox 0, 0
# 65 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_Its50YForChildsTicket, MSGBOX_YESNO
# 66 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PewterCity_Museum_1F_EventScript_TryPayForTicket
# 67 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_ComeAgain
# 68 "data/maps/PewterCity_Museum_1F/scripts.pory"
	closemessage
# 69 "data/maps/PewterCity_Museum_1F/scripts.pory"
	hidemoneybox
# 70 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Museum_1F_Movement_ForcePlayerExit
# 71 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 72 "data/maps/PewterCity_Museum_1F/scripts.pory"
	releaseall
# 73 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 74 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 75 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_TryPayForTicket::
# 76 "data/maps/PewterCity_Museum_1F/scripts.pory"
	checkmoney 50
# 77 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Museum_1F_EventScript_NotEnoughMoney
# 78 "data/maps/PewterCity_Museum_1F/scripts.pory"
	closemessage
# 79 "data/maps/PewterCity_Museum_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PewterCity_Museum_1F_EventScript_PlayerApproachCounterLeft
# 80 "data/maps/PewterCity_Museum_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PewterCity_Museum_1F_EventScript_PlayerApproachCounterMid
# 81 "data/maps/PewterCity_Museum_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, PewterCity_Museum_1F_EventScript_PlayerApproachCounterRight
# 82 "data/maps/PewterCity_Museum_1F/scripts.pory"
	playse SE_SHOP
# 83 "data/maps/PewterCity_Museum_1F/scripts.pory"
	removemoney 50
# 84 "data/maps/PewterCity_Museum_1F/scripts.pory"
	updatemoneybox
# 85 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitse
# 86 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_Right50YThankYou
# 87 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 1
# 88 "data/maps/PewterCity_Museum_1F/scripts.pory"
	hidemoneybox
# 89 "data/maps/PewterCity_Museum_1F/scripts.pory"
	releaseall
# 90 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 91 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 92 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_PlayerApproachCounterLeft::
# 93 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterLeft
# 94 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 95 "data/maps/PewterCity_Museum_1F/scripts.pory"
	return
# 96 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 97 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_PlayerApproachCounterMid::
# 98 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterMid
# 99 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 100 "data/maps/PewterCity_Museum_1F/scripts.pory"
	return
# 101 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 102 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_PlayerApproachCounterRight::
# 103 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterRight
# 104 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 105 "data/maps/PewterCity_Museum_1F/scripts.pory"
	return
# 106 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 107 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_NotEnoughMoney::
# 108 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_DontHaveEnoughMoney
# 109 "data/maps/PewterCity_Museum_1F/scripts.pory"
	closemessage
# 110 "data/maps/PewterCity_Museum_1F/scripts.pory"
	hidemoneybox
# 111 "data/maps/PewterCity_Museum_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Museum_1F_Movement_ForcePlayerExit
# 112 "data/maps/PewterCity_Museum_1F/scripts.pory"
	waitmovement 0
# 113 "data/maps/PewterCity_Museum_1F/scripts.pory"
	releaseall
# 114 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 115 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 116 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_Movement_ForcePlayerExit::
# 117 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_down
# 118 "data/maps/PewterCity_Museum_1F/scripts.pory"
	step_end
# 119 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 120 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_Movement_ApproachCounterLeft::
# 121 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_right
# 122 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_right
# 123 "data/maps/PewterCity_Museum_1F/scripts.pory"
	delay_8
# 124 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_in_place_right
# 125 "data/maps/PewterCity_Museum_1F/scripts.pory"
	step_end
# 126 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 127 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_Movement_ApproachCounterMid::
# 128 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_right
# 129 "data/maps/PewterCity_Museum_1F/scripts.pory"
	delay_8
# 130 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_in_place_right
# 131 "data/maps/PewterCity_Museum_1F/scripts.pory"
	step_end
# 132 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 133 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_Movement_ApproachCounterRight::
# 134 "data/maps/PewterCity_Museum_1F/scripts.pory"
	delay_8
# 135 "data/maps/PewterCity_Museum_1F/scripts.pory"
	walk_in_place_right
# 136 "data/maps/PewterCity_Museum_1F/scripts.pory"
	step_end
# 137 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 138 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_Scientist2::
# 139 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_WeHaveTwoFossilsOnExhibit, MSGBOX_NPC
# 140 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 141 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 142 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_OldMan::
# 143 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_ShouldBeGratefulForLongLife, MSGBOX_NPC
# 144 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 145 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 146 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_OldAmberScientist::
# 147 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lock
# 148 "data/maps/PewterCity_Museum_1F/scripts.pory"
	faceplayer
# 149 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_set FLAG_GOT_OLD_AMBER, PewterCity_Museum_1F_EventScript_AlreadyGotOldAmber
# 150 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_WantYouToGetAmberExamined
# 151 "data/maps/PewterCity_Museum_1F/scripts.pory"
	checkitemspace ITEM_OLD_AMBER
# 152 "data/maps/PewterCity_Museum_1F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Museum_1F_EventScript_NoRoomForOldAmber
# 153 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setflag FLAG_GOT_OLD_AMBER
# 154 "data/maps/PewterCity_Museum_1F/scripts.pory"
	removeobject LOCALID_OLD_AMBER
# 155 "data/maps/PewterCity_Museum_1F/scripts.pory"
	giveitem_msg PewterCity_Museum_1F_Text_ReceivedOldAmberFromMan, ITEM_OLD_AMBER, 1, MUS_OBTAIN_KEY_ITEM
# 156 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 157 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 158 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 159 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_NoRoomForOldAmber::
# 160 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_DontHaveSpaceForThis
# 161 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 162 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 163 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 164 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_AlreadyGotOldAmber::
# 165 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_GetOldAmberChecked
# 166 "data/maps/PewterCity_Museum_1F/scripts.pory"
	release
# 167 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 168 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 169 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_OldAmber::
# 170 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_BeautifulPieceOfAmber, MSGBOX_NPC
# 171 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 172 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 173 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_AerodactylFossil::
# 174 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lockall
# 175 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8004, SPECIES_AERODACTYL
# 176 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8005, 10
# 177 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8006, 3
# 178 "data/maps/PewterCity_Museum_1F/scripts.pory"
	special OpenMuseumFossilPic
# 179 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_AerodactylFossil
# 180 "data/maps/PewterCity_Museum_1F/scripts.pory"
	special CloseMuseumFossilPic
# 181 "data/maps/PewterCity_Museum_1F/scripts.pory"
	releaseall
# 182 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
# 183 "data/maps/PewterCity_Museum_1F/scripts.pory"

# 184 "data/maps/PewterCity_Museum_1F/scripts.pory"
PewterCity_Museum_1F_EventScript_KabutopsFossil::
# 185 "data/maps/PewterCity_Museum_1F/scripts.pory"
	lockall
# 186 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8004, SPECIES_KABUTOPS
# 187 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8005, 10
# 188 "data/maps/PewterCity_Museum_1F/scripts.pory"
	setvar VAR_0x8006, 3
# 189 "data/maps/PewterCity_Museum_1F/scripts.pory"
	special OpenMuseumFossilPic
# 190 "data/maps/PewterCity_Museum_1F/scripts.pory"
	msgbox PewterCity_Museum_1F_Text_KabutopsFossil
# 191 "data/maps/PewterCity_Museum_1F/scripts.pory"
	special CloseMuseumFossilPic
# 192 "data/maps/PewterCity_Museum_1F/scripts.pory"
	releaseall
# 193 "data/maps/PewterCity_Museum_1F/scripts.pory"
	end
