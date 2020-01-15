Route18_EastEntrance_2F_MapScripts:: @ 817046B
	.byte 0

Route18_EastEntrance_2F_EventScript_17046C:: @ 817046C
	msgbox gUnknown_819FD6B, MSGBOX_SIGN
	end

Route18_EastEntrance_2F_EventScript_170475:: @ 8170475
	msgbox gUnknown_819FDB3, MSGBOX_SIGN
	end

Route18_EastEntrance_2F_EventScript_17047E:: @ 817047E
	lock
	faceplayer
	setvar VAR_0x8008, INGAME_TRADE_LICKITUNG
	call EventScript_GetInGameTradeSpeciesInfo
	goto_if_set FLAG_DID_MARC_TRADE, EventScript_1704F0
	msgbox gUnknown_81A597B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1704D8
	call EventScript_ChooseMonForInGameTrade
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge EventScript_1704D8
	call EventScript_GetInGameTradeSpecies
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_1704E2
	call EventScript_DoInGameTrade
	msgbox gUnknown_81A59DA
	setflag FLAG_DID_MARC_TRADE
	release
	end

EventScript_1704D8:: @ 81704D8
	msgbox gUnknown_81A59B6
	release
	end

EventScript_1704E2:: @ 81704E2
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A59C6
	release
	end

EventScript_1704F0:: @ 81704F0
	msgbox gUnknown_81A59E7
	release
	end
