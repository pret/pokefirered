CeruleanCave_1F_EventObjects:
	object_event 1, 92, 0, 7, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA47, 434, 0, 0
	object_event 2, 92, 0, 11, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA54, 435, 0, 0
	object_event 3, 92, 0, 25, 0, 5, 0, 4, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA3A, 433, 0, 0
	object_event 4, 96, 0, 7, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 13, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 5, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 14, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 21, 0, 0
	object_event 8, 96, 0, 11, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 22, 0, 0
	object_event 9, 96, 0, 9, 0, 18, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 23, 0, 0

CeruleanCave_1F_MapWarps:
	warp_def 33, 21, 3, 7, 771
	warp_def 34, 2, 3, 0, 329
	warp_def 1, 7, 3, 0, 330
	warp_def 10, 2, 3, 1, 329
	warp_def 5, 15, 3, 2, 329
	warp_def 30, 10, 4, 3, 329
	warp_def 24, 11, 3, 4, 329
	warp_def 2, 4, 3, 5, 329

CeruleanCave_1F_MapBGEvents:
	bg_event 12, 2, 3, 7, 0, 2, 39, 1

CeruleanCave_1F_MapEvents::
	map_events CeruleanCave_1F_EventObjects, CeruleanCave_1F_MapWarps, 0x0, CeruleanCave_1F_MapBGEvents
