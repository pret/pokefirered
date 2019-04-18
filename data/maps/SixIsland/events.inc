SixIsland_EventObjects:
	object_event 1, 19, 0, 10, 0, 15, 0, 3, 9, 17, 0, 0, 0, 0, 0, SixIsland_EventScript_167EEB, 0, 0, 0
	object_event 2, 56, 0, 15, 0, 13, 0, 3, 18, 17, 0, 0, 0, 0, 0, SixIsland_EventScript_167EE2, 0, 0, 0

SixIsland_MapWarps:
	warp_def 11, 23, 3, 0, 9474
	warp_def 11, 11, 0, 0, 9472
	warp_def 16, 17, 0, 0, 9475
	warp_def 20, 11, 0, 0, 9476

SixIsland_MapBGEvents:
	bg_event 9, 17, 0, 0, 0, SixIsland_EventScript_167EF4
	bg_event 9, 7, 3, 7, 0, 138, 184, 1

SixIsland_MapEvents::
	map_events SixIsland_EventObjects, SixIsland_MapWarps, 0x0, SixIsland_MapBGEvents
