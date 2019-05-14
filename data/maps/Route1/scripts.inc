Route1_MapScripts:: @ 8167EFD
	.byte 0

Route1_EventScript_167EFE:: @ 8167EFE
	lock
	faceplayer
	checkflag FLAG_0x230
	goto_if 1, EventScript_167F48
	loadword 0, gUnknown_818329D
	callstd 4
	textcolor 3
	checkitemspace ITEM_POTION, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A6BF9
	getitemname 1, ITEM_POTION
	playfanfare MUS_FANFA1
	message Text_1A51F6
	waitmessage
	waitfanfare
	additem ITEM_POTION, 1
	loadword 0, gUnknown_8183387
	callstd 4
	call EventScript_1A6675
	setflag FLAG_0x230
	release
	end

EventScript_167F48:: @ 8167F48
	loadword 0, gUnknown_8183347
	callstd 4
	release
	end

Route1_EventScript_167F52:: @ 8167F52
	loadword 0, gUnknown_81833B9
	callstd 2
	end

Route1_EventScript_167F5B:: @ 8167F5B
	loadword 0, gUnknown_818343A
	callstd 3
	end
