# 1 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 2 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_MapScripts::
# 3 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	.byte 0
# 4 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 5 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_Scientist::
# 6 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox CinnabarIsland_PokemonLab_Lounge_Text_FoundFossilInMtMoon, MSGBOX_NPC
# 7 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 8 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 9 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_Clifton::
# 10 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	lock
# 11 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	faceplayer
# 12 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_ELECTRODE
# 13 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 14 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_set FLAG_DID_ESPHERE_TRADE, CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonAlreadyTraded
# 15 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_DoYouHaveMonWouldYouTradeForMon, MSGBOX_YESNO
# 16 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade
# 17 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 18 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade
# 19 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 20 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonNotRequestedMon
# 21 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	call EventScript_DoInGameTrade
# 22 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_Thanks
# 23 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	setflag FLAG_DID_ESPHERE_TRADE
# 24 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 25 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 26 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 27 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade::
# 28 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_WellIfYouDontWantTo
# 29 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 30 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 31 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 32 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonNotRequestedMon::
# 33 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 34 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_ThisIsntMon
# 35 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 36 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 37 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 38 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonAlreadyTraded::
# 39 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_HasTradedMonGrownStronger
# 40 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 41 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 42 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 43 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_Norma::
# 44 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	lock
# 45 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	faceplayer
# 46 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_TANGELA
# 47 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x8004, VAR_0x8008
# 48 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
# 49 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x8009, VAR_RESULT
# 50 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_set FLAG_DID_TANGENY_TRADE, CinnabarIsland_PokemonLab_Lounge_EventScript_NormaAlreadyTraded
# 51 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_DoYouHaveMonWantToTradeForMon, MSGBOX_YESNO
# 52 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade
# 53 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	special ChoosePartyMon
# 54 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	waitstate
# 55 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x800A, VAR_0x8004
# 56 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade
# 57 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x8005, VAR_0x800A
# 58 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	specialvar VAR_RESULT, GetTradeSpecies
# 59 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x800B, VAR_RESULT
# 60 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, CinnabarIsland_PokemonLab_Lounge_EventScript_NormaNotRequestedMon
# 61 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x8004, VAR_0x8008
# 62 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	copyvar VAR_0x8005, VAR_0x800A
# 63 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	special CreateInGameTradePokemon
# 64 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	special DoInGameTradeScene
# 65 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	waitstate
# 66 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_ThanksYoureAPal
# 67 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	setflag FLAG_DID_TANGENY_TRADE
# 68 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 69 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 70 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 71 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade::
# 72 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_ThatsTooBad
# 73 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 74 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 75 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 76 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_NormaNotRequestedMon::
# 77 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 78 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_ThisIsNoMon
# 79 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 80 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
# 81 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"

# 82 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
CinnabarIsland_PokemonLab_Lounge_EventScript_NormaAlreadyTraded::
# 83 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	msgbox Trade_Text_HowIsMyOldMon
# 84 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	release
# 85 "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.pory"
	end
