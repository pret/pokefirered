# 1 "data/maps/CeruleanCity_House3/scripts.pory"

# 2 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_MapScripts::
# 3 "data/maps/CeruleanCity_House3/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_House3/scripts.pory"

# 5 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_EventScript_OldWoman::
# 6 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox CeruleanCity_House3_Text_PleaseTradeWithMyHusband, MSGBOX_NPC
# 7 "data/maps/CeruleanCity_House3/scripts.pory"
	end
# 8 "data/maps/CeruleanCity_House3/scripts.pory"

# 9 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_EventScript_Dontae::
# 10 "data/maps/CeruleanCity_House3/scripts.pory"
	lock
# 11 "data/maps/CeruleanCity_House3/scripts.pory"
	faceplayer
# 12 "data/maps/CeruleanCity_House3/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_JYNX
# 13 "data/maps/CeruleanCity_House3/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 14 "data/maps/CeruleanCity_House3/scripts.pory"
	goto_if_set FLAG_DID_ZYNX_TRADE, CeruleanCity_House3_EventScript_AlreadyTraded
# 15 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox Trade_Text_DoYouHaveMonWouldYouTradeForMon, MSGBOX_YESNO
# 16 "data/maps/CeruleanCity_House3/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CeruleanCity_House3_EventScript_DeclineTrade
# 17 "data/maps/CeruleanCity_House3/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 18 "data/maps/CeruleanCity_House3/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, CeruleanCity_House3_EventScript_DeclineTrade
# 19 "data/maps/CeruleanCity_House3/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 20 "data/maps/CeruleanCity_House3/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, CeruleanCity_House3_EventScript_NotRequestedMon
# 21 "data/maps/CeruleanCity_House3/scripts.pory"
	call EventScript_DoInGameTrade
# 22 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox Trade_Text_Thanks
# 23 "data/maps/CeruleanCity_House3/scripts.pory"
	setflag FLAG_DID_ZYNX_TRADE
# 24 "data/maps/CeruleanCity_House3/scripts.pory"
	release
# 25 "data/maps/CeruleanCity_House3/scripts.pory"
	end
# 26 "data/maps/CeruleanCity_House3/scripts.pory"

# 27 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_EventScript_DeclineTrade::
# 28 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox Trade_Text_WellIfYouDontWantTo
# 29 "data/maps/CeruleanCity_House3/scripts.pory"
	release
# 30 "data/maps/CeruleanCity_House3/scripts.pory"
	end
# 31 "data/maps/CeruleanCity_House3/scripts.pory"

# 32 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_EventScript_NotRequestedMon::
# 33 "data/maps/CeruleanCity_House3/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 34 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox Trade_Text_ThisIsntMon
# 35 "data/maps/CeruleanCity_House3/scripts.pory"
	release
# 36 "data/maps/CeruleanCity_House3/scripts.pory"
	end
# 37 "data/maps/CeruleanCity_House3/scripts.pory"

# 38 "data/maps/CeruleanCity_House3/scripts.pory"
CeruleanCity_House3_EventScript_AlreadyTraded::
# 39 "data/maps/CeruleanCity_House3/scripts.pory"
	msgbox Trade_Text_HasTradedMonGrownStronger
# 40 "data/maps/CeruleanCity_House3/scripts.pory"
	release
# 41 "data/maps/CeruleanCity_House3/scripts.pory"
	end
