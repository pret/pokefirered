SeafoamIslands_B3F_EventObjects:
	object_event 1, 97, 0, 23, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 70, 0, 0
	object_event 2, 97, 0, 24, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 71, 0, 0
	object_event 3, 97, 0, 12, 0, 16, 0, 3, 8, 0, 0, 77, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 74, 0, 0
	object_event 4, 97, 0, 13, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 75, 0, 0
	object_event 5, 97, 0, 9, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 73, 0, 0
	object_event 6, 97, 0, 6, 0, 17, 0, 3, 8, 0, 0, 76, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 72, 0, 0

SeafoamIslands_B3F_MapWarps:
	warp_def 8, 14, 4, 0, 341
	warp_def 31, 4, 3, 1, 341
	warp_def 31, 16, 4, 2, 341
	warp_def 12, 9, 3, 0, 343
	warp_def 29, 5, 3, 1, 343
	warp_def 23, 9, 1, 7, 341
	warp_def 24, 9, 1, 8, 341
	warp_def 6, 18, 3, 2, 343
	warp_def 9, 18, 3, 3, 343

SeafoamIslands_B3F_MapBGEvents:
	bg_event 5, 12, 0, 7, 0, 110, 29, 1

SeafoamIslands_B3F_MapEvents::
	map_events SeafoamIslands_B3F_EventObjects, SeafoamIslands_B3F_MapWarps, 0x0, SeafoamIslands_B3F_MapBGEvents
