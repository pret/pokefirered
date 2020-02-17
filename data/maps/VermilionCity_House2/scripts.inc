VermilionCity_House2_MapScripts:: @ 816B5D6
	.byte 0

VermilionCity_House2_EventScript_Elyssa:: @ 816B5D7
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_FARFETCHD
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_CH_DING_TRADE, VermilionCity_House2_EventScript_AlreadyTraded
	msgbox VermilionCity_House2_Text_DoYouHaveMonWantToTradeForMyMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq VermilionCity_House2_EventScript_DeclineTrade
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge VermilionCity_House2_EventScript_DeclineTrade
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne VermilionCity_House2_EventScript_NotRequestedMon
	call EventScript_DoInGameTrade
	msgbox VermilionCity_House2_Text_ThankYou
	setflag FLAG_DID_CH_DING_TRADE
	release
	end

VermilionCity_House2_EventScript_DeclineTrade:: @ 816B631
	msgbox VermilionCity_House2_Text_ThatsTooBad
	release
	end

VermilionCity_House2_EventScript_NotRequestedMon:: @ 816B63B
	getspeciesname 0, VAR_0x8009
	msgbox VermilionCity_House2_Text_ThisIsNoMon
	release
	end

VermilionCity_House2_EventScript_AlreadyTraded:: @ 816B649
	msgbox VermilionCity_House2_Text_HowIsMyOldMon
	release
	end
