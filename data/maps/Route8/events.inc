Route8_EventObjects:
	object_event 1, 22, 0, 62, 0, 14, 0, 3, 9, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA1D5, 0, 0, 0
	object_event 2, 32, 0, 55, 0, 15, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA30B, 0, 0, 0
	object_event 3, 55, 0, 51, 0, 6, 0, 3, 1, 17, 0, 1, 0, 4, 0, Route8_EventScript_1AA251, 0, 0, 0
	object_event 4, 22, 0, 29, 0, 3, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA11B, 0, 0, 0
	object_event 5, 55, 0, 29, 0, 4, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA28F, 0, 0, 0
	object_event 6, 22, 0, 29, 0, 5, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA159, 0, 0, 0
	object_event 7, 22, 0, 29, 0, 6, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA197, 0, 0, 0
	object_event 8, 32, 0, 21, 0, 3, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA2CD, 0, 0, 0
	object_event 9, 55, 0, 9, 0, 6, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route8_EventScript_1AA213, 0, 0, 0
	object_event 10, 95, 0, 33, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_EventScript_1BDF13, 18, 0, 0
	object_event 11, 95, 0, 47, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_EventScript_1BDF13, 19, 0, 0
	object_event 12, 17, 0, 40, 0, 3, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA349, 0, 0, 0
	object_event 13, 17, 0, 41, 0, 3, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA38F, 0, 0, 0
	object_event 14, 53, 0, 14, 0, 16, 0, 3, 52, 37, 0, 1, 0, 1, 0, Route8_EventScript_1AA3D5, 0, 0, 0
	object_event 15, 53, 0, 24, 0, 17, 0, 3, 41, 85, 0, 1, 0, 1, 0, Route8_EventScript_1AA413, 0, 0, 0

Route8_MapWarps:
	warp_def 13, 4, 0, 1, 291
	warp_def 7, 10, 3, 2, 5120

Route8_MapBGEvents:
	bg_event 16, 5, 0, 0, 0, Route8_EventScript_167FC6
	bg_event 42, 10, 3, 7, 0, 136, 127, 1
	bg_event 38, 11, 3, 7, 0, 141, 128, 1
	bg_event 42, 15, 3, 7, 0, 138, 129, 1

Route8_MapEvents::
	map_events Route8_EventObjects, Route8_MapWarps, 0x0, Route8_MapBGEvents
