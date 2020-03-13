Route18_EastEntrance_2F_MapScripts:: @ 817046B
	.byte 0

Route18_EastEntrance_2F_EventScript_LeftBinoculars:: @ 817046C
	msgbox Route18_EastEntrance_2F_Text_PalletTownInWest, MSGBOX_SIGN
	end

Route18_EastEntrance_2F_EventScript_RightBinoculars:: @ 8170475
	msgbox Route18_EastEntrance_2F_Text_PeopleSwimming, MSGBOX_SIGN
	end

Route18_EastEntrance_2F_EventScript_Haden:: @ 817047E
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_LICKITUNG
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_MARC_TRADE, Route18_EastEntrance_2F_EventScript_AlreadyTraded
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq Route18_EastEntrance_2F_EventScript_DeclineTrade
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge Route18_EastEntrance_2F_EventScript_DeclineTrade
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne Route18_EastEntrance_2F_EventScript_NotRequestedMon
	call EventScript_DoInGameTrade
	msgbox Trade_Text_HeyThanks
	setflag FLAG_DID_MARC_TRADE
	release
	end

Route18_EastEntrance_2F_EventScript_DeclineTrade:: @ 81704D8
	msgbox Trade_Text_AwwOhWell
	release
	end

Route18_EastEntrance_2F_EventScript_NotRequestedMon:: @ 81704E2
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_WhatThatsNoMon
	release
	end

Route18_EastEntrance_2F_EventScript_AlreadyTraded:: @ 81704F0
	msgbox Trade_Text_IsntMyOldMonGreat
	release
	end
