CinnabarIsland_PokemonLab_Lounge_MapScripts:: @ 816E2B8
	.byte 0

CinnabarIsland_PokemonLab_Lounge_EventScript_Scientist:: @ 816E2B9
	msgbox CinnabarIsland_PokemonLab_Lounge_Text_FoundFossilInMtMoon, MSGBOX_NPC
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_Clifton:: @ 816E2C2
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_ELECTRODE
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_ESPHERE_TRADE, CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonAlreadyTraded
	msgbox Trade_Text_DoYouHaveMonWouldYouTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonNotRequestedMon
	call EventScript_DoInGameTrade
	msgbox Trade_Text_Thanks
	setflag FLAG_DID_ESPHERE_TRADE
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonDeclineTrade:: @ 816E31C
	msgbox Trade_Text_WellIfYouDontWantTo
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonNotRequestedMon:: @ 816E326
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_ThisIsntMon
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_CliftonAlreadyTraded:: @ 816E334
	msgbox Trade_Text_HasTradedMonGrownStronger
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_Norma:: @ 816E33E
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_TANGELA
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	goto_if_set FLAG_DID_TANGENY_TRADE, CinnabarIsland_PokemonLab_Lounge_EventScript_NormaAlreadyTraded
	msgbox Trade_Text_DoYouHaveMonWantToTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade
	special ChoosePartyMon
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne CinnabarIsland_PokemonLab_Lounge_EventScript_NormaNotRequestedMon
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox Trade_Text_ThanksYoureAPal
	setflag FLAG_DID_TANGENY_TRADE
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_NormaDeclineTrade:: @ 816E3BC
	msgbox Trade_Text_ThatsTooBad
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_NormaNotRequestedMon:: @ 816E3C6
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_ThisIsNoMon
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_NormaAlreadyTraded:: @ 816E3D4
	msgbox Trade_Text_HowIsMyOldMon
	release
	end
