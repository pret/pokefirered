ThreeIsland_BondBridge_EventObjects:
	object_event 1, 28, 0, 27, 0, 10, 0, 3, 2, 17, 0, 1, 0, 5, 0, ThreeIsland_BondBridge_EventScript_1ABF65, 0, 0, 0
	object_event 2, 28, 0, 68, 0, 10, 0, 3, 9, 17, 0, 1, 0, 2, 0, ThreeIsland_BondBridge_EventScript_1ABFA3, 0, 0, 0
	object_event 3, 37, 0, 33, 0, 13, 0, 3, 10, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1ABFE1, 0, 0, 0
	object_event 4, 37, 0, 50, 0, 11, 0, 3, 27, 18, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC01F, 0, 0, 0
	object_event 5, 44, 0, 36, 0, 4, 0, 1, 1, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC05D, 0, 0, 0
	object_event 6, 17, 0, 77, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC09B, 0, 0, 0
	object_event 7, 17, 0, 78, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC0E1, 0, 0, 0
	object_event 8, 95, 0, 72, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BondBridge_EventScript_1BDF13, 18, 0, 0
	object_event 9, 95, 0, 86, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BondBridge_EventScript_1BDF13, 19, 0, 0

ThreeIsland_BondBridge_MapWarps:
	warp_def 12, 6, 3, 0, 365
	warp_def 13, 6, 3, 0, 365

ThreeIsland_BondBridge_MapBGEvents:
	bg_event 14, 7, 0, 0, 0, ThreeIsland_BondBridge_EventScript_168777
	bg_event 61, 5, 0, 7, 0, 84, 165, 1
	bg_event 44, 12, 3, 7, 0, 106, 166, 1
	bg_event 33, 7, 3, 7, 0, 108, 167, 1
	bg_event 91, 9, 0, 0, 0, ThreeIsland_BondBridge_EventScript_168780

ThreeIsland_BondBridge_MapEvents::
	map_events ThreeIsland_BondBridge_EventObjects, ThreeIsland_BondBridge_MapWarps, 0x0, ThreeIsland_BondBridge_MapBGEvents
