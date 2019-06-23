RockTunnel_1F_MapScripts:: @ 8162DD6
	map_script 3, RockTunnel_1F_MapScript1_162DDC
	.byte 0

RockTunnel_1F_MapScript1_162DDC:: @ 8162DDC
	setworldmapflag FLAG_WORLD_MAP_ROCK_TUNNEL_1F
	end

RockTunnel_1F_EventScript_162DE0:: @ 8162DE0
	msgbox gUnknown_817962D, 3
	end

RockTunnel_1F_EventScript_162DE9:: @ 8162DE9
	trainerbattle 0, 192, 0, Text_179366, Text_179388
	msgbox gUnknown_8179396, 6
	end

RockTunnel_1F_EventScript_162E00:: @ 8162E00
	trainerbattle 0, 193, 0, Text_1793F1, Text_17940E
	msgbox gUnknown_817943A, 6
	end

RockTunnel_1F_EventScript_162E17:: @ 8162E17
	trainerbattle 0, 194, 0, Text_17947B, Text_1794AC
	msgbox gUnknown_81794B4, 6
	end

RockTunnel_1F_EventScript_162E2E:: @ 8162E2E
	trainerbattle 0, 168, 0, Text_1794D4, Text_1794EE
	msgbox gUnknown_81794F9, 6
	end

RockTunnel_1F_EventScript_162E45:: @ 8162E45
	trainerbattle 0, 476, 0, Text_17951C, Text_179547
	msgbox gUnknown_8179558, 6
	end

RockTunnel_1F_EventScript_162E5C:: @ 8162E5C
	trainerbattle 0, 475, 0, Text_1795E5, Text_179604
	msgbox gUnknown_8179613, 6
	end

RockTunnel_1F_EventScript_162E73:: @ 8162E73
	trainerbattle 0, 474, 0, Text_179577, Text_1795A1
	msgbox gUnknown_81795B5, 6
	end
