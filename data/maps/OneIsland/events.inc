OneIsland_EventObjects:
	object_event 1, 73, 0, 12, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 113, 0, 0
	object_event 2, 32, 0, 16, 0, 12, 0, 3, 2, 17, 0, 0, 0, 0, 0, OneIsland_EventScript_167517, 0, 0, 0
	object_event 3, 30, 0, 13, 0, 9, 0, 3, 13, 17, 0, 0, 0, 0, 0, OneIsland_EventScript_167549, 0, 0, 0

OneIsland_MapWarps:
	warp_def 14, 5, 0, 0, 8192
	warp_def 19, 9, 0, 0, 8194
	warp_def 8, 11, 0, 0, 8195
	warp_def 12, 18, 3, 0, 8196

OneIsland_MapBGEvents:
	bg_event 14, 13, 0, 0, 0, OneIsland_EventScript_167552
	bg_event 15, 6, 0, 0, 0, OneIsland_EventScript_16755B

OneIsland_MapEvents::
	map_events OneIsland_EventObjects, OneIsland_MapWarps, 0x0, OneIsland_MapBGEvents
