Route10_EventObjects:
	object_event 1, 40, 0, 7, 0, 60, 0, 3, 1, 17, 0, 1, 0, 2, 0, Route10_EventScript_1A9FE5, 0, 0, 0
	object_event 2, 56, 0, 4, 0, 62, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route10_EventScript_1AA09F, 0, 0, 0
	object_event 3, 52, 0, 15, 0, 70, 0, 3, 5, 18, 0, 1, 0, 2, 0, Route10_EventScript_1AA061, 0, 0, 0
	object_event 4, 56, 0, 4, 0, 68, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route10_EventScript_1AA0DD, 0, 0, 0
	object_event 5, 52, 0, 13, 0, 44, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route10_EventScript_1AA023, 0, 0, 0
	object_event 6, 40, 0, 9, 0, 27, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route10_EventScript_1A9FA7, 0, 0, 0
	object_event 7, 95, 0, 10, 0, 20, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 18, 0, 0
	object_event 8, 95, 0, 10, 0, 22, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 19, 0, 0
	object_event 9, 95, 0, 10, 0, 24, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 20, 0, 0
	object_event 10, 95, 0, 10, 0, 26, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 21, 0, 0

Route10_MapWarps:
	warp_def 8, 19, 3, 0, 337
	warp_def 8, 57, 3, 5, 337
	warp_def 7, 40, 3, 1, 351
	warp_def 13, 20, 0, 1, 5376
	warp_def 2, 37, 3, 3, 351

Route10_MapBGEvents:
	bg_event 15, 59, 0, 0, 0, Route10_EventScript_167FE4
	bg_event 6, 42, 0, 0, 0, Route10_EventScript_167FED
	bg_event 7, 21, 0, 0, 0, Route10_EventScript_167FDB
	bg_event 10, 19, 0, 7, 0, 22, 9, 1
	bg_event 12, 40, 3, 7, 0, 35, 10, 1
	bg_event 6, 26, 3, 7, 0, 133, 126, 1
	bg_event 17, 29, 3, 7, 0, 140, 125, 1
	bg_event 20, 57, 3, 7, 0, 150, 151, 1

Route10_MapEvents::
	map_events Route10_EventObjects, Route10_MapWarps, 0x0, Route10_MapBGEvents
