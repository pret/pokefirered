Route11_EastEntrance_2F_MapScripts:: @ 816FD34
	.byte 0

Route11_EastEntrance_2F_EventScript_16FD35:: @ 816FD35
	lockall
	goto_if_set FLAG_WOKE_UP_ROUTE_12_SNORLAX, EventScript_16FD49
	msgbox gUnknown_819EC8A
	releaseall
	end

EventScript_16FD49:: @ 816FD49
	msgbox gUnknown_819ECD9
	releaseall
	end

Route11_EastEntrance_2F_EventScript_16FD53:: @ 816FD53
	msgbox gUnknown_819ED1F, MSGBOX_SIGN
	end

Route11_EastEntrance_2F_EventScript_16FD5C:: @ 816FD5C
	lock
	faceplayer
	setvar VAR_0x8008, 4
	call EventScript_1A8CAD
	goto_if_set FLAG_DID_NINA_TRADE, EventScript_16FDCE
	msgbox gUnknown_81A597B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16FDB6
	call EventScript_1A8CBD
	compare VAR_0x8004, 6
	goto_if_ge EventScript_16FDB6
	call EventScript_1A8CC9
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne EventScript_16FDC0
	call EventScript_1A8CD9
	msgbox gUnknown_81A59DA
	setflag FLAG_DID_NINA_TRADE
	release
	end

EventScript_16FDB6:: @ 816FDB6
	msgbox gUnknown_81A59B6
	release
	end

EventScript_16FDC0:: @ 816FDC0
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A59C6
	release
	end

EventScript_16FDCE:: @ 816FDCE
	msgbox gUnknown_81A59E7
	release
	end

Route11_EastEntrance_2F_EventScript_16FDD8:: @ 816FDD8
	lock
	faceplayer
	call EventScript_16FE64
	goto_if_set FLAG_GOT_ITEMFINDER, EventScript_16FE5A
	msgbox gUnknown_819E9E5, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_16FE64
	compare VAR_0x8006, 30
	goto_if_lt EventScript_1A7ABD
	msgbox gUnknown_819EAE4
	checkitemspace ITEM_ITEMFINDER, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1A7AC7
	giveitem_msg gUnknown_819EB37, ITEM_ITEMFINDER
	setflag FLAG_GOT_ITEMFINDER
	msgbox gUnknown_819EB59
	release
	end

EventScript_16FE5A:: @ 816FE5A
	msgbox gUnknown_819EB59
	release
	end

EventScript_16FE64:: @ 816FE64
	getnumberstring 0, 30
	getitemname 1, ITEM_ITEMFINDER
	return
