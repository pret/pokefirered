Route15_WestEntrance_2F_EventObjects:
	object_event 1, 55, 0, 5, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, Route15_WestEntrance_2F_EventScript_1700B9, 0, 0, 0

Route15_WestEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 6144

Route15_WestEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route15_WestEntrance_2F_EventScript_170093
	bg_event 8, 1, 0, 0, 0, Route15_WestEntrance_2F_EventScript_1700B0

Route15_WestEntrance_2F_MapEvents::
	map_events Route15_WestEntrance_2F_EventObjects, Route15_WestEntrance_2F_MapWarps, 0x0, Route15_WestEntrance_2F_MapBGEvents
