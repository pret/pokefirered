PokemonTower_6F_EventObjects:
	object_event 1, 58, 0, 13, 0, 10, 0, 3, 10, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_163514, 0, 0, 0
	object_event 2, 58, 0, 18, 0, 6, 0, 3, 9, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_163542, 0, 0, 0
	object_event 3, 58, 0, 9, 0, 6, 0, 3, 8, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_16352B, 0, 0, 0
	object_event 4, 92, 0, 5, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_6F_EventScript_1BE796, 380, 0, 0
	object_event 5, 92, 0, 15, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_6F_EventScript_1BE7A3, 381, 0, 0

PokemonTower_6F_MapWarps:
	warp_def 11, 16, 3, 0, 350
	warp_def 18, 10, 3, 1, 348

PokemonTower_6F_MapCoordEvents:
	coord_event 11, 15, 3, 0, 16473, 0, 0, PokemonTower_6F_EventScript_1634B8
	coord_event 12, 16, 3, 0, 16473, 0, 0, PokemonTower_6F_EventScript_1634B8

PokemonTower_6F_MapEvents::
	map_events PokemonTower_6F_EventObjects, PokemonTower_6F_MapWarps, PokemonTower_6F_MapCoordEvents, 0x0
