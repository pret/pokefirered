FiveIsland_EventObjects:
	object_event 1, 57, 0, 8, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, FiveIsland_EventScript_167EAA, 0, 0, 0
	object_event 2, 20, 0, 16, 0, 10, 0, 3, 2, 17, 0, 0, 0, 0, 0, FiveIsland_EventScript_167EA1, 0, 0, 0
	object_event 3, 65375, 0, 32, 0, 9, 0, 4, 0, 0, 0, 56, 0, 3, 0, 0x0, 0, 0, 0

FiveIsland_MapWarps:
	warp_def 12, 14, 3, 0, 9218
	warp_def 18, 6, 0, 0, 9216
	warp_def 12, 6, 0, 0, 9219
	warp_def 22, 9, 0, 0, 9220

FiveIsland_MapBGEvents:
	bg_event 20, 8, 0, 0, 0, FiveIsland_EventScript_167E98

FiveIsland_MapEvents::
	map_events FiveIsland_EventObjects, FiveIsland_MapWarps, 0x0, FiveIsland_MapBGEvents
