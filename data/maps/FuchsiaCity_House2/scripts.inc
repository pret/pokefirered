FuchsiaCity_House2_MapScripts:: @ 816D816
	.byte 0

FuchsiaCity_House2_EventScript_16D817:: @ 816D817
	lock
	faceplayer
	checkflag FLAG_0x244
	goto_if 1, EventScript_16D83F
	loadword 0, gUnknown_819918E
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16D849
	loadword 0, gUnknown_8199337
	callstd 4
	release
	end

EventScript_16D83F:: @ 816D83F
	loadword 0, gUnknown_8199354
	callstd 4
	release
	end

EventScript_16D849:: @ 816D849
	loadword 0, gUnknown_8199207
	callstd 4
	checkitemspace ITEM_GOOD_ROD, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16D88A
	additem ITEM_GOOD_ROD, 1
	giveitemfanfaremsg gUnknown_819925E, ITEM_GOOD_ROD
	loadword 0, gUnknown_8199296
	callstd 4
	setflag FLAG_0x244
	release
	end

EventScript_16D88A:: @ 816D88A
	loadword 0, gUnknown_819937E
	callstd 4
	release
	end
