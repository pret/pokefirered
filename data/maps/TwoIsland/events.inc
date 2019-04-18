TwoIsland_EventObjects:
	object_event 1, 68, 0, 28, 0, 4, 0, 3, 8, 33, 0, 0, 0, 0, 0, TwoIsland_EventScript_16760F, 0, 0, 0
	object_event 2, 23, 0, 31, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167755, 123, 0, 0
	object_event 3, 29, 0, 30, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_16775E, 124, 0, 0
	object_event 4, 62, 0, 26, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_16774C, 0, 0, 0
	object_event 5, 52, 0, 27, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167777, 125, 0, 0
	object_event 6, 95, 0, 30, 0, 16, 0, 3, 1, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_1BDF13, 18, 0, 0
	object_event 7, 92, 0, 39, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_1BEAAF, 442, 0, 0
	object_event 8, 16, 0, 37, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167789, 0, 0, 0
	object_event 9, 19, 0, 24, 0, 12, 0, 3, 2, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167780, 0, 0, 0

TwoIsland_MapWarps:
	warp_def 39, 9, 0, 0, 8448
	warp_def 33, 9, 0, 0, 8449
	warp_def 21, 7, 0, 0, 8450
	warp_def 10, 8, 3, 0, 8452

TwoIsland_MapBGEvents:
	bg_event 29, 8, 0, 0, 0, TwoIsland_EventScript_167792
	bg_event 40, 10, 0, 0, 0, TwoIsland_EventScript_16779B
	bg_event 8, 3, 0, 0, 0, TwoIsland_EventScript_1677A4

TwoIsland_MapEvents::
	map_events TwoIsland_EventObjects, TwoIsland_MapWarps, 0x0, TwoIsland_MapBGEvents
