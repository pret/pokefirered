Route12_NorthEntrance_2F_MapScripts:: @ 816FE77
	.byte 0

Route12_NorthEntrance_2F_EventScript_16FE78:: @ 816FE78
	loadword 0, gUnknown_819EF5D
	callstd 3
	end

Route12_NorthEntrance_2F_EventScript_16FE81:: @ 816FE81
	loadword 0, gUnknown_819EFA0
	callstd 3
	end

Route12_NorthEntrance_2F_EventScript_16FE8A:: @ 816FE8A
	lock
	faceplayer
	checkflag FLAG_0x25B
	goto_if 1, EventScript_16FF01
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_16FEE5
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_16FEEE
	checkitemspace ITEM_TM27, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16FEF7
	additem ITEM_TM27, 1
	loadword 0, gUnknown_819EE9F
	setorcopyvar VAR_0x8000, 315
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9
	loadword 0, gUnknown_819EEC6
	callstd 4
	setflag FLAG_0x25B
	release
	end

EventScript_16FEE5:: @ 816FEE5
	loadword 0, gUnknown_819EDE1
	callstd 4
	return

EventScript_16FEEE:: @ 816FEEE
	loadword 0, gUnknown_819EE40
	callstd 4
	return

EventScript_16FEF7:: @ 816FEF7
	loadword 0, gUnknown_819EF3F
	callstd 4
	release
	end

EventScript_16FF01:: @ 816FF01
	loadword 0, gUnknown_819EEC6
	callstd 4
	release
	end
