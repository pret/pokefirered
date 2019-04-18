SilphCo_6F_EventObjects:
	object_event 1, 49, 0, 21, 0, 5, 0, 3, 10, 17, 0, 1, 0, 2, 0, SilphCo_6F_EventScript_161956, 83, 0, 0
	object_event 2, 47, 0, 23, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618D3, 0, 0, 0
	object_event 3, 48, 0, 24, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618F4, 0, 0, 0
	object_event 4, 47, 0, 22, 0, 13, 0, 3, 7, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_161891, 0, 0, 0
	object_event 5, 47, 0, 14, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618B2, 0, 0, 0
	object_event 6, 48, 0, 16, 0, 12, 0, 3, 10, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_161915, 0, 0, 0
	object_event 7, 55, 0, 9, 0, 11, 0, 3, 8, 17, 0, 1, 0, 4, 0, SilphCo_6F_EventScript_16193F, 83, 0, 0
	object_event 8, 92, 0, 2, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1BE8C1, 403, 0, 0
	object_event 9, 92, 0, 1, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1BE8CE, 404, 0, 0
	object_event 10, 49, 0, 18, 0, 17, 0, 3, 9, 17, 0, 1, 0, 2, 0, SilphCo_6F_EventScript_16196D, 83, 0, 0

SilphCo_6F_MapWarps:
	warp_def 14, 2, 3, 0, 309
	warp_def 29, 5, 3, 4, 304
	warp_def 26, 2, 3, 2, 307
	warp_def 2, 6, 3, 1, 306
	warp_def 20, 3, 0, 0, 314

SilphCo_6F_MapBGEvents:
	bg_event 6, 15, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 6, 16, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 5, 15, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 5, 16, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 1, 8, 0, 7, 0, 66, 139, 1
	bg_event 25, 1, 0, 0, 0, SilphCo_6F_EventScript_161936

SilphCo_6F_MapEvents::
	map_events SilphCo_6F_EventObjects, SilphCo_6F_MapWarps, 0x0, SilphCo_6F_MapBGEvents
