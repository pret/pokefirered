# 1 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 2 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_MapScripts::
# 3 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FuchsiaCity_SafariZone_Entrance_OnFrame
# 4 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	.byte 0
# 5 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 6 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_OnFrame::
# 7 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 1, FuchsiaCity_SafariZone_Entrance_EventScript_ExitWarpIn
# 8 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 2, FuchsiaCity_SafariZone_Entrance_EventScript_ExitEarly
# 9 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 3, FuchsiaCity_SafariZone_Entrance_EventScript_ExitWalkIn
# 10 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	.2byte 0
# 11 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 12 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
@ When player runs out of balls mid-battle
# 13 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ExitWalkIn::
# 14 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 15 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 16 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ApproachCounter
# 17 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 18 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CatchFairShareComeAgain
# 19 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 20 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit2
# 21 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 22 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	special ExitSafariMode
# 23 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
# 24 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	releaseall
# 25 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 26 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 27 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
@ When player runs of out balls after catching a pokemon, or runs out of steps
# 28 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ExitWarpIn::
# 29 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 30 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 31 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CatchFairShareComeAgain
# 32 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 33 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit
# 34 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 35 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	special ExitSafariMode
# 36 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
# 37 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	releaseall
# 38 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 39 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 40 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
@ When player re-enters the entrance building with balls/steps remaining
# 41 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ExitEarly::
# 42 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 43 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 44 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_GoingToLeaveSafariZoneEarly, MSGBOX_YESNO
# 45 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_eq VAR_RESULT, NO, FuchsiaCity_SafariZone_Entrance_EventScript_ReturnToSafariZone
# 46 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_PleaseReturnSafariBalls
# 47 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 48 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit
# 49 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 50 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	special ExitSafariMode
# 51 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
# 52 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	releaseall
# 53 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 54 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 55 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ReturnToSafariZone::
# 56 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_GoodLuck
# 57 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 58 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ReEnter
# 59 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 60 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	warp MAP_SAFARI_ZONE_CENTER, 26, 30
# 61 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitstate
# 62 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 63 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 64 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_Exit::
# 65 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 66 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 67 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 68 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 69 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_ReEnter::
# 70 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 71 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 72 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 73 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_Exit2::
# 74 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 75 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 76 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 77 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 78 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_ApproachCounter::
# 79 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 80 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	delay_8
# 81 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 82 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 83 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerMid::
# 84 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 85 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_TEMP_2, 0
# 86 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
# 87 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 88 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 89 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerRight::
# 90 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 91 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_TEMP_2, 1
# 92 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
# 93 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 94 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 95 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerLeft::
# 96 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lockall
# 97 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_TEMP_2, 2
# 98 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
# 99 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 100 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 101 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone::
# 102 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 103 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_WelcomeToSafariZone
# 104 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 105 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 106 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	showmoneybox 0, 0
# 107 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_PlaySafariGameFor500, MSGBOX_YESNO
# 108 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FuchsiaCity_SafariZone_Entrance_EventScript_TryEnterSafariZone
# 109 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_OkayPleaseComeAgain
# 110 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
# 111 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 112 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 113 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_TryEnterSafariZone::
# 114 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	call FuchsiaCity_SafariZone_Entrance_EventScript_CheckSpaceForMons
# 115 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	checkmoney 500
# 116 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, FuchsiaCity_SafariZone_Entrance_EventScript_NotEnoughMoney
# 117 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	removemoney 500
# 118 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	updatemoneybox
# 119 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_ThatllBe500WeOnlyUseSpecialBalls
# 120 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 121 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 122 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	message FuchsiaCity_SafariZone_Entrance_Text_PlayerReceived30SafariBalls
# 123 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitfanfare
# 124 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	call EventScript_RestorePrevTextColor
# 125 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CallYouOnPAWhenYouRunOut
# 126 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 127 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	hidemoneybox
# 128 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	call_if_eq VAR_TEMP_2, 0, FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneMid
# 129 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	call_if_eq VAR_TEMP_2, 1, FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneRight
# 130 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	call_if_eq VAR_TEMP_2, 2, FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneLeft
# 131 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	special EnterSafariMode
# 132 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 2
# 133 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	warp MAP_SAFARI_ZONE_CENTER, 255, 26, 30
# 134 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitstate
# 135 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 136 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 137 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneRight::
# 138 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneRight
# 139 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 140 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	return
# 141 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 142 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneMid::
# 143 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneMid
# 144 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 145 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	return
# 146 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 147 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneLeft::
# 148 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneLeft
# 149 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 150 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	return
# 151 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 152 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_CheckSpaceForMons::
# 153 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	getpartysize
# 154 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_ne VAR_RESULT, PARTY_SIZE, EventScript_Return
# 155 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	specialvar VAR_RESULT, IsThereRoomInAnyBoxForMorePokemon
# 156 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, EventScript_Return
# 157 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox SafariZone_Text_ExcuseMeYourPCBoxIsFull
# 158 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
# 159 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 160 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 161 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_NotEnoughMoney::
# 162 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_OopsNotEnoughMoney
# 163 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
# 164 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 165 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 166 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack::
# 167 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	closemessage
# 168 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	hidemoneybox
# 169 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ForceBack
# 170 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	waitmovement 0
# 171 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	releaseall
# 172 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 173 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 174 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_ForceBack::
# 175 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_down
# 176 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 177 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 178 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneMid::
# 179 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 180 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 181 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 182 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 183 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneRight::
# 184 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 185 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_left
# 186 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 187 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 188 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 189 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneLeft::
# 190 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 191 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_right
# 192 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	walk_up
# 193 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	step_end
# 194 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 195 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_InfoAttendant::
# 196 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	lock
# 197 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	faceplayer
# 198 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_FirstTimeAtSafariZone, MSGBOX_YESNO
# 199 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FuchsiaCity_SafariZone_Entrance_EventScript_ExplainSafariZone
# 200 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_SorryYoureARegularHere
# 201 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	release
# 202 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
# 203 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"

# 204 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
FuchsiaCity_SafariZone_Entrance_EventScript_ExplainSafariZone::
# 205 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	msgbox FuchsiaCity_SafariZone_Entrance_Text_ExplainSafariZone
# 206 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	release
# 207 "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.pory"
	end
