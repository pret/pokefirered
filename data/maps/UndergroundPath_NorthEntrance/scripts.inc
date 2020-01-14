UndergroundPath_NorthEntrance_MapScripts:: @ 8160E38
	.byte 0

UndergroundPath_NorthEntrance_EventScript_160E39:: @ 8160E39
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_NIDORAN
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_MS_NIDO_TRADE, EventScript_160EAB
	msgbox gUnknown_81A5AD6, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_160E93
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge EventScript_160E93
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_160E9D
	call EventScript_DoInGameTrade
	msgbox gUnknown_81A5B4A
	setflag FLAG_DID_MS_NIDO_TRADE
	release
	end

EventScript_160E93:: @ 8160E93
	msgbox gUnknown_81A5B08
	release
	end

EventScript_160E9D:: @ 8160E9D
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5B18
	release
	end

EventScript_160EAB:: @ 8160EAB
	msgbox gUnknown_81A5B60
	release
	end
