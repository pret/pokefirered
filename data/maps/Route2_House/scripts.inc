Route2_House_MapScripts:: @ 816F5F8
	.byte 0

Route2_House_EventScript_16F5F9:: @ 816F5F9
	msgbox gUnknown_819D5E7, MSGBOX_NPC
	end

Route2_House_EventScript_16F602:: @ 816F602
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_MR_MIME
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_MIMIEN_TRADE, EventScript_16F674
	msgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16F65C
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge EventScript_16F65C
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16F666
	call EventScript_DoInGameTrade
	msgbox Trade_Text_HeyThanks
	setflag FLAG_DID_MIMIEN_TRADE
	release
	end

EventScript_16F65C:: @ 816F65C
	msgbox Trade_Text_AwwOhWell
	release
	end

EventScript_16F666:: @ 816F666
	getspeciesname 0, VAR_0x8009
	msgbox Trade_Text_WhatThatsNoMon
	release
	end

EventScript_16F674:: @ 816F674
	msgbox Trade_Text_IsntMyOldMonGreat
	release
	end
