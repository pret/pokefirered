SafariZone_North_EventObjects:
	object_event 1, 92, 0, 33, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BE818, 390, 0, 0
	object_event 2, 92, 0, 28, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BE825, 391, 0, 0
	object_event 3, 92, 0, 29, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BEBDA, 467, 0, 0

SafariZone_North_MapWarps:
	warp_def 10, 34, 3, 0, 322
	warp_def 11, 34, 3, 1, 322
	warp_def 12, 34, 0, 2, 322
	warp_def 20, 34, 3, 3, 322
	warp_def 21, 34, 3, 4, 322
	warp_def 22, 34, 0, 5, 322
	warp_def 48, 31, 3, 0, 320
	warp_def 48, 32, 3, 1, 320
	warp_def 48, 33, 0, 2, 320
	warp_def 30, 34, 3, 3, 319
	warp_def 31, 34, 3, 4, 319
	warp_def 32, 34, 0, 5, 319
	warp_def 43, 8, 0, 1, 325

SafariZone_North_MapBGEvents:
	bg_event 13, 27, 0, 0, 0, SafariZone_North_EventScript_1623A2
	bg_event 23, 31, 0, 0, 0, SafariZone_North_EventScript_1623AB
	bg_event 29, 32, 0, 0, 0, SafariZone_North_EventScript_1623B4
	bg_event 34, 28, 0, 0, 0, SafariZone_North_EventScript_1623BD
	bg_event 44, 9, 0, 0, 0, SafariZone_North_EventScript_162399

SafariZone_North_MapEvents::
	map_events SafariZone_North_EventObjects, SafariZone_North_MapWarps, 0x0, SafariZone_North_MapBGEvents
