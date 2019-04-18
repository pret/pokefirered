SilphCo_4F_EventObjects:
	object_event 1, 49, 0, 33, 0, 16, 0, 3, 2, 17, 0, 1, 0, 1, 0, SilphCo_4F_EventScript_1617A7, 83, 0, 0
	object_event 2, 49, 0, 10, 0, 19, 0, 3, 10, 17, 0, 1, 0, 5, 0, SilphCo_4F_EventScript_161790, 83, 0, 0
	object_event 3, 55, 0, 14, 0, 8, 0, 3, 17, 17, 0, 1, 0, 2, 0, SilphCo_4F_EventScript_161779, 83, 0, 0
	object_event 4, 47, 0, 5, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_16174F, 0, 0, 0
	object_event 5, 92, 0, 3, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE873, 397, 0, 0
	object_event 6, 92, 0, 4, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE880, 398, 0, 0
	object_event 7, 92, 0, 2, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE88D, 399, 0, 0
	object_event 8, 92, 0, 30, 0, 18, 0, 0, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BEE09, 510, 0, 0

SilphCo_4F_MapWarps:
	warp_def 28, 2, 3, 0, 307
	warp_def 18, 6, 3, 3, 308
	warp_def 30, 2, 3, 3, 305
	warp_def 12, 9, 3, 1, 312
	warp_def 2, 20, 3, 4, 312
	warp_def 18, 14, 3, 2, 312
	warp_def 22, 3, 0, 0, 314

SilphCo_4F_MapBGEvents:
	bg_event 3, 16, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 4, 16, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 3, 17, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 4, 17, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 15, 11, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 14, 11, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 14, 12, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 15, 12, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 35, 20, 0, 7, 0, 65, 137, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_4F_EventScript_161770

SilphCo_4F_MapEvents::
	map_events SilphCo_4F_EventObjects, SilphCo_4F_MapWarps, 0x0, SilphCo_4F_MapBGEvents
