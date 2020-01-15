CeruleanCity_House3_MapScripts:: @ 816A9A7
	.byte 0

CeruleanCity_House3_EventScript_OldWoman:: @ 816A9A8
	msgbox CeruleanCity_House3_Text_PleaseTradeWithMyHusband, MSGBOX_NPC
	end

CeruleanCity_House3_EventScript_Dontae:: @ 816A9B1
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_JYNX
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_ZYNX_TRADE, CeruleanCity_House3_EventScript_AlreadyTraded
	msgbox Trade_Text_DoYouHaveMonWouldYouTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CeruleanCity_House3_EventScript_DeclineTrade
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge CeruleanCity_House3_EventScript_DeclineTrade
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne CeruleanCity_House3_EventScript_NotRequestedMon
	call EventScript_DoInGameTrade
	msgbox Trade_Text_Thanks
	setflag FLAG_DID_ZYNX_TRADE
	release
	end

CeruleanCity_House3_EventScript_DeclineTrade:: @ 816AA0B
	msgbox Trade_Text_WellIfYouDontWantTo
	release
	end

CeruleanCity_House3_EventScript_NotRequestedMon:: @ 816AA15
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_ThisIsntMon
	release
	end

CeruleanCity_House3_EventScript_AlreadyTraded:: @ 816AA23
	msgbox Trade_Text_HasTradedMonGrownStronger
	release
	end
