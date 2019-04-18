SevenIsland_House_Room1_EventObjects:
	object_event 1, 35, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SevenIsland_House_Room1_EventScript_170958, 0, 0, 0

SevenIsland_House_Room1_MapWarps:
	warp_def 4, 7, 3, 0, 785
	warp_def 4, 1, 0, 0, 7937

SevenIsland_House_Room1_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, SevenIsland_House_Room1_EventScript_170A75

SevenIsland_House_Room1_MapEvents::
	map_events SevenIsland_House_Room1_EventObjects, SevenIsland_House_Room1_MapWarps, 0x0, SevenIsland_House_Room1_MapBGEvents
