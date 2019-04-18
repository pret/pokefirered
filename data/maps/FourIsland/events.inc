FourIsland_EventObjects:
	object_event 1, 32, 0, 16, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167D55, 0, 0, 0
	object_event 2, 132, 0, 12, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 3, 122, 0, 13, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 4, 123, 0, 14, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 5, 121, 0, 17, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 6, 35, 0, 26, 0, 19, 0, 3, 9, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E2E, 0, 0, 0
	object_event 7, 96, 0, 5, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BE00C, 18, 0, 0
	object_event 8, 92, 0, 5, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BEC28, 473, 0, 0
	object_event 9, 92, 0, 32, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BEC35, 474, 0, 0
	object_event 10, 72, 0, 8, 0, 25, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 151, 0, 0
	object_event 11, 27, 0, 36, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E73, 0, 0, 0
	object_event 12, 17, 0, 31, 0, 21, 0, 3, 10, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E5A, 0, 0, 0

FourIsland_MapWarps:
	warp_def 18, 20, 0, 0, 8961
	warp_def 12, 13, 0, 0, 8960
	warp_def 25, 14, 0, 0, 8963
	warp_def 38, 12, 0, 0, 366
	warp_def 33, 23, 0, 0, 8964
	warp_def 25, 26, 0, 0, 8966
	warp_def 10, 28, 3, 0, 8965
	warp_def 22, 26, 0, 0, 8967

FourIsland_MapBGEvents:
	bg_event 13, 19, 0, 0, 0, FourIsland_EventScript_167E7C
	bg_event 22, 34, 3, 7, 0, 106, 168, 1
	bg_event 6, 21, 3, 7, 0, 2, 169, 1
	bg_event 31, 23, 0, 0, 0, FourIsland_EventScript_167E85

FourIsland_MapEvents::
	map_events FourIsland_EventObjects, FourIsland_MapWarps, 0x0, FourIsland_MapBGEvents
