VermilionCity_House1_MapScripts:: @ 816B3A6
	.byte 0

VermilionCity_House1_EventScript_16B3A7:: @ 816B3A7
	lock
	faceplayer
	checkflag FLAG_0x240
	goto_if 1, EventScript_16B3CF
	loadword 0, gUnknown_8193EC1
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16B3D9
	loadword 0, gUnknown_8194028
	callstd 4
	release
	end

EventScript_16B3CF:: @ 816B3CF
	loadword 0, gUnknown_8194045
	callstd 4
	release
	end

EventScript_16B3D9:: @ 816B3D9
	checkitemspace ITEM_OLD_ROD, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B41A
	additem ITEM_OLD_ROD, 1
	loadword 0, gUnknown_8193F2A
	callstd 4
	giveitemfanfaremsg gUnknown_8193F81, ITEM_OLD_ROD
	setflag FLAG_0x240
	loadword 0, gUnknown_8193FAF
	callstd 4
	release
	end

EventScript_16B41A:: @ 816B41A
	loadword 0, gUnknown_819406F
	callstd 4
	release
	end
