SaffronCity_House3_MapScripts:: @ 816F05E
	.byte 0

SaffronCity_House3_EventScript_16F05F:: @ 816F05F
	lock
	faceplayer
	checkflag FLAG_0x245
	goto_if 1, EventScript_16F0B5
	loadword 0, gUnknown_819C142
	callstd 4
	checkitemspace ITEM_TM29, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16F0AB
	additem ITEM_TM29, 1
	loadword 0, gUnknown_819C16C
	setorcopyvar VAR_0x8000, 317
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9
	loadword 0, gUnknown_819C18F
	callstd 4
	setflag FLAG_0x245
	release
	end

EventScript_16F0AB:: @ 816F0AB
	loadword 0, gUnknown_819C1FC
	callstd 4
	release
	end

EventScript_16F0B5:: @ 816F0B5
	loadword 0, gUnknown_819C18F
	callstd 4
	release
	end
