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
	checkflag FLAG_0x2FD
	goto_if_eq EventScript_170365
	msgbox gUnknown_819FB0E, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, sub_80CA3D8
	getnumberstring 2, VAR_0x8006
	call EventScript_17036F
	compare_var_to_value VAR_0x8006, 40
	goto_if 0, EventScript_1A7ABD
	msgbox gUnknown_819FC15
	checkitemspace ITEM_AMULET_COIN, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_1A7AC7
	additem ITEM_AMULET_COIN, 1
	giveitemfanfaremsg gUnknown_819FC68, ITEM_AMULET_COIN
	setflag FLAG_0x2FD
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
