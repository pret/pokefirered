UndergroundPath_NorthEntrance_MapScripts:: @ 8160E38
	.byte 0

UndergroundPath_NorthEntrance_EventScript_Saige:: @ 8160E39
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_NIDORAN
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_MS_NIDO_TRADE, UndergroundPath_NorthEntrance_EventScript_AlreadyTraded
	msgbox Trade_Text_DoYouHaveMonWantToTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq UndergroundPath_NorthEntrance_EventScript_DeclineTrade
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge UndergroundPath_NorthEntrance_EventScript_DeclineTrade
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne UndergroundPath_NorthEntrance_EventScript_NotRequestedMon
	call EventScript_DoInGameTrade
	msgbox Trade_Text_ThanksYoureAPal
	setflag FLAG_DID_MS_NIDO_TRADE
	release
	end

UndergroundPath_NorthEntrance_EventScript_DeclineTrade:: @ 8160E93
	msgbox Trade_Text_ThatsTooBad
	release
	end

UndergroundPath_NorthEntrance_EventScript_NotRequestedMon:: @ 8160E9D
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_ThisIsNoMon
	release
	end

UndergroundPath_NorthEntrance_EventScript_AlreadyTraded:: @ 8160EAB
	msgbox Trade_Text_HowIsMyOldMon
	release
	end
