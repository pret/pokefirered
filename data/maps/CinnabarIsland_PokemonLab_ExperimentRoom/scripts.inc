# 1 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 2 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
.equ HELIX_FOSSIL, 1
# 3 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
.equ DOME_FOSSIL,  2
# 4 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
.equ OLD_AMBER,    3
# 5 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 6 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_MapScripts::
# 7 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	.byte 0
# 8 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 9 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_Garett::
# 10 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	lock
# 11 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	faceplayer
# 12 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_SEEL
# 13 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 14 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_DID_SEELOR_TRADE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_AlreadyTraded
# 15 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
# 16 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineTrade
# 17 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 18 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineTrade
# 19 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 20 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NotRequestedMon
# 21 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_DoInGameTrade
# 22 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Trade_Text_HeyThanks
# 23 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setflag FLAG_DID_SEELOR_TRADE
# 24 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 25 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 26 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 27 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineTrade::
# 28 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Trade_Text_AwwOhWell
# 29 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 30 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 31 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 32 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NotRequestedMon::
# 33 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 34 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Trade_Text_WhatThatsNoMon
# 35 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 36 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 37 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 38 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_AlreadyTraded::
# 39 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Trade_Text_IsntMyOldMonGreat
# 40 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 41 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 42 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 43 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_FossilScientist::
# 44 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	lock
# 45 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	faceplayer
# 46 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, FALSE
# 47 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call_if_set FLAG_REVIVED_AMBER, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedMtMoonFossil
# 48 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_RevivedAllFossils
# 49 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 2, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveRevivedMon
# 50 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_FossilStillReviving
# 51 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddHelixFossilToList
# 52 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilHelix
# 53 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddDomeFossilToList
# 54 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilDome
# 55 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddOldAmberToList
# 56 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilAmber
# 57 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_HaveYouAFossilForMe
# 58 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 59 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 60 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 61 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddHelixFossilToList::
# 62 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_unset FLAG_GOT_HELIX_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 63 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_REVIVED_HELIX, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 64 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, TRUE
# 65 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
# 66 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 67 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddDomeFossilToList::
# 68 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_unset FLAG_GOT_DOME_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 69 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_REVIVED_DOME, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 70 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, TRUE
# 71 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
# 72 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 73 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddOldAmberToList::
# 74 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_unset FLAG_GOT_OLD_AMBER, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 75 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_REVIVED_AMBER, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 76 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, TRUE
# 77 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
# 78 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 79 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse::
# 80 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, FALSE
# 81 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
# 82 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 83 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil::
# 84 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_NoIsTooBad
# 85 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 86 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 87 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 88 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilHelix::
# 89 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	message CinnabarIsland_PokemonLab_ExperimentRoom_Text_HaveYouAFossilForMe
# 90 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitmessage
# 91 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddOldAmberToList
# 92 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilHelixAmber
# 93 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_HELIX, FALSE
# 94 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	switch VAR_RESULT
# 95 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowHelixFossil
# 96 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 97 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 127, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 98 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 99 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 100 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilDome::
# 101 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	message CinnabarIsland_PokemonLab_ExperimentRoom_Text_HaveYouAFossilForMe
# 102 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitmessage
# 103 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckAddOldAmberToList
# 104 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilDomeAmber
# 105 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_DOME, FALSE
# 106 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	switch VAR_RESULT
# 107 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowDomeFossil
# 108 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 109 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 127, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 110 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 111 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 112 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilAmber::
# 113 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	message CinnabarIsland_PokemonLab_ExperimentRoom_Text_HaveYouAFossilForMe
# 114 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitmessage
# 115 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_AMBER, FALSE
# 116 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	switch VAR_RESULT
# 117 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowOldAmber
# 118 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 119 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 127, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 120 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 121 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 122 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilHelixAmber::
# 123 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_HELIX_AMBER, FALSE
# 124 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	switch VAR_RESULT
# 125 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowHelixFossil
# 126 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowOldAmber
# 127 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 2, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 128 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 127, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 129 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 130 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 131 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ChooseFossilDomeAmber::
# 132 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	multichoice 0, 0, MULTICHOICE_DOME_AMBER, FALSE
# 133 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	switch VAR_RESULT
# 134 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowDomeFossil
# 135 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowOldAmber
# 136 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 2, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 137 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	case 127, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DontShowFossil
# 138 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 139 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 140 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowHelixFossil::
# 141 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_OMANYTE
# 142 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_HELIX_FOSSIL
# 143 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_ThatFossilIsOfMonMakeItLiveAgain, MSGBOX_YESNO
# 144 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineReviveFossil
# 145 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_HandedFossilToWeirdDoctor
# 146 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 147 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	removeitem ITEM_HELIX_FOSSIL
# 148 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_TakesTimeGoForWalk
# 149 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
# 150 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, HELIX_FOSSIL
# 151 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 152 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 153 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 154 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowDomeFossil::
# 155 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_KABUTO
# 156 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_DOME_FOSSIL
# 157 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_ThatFossilIsOfMonMakeItLiveAgain, MSGBOX_YESNO
# 158 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineReviveFossil
# 159 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_HandedFossilToWeirdDoctor
# 160 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 161 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	removeitem ITEM_DOME_FOSSIL
# 162 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_TakesTimeGoForWalk
# 163 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
# 164 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, DOME_FOSSIL
# 165 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 166 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 167 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 168 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_ShowOldAmber::
# 169 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_AERODACTYL
# 170 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_OLD_AMBER
# 171 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_ThatFossilIsOfMonMakeItLiveAgain, MSGBOX_YESNO
# 172 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineReviveFossil
# 173 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_HandedFossilToWeirdDoctor
# 174 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 175 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	removeitem ITEM_OLD_AMBER
# 176 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_TakesTimeGoForWalk
# 177 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
# 178 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, OLD_AMBER
# 179 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 180 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 181 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 182 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_DeclineReviveFossil::
# 183 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_YouComeAgain
# 184 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 185 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 186 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 187 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_FossilStillReviving::
# 188 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_TakesTimeGoForWalk
# 189 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 190 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 191 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 192 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveRevivedMon::
# 193 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, HELIX_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveOmanyte
# 194 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, DOME_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveKabuto
# 195 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, OLD_AMBER, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveAerodactyl
# 196 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 197 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 198 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveOmanyte::
# 199 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_OMANYTE
# 200 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_OMANYTE
# 201 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_FossilMonBackToLife
# 202 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	givemon SPECIES_OMANYTE, 5
# 203 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 2, EventScript_NoMoreRoomForPokemon
# 204 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setflag FLAG_REVIVED_HELIX
# 205 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonParty
# 206 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonPC
# 207 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 208 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 209 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveKabuto::
# 210 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_KABUTO
# 211 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_KABUTO
# 212 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_FossilMonBackToLife
# 213 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	givemon SPECIES_KABUTO, 5
# 214 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 2, EventScript_NoMoreRoomForPokemon
# 215 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setflag FLAG_REVIVED_DOME
# 216 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonParty
# 217 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonPC
# 218 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 219 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 220 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_GiveAerodactyl::
# 221 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_AERODACTYL
# 222 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	bufferspeciesname STR_VAR_1, SPECIES_AERODACTYL
# 223 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_FossilMonBackToLife
# 224 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	givemon SPECIES_AERODACTYL, 5
# 225 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 2, EventScript_NoMoreRoomForPokemon
# 226 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setflag FLAG_REVIVED_AMBER
# 227 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonParty
# 228 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, 1, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonPC
# 229 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 230 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 231 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonParty::
# 232 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 233 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 234 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	message CinnabarIsland_PokemonLab_ExperimentRoom_Text_ReceivedMonFromDoctor
# 235 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitmessage
# 236 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitfanfare
# 237 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 0
# 238 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 239 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_EndGiveMon
# 240 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_GetGiftMonPartySlot
# 241 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_ChangePokemonNickname
# 242 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_EndGiveMon
# 243 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 244 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 245 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_NicknameMonPC::
# 246 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 247 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 248 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	message CinnabarIsland_PokemonLab_ExperimentRoom_Text_ReceivedMonFromDoctor
# 249 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitmessage
# 250 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	waitfanfare
# 251 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 0
# 252 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 253 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_MonSentToPC
# 254 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_NameReceivedBoxMon
# 255 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_MonSentToPC
# 256 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 257 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 258 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_MonSentToPC::
# 259 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	call EventScript_TransferredToPC
# 260 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_EndGiveMon
# 261 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 262 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 263 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_EndGiveMon::
# 264 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 265 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 266 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 267 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_RevivedAllFossils::
# 268 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_ExperimentRoom_Text_YouComeAgain
# 269 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	release
# 270 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 271 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 272 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedMtMoonFossil::
# 273 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_GOT_HELIX_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedHelix
# 274 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_set FLAG_GOT_DOME_FOSSIL, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedDome
# 275 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 276 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	end
# 277 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 278 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedHelix::
# 279 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_unset FLAG_REVIVED_HELIX, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 280 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, TRUE
# 281 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
# 282 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"

# 283 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_CheckRevivedDome::
# 284 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	goto_if_unset FLAG_REVIVED_DOME, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_SetResultFalse
# 285 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	setvar VAR_RESULT, TRUE
# 286 "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.pory"
	return
