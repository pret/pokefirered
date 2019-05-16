Route11_EastEntrance_2F_MapScripts:: @ 816FD34
	.byte 0

Route11_EastEntrance_2F_EventScript_16FD35:: @ 816FD35
	lockall
	checkflag FLAG_0x253
	goto_if 1, EventScript_16FD49
	msgbox gUnknown_819EC8A
	releaseall
	end

EventScript_16FD49:: @ 816FD49
	msgbox gUnknown_819ECD9
	releaseall
	end

Route11_EastEntrance_2F_EventScript_16FD53:: @ 816FD53
	msgbox gUnknown_819ED1F, 3
	end

Route11_EastEntrance_2F_EventScript_16FD5C:: @ 816FD5C
	lock
	faceplayer
	setvar VAR_0x8008, 4
	call EventScript_1A8CAD
	checkflag FLAG_0x251
	goto_if 1, EventScript_16FDCE
	msgbox gUnknown_81A597B, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16FDB6
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16FDB6
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_16FDC0
	call EventScript_1A8CD9
	msgbox gUnknown_81A59DA
	setflag FLAG_0x251
	release
	end

EventScript_16FDB6:: @ 816FDB6
	msgbox gUnknown_81A59B6
	release
	end

EventScript_16FDC0:: @ 816FDC0
	getspeciesname 0, 32777
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
	checkflag FLAG_0x252
	goto_if 1, EventScript_16FE5A
	msgbox gUnknown_819E9E5, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, sub_80CA3D8
	getnumberstring 2, VAR_0x8006
	call EventScript_16FE64
	compare_var_to_value VAR_0x8006, 30
	goto_if 0, EventScript_1A7ABD
	msgbox gUnknown_819EAE4
	checkitemspace ITEM_ITEMFINDER, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A7AC7
	additem ITEM_ITEMFINDER, 1
	giveitemfanfaremsg gUnknown_819EB37, ITEM_ITEMFINDER
	setflag FLAG_0x252
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
