# 1 "data/maps/Route2_House/scripts.pory"

# 2 "data/maps/Route2_House/scripts.pory"
Route2_House_MapScripts::
# 3 "data/maps/Route2_House/scripts.pory"
	.byte 0
# 4 "data/maps/Route2_House/scripts.pory"

# 5 "data/maps/Route2_House/scripts.pory"
Route2_House_EventScript_Scientist::
# 6 "data/maps/Route2_House/scripts.pory"
	msgbox Route2_House_Text_FaintedMonsCanUseFieldMoves, MSGBOX_NPC
# 7 "data/maps/Route2_House/scripts.pory"
	end
# 8 "data/maps/Route2_House/scripts.pory"

# 9 "data/maps/Route2_House/scripts.pory"
Route2_House_EventScript_Reyley::
# 10 "data/maps/Route2_House/scripts.pory"
	lock
# 11 "data/maps/Route2_House/scripts.pory"
	faceplayer
# 12 "data/maps/Route2_House/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_MR_MIME
# 13 "data/maps/Route2_House/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 14 "data/maps/Route2_House/scripts.pory"
	goto_if_set FLAG_DID_MIMIEN_TRADE, Route2_House_EventScript_AlreadyTraded
# 15 "data/maps/Route2_House/scripts.pory"
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
# 16 "data/maps/Route2_House/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route2_House_EventScript_DeclineTrade
# 17 "data/maps/Route2_House/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 18 "data/maps/Route2_House/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, Route2_House_EventScript_DeclineTrade
# 19 "data/maps/Route2_House/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 20 "data/maps/Route2_House/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, Route2_House_EventScript_NotRequestedMon
# 21 "data/maps/Route2_House/scripts.pory"
	call EventScript_DoInGameTrade
# 22 "data/maps/Route2_House/scripts.pory"
	msgbox Trade_Text_HeyThanks
# 23 "data/maps/Route2_House/scripts.pory"
	setflag FLAG_DID_MIMIEN_TRADE
# 24 "data/maps/Route2_House/scripts.pory"
	release
# 25 "data/maps/Route2_House/scripts.pory"
	end
# 26 "data/maps/Route2_House/scripts.pory"

# 27 "data/maps/Route2_House/scripts.pory"
Route2_House_EventScript_DeclineTrade::
# 28 "data/maps/Route2_House/scripts.pory"
	msgbox Trade_Text_AwwOhWell
# 29 "data/maps/Route2_House/scripts.pory"
	release
# 30 "data/maps/Route2_House/scripts.pory"
	end
# 31 "data/maps/Route2_House/scripts.pory"

# 32 "data/maps/Route2_House/scripts.pory"
Route2_House_EventScript_NotRequestedMon::
# 33 "data/maps/Route2_House/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 34 "data/maps/Route2_House/scripts.pory"
	msgbox Trade_Text_WhatThatsNoMon
# 35 "data/maps/Route2_House/scripts.pory"
	release
# 36 "data/maps/Route2_House/scripts.pory"
	end
# 37 "data/maps/Route2_House/scripts.pory"

# 38 "data/maps/Route2_House/scripts.pory"
Route2_House_EventScript_AlreadyTraded::
# 39 "data/maps/Route2_House/scripts.pory"
	msgbox Trade_Text_IsntMyOldMonGreat
# 40 "data/maps/Route2_House/scripts.pory"
	release
# 41 "data/maps/Route2_House/scripts.pory"
	end
