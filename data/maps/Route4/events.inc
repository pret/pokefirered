Route4_EventObjects:
	object_event 1, 23, 0, 9, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route4_EventScript_167F8C, 0, 0, 0
	object_event 2, 22, 0, 75, 0, 3, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route4_EventScript_1A95B9, 0, 0, 0
	object_event 3, 92, 0, 67, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route4_EventScript_1BE637, 353, 0, 0
	object_event 4, 19, 0, 15, 0, 14, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route4_EventScript_1ACDEA, 0, 0, 0
	object_event 5, 54, 0, 47, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route4_EventScript_1C494E, 0, 0, 0
	object_event 6, 54, 0, 50, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route4_EventScript_1C49B6, 0, 0, 0
	object_event 7, 65321, 0, 109, 0, 3, 0, 12, 0, 0, 0, 3, 0, 3, 0, 0x0, 0, 0, 0

Route4_MapWarps:
	warp_def 19, 5, 3, 3, 257
	warp_def 32, 5, 0, 7, 258
	warp_def 12, 5, 0, 1, 4096

Route4_MapBGEvents:
	bg_event 18, 7, 0, 0, 0, Route4_EventScript_167F95
	bg_event 34, 7, 0, 0, 0, Route4_EventScript_167F9E
	bg_event 43, 2, 3, 7, 0, 3, 50, 1
	bg_event 5, 4, 3, 7, 0, 140, 114, 1
	bg_event 67, 17, 3, 7, 0, 148, 156, 1

Route4_MapEvents::
	map_events Route4_EventObjects, Route4_MapWarps, 0x0, Route4_MapBGEvents
