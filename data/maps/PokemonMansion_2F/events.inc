PokemonMansion_2F_EventObjects:
	object_event 1, 52, 0, 5, 0, 23, 0, 3, 1, 17, 0, 1, 0, 1, 0, PokemonMansion_2F_EventScript_16228A, 0, 0, 0
	object_event 2, 92, 0, 36, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BE977, 417, 0, 0
	object_event 3, 92, 0, 18, 0, 23, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BEB72, 459, 0, 0
	object_event 4, 92, 0, 35, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BEB7F, 460, 0, 0

PokemonMansion_2F_MapWarps:
	warp_def 9, 3, 3, 0, 317
	warp_def 34, 22, 3, 1, 317
	warp_def 6, 14, 3, 3, 315
	warp_def 9, 14, 3, 2, 317
	warp_def 27, 17, 3, 5, 317

PokemonMansion_2F_MapBGEvents:
	bg_event 2, 16, 0, 1, 0, PokemonMansion_2F_EventScript_162264
	bg_event 6, 31, 0, 0, 0, PokemonMansion_2F_EventScript_162281
	bg_event 25, 4, 0, 0, 0, PokemonMansion_2F_EventScript_162278

PokemonMansion_2F_MapEvents::
	map_events PokemonMansion_2F_EventObjects, PokemonMansion_2F_MapWarps, 0x0, PokemonMansion_2F_MapBGEvents
