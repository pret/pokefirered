CinnabarIsland_EventObjects:
	object_event 1, 28, 0, 14, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CinnabarIsland_EventScript_1671EF, 0, 0, 0
	object_event 2, 32, 0, 11, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, CinnabarIsland_EventScript_167208, 0, 0, 0
	object_event 3, 73, 0, 20, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 98, 0, 0
	object_event 4, 108, 0, 23, 0, 7, 0, 1, 9, 17, 0, 0, 0, 0, 0, 0x0, 107, 0, 0

CinnabarIsland_MapWarps:
	warp_def 8, 3, 0, 1, 315
	warp_def 20, 4, 0, 1, 3072
	warp_def 8, 9, 0, 1, 3073
	warp_def 14, 11, 0, 0, 3077
	warp_def 19, 11, 0, 1, 3079

CinnabarIsland_MapCoordEvents:
	coord_event 20, 5, 3, 0, 16385, 0, 0, CinnabarIsland_EventScript_1671CA

CinnabarIsland_MapBGEvents:
	bg_event 12, 3, 0, 0, 0, CinnabarIsland_EventScript_167211
	bg_event 9, 9, 0, 0, 0, CinnabarIsland_EventScript_16721A
	bg_event 22, 5, 0, 0, 0, CinnabarIsland_EventScript_167223
	bg_event 10, 9, 0, 0, 0, CinnabarIsland_EventScript_16721A

CinnabarIsland_MapEvents::
	map_events CinnabarIsland_EventObjects, CinnabarIsland_MapWarps, CinnabarIsland_MapCoordEvents, CinnabarIsland_MapBGEvents
