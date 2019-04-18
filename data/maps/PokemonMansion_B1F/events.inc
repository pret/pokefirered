PokemonMansion_B1F_EventObjects:
	object_event 1, 92, 0, 6, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9B8, 423, 0, 0
	object_event 2, 52, 0, 20, 0, 25, 0, 3, 2, 17, 0, 1, 0, 1, 0, PokemonMansion_B1F_EventScript_162329, 0, 0, 0
	object_event 3, 55, 0, 34, 0, 13, 0, 3, 8, 17, 0, 1, 0, 6, 0, PokemonMansion_B1F_EventScript_162340, 0, 0, 0
	object_event 4, 92, 0, 23, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE99E, 420, 0, 0
	object_event 5, 92, 0, 2, 0, 29, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9AB, 421, 0, 0
	object_event 6, 92, 0, 5, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9C5, 424, 0, 0

PokemonMansion_B1F_MapWarps:
	warp_def 34, 29, 3, 4, 315

PokemonMansion_B1F_MapBGEvents:
	bg_event 21, 27, 0, 0, 0, PokemonMansion_B1F_EventScript_162320
	bg_event 24, 29, 0, 1, 0, PokemonMansion_B1F_EventScript_16230C
	bg_event 27, 5, 0, 1, 0, PokemonMansion_B1F_EventScript_16230C
	bg_event 35, 5, 3, 7, 0, 36, 33, 1

PokemonMansion_B1F_MapEvents::
	map_events PokemonMansion_B1F_EventObjects, PokemonMansion_B1F_MapWarps, 0x0, PokemonMansion_B1F_MapBGEvents
