SilphCo_7F_EventObjects:
	object_event 1, 72, 0, 2, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 78, 0, 0
	object_event 2, 47, 0, 0, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161AC8, 0, 0, 0
	object_event 3, 49, 0, 24, 0, 5, 0, 3, 9, 17, 0, 1, 0, 4, 0, SilphCo_7F_EventScript_161C1A, 83, 0, 0
	object_event 4, 49, 0, 24, 0, 15, 0, 3, 10, 17, 0, 1, 0, 2, 0, SilphCo_7F_EventScript_161C31, 83, 0, 0
	object_event 5, 49, 0, 13, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, SilphCo_7F_EventScript_161C48, 83, 0, 0
	object_event 6, 48, 0, 10, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161BD9, 0, 0, 0
	object_event 7, 47, 0, 13, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161B97, 0, 0, 0
	object_event 8, 47, 0, 9, 0, 14, 0, 3, 27, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161BB8, 0, 0, 0
	object_event 9, 55, 0, 3, 0, 13, 0, 3, 5, 18, 0, 1, 0, 1, 0, SilphCo_7F_EventScript_161C03, 83, 0, 0
	object_event 10, 92, 0, 0, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_1BE8DB, 405, 0, 0
	object_event 11, 92, 0, 30, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_1BE8E8, 406, 0, 0

SilphCo_7F_MapWarps:
	warp_def 19, 2, 3, 0, 308
	warp_def 5, 8, 3, 1, 313
	warp_def 25, 17, 3, 5, 307
	warp_def 27, 2, 3, 3, 310
	warp_def 5, 4, 3, 2, 305
	warp_def 23, 3, 0, 0, 314

SilphCo_7F_MapCoordEvents:
	coord_event 2, 4, 3, 0, 16476, 0, 0, SilphCo_7F_EventScript_1619BC
	coord_event 2, 5, 3, 0, 16476, 0, 0, SilphCo_7F_EventScript_1619C8

SilphCo_7F_MapBGEvents:
	bg_event 11, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 12, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 11, 9, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 12, 9, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 24, 7, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 7, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 24, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 13, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 26, 13, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 25, 14, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 26, 14, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 22, 11, 0, 7, 0, 70, 140, 1
	bg_event 20, 1, 0, 0, 0, SilphCo_7F_EventScript_161BFA

SilphCo_7F_MapEvents::
	map_events SilphCo_7F_EventObjects, SilphCo_7F_MapWarps, SilphCo_7F_MapCoordEvents, SilphCo_7F_MapBGEvents
