FiveIsland_ResortGorgeous_EventObjects:
	object_event 1, 22, 0, 44, 0, 10, 0, 3, 18, 17, 0, 1, 0, 3, 0, FiveIsland_ResortGorgeous_EventScript_1AC127, 0, 0, 0
	object_event 2, 22, 0, 33, 0, 12, 0, 3, 7, 17, 0, 1, 0, 4, 0, FiveIsland_ResortGorgeous_EventScript_1AC165, 0, 0, 0
	object_event 3, 22, 0, 12, 0, 10, 0, 3, 8, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC1A3, 0, 0, 0
	object_event 4, 28, 0, 23, 0, 9, 0, 3, 2, 18, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC1E1, 0, 0, 0
	object_event 5, 28, 0, 33, 0, 8, 0, 3, 8, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC21F, 0, 0, 0
	object_event 6, 18, 0, 33, 0, 3, 0, 3, 46, 26, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC25D, 0, 0, 0
	object_event 7, 43, 0, 56, 0, 7, 0, 1, 1, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC29B, 0, 0, 0
	object_event 8, 28, 0, 39, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 148, 0, 0

FiveIsland_ResortGorgeous_MapWarps:
	warp_def 64, 13, 3, 0, 524
	warp_def 39, 8, 0, 0, 9984

FiveIsland_ResortGorgeous_MapBGEvents:
	bg_event 10, 7, 3, 7, 0, 8, 174, 1
	bg_event 27, 11, 3, 7, 0, 108, 175, 1
	bg_event 40, 12, 3, 7, 0, 109, 176, 1
	bg_event 27, 5, 3, 7, 0, 108, 177, 1
	bg_event 42, 9, 0, 0, 0, FiveIsland_ResortGorgeous_EventScript_168844

FiveIsland_ResortGorgeous_MapEvents::
	map_events FiveIsland_ResortGorgeous_EventObjects, FiveIsland_ResortGorgeous_MapWarps, 0x0, FiveIsland_ResortGorgeous_MapBGEvents
