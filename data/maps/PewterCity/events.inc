PewterCity_EventObjects:
	object_event 1, 22, 0, 6, 0, 15, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_166075, 0, 0, 0
	object_event 2, 25, 0, 33, 0, 17, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_16607E, 80, 0, 0
	object_event 3, 27, 0, 21, 0, 28, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_16622B, 0, 0, 0
	object_event 4, 20, 0, 33, 0, 27, 0, 3, 5, 18, 0, 0, 0, 0, 0, PewterCity_EventScript_166244, 0, 0, 0
	object_event 5, 19, 0, 42, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_165B9D, 46, 0, 0
	object_event 6, 95, 0, 30, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_1BDF13, 18, 0, 0
	object_event 7, 55, 0, 46, 0, 20, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_1662A9, 146, 0, 0

PewterCity_MapWarps:
	warp_def 17, 6, 0, 1, 1536
	warp_def 25, 4, 0, 3, 1536
	warp_def 15, 16, 0, 1, 1538
	warp_def 28, 18, 0, 1, 1539
	warp_def 33, 11, 0, 1, 1540
	warp_def 17, 25, 0, 1, 1541
	warp_def 9, 30, 0, 1, 1543

PewterCity_MapCoordEvents:
	coord_event 42, 21, 3, 0, 16492, 0, 0, PewterCity_EventScript_165D8E
	coord_event 42, 22, 3, 0, 16492, 0, 0, PewterCity_EventScript_165D9A
	coord_event 42, 23, 3, 0, 16492, 0, 0, PewterCity_EventScript_165DA6
	coord_event 43, 23, 3, 0, 16492, 0, 0, PewterCity_EventScript_165DB2
	coord_event 46, 21, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662B7
	coord_event 46, 22, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662C4
	coord_event 46, 23, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662D1

PewterCity_MapBGEvents:
	bg_event 19, 7, 0, 0, 0, PewterCity_EventScript_16627F
	bg_event 39, 19, 0, 0, 0, PewterCity_EventScript_166276
	bg_event 11, 16, 0, 0, 0, PewterCity_EventScript_166288
	bg_event 20, 30, 0, 0, 0, PewterCity_EventScript_16626D
	bg_event 31, 25, 0, 0, 0, PewterCity_EventScript_1662A0
	bg_event 6, 3, 3, 7, 0, 4, 112, 1

PewterCity_MapEvents::
	map_events PewterCity_EventObjects, PewterCity_MapWarps, PewterCity_MapCoordEvents, PewterCity_MapBGEvents
