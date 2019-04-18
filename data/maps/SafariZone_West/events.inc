SafariZone_West_EventObjects:
	object_event 1, 92, 0, 28, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE83F, 393, 0, 0
	object_event 2, 92, 0, 17, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE832, 392, 0, 0
	object_event 3, 92, 0, 16, 0, 27, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE84C, 394, 0, 0
	object_event 4, 92, 0, 27, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE859, 395, 0, 0

SafariZone_West_MapWarps:
	warp_def 30, 5, 3, 0, 321
	warp_def 31, 5, 3, 1, 321
	warp_def 32, 5, 0, 2, 321
	warp_def 37, 5, 3, 3, 321
	warp_def 38, 5, 3, 4, 321
	warp_def 39, 5, 0, 5, 321
	warp_def 40, 26, 3, 6, 319
	warp_def 40, 27, 3, 7, 319
	warp_def 40, 28, 0, 8, 319
	warp_def 12, 7, 0, 1, 327
	warp_def 19, 18, 0, 1, 326

SafariZone_West_MapBGEvents:
	bg_event 27, 9, 0, 0, 0, SafariZone_West_EventScript_1623D0
	bg_event 36, 10, 0, 0, 0, SafariZone_West_EventScript_1623D9
	bg_event 35, 26, 0, 0, 0, SafariZone_West_EventScript_1623E2
	bg_event 22, 19, 0, 0, 0, SafariZone_West_EventScript_1623C7
	bg_event 13, 11, 3, 7, 0, 24, 23, 1

SafariZone_West_MapEvents::
	map_events SafariZone_West_EventObjects, SafariZone_West_MapWarps, 0x0, SafariZone_West_MapBGEvents
