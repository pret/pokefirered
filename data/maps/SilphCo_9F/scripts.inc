SilphCo_9F_MapScripts:: @ 8161CDE
	map_script 1, SilphCo_9F_MapScript1_161CE4
	.byte 0

SilphCo_9F_MapScript1_161CE4:: @ 8161CE4
	checkflag FLAG_0x288
	call_if 0, EventScript_1A840C
	checkflag FLAG_0x289
	call_if 0, EventScript_1A8443
	checkflag FLAG_0x28A
	call_if 0, EventScript_1A847A
	checkflag FLAG_0x28B
	call_if 0, EventScript_1A84A8
	end

SilphCo_9F_EventScript_161D09:: @ 8161D09
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_161D2E
	loadword 0, gUnknown_8176B54
	callstd 4
	closemessage
	call EventScript_1A6C26
	loadword 0, gUnknown_8176B81
	callstd 4
	release
	end

EventScript_161D2E:: @ 8161D2E
	loadword 0, gUnknown_8176B90
	callstd 4
	release
	end

SilphCo_9F_EventScript_161D38:: @ 8161D38
	loadword 0, gUnknown_8176CD4
	callstd 3
	end

SilphCo_9F_EventScript_161D41:: @ 8161D41
	trainerbattle 0, 344, 0, Text_176BFB, Text_176C2B
	loadword 0, gUnknown_8176C3C
	callstd 6
	end

SilphCo_9F_EventScript_161D58:: @ 8161D58
	trainerbattle 0, 387, 0, Text_176BA3, Text_176BC8
	loadword 0, gUnknown_8176BD0
	callstd 6
	end

SilphCo_9F_EventScript_161D6F:: @ 8161D6F
	trainerbattle 0, 388, 0, Text_176C7A, Text_176CA0
	loadword 0, gUnknown_8176CB8
	callstd 6
	end
