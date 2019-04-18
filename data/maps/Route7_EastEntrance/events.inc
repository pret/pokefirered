Route7_EastEntrance_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route7_EastEntrance_EventScript_16FA8E, 0, 0, 0

Route7_EastEntrance_MapWarps:
	warp_def 1, 5, 3, 1, 793
	warp_def 1, 6, 3, 1, 793
	warp_def 11, 5, 3, 8, 778
	warp_def 11, 6, 3, 8, 778

Route7_EastEntrance_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FA97
	coord_event 6, 5, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FAA3
	coord_event 6, 6, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FAAF

Route7_EastEntrance_MapEvents::
	map_events Route7_EastEntrance_EventObjects, Route7_EastEntrance_MapWarps, Route7_EastEntrance_MapCoordEvents, 0x0
