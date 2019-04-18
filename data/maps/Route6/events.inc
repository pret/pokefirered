Route6_EventObjects:
	object_event 1, 20, 0, 3, 0, 16, 0, 3, 10, 17, 0, 1, 0, 5, 0, Route6_EventScript_1A9999, 0, 0, 0
	object_event 2, 39, 0, 12, 0, 21, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route6_EventScript_1A9A15, 0, 0, 0
	object_event 3, 40, 0, 13, 0, 21, 0, 3, 9, 17, 0, 1, 0, 0, 0, Route6_EventScript_1A9A91, 0, 0, 0
	object_event 4, 20, 0, 20, 0, 25, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A99D7, 0, 0, 0
	object_event 5, 40, 0, 13, 0, 32, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A9ACF, 0, 0, 0
	object_event 6, 39, 0, 13, 0, 33, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A9A53, 0, 0, 0

Route6_MapWarps:
	warp_def 19, 13, 0, 1, 288
	warp_def 12, 5, 3, 2, 4608
	warp_def 13, 5, 3, 2, 4608

Route6_MapBGEvents:
	bg_event 21, 15, 0, 0, 0, Route6_EventScript_167FB2
	bg_event 5, 5, 3, 7, 0, 142, 118, 1
	bg_event 19, 5, 3, 7, 0, 68, 119, 1

Route6_MapEvents::
	map_events Route6_EventObjects, Route6_MapWarps, 0x0, Route6_MapBGEvents
