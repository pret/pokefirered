SafariZone_Center_MapScripts:: @ 8162357
	map_script 3, SafariZone_Center_MapScript1_16235D
	.byte 0

SafariZone_Center_MapScript1_16235D:: @ 816235D
	setworldmapflag FLAG_WORLD_MAP_SAFARI_ZONE_CENTER
	end

SafariZone_Center_EventScript_162361:: @ 8162361
	loadword 0, gUnknown_81777F2
	callstd 3
	end

SafariZone_Center_EventScript_16236A:: @ 816236A
	loadword 0, gUnknown_81777FD
	callstd 3
	end

SafariZone_Center_EventScript_162373:: @ 8162373
	loadword 0, gUnknown_817782F
	callstd 3
	end
