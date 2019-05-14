MtMoon_1F_MapScripts:: @ 81605E4
	map_script 3, MtMoon_1F_MapScript1_1605EA
	.byte 0

MtMoon_1F_MapScript1_1605EA:: @ 81605EA
	setworldmapflag FLAG_WORLD_MAP_MT_MOON_1F
	end

MtMoon_1F_EventScript_1605EE:: @ 81605EE
	loadword 0, gUnknown_8172AE0
	callstd 3
	end

MtMoon_1F_EventScript_1605F7:: @ 81605F7
	trainerbattle 0, 181, 0, Text_17279D, Text_1727CB
	loadword 0, gUnknown_81727DF
	callstd 6
	end

MtMoon_1F_EventScript_16060E:: @ 816060E
	trainerbattle 0, 91, 0, Text_17281D, Text_172844
	loadword 0, gUnknown_8172863
	callstd 6
	end

MtMoon_1F_EventScript_160625:: @ 8160625
	trainerbattle 0, 120, 0, Text_172896, Text_1728C3
	loadword 0, gUnknown_81728D2
	callstd 6
	end

MtMoon_1F_EventScript_16063C:: @ 816063C
	trainerbattle 0, 121, 0, Text_172972, Text_1729A4
	loadword 0, gUnknown_81729AC
	callstd 6
	end

MtMoon_1F_EventScript_160653:: @ 8160653
	trainerbattle 0, 169, 0, Text_17290B, Text_172927
	loadword 0, gUnknown_817293C
	callstd 6
	end

MtMoon_1F_EventScript_16066A:: @ 816066A
	trainerbattle 0, 108, 0, Text_1729EA, Text_172A1A
	loadword 0, gUnknown_8172A26
	callstd 6
	end

MtMoon_1F_EventScript_160681:: @ 8160681
	trainerbattle 0, 109, 0, Text_172A55, Text_172A8F
	loadword 0, gUnknown_8172A97
	callstd 6
	end
