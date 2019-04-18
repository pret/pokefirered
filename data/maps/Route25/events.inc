Route25_EventObjects:
	object_event 1, 56, 0, 11, 0, 4, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route25_EventScript_1A98A1, 0, 0, 0
	object_event 2, 18, 0, 18, 0, 2, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A976B, 0, 0, 0
	object_event 3, 56, 0, 17, 0, 7, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A991D, 0, 0, 0
	object_event 4, 18, 0, 22, 0, 4, 0, 3, 1, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A97A9, 0, 0, 0
	object_event 5, 40, 0, 22, 0, 8, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A9825, 0, 0, 0
	object_event 6, 56, 0, 27, 0, 9, 0, 3, 7, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A98DF, 0, 0, 0
	object_event 7, 39, 0, 28, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A995B, 0, 0, 0
	object_event 8, 18, 0, 36, 0, 4, 0, 3, 26, 49, 0, 1, 0, 2, 0, Route25_EventScript_1A97E7, 0, 0, 0
	object_event 9, 22, 0, 42, 0, 5, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A9863, 0, 0, 0
	object_event 10, 92, 0, 26, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route25_EventScript_1BE651, 355, 0, 0
	object_event 11, 95, 0, 30, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route25_EventScript_1BDF13, 18, 0, 0
	object_event 12, 29, 0, 49, 0, 10, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route25_EventScript_1ACE4F, 0, 0, 0
	object_event 13, 25, 0, 49, 0, 11, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route25_EventScript_16874F, 0, 0, 0

Route25_MapWarps:
	warp_def 51, 4, 0, 1, 7680

Route25_MapBGEvents:
	bg_event 48, 4, 0, 0, 0, Route25_EventScript_168746
	bg_event 14, 2, 3, 7, 0, 36, 4, 1
	bg_event 58, 6, 3, 7, 0, 34, 5, 1
	bg_event 33, 8, 3, 7, 0, 139, 116, 1
	bg_event 40, 3, 3, 7, 0, 149, 117, 1

Route25_MapEvents::
	map_events Route25_EventObjects, Route25_MapWarps, 0x0, Route25_MapBGEvents
