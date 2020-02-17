Route12_NorthEntrance_2F_MapScripts:: @ 816FE77
	.byte 0

Route12_NorthEntrance_2F_EventScript_16FE78:: @ 816FE78
	msgbox gUnknown_819EF5D, MSGBOX_SIGN
	end

Route12_NorthEntrance_2F_EventScript_16FE81:: @ 816FE81
	msgbox gUnknown_819EFA0, MSGBOX_SIGN
	end

Route12_NorthEntrance_2F_EventScript_16FE8A:: @ 816FE8A
	lock
	faceplayer
	goto_if_set FLAG_GOT_TM27, EventScript_16FF01
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq EventScript_16FEE5
	compare VAR_RESULT, FEMALE
	call_if_eq EventScript_16FEEE
	checkitemspace ITEM_TM27, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16FEF7
	giveitem_msg gUnknown_819EE9F, ITEM_TM27
	msgbox gUnknown_819EEC6
	setflag FLAG_GOT_TM27
	release
	end

EventScript_16FEE5:: @ 816FEE5
	msgbox gUnknown_819EDE1
	return

EventScript_16FEEE:: @ 816FEEE
	msgbox gUnknown_819EE40
	return

EventScript_16FEF7:: @ 816FEF7
	msgbox gUnknown_819EF3F
	release
	end

EventScript_16FF01:: @ 816FF01
	msgbox gUnknown_819EEC6
	release
	end
