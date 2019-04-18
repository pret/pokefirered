Route9_EventObjects:
	object_event 1, 40, 0, 14, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9E71, 0, 0, 0
	object_event 2, 56, 0, 20, 0, 17, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route9_EventScript_1A9F69, 0, 0, 0
	object_event 3, 56, 0, 61, 0, 16, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route9_EventScript_1A9EED, 0, 0, 0
	object_event 4, 39, 0, 26, 0, 7, 0, 3, 1, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9DF5, 0, 0, 0
	object_event 5, 20, 0, 26, 0, 1, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route9_EventScript_1A9D79, 0, 0, 0
	object_event 6, 20, 0, 49, 0, 7, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9DB7, 0, 0, 0
	object_event 7, 56, 0, 53, 0, 2, 0, 3, 5, 19, 0, 1, 0, 1, 0, Route9_EventScript_1A9F2B, 0, 0, 0
	object_event 8, 40, 0, 60, 0, 9, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route9_EventScript_1A9EAF, 0, 0, 0
	object_event 9, 39, 0, 36, 0, 6, 0, 3, 10, 17, 0, 1, 0, 5, 0, Route9_EventScript_1A9E33, 0, 0, 0
	object_event 10, 95, 0, 2, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BDF13, 18, 0, 0
	object_event 11, 92, 0, 12, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BE6B9, 363, 0, 0
	object_event 12, 92, 0, 65, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BEAFD, 450, 0, 0

Route9_MapBGEvents:
	bg_event 29, 7, 0, 0, 0, Route9_EventScript_167FD0
	bg_event 15, 7, 0, 7, 0, 34, 6, 1
	bg_event 63, 2, 3, 7, 0, 68, 123, 1
	bg_event 48, 2, 3, 7, 0, 134, 150, 1

Route9_MapEvents::
	map_events Route9_EventObjects, 0x0, 0x0, Route9_MapBGEvents
