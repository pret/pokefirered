SilphCo_6F_MapScripts:: @ 8161881
	map_script 1, SilphCo_6F_MapScript1_161887
	.byte 0

SilphCo_6F_MapScript1_161887:: @ 8161887
	checkflag FLAG_0x283
	call_if 0, EventScript_1A8314
	end

SilphCo_6F_EventScript_161891:: @ 8161891
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1618A8
	loadword 0, gUnknown_817607E
	callstd 4
	release
	end

EventScript_1618A8:: @ 81618A8
	loadword 0, gUnknown_81760B6
	callstd 4
	release
	end

SilphCo_6F_EventScript_1618B2:: @ 81618B2
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1618C9
	loadword 0, gUnknown_8175F24
	callstd 4
	release
	end

EventScript_1618C9:: @ 81618C9
	loadword 0, gUnknown_8175F51
	callstd 4
	release
	end

SilphCo_6F_EventScript_1618D3:: @ 81618D3
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1618EA
	loadword 0, gUnknown_8175F70
	callstd 4
	release
	end

EventScript_1618EA:: @ 81618EA
	loadword 0, gUnknown_8175F93
	callstd 4
	release
	end

SilphCo_6F_EventScript_1618F4:: @ 81618F4
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_16190B
	loadword 0, gUnknown_8175FAA
	callstd 4
	release
	end

EventScript_16190B:: @ 816190B
	loadword 0, gUnknown_8175FD3
	callstd 4
	release
	end

SilphCo_6F_EventScript_161915:: @ 8161915
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_16192C
	loadword 0, gUnknown_8176012
	callstd 4
	release
	end

EventScript_16192C:: @ 816192C
	loadword 0, gUnknown_817604B
	callstd 4
	release
	end

SilphCo_6F_EventScript_161936:: @ 8161936
	loadword 0, gUnknown_817624D
	callstd 3
	end

SilphCo_6F_EventScript_16193F:: @ 816193F
	trainerbattle 0, 341, 0, Text_176136, Text_1761BD
	loadword 0, gUnknown_81761C4
	callstd 6
	end

SilphCo_6F_EventScript_161956:: @ 8161956
	trainerbattle 0, 380, 0, Text_1760DE, Text_176104
	loadword 0, gUnknown_817610F
	callstd 6
	end

SilphCo_6F_EventScript_16196D:: @ 816196D
	trainerbattle 0, 381, 0, Text_1761F1, Text_17620E
	loadword 0, gUnknown_817621B
	callstd 6
	end
