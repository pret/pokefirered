SixIsland_GreenPath_EventObjects:
	object_event 1, 23, 0, 11, 0, 8, 0, 3, 20, 17, 0, 1, 0, 2, 0, SixIsland_GreenPath_EventScript_1AC517, 0, 0, 0

SixIsland_GreenPath_MapWarps:
	warp_def 63, 10, 3, 1, 377
	warp_def 64, 10, 3, 1, 377
	warp_def 45, 10, 3, 4, 377
	warp_def 46, 10, 3, 4, 377

SixIsland_GreenPath_MapBGEvents:
	bg_event 40, 10, 0, 0, 0, SixIsland_GreenPath_EventScript_168B37
	bg_event 69, 10, 0, 0, 0, SixIsland_GreenPath_EventScript_168B2E
	bg_event 12, 9, 3, 7, 0, 2, 180, 1

SixIsland_GreenPath_MapEvents::
	map_events SixIsland_GreenPath_EventObjects, SixIsland_GreenPath_MapWarps, 0x0, SixIsland_GreenPath_MapBGEvents
