PokemonMansion_3F_EventObjects:
	object_event 1, 52, 0, 7, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, PokemonMansion_3F_EventScript_1622CE, 0, 0, 0
	object_event 2, 55, 0, 22, 0, 13, 0, 3, 8, 17, 0, 1, 0, 1, 0, PokemonMansion_3F_EventScript_1622E5, 0, 0, 0
	object_event 3, 92, 0, 9, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_3F_EventScript_1BE984, 418, 0, 0
	object_event 4, 92, 0, 32, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_3F_EventScript_1BE991, 419, 0, 0

PokemonMansion_3F_MapWarps:
	warp_def 8, 3, 3, 0, 316
	warp_def 34, 18, 3, 1, 316
	warp_def 11, 11, 3, 3, 316
	warp_def 18, 18, 3, 7, 315
	warp_def 19, 18, 3, 8, 315
	warp_def 23, 18, 3, 4, 316
	warp_def 20, 18, 3, 8, 315
	warp_def 24, 18, 3, 4, 316

PokemonMansion_3F_MapBGEvents:
	bg_event 8, 16, 0, 0, 0, PokemonMansion_3F_EventScript_1622C5
	bg_event 12, 5, 0, 1, 0, PokemonMansion_3F_EventScript_1622B1
	bg_event 36, 13, 3, 7, 0, 68, 32, 1

PokemonMansion_3F_MapEvents::
	map_events PokemonMansion_3F_EventObjects, PokemonMansion_3F_MapWarps, 0x0, PokemonMansion_3F_MapBGEvents
