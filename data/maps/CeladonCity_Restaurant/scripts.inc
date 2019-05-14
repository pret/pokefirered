CeladonCity_Restaurant_MapScripts:: @ 816D1EA
	.byte 0

CeladonCity_Restaurant_EventScript_16D1EB:: @ 816D1EB
	loadword 0, gUnknown_81978E6
	callstd 2
	end

CeladonCity_Restaurant_EventScript_16D1F4:: @ 816D1F4
	loadword 0, gUnknown_8197915
	callstd 2
	end

CeladonCity_Restaurant_EventScript_16D1FD:: @ 816D1FD
	lock
	faceplayer
	checkflag FLAG_0x243
	goto_if 1, EventScript_16D24B
	loadword 0, gUnknown_81979C1
	callstd 4
	checkitemspace ITEM_COIN_CASE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16D241
	additem ITEM_COIN_CASE, 1
	loadword 0, gUnknown_8197A38
	setorcopyvar VAR_0x8000, 260
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9
	setflag FLAG_0x243
	release
	end

EventScript_16D241:: @ 816D241
	loadword 0, gUnknown_8197A5E
	callstd 4
	release
	end

EventScript_16D24B:: @ 816D24B
	loadword 0, gUnknown_8197A72
	callstd 4
	release
	end

CeladonCity_Restaurant_EventScript_16D255:: @ 816D255
	loadword 0, gUnknown_8197952
	callstd 2
	end

CeladonCity_Restaurant_EventScript_16D25E:: @ 816D25E
	loadword 0, gUnknown_819798A
	callstd 2
	end
