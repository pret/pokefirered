Route22_EventObjects:
	object_event 1, 72, 0, 25, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 79, 0, 0

Route22_MapWarps:
	warp_def 8, 5, 0, 2, 7168
	warp_def 9, 5, 0, 2, 7168

Route22_MapCoordEvents:
	coord_event 33, 4, 3, 0, 16468, 1, 0, Route22_EventScript_16828C
	coord_event 33, 5, 3, 0, 16468, 1, 0, Route22_EventScript_168298
	coord_event 33, 6, 0, 0, 16468, 1, 0, Route22_EventScript_1682AB
	coord_event 33, 4, 3, 0, 16468, 3, 0, Route22_EventScript_1683ED
	coord_event 33, 5, 3, 0, 16468, 3, 0, Route22_EventScript_1683F9
	coord_event 33, 6, 0, 0, 16468, 3, 0, Route22_EventScript_16840C

Route22_MapBGEvents:
	bg_event 7, 12, 0, 0, 0, Route22_EventScript_1684E2

Route22_MapEvents::
	map_events Route22_EventObjects, Route22_MapWarps, Route22_MapCoordEvents, Route22_MapBGEvents
