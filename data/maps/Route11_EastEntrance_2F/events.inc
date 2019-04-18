Route11_EastEntrance_2F_EventObjects:
	object_event 1, 18, 0, 7, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD5C, 0, 0, 0
	object_event 2, 55, 0, 2, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FDD8, 0, 0, 0

Route11_EastEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 5632

Route11_EastEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD35
	bg_event 8, 1, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD53

Route11_EastEntrance_2F_MapEvents::
	map_events Route11_EastEntrance_2F_EventObjects, Route11_EastEntrance_2F_MapWarps, 0x0, Route11_EastEntrance_2F_MapBGEvents
