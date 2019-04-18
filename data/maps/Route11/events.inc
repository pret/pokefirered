Route11_EventObjects:
	object_event 1, 18, 0, 19, 0, 8, 0, 3, 17, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9B0D, 0, 0, 0
	object_event 2, 32, 0, 16, 0, 17, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9C81, 0, 0, 0
	object_event 3, 18, 0, 31, 0, 8, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9B4B, 0, 0, 0
	object_event 4, 18, 0, 28, 0, 10, 0, 3, 40, 72, 0, 1, 0, 1, 0, Route11_EventScript_1A9BC7, 0, 0, 0
	object_event 5, 32, 0, 38, 0, 15, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9CBF, 0, 0, 0
	object_event 6, 32, 0, 50, 0, 4, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9D3B, 0, 0, 0
	object_event 7, 30, 0, 42, 0, 8, 0, 3, 14, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9C05, 0, 0, 0
	object_event 8, 18, 0, 50, 0, 14, 0, 3, 25, 65, 0, 1, 0, 1, 0, Route11_EventScript_1A9B89, 0, 0, 0
	object_event 9, 32, 0, 57, 0, 16, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9CFD, 0, 0, 0
	object_event 10, 30, 0, 32, 0, 18, 0, 3, 14, 17, 0, 1, 0, 6, 0, Route11_EventScript_1A9C43, 0, 0, 0
	object_event 11, 92, 0, 42, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEAF0, 449, 0, 0
	object_event 12, 92, 0, 63, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEB99, 462, 0, 0
	object_event 13, 92, 0, 13, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEBA6, 463, 0, 0

Route11_MapWarps:
	warp_def 6, 7, 0, 0, 294
	warp_def 58, 10, 3, 0, 5632
	warp_def 65, 10, 3, 2, 5632

Route11_MapBGEvents:
	bg_event 3, 7, 3, 0, 0, Route11_EventScript_167FF7
	bg_event 58, 5, 0, 7, 0, 85, 41, 1

Route11_MapEvents::
	map_events Route11_EventObjects, Route11_MapWarps, 0x0, Route11_MapBGEvents
