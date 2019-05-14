Route20_MapScripts:: @ 816823B
	map_script 3, Route20_MapScript1_168241
	.byte 0

Route20_MapScript1_168241:: @ 8168241
	checkflag FLAG_0x2D2
	call_if 0, EventScript_168254
	checkflag FLAG_0x2D3
	call_if 0, EventScript_16826D
	end

EventScript_168254:: @ 8168254
	clearflag FLAG_0x040
	clearflag FLAG_0x041
	setflag FLAG_0x042
	setflag FLAG_0x043
	setflag FLAG_0x044
	setflag FLAG_0x045
	setflag FLAG_0x046
	setflag FLAG_0x047
	return

EventScript_16826D:: @ 816826D
	clearflag FLAG_0x048
	clearflag FLAG_0x049
	clearflag FLAG_0x04A
	clearflag FLAG_0x04B
	setflag FLAG_0x04C
	setflag FLAG_0x04D
	return

Route20_EventScript_168280:: @ 8168280
	loadword 0, gUnknown_81882D1
	callstd 3
	end
