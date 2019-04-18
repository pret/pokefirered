Route20_EventObjects:
	object_event 1, 44, 0, 8, 0, 11, 0, 1, 13, 17, 0, 1, 0, 3, 0, Route20_EventScript_1AB83F, 0, 0, 0
	object_event 2, 40, 0, 16, 0, 14, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB8F9, 0, 0, 0
	object_event 3, 44, 0, 34, 0, 7, 0, 1, 8, 17, 0, 1, 0, 4, 0, Route20_EventScript_1AB801, 0, 0, 0
	object_event 4, 26, 0, 43, 0, 9, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB8BB, 0, 0, 0
	object_event 5, 43, 0, 23, 0, 10, 0, 1, 52, 69, 0, 1, 0, 1, 0, Route20_EventScript_1AB747, 0, 0, 0
	object_event 6, 40, 0, 73, 0, 16, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route20_EventScript_1AB937, 0, 0, 0
	object_event 7, 43, 0, 111, 0, 9, 0, 1, 45, 53, 0, 1, 0, 1, 0, Route20_EventScript_1AB709, 0, 0, 0
	object_event 8, 43, 0, 106, 0, 11, 0, 1, 50, 53, 0, 1, 0, 1, 0, Route20_EventScript_1AB785, 0, 0, 0
	object_event 9, 44, 0, 93, 0, 10, 0, 1, 1, 17, 0, 1, 0, 5, 0, Route20_EventScript_1AB87D, 0, 0, 0
	object_event 10, 44, 0, 54, 0, 11, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB7C3, 0, 0, 0
	object_event 11, 39, 0, 69, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route20_EventScript_1ACE36, 0, 0, 0

Route20_MapWarps:
	warp_def 60, 8, 3, 3, 339
	warp_def 72, 14, 3, 4, 339

Route20_MapBGEvents:
	bg_event 68, 14, 0, 0, 0, Route20_EventScript_168280
	bg_event 64, 8, 0, 0, 0, Route20_EventScript_168280
	bg_event 23, 6, 3, 7, 0, 108, 153, 1

Route20_MapEvents::
	map_events Route20_EventObjects, Route20_MapWarps, 0x0, Route20_MapBGEvents
