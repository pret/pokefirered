FiveIsland_MapScripts:: @ 8167E8E
	map_script 3, FiveIsland_MapScript1_167E94
	.byte 0

FiveIsland_MapScript1_167E94:: @ 8167E94
	setworldmapflag 2207
	end

FiveIsland_EventScript_167E98:: @ 8167E98
	loadword 0, gUnknown_8182DFB
	callstd 3
	end

FiveIsland_EventScript_167EA1:: @ 8167EA1
	loadword 0, gUnknown_8182E26
	callstd 2
	end

FiveIsland_EventScript_167EAA:: @ 8167EAA
	loadword 0, gUnknown_8182E96
	callstd 2
	end
