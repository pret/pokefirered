OneIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170E94, 0, 0, 0
	object_event 2, 73, 0, 14, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170E9D, 114, 0, 0
	object_event 3, 89, 0, 15, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170EC5, 115, 0, 0
	object_event 4, 16, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171148, 0, 0, 0
	object_event 5, 56, 0, 3, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171151, 0, 0, 0
	object_event 6, 24, 0, 7, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_17115A, 0, 0, 0

OneIsland_PokemonCenter_1F_MapWarps:
	warp_def 9, 9, 3, 0, 780
	warp_def 1, 5, 4, 0, 8193

OneIsland_PokemonCenter_1F_MapCoordEvents:
	coord_event 12, 6, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711AA
	coord_event 12, 7, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711B6
	coord_event 12, 8, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711C2
	coord_event 12, 9, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711CE

OneIsland_PokemonCenter_1F_MapBGEvents:
	bg_event 12, 2, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 3, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 4, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 13, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 15, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 14, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 16, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 17, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179

OneIsland_PokemonCenter_1F_MapEvents::
	map_events OneIsland_PokemonCenter_1F_EventObjects, OneIsland_PokemonCenter_1F_MapWarps, OneIsland_PokemonCenter_1F_MapCoordEvents, OneIsland_PokemonCenter_1F_MapBGEvents
