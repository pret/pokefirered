ThreeIsland_BerryForest_EventObjects:
	object_event 1, 17, 0, 4, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163C83, 122, 0, 0
	object_event 2, 95, 0, 12, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 18, 0, 0
	object_event 3, 95, 0, 19, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 19, 0, 0
	object_event 4, 95, 0, 23, 0, 17, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 20, 0, 0
	object_event 5, 95, 0, 38, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 21, 0, 0
	object_event 6, 95, 0, 44, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 22, 0, 0
	object_event 7, 95, 0, 44, 0, 29, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 23, 0, 0
	object_event 8, 95, 0, 16, 0, 43, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 24, 0, 0
	object_event 9, 95, 0, 17, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 25, 0, 0
	object_event 10, 95, 0, 14, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 26, 0, 0
	object_event 11, 95, 0, 11, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 27, 0, 0
	object_event 12, 92, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED05, 490, 0, 0
	object_event 13, 92, 0, 27, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED12, 491, 0, 0
	object_event 14, 92, 0, 12, 0, 43, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED1F, 492, 0, 0

ThreeIsland_BerryForest_MapWarps:
	warp_def 43, 41, 3, 0, 816
	warp_def 42, 41, 3, 0, 816
	warp_def 44, 41, 3, 1, 816

ThreeIsland_BerryForest_MapBGEvents:
	bg_event 7, 27, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163D31
	bg_event 39, 35, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163D28
	bg_event 31, 25, 3, 7, 0, 148, 90, 1
	bg_event 15, 15, 3, 7, 0, 149, 91, 1
	bg_event 25, 24, 3, 7, 0, 150, 92, 1
	bg_event 11, 24, 3, 7, 0, 151, 93, 1
	bg_event 37, 18, 3, 7, 0, 139, 94, 1
	bg_event 14, 23, 3, 7, 0, 133, 95, 1
	bg_event 47, 5, 3, 7, 0, 134, 96, 1
	bg_event 7, 30, 3, 7, 0, 135, 97, 1
	bg_event 16, 5, 3, 7, 0, 136, 98, 1
	bg_event 25, 6, 3, 7, 0, 137, 99, 1
	bg_event 46, 32, 3, 7, 0, 140, 100, 1
	bg_event 43, 16, 3, 7, 0, 152, 101, 1
	bg_event 8, 5, 3, 7, 0, 141, 102, 1

ThreeIsland_BerryForest_MapEvents::
	map_events ThreeIsland_BerryForest_EventObjects, ThreeIsland_BerryForest_MapWarps, 0x0, ThreeIsland_BerryForest_MapBGEvents
