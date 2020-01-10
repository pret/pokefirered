RockTunnel_1F_MapScripts:: @ 8162DD6
	map_script MAP_SCRIPT_ON_TRANSITION, RockTunnel_1F_OnTransition
	.byte 0

RockTunnel_1F_OnTransition:: @ 8162DDC
	setworldmapflag FLAG_WORLD_MAP_ROCK_TUNNEL_1F
	end

RockTunnel_1F_EventScript_162DE0:: @ 8162DE0
	msgbox gUnknown_817962D, 3
	end

RockTunnel_1F_EventScript_162DE9:: @ 8162DE9
	trainerbattle_single TRAINER_HIKER_LENNY, Text_179366, Text_179388
	msgbox gUnknown_8179396, 6
	end

RockTunnel_1F_EventScript_162E00:: @ 8162E00
	trainerbattle_single TRAINER_HIKER_OLIVER, Text_1793F1, Text_17940E
	msgbox gUnknown_817943A, 6
	end

RockTunnel_1F_EventScript_162E17:: @ 8162E17
	trainerbattle_single TRAINER_HIKER_LUCAS, Text_17947B, Text_1794AC
	msgbox gUnknown_81794B4, 6
	end

RockTunnel_1F_EventScript_162E2E:: @ 8162E2E
	trainerbattle_single TRAINER_POKEMANIAC_ASHTON, Text_1794D4, Text_1794EE
	msgbox gUnknown_81794F9, 6
	end

RockTunnel_1F_EventScript_162E45:: @ 8162E45
	trainerbattle_single TRAINER_PICNICKER_LEAH, Text_17951C, Text_179547
	msgbox gUnknown_8179558, 6
	end

RockTunnel_1F_EventScript_162E5C:: @ 8162E5C
	trainerbattle_single TRAINER_PICNICKER_ARIANA, Text_1795E5, Text_179604
	msgbox gUnknown_8179613, 6
	end

RockTunnel_1F_EventScript_162E73:: @ 8162E73
	trainerbattle_single TRAINER_PICNICKER_DANA, Text_179577, Text_1795A1
	msgbox gUnknown_81795B5, 6
	end
