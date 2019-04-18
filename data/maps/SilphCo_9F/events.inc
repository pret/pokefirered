SilphCo_9F_EventObjects:
	object_event 1, 55, 0, 26, 0, 16, 0, 3, 3, 17, 0, 1, 0, 2, 0, SilphCo_9F_EventScript_161D41, 83, 0, 0
	object_event 2, 49, 0, 15, 0, 18, 0, 3, 7, 17, 0, 1, 0, 3, 0, SilphCo_9F_EventScript_161D6F, 83, 0, 0
	object_event 3, 28, 0, 2, 0, 16, 0, 0, 8, 17, 0, 0, 0, 0, 0, SilphCo_9F_EventScript_161D09, 0, 0, 0
	object_event 4, 49, 0, 1, 0, 6, 0, 3, 8, 17, 0, 1, 0, 5, 0, SilphCo_9F_EventScript_161D58, 83, 0, 0

SilphCo_9F_MapWarps:
	warp_def 16, 2, 0, 0, 310
	warp_def 22, 18, 3, 3, 307
	warp_def 9, 4, 3, 4, 305
	warp_def 18, 2, 3, 3, 312
	warp_def 24, 3, 0, 0, 314

SilphCo_9F_MapBGEvents:
	bg_event 11, 14, 3, 7, 0, 20, 25, 1
	bg_event 3, 10, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 3, 11, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 13, 16, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 13, 17, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 21, 6, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 22, 6, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 22, 7, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 21, 7, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 21, 13, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 21, 12, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 22, 12, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 22, 13, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 2, 11, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 2, 10, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 12, 16, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 12, 17, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 5, 8, 0, 7, 0, 67, 142, 1
	bg_event 17, 1, 0, 0, 0, SilphCo_9F_EventScript_161D38

SilphCo_9F_MapEvents::
	map_events SilphCo_9F_EventObjects, SilphCo_9F_MapWarps, 0x0, SilphCo_9F_MapBGEvents
