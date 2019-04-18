SafariZone_Center_EventObjects:
	object_event 1, 92, 0, 24, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_Center_EventScript_1BE7D7, 385, 0, 0

SafariZone_Center_MapWarps:
	warp_def 25, 30, 3, 0, 2816
	warp_def 26, 30, 3, 0, 2816
	warp_def 27, 30, 3, 0, 2816
	warp_def 25, 5, 3, 9, 321
	warp_def 26, 5, 3, 10, 321
	warp_def 27, 5, 0, 11, 321
	warp_def 8, 17, 3, 6, 322
	warp_def 8, 18, 3, 7, 322
	warp_def 8, 19, 0, 8, 322
	warp_def 43, 15, 3, 3, 320
	warp_def 43, 16, 3, 4, 320
	warp_def 43, 17, 0, 5, 320
	warp_def 29, 25, 0, 1, 323

SafariZone_Center_MapBGEvents:
	bg_event 30, 26, 0, 0, 0, SafariZone_Center_EventScript_162361
	bg_event 25, 27, 0, 0, 0, SafariZone_Center_EventScript_16236A
	bg_event 27, 15, 3, 7, 0, 98, 22, 1
	bg_event 33, 20, 0, 0, 0, SafariZone_Center_EventScript_162373

SafariZone_Center_MapEvents::
	map_events SafariZone_Center_EventObjects, SafariZone_Center_MapWarps, 0x0, SafariZone_Center_MapBGEvents
