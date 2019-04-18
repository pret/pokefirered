VermilionCity_PokemonFanClub_EventObjects:
	object_event 1, 61, 0, 5, 0, 4, 0, 4, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B47F, 0, 0, 0
	object_event 2, 48, 0, 6, 0, 4, 0, 4, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B4FC, 0, 0, 0
	object_event 3, 120, 0, 7, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B59E, 0, 0, 0
	object_event 4, 126, 0, 4, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5B1, 0, 0, 0
	object_event 5, 23, 0, 4, 0, 5, 0, 0, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B528, 0, 0, 0
	object_event 6, 27, 0, 7, 0, 5, 0, 0, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B563, 0, 0, 0

VermilionCity_PokemonFanClub_MapWarps:
	warp_def 4, 10, 3, 5, 773
	warp_def 5, 10, 3, 5, 773
	warp_def 6, 10, 3, 5, 773

VermilionCity_PokemonFanClub_MapBGEvents:
	bg_event 2, 1, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5C4
	bg_event 9, 1, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5CD

VermilionCity_PokemonFanClub_MapEvents::
	map_events VermilionCity_PokemonFanClub_EventObjects, VermilionCity_PokemonFanClub_MapWarps, 0x0, VermilionCity_PokemonFanClub_MapBGEvents
