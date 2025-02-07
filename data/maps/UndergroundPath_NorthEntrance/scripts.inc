# 1 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"

# 2 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
UndergroundPath_NorthEntrance_MapScripts::
# 3 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	.byte 0
# 4 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"

# 5 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
UndergroundPath_NorthEntrance_EventScript_Saige::
# 6 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	lock
# 7 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	faceplayer
# 8 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_NIDORAN
# 9 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 10 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	goto_if_set FLAG_DID_MS_NIDO_TRADE, UndergroundPath_NorthEntrance_EventScript_AlreadyTraded
# 11 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	msgbox Trade_Text_DoYouHaveMonWantToTradeForMon, MSGBOX_YESNO
# 12 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	goto_if_eq VAR_RESULT, NO, UndergroundPath_NorthEntrance_EventScript_DeclineTrade
# 13 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 14 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, UndergroundPath_NorthEntrance_EventScript_DeclineTrade
# 15 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 16 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, UndergroundPath_NorthEntrance_EventScript_NotRequestedMon
# 17 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	call EventScript_DoInGameTrade
# 18 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	msgbox Trade_Text_ThanksYoureAPal
# 19 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	setflag FLAG_DID_MS_NIDO_TRADE
# 20 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	release
# 21 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	end
# 22 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"

# 23 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
UndergroundPath_NorthEntrance_EventScript_DeclineTrade::
# 24 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	msgbox Trade_Text_ThatsTooBad
# 25 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	release
# 26 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	end
# 27 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"

# 28 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
UndergroundPath_NorthEntrance_EventScript_NotRequestedMon::
# 29 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 30 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	msgbox Trade_Text_ThisIsNoMon
# 31 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	release
# 32 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	end
# 33 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"

# 34 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
UndergroundPath_NorthEntrance_EventScript_AlreadyTraded::
# 35 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	msgbox Trade_Text_HowIsMyOldMon
# 36 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	release
# 37 "data/maps/UndergroundPath_NorthEntrance/scripts.pory"
	end
