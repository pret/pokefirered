# 1 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 2 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
.equ LOCALID_SELPHY, 1
# 3 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
.equ LOCALID_BUTLER, 2
# 4 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 5 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
.equ SHOWN_REQUESTED_MON, FLAG_TEMP_2
# 6 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 7 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_MapScripts::
# 8 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	.byte 0
# 9 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 10 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_Selphy::
# 11 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 12 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	special QuestLog_CutRecording
# 13 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	lock
# 14 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	faceplayer
# 15 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_set SHOWN_REQUESTED_MON, FiveIsland_ResortGorgeous_House_EventScript_JustFulfilledRequest
# 16 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_eq VAR_RESORT_GORGEOUS_REQUESTED_MON, 0xFFFF, FiveIsland_ResortGorgeous_House_EventScript_RequestTookTooLong
# 17 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_ne VAR_RESORT_GORGEOUS_REQUESTED_MON, SPECIES_NONE, FiveIsland_ResortGorgeous_House_EventScript_CheckForRequestedMon
# 18 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_PleaseHearMyWish
# 19 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto FiveIsland_ResortGorgeous_House_EventScript_RequestMon
# 20 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 21 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 22 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_RequestMon::
# 23 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	special SampleResortGorgeousMonAndReward
# 24 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_WishToSeeMonPlease
# 25 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	release
# 26 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 27 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 28 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_RequestTookTooLong::
# 29 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_OhImTiredOfWaiting
# 30 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto FiveIsland_ResortGorgeous_House_EventScript_RequestMon
# 31 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 32 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 33 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_CheckForRequestedMon::
# 34 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	copyvar VAR_0x8004, VAR_RESORT_GORGEOUS_REQUESTED_MON
# 35 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	specialvar VAR_RESULT, DoesPlayerPartyContainSpecies
# 36 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, FiveIsland_ResortGorgeous_House_EventScript_ShowRequestedMon
# 37 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto FiveIsland_ResortGorgeous_House_EventScript_RequestMon
# 38 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 39 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 40 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_ShowRequestedMon::
# 41 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	special SampleResortGorgeousMonAndReward
# 42 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_MonYouCaughtForMeThankYou
# 43 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	addobject LOCALID_BUTLER
# 44 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_BUTLER, FiveIsland_ResortGorgeous_House_Movement_ButlerEnter
# 45 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 46 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 47 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_ButlerYesMyLady
# 48 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_SELPHY, Common_Movement_WalkInPlaceFasterUp
# 49 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 50 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 51 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_SelphyGiveTokenOfAppreciation
# 52 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 53 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_ButlerIShallDoAsYouBid
# 54 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	closemessage
# 55 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerNorth
# 56 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerSouth
# 57 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerEast
# 58 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerWest
# 59 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	copyobjectxytoperm LOCALID_BUTLER
# 60 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_ButlerPleaseAcceptThisAsHerThanks
# 61 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	giveitem VAR_RESORT_GORGEOUS_REWARD
# 62 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, FiveIsland_ResortGorgeous_House_EventScript_NoRoomForReward
# 63 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	setflag SHOWN_REQUESTED_MON
# 64 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	setvar VAR_RESORT_GORGEOUS_REQUESTED_MON, SPECIES_NONE
# 65 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	release
# 66 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 67 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 68 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerNorth::
# 69 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_SELPHY, Common_Movement_WalkInPlaceFasterDown
# 70 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_BUTLER, FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerNorth
# 71 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 72 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 73 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 74 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	return
# 75 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 76 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerSouth::
# 77 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_BUTLER, FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerSouth
# 78 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 79 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 80 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 81 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	return
# 82 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 83 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerEast::
# 84 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_SELPHY, Common_Movement_WalkInPlaceFasterLeft
# 85 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_BUTLER, FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerEast
# 86 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 87 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 88 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 89 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	return
# 90 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 91 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_ButlerApproachPlayerWest::
# 92 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	applymovement LOCALID_BUTLER, FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerWest
# 93 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	waitmovement 0
# 94 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	return
# 95 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 96 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_NoRoomForReward::
# 97 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 98 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_ButlerBagAppearsToBeFull
# 99 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 100 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_OhHowDisappointing
# 101 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	setflag SHOWN_REQUESTED_MON
# 102 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	setvar VAR_RESORT_GORGEOUS_REQUESTED_MON, SPECIES_NONE
# 103 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	release
# 104 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 105 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 106 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_JustFulfilledRequest::
# 107 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_SelphyWishYouBestOfLuck
# 108 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	release
# 109 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
# 110 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 111 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerNorth::
# 112 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 113 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 114 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 115 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_down
# 116 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_down
# 117 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_down
# 118 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_in_place_faster_right
# 119 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	step_end
# 120 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 121 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerSouth::
# 122 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 123 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 124 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_in_place_faster_down
# 125 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	step_end
# 126 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 127 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerEast::
# 128 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 129 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 130 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_left
# 131 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_down
# 132 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	step_end
# 133 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 134 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
@ Very odd. If the player is talking to Selphy facing West, then the player has clipped through the table
# 135 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
@ In this case rather than approach the player the Butler walks up, which clips the Butler into a wall
# 136 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_Movement_ButlerApproachPlayerWest::
# 137 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_up
# 138 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	step_end
# 139 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 140 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_Movement_ButlerEnter::
# 141 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	walk_in_place_down
# 142 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	step_end
# 143 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"

# 144 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
@ Addressed as "Sebastian" but speaks only as "Butler"
# 145 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
FiveIsland_ResortGorgeous_House_EventScript_Butler::
# 146 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_House_Text_LadySelphySmileHasBrillianceOfSun, MSGBOX_NPC
# 147 "data/maps/FiveIsland_ResortGorgeous_House/scripts.pory"
	end
