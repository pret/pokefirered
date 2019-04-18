SilphCo_3F_EventObjects:
	object_event 1, 49, 0, 25, 0, 9, 0, 3, 9, 17, 0, 1, 0, 3, 0, SilphCo_3F_EventScript_16171F, 83, 0, 0
	object_event 2, 47, 0, 31, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_3F_EventScript_1616DE, 0, 0, 0
	object_event 3, 55, 0, 4, 0, 12, 0, 3, 1, 17, 0, 1, 0, 0, 0, SilphCo_3F_EventScript_161708, 83, 0, 0
	object_event 4, 92, 0, 8, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_3F_EventScript_1BE866, 396, 0, 0

SilphCo_3F_MapWarps:
	warp_def 28, 2, 3, 0, 304
	warp_def 4, 6, 3, 1, 307
	warp_def 13, 14, 3, 4, 309
	warp_def 30, 2, 3, 2, 306
	warp_def 2, 14, 3, 2, 311
	warp_def 3, 20, 3, 4, 307
	warp_def 29, 14, 3, 7, 305
	warp_def 32, 20, 3, 6, 305
	warp_def 33, 5, 3, 1, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_3F_MapBGEvents:
	bg_event 10, 12, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 10, 13, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 21, 12, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 21, 13, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 9, 12, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 9, 13, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 20, 12, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 20, 13, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 34, 18, 0, 7, 0, 64, 136, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_3F_EventScript_1616FF

SilphCo_3F_MapEvents::
	map_events SilphCo_3F_EventObjects, SilphCo_3F_MapWarps, 0x0, SilphCo_3F_MapBGEvents
