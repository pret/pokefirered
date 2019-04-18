SilphCo_1F_EventObjects:
	object_event 1, 48, 0, 3, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_1F_EventScript_16162F, 63, 0, 0

SilphCo_1F_MapWarps:
	warp_def 7, 21, 0, 0, 778
	warp_def 8, 20, 3, 0, 778
	warp_def 9, 20, 3, 0, 778
	warp_def 31, 2, 3, 3, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_1F_MapBGEvents:
	bg_event 30, 1, 0, 0, 0, SilphCo_1F_EventScript_161638

SilphCo_1F_MapEvents::
	map_events SilphCo_1F_EventObjects, SilphCo_1F_MapWarps, 0x0, SilphCo_1F_MapBGEvents
