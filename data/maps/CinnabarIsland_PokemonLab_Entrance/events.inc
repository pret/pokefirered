CinnabarIsland_PokemonLab_Entrance_EventObjects:
	object_event 1, 55, 0, 2, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E28B, 0, 0, 0

CinnabarIsland_PokemonLab_Entrance_MapWarps:
	warp_def 3, 9, 3, 2, 776
	warp_def 4, 9, 3, 2, 776
	warp_def 5, 9, 3, 2, 776
	warp_def 13, 5, 0, 0, 3074
	warp_def 19, 5, 0, 0, 3075
	warp_def 25, 5, 0, 0, 3076

CinnabarIsland_PokemonLab_Entrance_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E294
	bg_event 12, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E29D
	bg_event 18, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E2A6
	bg_event 24, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E2AF

CinnabarIsland_PokemonLab_Entrance_MapEvents::
	map_events CinnabarIsland_PokemonLab_Entrance_EventObjects, CinnabarIsland_PokemonLab_Entrance_MapWarps, 0x0, CinnabarIsland_PokemonLab_Entrance_MapBGEvents
