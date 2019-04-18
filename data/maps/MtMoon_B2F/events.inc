MtMoon_B2F_EventObjects:
	object_event 1, 98, 0, 13, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_16071B, 47, 0, 0
	object_event 2, 98, 0, 14, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_16077F, 48, 0, 0
	object_event 3, 55, 0, 13, 0, 11, 0, 3, 10, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1606C2, 0, 0, 0
	object_event 4, 49, 0, 37, 0, 21, 0, 3, 1, 17, 0, 1, 0, 3, 0, MtMoon_B2F_EventScript_160829, 173, 0, 0
	object_event 5, 49, 0, 12, 0, 20, 0, 3, 8, 17, 0, 1, 0, 2, 0, MtMoon_B2F_EventScript_1607E4, 173, 0, 0
	object_event 6, 49, 0, 35, 0, 12, 0, 3, 7, 17, 0, 1, 0, 4, 0, MtMoon_B2F_EventScript_160812, 173, 0, 0
	object_event 7, 49, 0, 18, 0, 27, 0, 3, 8, 17, 0, 1, 0, 4, 0, MtMoon_B2F_EventScript_1607FB, 173, 0, 0
	object_event 8, 92, 0, 30, 0, 26, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BE61D, 351, 0, 0
	object_event 9, 92, 0, 35, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BE62A, 352, 0, 0
	object_event 10, 92, 0, 24, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BEAD6, 447, 0, 0
	object_event 11, 92, 0, 3, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BEAE3, 448, 0, 0

MtMoon_B2F_MapWarps:
	warp_def 25, 21, 3, 3, 258
	warp_def 31, 11, 3, 4, 258
	warp_def 17, 31, 3, 5, 258
	warp_def 5, 10, 3, 6, 258

MtMoon_B2F_MapCoordEvents:
	coord_event 14, 11, 3, 0, 16523, 0, 0, MtMoon_B2F_EventScript_1606B0

MtMoon_B2F_MapBGEvents:
	bg_event 20, 16, 3, 7, 0, 94, 2, 1
	bg_event 39, 11, 3, 7, 0, 34, 3, 1

MtMoon_B2F_MapEvents::
	map_events MtMoon_B2F_EventObjects, MtMoon_B2F_MapWarps, MtMoon_B2F_MapCoordEvents, MtMoon_B2F_MapBGEvents
