# 1 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 2 "data/maps/Route11_EastEntrance_2F/scripts.pory"
.equ REQUIRED_CAUGHT_MONS, 30
# 3 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 4 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_MapScripts::
# 5 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	.byte 0
# 6 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 7 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_LeftBinoculars::
# 8 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	lockall
# 9 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_set FLAG_WOKE_UP_ROUTE_12_SNORLAX, Route11_EastEntrance_2F_EventScript_LeftBinocularsSnorlaxGone
# 10 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_BigMonAsleepOnRoad
# 11 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	releaseall
# 12 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 13 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 14 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_LeftBinocularsSnorlaxGone::
# 15 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_WhatABreathtakingView
# 16 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	releaseall
# 17 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 18 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 19 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_RightBinoculars::
# 20 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_RockTunnelGoodRouteToLavender, MSGBOX_SIGN
# 21 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 22 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 23 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_Turner::
# 24 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	lock
# 25 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	faceplayer
# 26 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_NIDORINOA
# 27 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 28 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_set FLAG_DID_NINA_TRADE, Route11_EastEntrance_2F_EventScript_AlreadyTraded
# 29 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
# 30 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route11_EastEntrance_2F_EventScript_DeclineTrade
# 31 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 32 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, Route11_EastEntrance_2F_EventScript_DeclineTrade
# 33 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 34 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, Route11_EastEntrance_2F_EventScript_NotRequestedMon
# 35 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call EventScript_DoInGameTrade
# 36 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_HeyThanks
# 37 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	setflag FLAG_DID_NINA_TRADE
# 38 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 39 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 40 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 41 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_DeclineTrade::
# 42 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_AwwOhWell
# 43 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 44 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 45 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 46 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_NotRequestedMon::
# 47 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 48 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_WhatThatsNoMon
# 49 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 50 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 51 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 52 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_AlreadyTraded::
# 53 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Trade_Text_IsntMyOldMonGreat
# 54 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 55 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 56 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 57 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_Aide::
# 58 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	lock
# 59 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	faceplayer
# 60 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call Route11_EastEntrance_2F_EventScript_GetAideRequestInfo
# 61 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_set FLAG_GOT_ITEMFINDER, Route11_EastEntrance_2F_EventScript_AlreadyGotItemfinder
# 62 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_GiveItemfinderIfCaught30, MSGBOX_YESNO
# 63 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Aide_EventScript_DeclineCheckMons
# 64 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	setvar VAR_0x8004, 0
# 65 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	specialvar VAR_RESULT, GetPokedexCount
# 66 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	buffernumberstring STR_VAR_3, VAR_0x8006
# 67 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	call Route11_EastEntrance_2F_EventScript_GetAideRequestInfo
# 68 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_lt VAR_0x8006, REQUIRED_CAUGHT_MONS, Aide_EventScript_HaventCaughtEnough
# 69 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_GreatHereYouGo
# 70 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	checkitemspace ITEM_ITEMFINDER
# 71 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Aide_EventScript_NoRoomForItem
# 72 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	giveitem_msg Route11_EastEntrance_2F_Text_ReceivedItemfinderFromAide, ITEM_ITEMFINDER
# 73 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	setflag FLAG_GOT_ITEMFINDER
# 74 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_ExplainItemfinder
# 75 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 76 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 77 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 78 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_AlreadyGotItemfinder::
# 79 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	msgbox Route11_EastEntrance_2F_Text_ExplainItemfinder
# 80 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	release
# 81 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	end
# 82 "data/maps/Route11_EastEntrance_2F/scripts.pory"

# 83 "data/maps/Route11_EastEntrance_2F/scripts.pory"
Route11_EastEntrance_2F_EventScript_GetAideRequestInfo::
# 84 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	buffernumberstring STR_VAR_1, REQUIRED_CAUGHT_MONS
# 85 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	bufferitemname STR_VAR_2, ITEM_ITEMFINDER
# 86 "data/maps/Route11_EastEntrance_2F/scripts.pory"
	return
