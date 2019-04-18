SilphCo_2F_EventObjects:
	object_event 1, 49, 0, 29, 0, 12, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_2F_EventScript_1616AE, 83, 0, 0
	object_event 2, 55, 0, 28, 0, 18, 0, 3, 15, 17, 0, 1, 0, 4, 0, SilphCo_2F_EventScript_161680, 83, 0, 0
	object_event 3, 49, 0, 20, 0, 14, 0, 3, 13, 17, 0, 1, 0, 3, 0, SilphCo_2F_EventScript_161697, 83, 0, 0
	object_event 4, 55, 0, 5, 0, 19, 0, 3, 1, 17, 0, 1, 0, 0, 0, SilphCo_2F_EventScript_161669, 83, 0, 0
	object_event 5, 28, 0, 10, 0, 4, 0, 0, 7, 17, 0, 0, 0, 0, 0, SilphCo_2F_EventScript_16165A, 0, 0, 0

SilphCo_2F_MapWarps:
	warp_def 28, 2, 3, 0, 305
	warp_def 2, 6, 3, 8, 305
	warp_def 15, 6, 3, 5, 310
	warp_def 30, 2, 3, 3, 303
	warp_def 7, 19, 3, 1, 308
	warp_def 33, 19, 3, 2, 310
	warp_def 22, 3, 0, 0, 314

SilphCo_2F_MapBGEvents:
	bg_event 5, 8, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 6, 8, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 5, 9, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 6, 9, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 5, 15, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 6, 15, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 5, 16, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 6, 16, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 11, 21, 0, 7, 0, 2, 135, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_2F_EventScript_161660

SilphCo_2F_MapEvents::
	map_events SilphCo_2F_EventObjects, SilphCo_2F_MapWarps, 0x0, SilphCo_2F_MapBGEvents
