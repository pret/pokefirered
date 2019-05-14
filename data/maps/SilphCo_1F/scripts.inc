SilphCo_1F_MapScripts:: @ 8161625
	map_script 3, SilphCo_1F_MapScript1_16162B
	.byte 0

SilphCo_1F_MapScript1_16162B:: @ 816162B
	setworldmapflag FLAG_WORLD_MAP_SILPH_CO_1F
	end

SilphCo_1F_EventScript_16162F:: @ 816162F
	loadword 0, gUnknown_81754F7
	callstd 2
	end

SilphCo_1F_EventScript_161638:: @ 8161638
	loadword 0, gUnknown_8175549
	callstd 3
	end
