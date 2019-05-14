SilphCo_3F_MapScripts:: @ 81616C5
	map_script 1, SilphCo_3F_MapScript1_1616CB
	.byte 0

SilphCo_3F_MapScript1_1616CB:: @ 81616CB
	checkflag FLAG_0x27C
	call_if 0, EventScript_1A81A5
	checkflag FLAG_0x27D
	call_if 0, EventScript_1A81DC
	end

SilphCo_3F_EventScript_1616DE:: @ 81616DE
	lock
	faceplayer
	compare_var_to_value VAR_0x4060, 1
	goto_if 4, EventScript_1616F5
	loadword 0, gUnknown_81758AD
	callstd 4
	release
	end

EventScript_1616F5:: @ 81616F5
	loadword 0, gUnknown_81758D3
	callstd 4
	release
	end

SilphCo_3F_EventScript_1616FF:: @ 81616FF
	loadword 0, gUnknown_81759DC
	callstd 3
	end

SilphCo_3F_EventScript_161708:: @ 8161708
	trainerbattle 0, 338, 0, Text_175948, Text_17597D
	loadword 0, gUnknown_8175990
	callstd 6
	end

SilphCo_3F_EventScript_16171F:: @ 816171F
	trainerbattle 0, 375, 0, Text_1758F6, Text_175911
	loadword 0, gUnknown_817591C
	callstd 6
	end
