Route7_EventObjects:
	object_event 1, 65375, 0, 248, 255, 12, 0, 10, 0, 0, 0, 6, 0, 3, 0, 0x0, 0, 0, 0

Route7_MapWarps:
	warp_def 7, 14, 0, 1, 289
	warp_def 15, 10, 3, 0, 4864

Route7_MapBGEvents:
	bg_event 5, 14, 0, 0, 0, Route7_EventScript_167FBC
	bg_event 16, 15, 3, 7, 0, 151, 152, 1

Route7_MapEvents::
	map_events Route7_EventObjects, Route7_MapWarps, 0x0, Route7_MapBGEvents
