PokemonTower_5F_EventObjects:
	object_event 1, 58, 0, 11, 0, 4, 0, 3, 1, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_163472, 0, 0, 0
	object_event 2, 58, 0, 19, 0, 7, 0, 3, 9, 17, 0, 1, 0, 3, 0, PokemonTower_5F_EventScript_16345B, 0, 0, 0
	object_event 3, 58, 0, 7, 0, 12, 0, 3, 10, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_163489, 0, 0, 0
	object_event 4, 58, 0, 11, 0, 16, 0, 3, 1, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_1634A0, 0, 0, 0
	object_event 5, 58, 0, 12, 0, 8, 0, 3, 10, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_163433, 0, 0, 0
	object_event 6, 92, 0, 6, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_1BE789, 379, 0, 0
	object_event 7, 92, 0, 11, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_1BEBB3, 464, 0, 0

PokemonTower_5F_MapWarps:
	warp_def 4, 10, 3, 0, 347
	warp_def 18, 10, 3, 1, 349

PokemonTower_5F_MapCoordEvents:
	coord_event 10, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 11, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 12, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 10, 9, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 9, 8, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 12, 9, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 10, 10, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 11, 10, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 12, 10, 0, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 9, 9, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 9, 10, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 10, 11, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 11, 11, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 12, 11, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 8, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 9, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 10, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453

PokemonTower_5F_MapBGEvents:
	bg_event 7, 3, 3, 7, 0, 104, 14, 1

PokemonTower_5F_MapEvents::
	map_events PokemonTower_5F_EventObjects, PokemonTower_5F_MapWarps, PokemonTower_5F_MapCoordEvents, PokemonTower_5F_MapBGEvents
