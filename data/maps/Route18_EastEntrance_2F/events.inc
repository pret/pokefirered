Route18_EastEntrance_2F_EventObjects:
	object_event 1, 19, 0, 5, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route18_EastEntrance_2F_EventScript_17047E, 0, 0, 0

Route18_EastEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 2, 6656

Route18_EastEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route18_EastEntrance_2F_EventScript_17046C
	bg_event 8, 1, 0, 0, 0, Route18_EastEntrance_2F_EventScript_170475

Route18_EastEntrance_2F_MapEvents::
	map_events Route18_EastEntrance_2F_EventObjects, Route18_EastEntrance_2F_MapWarps, 0x0, Route18_EastEntrance_2F_MapBGEvents
