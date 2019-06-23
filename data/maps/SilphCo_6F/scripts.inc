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
	msgbox gUnknown_817607E
	release
	end

EventScript_1618A8:: @ 81618A8
	msgbox gUnknown_81760B6
	release
	end

SilphCo_6F_EventScript_1618B2:: @ 81618B2
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1618C9
	msgbox gUnknown_8175F24
	release
	end

EventScript_1618C9:: @ 81618C9
	msgbox gUnknown_8175F51
	release
	end

SilphCo_6F_EventScript_1618D3:: @ 81618D3
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1618EA
	msgbox gUnknown_8175F70
	release
	end

EventScript_1618EA:: @ 81618EA
	msgbox gUnknown_8175F93
	release
	end

SilphCo_6F_EventScript_1618F4:: @ 81618F4
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_16190B
	msgbox gUnknown_8175FAA
	release
	end

EventScript_16190B:: @ 816190B
	msgbox gUnknown_8175FD3
	release
	end

SilphCo_6F_EventScript_161915:: @ 8161915
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_16192C
	msgbox gUnknown_8176012
	release
	end

EventScript_16192C:: @ 816192C
	msgbox gUnknown_817604B
	release
	end

SilphCo_6F_EventScript_161936:: @ 8161936
	msgbox gUnknown_817624D, 3
	end

SilphCo_6F_EventScript_16193F:: @ 816193F
	trainerbattle 0, 341, 0, Text_176136, Text_1761BD
	msgbox gUnknown_81761C4, 6
	end

SilphCo_6F_EventScript_161956:: @ 8161956
	trainerbattle 0, 380, 0, Text_1760DE, Text_176104
	msgbox gUnknown_817610F, 6
	end

SilphCo_6F_EventScript_16196D:: @ 816196D
	trainerbattle 0, 381, 0, Text_1761F1, Text_17620E
	msgbox gUnknown_817621B, 6
	end
