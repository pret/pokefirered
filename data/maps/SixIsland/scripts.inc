SixIsland_MapScripts:: @ 8167ED8
	map_script 3, SixIsland_MapScript1_167EDE
	.byte 0

SixIsland_MapScript1_167EDE:: @ 8167EDE
	setworldmapflag 2209
	end

SixIsland_EventScript_167EE2:: @ 8167EE2
	loadword 0, gUnknown_81831EF
	callstd 2
	end

SixIsland_EventScript_167EEB:: @ 8167EEB
	loadword 0, gUnknown_8183255
	callstd 2
	end

SixIsland_EventScript_167EF4:: @ 8167EF4
	loadword 0, gUnknown_81831C6
	callstd 3
	end
