# 1 "data/maps/VermilionCity_House2/scripts.pory"

# 2 "data/maps/VermilionCity_House2/scripts.pory"
VermilionCity_House2_MapScripts::
# 3 "data/maps/VermilionCity_House2/scripts.pory"
	.byte 0
# 4 "data/maps/VermilionCity_House2/scripts.pory"

# 5 "data/maps/VermilionCity_House2/scripts.pory"
VermilionCity_House2_EventScript_Elyssa::
# 6 "data/maps/VermilionCity_House2/scripts.pory"
	lock
# 7 "data/maps/VermilionCity_House2/scripts.pory"
	faceplayer
# 8 "data/maps/VermilionCity_House2/scripts.pory"
	setvar VAR_0x8008, INGAME_TRADE_FARFETCHD
# 9 "data/maps/VermilionCity_House2/scripts.pory"
	call EventScript_GetInGameTradeSpeciesInfo
# 10 "data/maps/VermilionCity_House2/scripts.pory"
	goto_if_set FLAG_DID_CH_DING_TRADE, VermilionCity_House2_EventScript_AlreadyTraded
# 11 "data/maps/VermilionCity_House2/scripts.pory"
	msgbox VermilionCity_House2_Text_DoYouHaveMonWantToTradeForMyMon, MSGBOX_YESNO
# 12 "data/maps/VermilionCity_House2/scripts.pory"
	goto_if_eq VAR_RESULT, NO, VermilionCity_House2_EventScript_DeclineTrade
# 13 "data/maps/VermilionCity_House2/scripts.pory"
	call EventScript_ChooseMonForInGameTrade
# 14 "data/maps/VermilionCity_House2/scripts.pory"
	goto_if_ge VAR_0x8004, PARTY_SIZE, VermilionCity_House2_EventScript_DeclineTrade
# 15 "data/maps/VermilionCity_House2/scripts.pory"
	call EventScript_GetInGameTradeSpecies
# 16 "data/maps/VermilionCity_House2/scripts.pory"
	goto_if_ne VAR_RESULT, VAR_0x8009, VermilionCity_House2_EventScript_NotRequestedMon
# 17 "data/maps/VermilionCity_House2/scripts.pory"
	call EventScript_DoInGameTrade
# 18 "data/maps/VermilionCity_House2/scripts.pory"
	msgbox VermilionCity_House2_Text_ThankYou
# 19 "data/maps/VermilionCity_House2/scripts.pory"
	setflag FLAG_DID_CH_DING_TRADE
# 20 "data/maps/VermilionCity_House2/scripts.pory"
	release
# 21 "data/maps/VermilionCity_House2/scripts.pory"
	end
# 22 "data/maps/VermilionCity_House2/scripts.pory"

# 23 "data/maps/VermilionCity_House2/scripts.pory"
VermilionCity_House2_EventScript_DeclineTrade::
# 24 "data/maps/VermilionCity_House2/scripts.pory"
	msgbox VermilionCity_House2_Text_ThatsTooBad
# 25 "data/maps/VermilionCity_House2/scripts.pory"
	release
# 26 "data/maps/VermilionCity_House2/scripts.pory"
	end
# 27 "data/maps/VermilionCity_House2/scripts.pory"

# 28 "data/maps/VermilionCity_House2/scripts.pory"
VermilionCity_House2_EventScript_NotRequestedMon::
# 29 "data/maps/VermilionCity_House2/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_0x8009
# 30 "data/maps/VermilionCity_House2/scripts.pory"
	msgbox VermilionCity_House2_Text_ThisIsNoMon
# 31 "data/maps/VermilionCity_House2/scripts.pory"
	release
# 32 "data/maps/VermilionCity_House2/scripts.pory"
	end
# 33 "data/maps/VermilionCity_House2/scripts.pory"

# 34 "data/maps/VermilionCity_House2/scripts.pory"
VermilionCity_House2_EventScript_AlreadyTraded::
# 35 "data/maps/VermilionCity_House2/scripts.pory"
	msgbox VermilionCity_House2_Text_HowIsMyOldMon
# 36 "data/maps/VermilionCity_House2/scripts.pory"
	release
# 37 "data/maps/VermilionCity_House2/scripts.pory"
	end
