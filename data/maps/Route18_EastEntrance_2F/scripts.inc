# 1 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 2 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_MapScripts::
# 3 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	.byte 0
# 4 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 5 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_LeftBinoculars::
# 6 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Route18_EastEntrance_2F_Text_PalletTownInWest, MSGBOX_SIGN
# 7 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
# 8 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 9 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_RightBinoculars::
# 10 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Route18_EastEntrance_2F_Text_PeopleSwimming, MSGBOX_SIGN
# 11 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
# 12 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 13 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_Haden::
# 14 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	lock
# 15 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	faceplayer
# 16 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_LICKITUNG
# 17 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 18 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	goto_if_set FLAG_DID_MARC_TRADE, Route18_EastEntrance_2F_EventScript_AlreadyTraded
# 19 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
# 20 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route18_EastEntrance_2F_EventScript_DeclineTrade
# 21 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 22 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, Route18_EastEntrance_2F_EventScript_DeclineTrade
# 23 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 24 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, Route18_EastEntrance_2F_EventScript_NotRequestedMon
# 25 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	call EventScript_DoInGameTrade
# 26 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_HeyThanks
# 27 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	setflag FLAG_DID_MARC_TRADE
# 28 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	release
# 29 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
# 30 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 31 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_DeclineTrade::
# 32 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_AwwOhWell
# 33 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	release
# 34 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
# 35 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 36 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_NotRequestedMon::
# 37 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 38 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_WhatThatsNoMon
# 39 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	release
# 40 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
# 41 "data/maps/Route18_EastEntrance_2F/scripts.pory"

# 42 "data/maps/Route18_EastEntrance_2F/scripts.pory"
Route18_EastEntrance_2F_EventScript_AlreadyTraded::
# 43 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_IsntMyOldMonGreat
# 44 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	release
# 45 "data/maps/Route18_EastEntrance_2F/scripts.pory"
	end
