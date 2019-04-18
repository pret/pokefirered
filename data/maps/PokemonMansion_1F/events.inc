PokemonMansion_1F_EventObjects:
	object_event 1, 55, 0, 22, 0, 24, 0, 3, 9, 17, 0, 1, 0, 4, 0, PokemonMansion_1F_EventScript_162226, 0, 0, 0
	object_event 2, 92, 0, 29, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BE95D, 415, 0, 0
	object_event 3, 92, 0, 22, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BE96A, 416, 0, 0
	object_event 4, 92, 0, 27, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BEB65, 458, 0, 0
	object_event 5, 18, 0, 8, 0, 8, 0, 3, 5, 18, 0, 1, 0, 1, 0, PokemonMansion_1F_EventScript_16223D, 0, 0, 0

PokemonMansion_1F_MapWarps:
	warp_def 7, 33, 3, 0, 776
	warp_def 8, 33, 3, 0, 776
	warp_def 9, 33, 3, 0, 776
	warp_def 10, 13, 3, 2, 316
	warp_def 25, 27, 3, 0, 318
	warp_def 34, 33, 3, 0, 776
	warp_def 35, 34, 0, 0, 776
	warp_def 19, 22, 3, 3, 317
	warp_def 20, 22, 3, 4, 317
	warp_def 11, 13, 0, 2, 316

PokemonMansion_1F_MapBGEvents:
	bg_event 5, 5, 0, 1, 0, PokemonMansion_1F_EventScript_162212
	bg_event 2, 21, 0, 7, 0, 94, 31, 1

PokemonMansion_1F_MapEvents::
	map_events PokemonMansion_1F_EventObjects, PokemonMansion_1F_MapWarps, 0x0, PokemonMansion_1F_MapBGEvents
