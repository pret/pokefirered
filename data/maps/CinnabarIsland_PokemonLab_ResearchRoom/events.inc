CinnabarIsland_PokemonLab_ResearchRoom_EventObjects:
	object_event 1, 52, 0, 5, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3DF, 0, 0, 0
	object_event 2, 55, 0, 10, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3E5, 0, 0, 0

CinnabarIsland_PokemonLab_ResearchRoom_MapWarps:
	warp_def 7, 9, 3, 4, 3073

CinnabarIsland_PokemonLab_ResearchRoom_MapBGEvents:
	bg_event 6, 1, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3F7
	bg_event 3, 1, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3EE

CinnabarIsland_PokemonLab_ResearchRoom_MapEvents::
	map_events CinnabarIsland_PokemonLab_ResearchRoom_EventObjects, CinnabarIsland_PokemonLab_ResearchRoom_MapWarps, 0x0, CinnabarIsland_PokemonLab_ResearchRoom_MapBGEvents
