# 1 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 2 "data/maps/PalletTown_RivalsHouse/scripts.pory"
.equ LOCALID_DAISY,    1
# 3 "data/maps/PalletTown_RivalsHouse/scripts.pory"
.equ LOCALID_TOWN_MAP, 2
# 4 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 5 "data/maps/PalletTown_RivalsHouse/scripts.pory"
.equ RECEIVED_TOWN_MAP, VAR_TEMP_1
# 6 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 7 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_MapScripts::
# 8 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_RivalsHouse_OnTransition
# 9 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	.byte 0
# 10 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 11 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_OnTransition::
# 12 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	call_if_lt VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2, PalletTown_RivalsHouse_EventScript_MoveDaisyToTable
# 13 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	call_if_ge VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2, PalletTown_RivalsHouse_EventScript_AlreadyReceivedTownMap
# 14 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 15 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 16 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MoveDaisyToTable::
# 17 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	setobjectmovementtype LOCALID_DAISY, MOVEMENT_TYPE_FACE_RIGHT
# 18 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	setobjectxyperm LOCALID_DAISY, 5, 4
# 19 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	return
# 20 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 21 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_AlreadyReceivedTownMap::
# 22 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	setvar RECEIVED_TOWN_MAP, TRUE
# 23 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	return
# 24 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 25 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_Daisy::
# 26 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	lock
# 27 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	faceplayer
# 28 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	famechecker FAMECHECKER_DAISY, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 29 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, PalletTown_RivalsHouse_EventScript_GroomMon
# 30 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq RECEIVED_TOWN_MAP, TRUE, PalletTown_RivalsHouse_EventScript_PleaseGiveMonsRest
# 31 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2, PalletTown_RivalsHouse_EventScript_ExplainTownMap
# 32 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 1, PalletTown_RivalsHouse_EventScript_GiveTownMap
# 33 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1, PalletTown_RivalsHouse_EventScript_HeardBattledRival
# 34 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_HiBrothersAtLab
# 35 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	closemessage
# 36 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	applymovement LOCALID_DAISY, Common_Movement_FaceOriginalDirection
# 37 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	waitmovement 0
# 38 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 39 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 40 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 41 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_HeardBattledRival::
# 42 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_HeardYouBattledRival
# 43 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 44 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 45 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 46 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_GroomMon::
# 47 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 48 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	special QuestLog_CutRecording
# 49 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_lt VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 500, PalletTown_RivalsHouse_EventScript_RateMonFriendship
# 50 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_LikeMeToGroomMon, MSGBOX_YESNO
# 51 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PalletTown_RivalsHouse_EventScript_DeclineGrooming
# 52 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_GroomWhichOne
# 53 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	special ChoosePartyMon
# 54 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	waitstate
# 55 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	lock
# 56 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	faceplayer
# 57 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, PalletTown_RivalsHouse_EventScript_DeclineGrooming
# 58 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	specialvar VAR_RESULT, GetPartyMonSpecies
# 59 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq VAR_RESULT, SPECIES_EGG, PalletTown_RivalsHouse_EventScript_CantGroomEgg
# 60 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_LookingNiceInNoTime
# 61 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	closemessage
# 62 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	fadescreen FADE_TO_BLACK
# 63 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	playfanfare MUS_HEAL
# 64 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	waitfanfare
# 65 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	special DaisyMassageServices
# 66 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 67 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	special BufferMonNickname
# 68 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ThereYouGoAllDone
# 69 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 70 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 71 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 72 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_CantGroomEgg::
# 73 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_CantGroomAnEgg
# 74 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 75 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 76 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 77 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_DeclineGrooming::
# 78 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_DontNeedAnyGrooming
# 79 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 80 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 81 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 82 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_RateMonFriendship::
# 83 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_MayISeeFirstMon
# 84 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	specialvar VAR_RESULT, GetLeadMonFriendship
# 85 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	switch VAR_RESULT
# 86 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 0, PalletTown_RivalsHouse_EventScript_MonFriendshipLowest
# 87 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 1, PalletTown_RivalsHouse_EventScript_MonFriendshipLower
# 88 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 2, PalletTown_RivalsHouse_EventScript_MonFriendshipLow
# 89 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 3, PalletTown_RivalsHouse_EventScript_MonFriendshipMid
# 90 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 4, PalletTown_RivalsHouse_EventScript_MonFriendshipHigh
# 91 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 5, PalletTown_RivalsHouse_EventScript_MonFriendshipHigher
# 92 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	case 6, PalletTown_RivalsHouse_EventScript_MonFriendshipHighest
# 93 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 94 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 95 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipLowest::
# 96 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_WhyWouldMonHateYouSoMuch
# 97 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 98 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 99 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 100 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipLower::
# 101 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_DontLikeWayItGlaresAtYou
# 102 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 103 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 104 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 105 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipLow::
# 106 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_NotFamiliarWithYouYet
# 107 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 108 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 109 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 110 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipMid::
# 111 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ItsWarmingUpToYou
# 112 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 113 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 114 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 115 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipHigh::
# 116 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ItsQuiteFriendly
# 117 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 118 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 119 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 120 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipHigher::
# 121 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ItLooksVeryHappy
# 122 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 123 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 124 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 125 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_MonFriendshipHighest::
# 126 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_CouldntLoveYouMore
# 127 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 128 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 129 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 130 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_PleaseGiveMonsRest::
# 131 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_PleaseGiveMonsRest
# 132 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 133 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 134 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 135 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_GiveTownMap::
# 136 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ErrandForGrandpaThisWillHelp
# 137 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	closemessage
# 138 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	checkitemspace ITEM_TOWN_MAP
# 139 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PalletTown_RivalsHouse_EventScript_NoRoomForTownMap
# 140 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	applymovement LOCALID_DAISY, Common_Movement_WalkInPlaceFasterRight
# 141 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	waitmovement 0
# 142 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	removeobject LOCALID_TOWN_MAP
# 143 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2
# 144 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	delay 15
# 145 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	applymovement LOCALID_DAISY, Common_Movement_FacePlayer
# 146 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	waitmovement 0
# 147 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	delay 12
# 148 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	giveitem_msg PalletTown_RivalsHouse_Text_ReceivedTownMapFromDaisy, ITEM_TOWN_MAP, 1, MUS_OBTAIN_KEY_ITEM
# 149 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 150 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 151 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 152 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_NoRoomForTownMap::
# 153 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_DontHaveSpaceForThis
# 154 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 155 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 156 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 157 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_ExplainTownMap::
# 158 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ExplainTownMap
# 159 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	release
# 160 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 161 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 162 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_TownMap::
# 163 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ItsBigMapOfKanto, MSGBOX_NPC
# 164 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 165 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 166 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_Bookshelf::
# 167 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_ShelvesCrammedFullOfBooks, MSGBOX_SIGN
# 168 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
# 169 "data/maps/PalletTown_RivalsHouse/scripts.pory"

# 170 "data/maps/PalletTown_RivalsHouse/scripts.pory"
PalletTown_RivalsHouse_EventScript_Picture::
# 171 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	msgbox PalletTown_RivalsHouse_Text_LovelyAndSweetClefairy, MSGBOX_SIGN
# 172 "data/maps/PalletTown_RivalsHouse/scripts.pory"
	end
