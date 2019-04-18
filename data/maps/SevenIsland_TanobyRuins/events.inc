SevenIsland_TanobyRuins_EventObjects:
	object_event 1, 56, 0, 35, 0, 7, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACC4D, 0, 0, 0
	object_event 2, 56, 0, 121, 0, 11, 0, 3, 1, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACC8B, 0, 0, 0
	object_event 3, 22, 0, 85, 0, 8, 0, 3, 10, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACCC9, 0, 0, 0
	object_event 4, 61, 0, 85, 0, 5, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACD07, 0, 0, 0

SevenIsland_TanobyRuins_MapWarps:
	warp_def 120, 10, 3, 0, 539
	warp_def 103, 10, 3, 0, 540
	warp_def 88, 8, 3, 0, 541
	warp_def 44, 11, 3, 0, 542
	warp_def 32, 9, 3, 0, 543
	warp_def 12, 15, 3, 0, 544
	warp_def 11, 6, 3, 0, 545

SevenIsland_TanobyRuins_MapBGEvents:
	bg_event 33, 10, 3, 7, 0, 111, 65, 1
	bg_event 86, 9, 3, 7, 0, 111, 66, 1
	bg_event 125, 5, 3, 7, 0, 111, 67, 1
	bg_event 8, 2, 3, 7, 0, 111, 64, 1

SevenIsland_TanobyRuins_MapEvents::
	map_events SevenIsland_TanobyRuins_EventObjects, SevenIsland_TanobyRuins_MapWarps, 0x0, SevenIsland_TanobyRuins_MapBGEvents
