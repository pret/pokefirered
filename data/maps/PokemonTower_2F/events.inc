PokemonTower_2F_EventObjects:
	object_event 1, 72, 0, 16, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 81, 0, 0
	object_event 2, 58, 0, 3, 0, 7, 0, 0, 10, 17, 0, 0, 0, 0, 0, PokemonTower_2F_EventScript_163286, 0, 0, 0

PokemonTower_2F_MapWarps:
	warp_def 4, 10, 3, 0, 346
	warp_def 18, 10, 3, 3, 344

PokemonTower_2F_MapCoordEvents:
	coord_event 17, 5, 3, 0, 16477, 0, 0, PokemonTower_2F_EventScript_16328F
	coord_event 16, 6, 3, 0, 16477, 0, 0, PokemonTower_2F_EventScript_16329B

PokemonTower_2F_MapEvents::
	map_events PokemonTower_2F_EventObjects, PokemonTower_2F_MapWarps, PokemonTower_2F_MapCoordEvents, 0x0
