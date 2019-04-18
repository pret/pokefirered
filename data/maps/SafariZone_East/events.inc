SafariZone_East_EventObjects:
	object_event 1, 92, 0, 13, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7E4, 386, 0, 0
	object_event 2, 92, 0, 37, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7F1, 387, 0, 0
	object_event 3, 92, 0, 31, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7FE, 388, 0, 0
	object_event 4, 92, 0, 36, 0, 17, 0, 4, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE80B, 389, 0, 0

SafariZone_East_MapWarps:
	warp_def 8, 9, 3, 6, 321
	warp_def 8, 10, 3, 7, 321
	warp_def 8, 11, 0, 8, 321
	warp_def 8, 26, 3, 9, 319
	warp_def 8, 27, 3, 10, 319
	warp_def 8, 28, 0, 11, 319
	warp_def 40, 14, 0, 1, 324

SafariZone_East_MapBGEvents:
	bg_event 18, 27, 0, 0, 0, SafariZone_East_EventScript_16238F
	bg_event 43, 15, 0, 0, 0, SafariZone_East_EventScript_16237D
	bg_event 17, 8, 0, 0, 0, SafariZone_East_EventScript_162386

SafariZone_East_MapEvents::
	map_events SafariZone_East_EventObjects, SafariZone_East_MapWarps, 0x0, SafariZone_East_MapBGEvents
