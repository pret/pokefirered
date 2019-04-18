SilphCo_5F_EventObjects:
	object_event 1, 49, 0, 35, 0, 7, 0, 3, 7, 17, 0, 1, 0, 2, 0, SilphCo_5F_EventScript_161853, 83, 0, 0
	object_event 2, 26, 0, 23, 0, 13, 0, 3, 13, 17, 0, 1, 0, 4, 0, SilphCo_5F_EventScript_16186A, 83, 0, 0
	object_event 3, 47, 0, 16, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1617E0, 0, 0, 0
	object_event 4, 55, 0, 11, 0, 6, 0, 3, 2, 17, 0, 1, 0, 1, 0, SilphCo_5F_EventScript_161825, 83, 0, 0
	object_event 5, 49, 0, 9, 0, 21, 0, 3, 16, 17, 0, 1, 0, 3, 0, SilphCo_5F_EventScript_16183C, 83, 0, 0
	object_event 6, 92, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE89A, 400, 0, 0
	object_event 7, 92, 0, 1, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE8A7, 401, 0, 0
	object_event 8, 92, 0, 22, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE8B4, 402, 0, 0
	object_event 9, 55, 0, 2, 0, 7, 0, 3, 28, 18, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1AD0D4, 0, 0, 0

SilphCo_5F_MapWarps:
	warp_def 28, 2, 3, 0, 306
	warp_def 15, 7, 3, 1, 305
	warp_def 30, 2, 3, 2, 308
	warp_def 10, 20, 3, 1, 311
	warp_def 2, 20, 3, 5, 305
	warp_def 33, 5, 3, 2, 309
	warp_def 22, 3, 0, 0, 314

SilphCo_5F_MapBGEvents:
	bg_event 13, 16, 0, 7, 0, 36, 24, 1
	bg_event 8, 9, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 8, 10, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 8, 18, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 8, 19, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 19, 13, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 19, 14, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 7, 9, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 7, 10, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 7, 19, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 7, 18, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 18, 13, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 18, 14, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 28, 11, 0, 0, 0, SilphCo_5F_EventScript_161813
	bg_event 30, 13, 0, 0, 0, SilphCo_5F_EventScript_16180A
	bg_event 25, 15, 0, 0, 0, SilphCo_5F_EventScript_161801
	bg_event 32, 9, 0, 7, 0, 69, 138, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_5F_EventScript_16181C

SilphCo_5F_MapEvents::
	map_events SilphCo_5F_EventObjects, SilphCo_5F_MapWarps, 0x0, SilphCo_5F_MapBGEvents
