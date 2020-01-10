Route16_NorthEntrance_2F_MapScripts:: @ 81702BE
	.byte 0

Route16_NorthEntrance_2F_EventScript_1702BF:: @ 81702BF
	msgbox gUnknown_819FA07, 2
	end

Route16_NorthEntrance_2F_EventScript_1702C8:: @ 81702C8
	msgbox gUnknown_819FA41, 2
	end

Route16_NorthEntrance_2F_EventScript_1702D1:: @ 81702D1
	msgbox gUnknown_819FA6F, 3
	end

Route16_NorthEntrance_2F_EventScript_1702DA:: @ 81702DA
	msgbox gUnknown_819FAB9, 3
	end

Route16_NorthEntrance_2F_EventScript_1702E3:: @ 81702E3
	lock
	faceplayer
	call EventScript_17036F
	goto_if_set FLAG_GOT_AMULET_COIN_FROM_OAKS_AIDE, EventScript_170365
	msgbox gUnknown_819FB0E, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_17036F
	compare VAR_0x8006, 40
	goto_if_lt EventScript_1A7ABD
	msgbox gUnknown_819FC15
	checkitemspace ITEM_AMULET_COIN, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A7AC7
	giveitem_msg gUnknown_819FC68, ITEM_AMULET_COIN
	setflag FLAG_GOT_AMULET_COIN_FROM_OAKS_AIDE
	msgbox gUnknown_819FC93
	release
	end

EventScript_170365:: @ 8170365
	msgbox gUnknown_819FC93
	release
	end

EventScript_17036F:: @ 817036F
	getnumberstring 0, 40
	getitemname 1, ITEM_AMULET_COIN
	return
