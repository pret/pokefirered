SevenIsland_MapScripts:: @ 8167EB3
	map_script 3, SevenIsland_MapScript1_167EB9
	.byte 0

SevenIsland_MapScript1_167EB9:: @ 8167EB9
	setworldmapflag 2208
	end

SevenIsland_EventScript_167EBD:: @ 8167EBD
	loadword 0, gUnknown_8183046
	callstd 3
	end

SevenIsland_EventScript_167EC6:: @ 8167EC6
	loadword 0, gUnknown_818306C
	callstd 2
	end

SevenIsland_EventScript_167ECF:: @ 8167ECF
	loadword 0, gUnknown_8183143
	callstd 2
	end
