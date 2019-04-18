SixIsland_DottedHole_SapphireRoom_EventObjects:
	object_event 1, 100, 0, 7, 0, 7, 0, 0, 8, 17, 0, 0, 0, 0, 0, SixIsland_DottedHole_SapphireRoom_EventScript_1641B5, 143, 0, 0
	object_event 2, 55, 0, 5, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 144, 0, 0

SixIsland_DottedHole_SapphireRoom_MapWarps:
	warp_def 11, 7, 3, 2, 371
	warp_def 5, 9, 3, 3, 375

SixIsland_DottedHole_SapphireRoom_MapBGEvents:
	bg_event 7, 2, 0, 1, 0, SixIsland_DottedHole_SapphireRoom_EventScript_16441F

SixIsland_DottedHole_SapphireRoom_MapEvents::
	map_events SixIsland_DottedHole_SapphireRoom_EventObjects, SixIsland_DottedHole_SapphireRoom_MapWarps, 0x0, SixIsland_DottedHole_SapphireRoom_MapBGEvents
