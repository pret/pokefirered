Route2_EventObjects:
	object_event 1, 95, 0, 16, 0, 62, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 20, 0, 0
	object_event 2, 95, 0, 15, 0, 69, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 19, 0, 0
	object_event 3, 95, 0, 11, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 21, 0, 0
	object_event 4, 95, 0, 18, 0, 26, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 22, 0, 0
	object_event 5, 92, 0, 17, 0, 54, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BE58E, 340, 0, 0
	object_event 6, 92, 0, 17, 0, 64, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BE59B, 341, 0, 0
	object_event 7, 65375, 0, 6, 0, 85, 0, 8, 0, 0, 0, 1, 0, 3, 0, 0x0, 0, 0, 0

Route2_MapWarps:
	warp_def 5, 13, 3, 3, 3843
	warp_def 6, 13, 3, 3, 3843
	warp_def 5, 51, 3, 1, 3840
	warp_def 17, 11, 3, 1, 292
	warp_def 17, 22, 0, 1, 3841
	warp_def 18, 46, 3, 1, 3842
	warp_def 18, 41, 3, 3, 3842
	warp_def 19, 41, 3, 3, 3842
	warp_def 19, 46, 3, 1, 3842
	warp_def 6, 51, 3, 1, 3840

Route2_MapBGEvents:
	bg_event 14, 12, 0, 0, 0, Route2_EventScript_167F6E
	bg_event 7, 73, 0, 0, 0, Route2_EventScript_167F65

Route2_MapEvents::
	map_events Route2_EventObjects, Route2_MapWarps, 0x0, Route2_MapBGEvents
