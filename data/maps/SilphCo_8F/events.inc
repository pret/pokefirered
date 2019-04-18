SilphCo_8F_EventObjects:
	object_event 1, 49, 0, 28, 0, 5, 0, 3, 9, 17, 0, 1, 0, 4, 0, SilphCo_8F_EventScript_161CB0, 83, 0, 0
	object_event 2, 49, 0, 10, 0, 17, 0, 3, 10, 17, 0, 1, 0, 5, 0, SilphCo_8F_EventScript_161CC7, 83, 0, 0
	object_event 3, 55, 0, 9, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, SilphCo_8F_EventScript_161C99, 83, 0, 0
	object_event 4, 47, 0, 2, 0, 5, 0, 3, 5, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_161C6F, 0, 0, 0
	object_event 5, 92, 0, 24, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_1BEB4B, 456, 0, 0
	object_event 6, 55, 0, 29, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_1AD0ED, 0, 0, 0

SilphCo_8F_MapWarps:
	warp_def 16, 2, 3, 0, 311
	warp_def 11, 10, 3, 4, 310
	warp_def 10, 6, 3, 5, 304
	warp_def 28, 2, 3, 3, 309
	warp_def 2, 12, 3, 1, 310
	warp_def 2, 17, 3, 2, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_8F_MapBGEvents:
	bg_event 6, 10, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 6, 11, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 5, 11, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 5, 10, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 29, 10, 0, 7, 0, 110, 141, 1
	bg_event 27, 1, 0, 0, 0, SilphCo_8F_EventScript_161C90

SilphCo_8F_MapEvents::
	map_events SilphCo_8F_EventObjects, SilphCo_8F_MapWarps, 0x0, SilphCo_8F_MapBGEvents
