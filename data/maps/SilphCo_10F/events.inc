SilphCo_10F_EventObjects:
	object_event 1, 55, 0, 2, 0, 7, 0, 3, 2, 34, 0, 1, 0, 1, 0, SilphCo_10F_EventScript_161DC0, 83, 0, 0
	object_event 2, 48, 0, 10, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_161D96, 0, 0, 0
	object_event 3, 49, 0, 0, 0, 13, 0, 3, 10, 17, 0, 1, 0, 4, 0, SilphCo_10F_EventScript_161DD7, 83, 0, 0
	object_event 4, 92, 0, 5, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE8F5, 407, 0, 0
	object_event 5, 92, 0, 2, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE902, 408, 0, 0
	object_event 6, 92, 0, 3, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE90F, 409, 0, 0

SilphCo_10F_MapWarps:
	warp_def 6, 2, 3, 0, 313
	warp_def 10, 14, 3, 3, 306
	warp_def 14, 9, 3, 5, 306
	warp_def 8, 2, 3, 3, 311
	warp_def 14, 17, 3, 4, 306
	warp_def 13, 3, 0, 0, 314

SilphCo_10F_MapBGEvents:
	bg_event 12, 11, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 13, 11, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 12, 12, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 13, 12, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 9, 9, 0, 7, 0, 63, 143, 1
	bg_event 7, 1, 0, 0, 0, SilphCo_10F_EventScript_161DB7

SilphCo_10F_MapEvents::
	map_events SilphCo_10F_EventObjects, SilphCo_10F_MapWarps, 0x0, SilphCo_10F_MapBGEvents
