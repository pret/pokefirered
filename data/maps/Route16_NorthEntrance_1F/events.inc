Route16_NorthEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_1F_EventScript_1701DB, 0, 0, 0
	object_event 2, 32, 0, 7, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_1F_EventScript_1702B5, 0, 0, 0

Route16_NorthEntrance_1F_MapWarps:
	warp_def 1, 3, 3, 1, 802
	warp_def 11, 3, 3, 2, 802
	warp_def 1, 12, 3, 3, 802
	warp_def 11, 12, 3, 4, 802
	warp_def 9, 16, 3, 0, 6402

Route16_NorthEntrance_1F_MapCoordEvents:
	coord_event 10, 12, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 2, 12, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 6, 10, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701E4
	coord_event 6, 11, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701F0
	coord_event 1, 13, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 1, 11, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 11, 11, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 11, 13, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 6, 12, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701FC
	coord_event 6, 13, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_170208
	coord_event 6, 14, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_170214

Route16_NorthEntrance_1F_MapEvents::
	map_events Route16_NorthEntrance_1F_EventObjects, Route16_NorthEntrance_1F_MapWarps, Route16_NorthEntrance_1F_MapCoordEvents, 0x0
