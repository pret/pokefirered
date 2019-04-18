Route8_WestEntrance_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_WestEntrance_EventScript_16FB54, 0, 0, 0

Route8_WestEntrance_MapWarps:
	warp_def 1, 4, 3, 10, 778
	warp_def 1, 5, 3, 10, 778
	warp_def 11, 5, 3, 1, 794
	warp_def 11, 6, 3, 1, 794

Route8_WestEntrance_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB5D
	coord_event 6, 5, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB69
	coord_event 6, 6, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB75

Route8_WestEntrance_MapEvents::
	map_events Route8_WestEntrance_EventObjects, Route8_WestEntrance_MapWarps, Route8_WestEntrance_MapCoordEvents, 0x0
