SilphCo_11F_EventObjects:
	object_event 1, 33, 0, 9, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_161DFE, 0, 0, 0
	object_event 2, 48, 0, 11, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_161E7F, 0, 0, 0
	object_event 3, 87, 0, 6, 0, 11, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 83, 0, 0
	object_event 4, 49, 0, 16, 0, 12, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_11F_EventScript_161F40, 83, 0, 0
	object_event 5, 92, 0, 16, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_1BEB58, 457, 0, 0
	object_event 6, 49, 0, 2, 0, 19, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_11F_EventScript_161F57, 83, 0, 0

SilphCo_11F_MapWarps:
	warp_def 7, 2, 3, 0, 312
	warp_def 2, 5, 3, 1, 309
	warp_def 13, 3, 0, 0, 314

SilphCo_11F_MapCoordEvents:
	coord_event 5, 15, 3, 0, 16480, 0, 0, SilphCo_11F_EventScript_161E88
	coord_event 6, 15, 3, 0, 16480, 0, 0, SilphCo_11F_EventScript_161E94

SilphCo_11F_MapBGEvents:
	bg_event 5, 16, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 5, 17, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 6, 16, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 6, 17, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 10, 18, 0, 7, 0, 24, 144, 1
	bg_event 8, 1, 0, 0, 0, SilphCo_11F_EventScript_161F37

SilphCo_11F_MapEvents::
	map_events SilphCo_11F_EventObjects, SilphCo_11F_MapWarps, SilphCo_11F_MapCoordEvents, SilphCo_11F_MapBGEvents
