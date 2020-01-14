CinnabarIsland_PokemonLab_Lounge_MapScripts:: @ 816E2B8
	.byte 0

CinnabarIsland_PokemonLab_Lounge_EventScript_16E2B9:: @ 816E2B9
	msgbox gUnknown_8199FB3, MSGBOX_NPC
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_16E2C2:: @ 816E2C2
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_ELECTRODE
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_ESPHERE_TRADE, EventScript_16E334
	msgbox Trade_Text_DoYouHaveMonWouldYouTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16E31C
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge EventScript_16E31C
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16E326
	call EventScript_DoInGameTrade
	msgbox Trade_Text_Thanks
	setflag FLAG_DID_ESPHERE_TRADE
	release
	end

EventScript_16E31C:: @ 816E31C
	msgbox Trade_Text_WellIfYouDontWantTo
	release
	end

EventScript_16E326:: @ 816E326
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_ThisIsntMon
	release
	end

EventScript_16E334:: @ 816E334
	msgbox Trade_Text_HasTradedMonGrownStronger
	release
	end

CinnabarIsland_PokemonLab_Lounge_EventScript_16E33E:: @ 816E33E
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_TANGELA
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	goto_if_set FLAG_DID_TANGENY_TRADE, EventScript_16E3D4
	msgbox gUnknown_81A5AD6, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16E3BC
	special Special_ChooseMonFromParty
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge EventScript_16E3BC
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16E3C6
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox gUnknown_81A5B4A
	setflag FLAG_DID_TANGENY_TRADE
	release
	end

EventScript_16E3BC:: @ 816E3BC
	msgbox gUnknown_81A5B08
	release
	end

EventScript_16E3C6:: @ 816E3C6
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5B18
	release
	end

EventScript_16E3D4:: @ 816E3D4
	msgbox gUnknown_81A5B60
	release
	end
