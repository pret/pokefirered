ThreeIsland_EventObjects:
	object_event 1, 25, 0, 7, 0, 24, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677E5, 126, 0, 0
	object_event 2, 25, 0, 8, 0, 23, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167989, 126, 0, 0
	object_event 3, 53, 0, 8, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 145, 0, 0
	object_event 4, 53, 0, 9, 0, 23, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 5, 53, 0, 9, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 6, 53, 0, 10, 0, 22, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 7, 53, 0, 10, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 8, 53, 0, 11, 0, 23, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 9, 95, 0, 20, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1BDF13, 18, 0, 0
	object_event 10, 92, 0, 18, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1BEABC, 443, 0, 0
	object_event 11, 23, 0, 15, 0, 7, 0, 3, 5, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C77, 0, 0, 0
	object_event 12, 16, 0, 14, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C80, 0, 0, 0
	object_event 13, 132, 0, 15, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C89, 0, 0, 0
	object_event 14, 53, 0, 15, 0, 31, 0, 3, 5, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167CA5, 121, 0, 0

ThreeIsland_MapWarps:
	warp_def 3, 31, 0, 0, 8704
	warp_def 14, 27, 0, 0, 8705
	warp_def 18, 12, 0, 0, 8707
	warp_def 4, 6, 0, 0, 8708
	warp_def 12, 6, 0, 0, 8709
	warp_def 12, 12, 0, 0, 8710
	warp_def 13, 19, 0, 0, 8711

ThreeIsland_MapCoordEvents:
	coord_event 7, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 8, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 9, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 10, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 7, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A1D
	coord_event 8, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A29
	coord_event 9, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A35
	coord_event 11, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 10, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A41
	coord_event 11, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A4D

ThreeIsland_MapBGEvents:
	bg_event 12, 31, 0, 0, 0, ThreeIsland_EventScript_167C9C
	bg_event 5, 13, 3, 7, 0, 69, 164, 1

ThreeIsland_MapEvents::
	map_events ThreeIsland_EventObjects, ThreeIsland_MapWarps, ThreeIsland_MapCoordEvents, ThreeIsland_MapBGEvents
