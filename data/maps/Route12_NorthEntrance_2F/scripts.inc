Route12_NorthEntrance_2F_MapScripts:: @ 816FE77
	.byte 0

Route12_NorthEntrance_2F_EventScript_16FE78:: @ 816FE78
	msgbox gUnknown_819EF5D, 3
	end

Route12_NorthEntrance_2F_EventScript_16FE81:: @ 816FE81
	msgbox gUnknown_819EFA0, 3
	end

Route12_NorthEntrance_2F_EventScript_16FE8A:: @ 816FE8A
	lock
	faceplayer
	checkflag FLAG_0x25B
	goto_if_eq EventScript_16FF01
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if eq, EventScript_16FEE5
	compare_var_to_value VAR_RESULT, 1
	call_if eq, EventScript_16FEEE
	checkitemspace ITEM_TM27, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16FEF7
	additem ITEM_TM27, 1
	giveitemfanfaremsg gUnknown_819EE9F, ITEM_TM27
	msgbox gUnknown_819EEC6
	setflag FLAG_0x25B
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
