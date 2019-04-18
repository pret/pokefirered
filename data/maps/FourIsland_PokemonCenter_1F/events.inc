FourIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171BF9, 0, 0, 0
	object_event 2, 25, 0, 10, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C02, 0, 0, 0
	object_event 3, 31, 0, 5, 0, 5, 0, 3, 13, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C0B, 0, 0, 0
	object_event 4, 61, 0, 2, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C14, 0, 0, 0

FourIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 0, 783
	warp_def 1, 6, 4, 0, 8962

FourIsland_PokemonCenter_1F_MapBGEvents:
	bg_event 3, 1, 0, 1, 0, FourIsland_PokemonCenter_1F_EventScript_1ACDD0
	bg_event 2, 1, 0, 1, 0, FourIsland_PokemonCenter_1F_EventScript_1ACDD0

FourIsland_PokemonCenter_1F_MapEvents::
	map_events FourIsland_PokemonCenter_1F_EventObjects, FourIsland_PokemonCenter_1F_MapWarps, 0x0, FourIsland_PokemonCenter_1F_MapBGEvents
