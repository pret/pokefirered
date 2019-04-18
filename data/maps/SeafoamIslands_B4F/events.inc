SeafoamIslands_B4F_EventObjects:
	object_event 1, 97, 0, 8, 0, 18, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 76, 0, 0
	object_event 2, 97, 0, 9, 0, 18, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 77, 0, 0
	object_event 3, 138, 0, 9, 0, 2, 0, 4, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B4F_EventScript_1631AC, 130, 0, 0
	object_event 4, 92, 0, 22, 0, 19, 0, 4, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B4F_EventScript_1BEC1B, 472, 0, 0

SeafoamIslands_B4F_MapWarps:
	warp_def 15, 9, 4, 3, 342
	warp_def 32, 5, 4, 4, 342
	warp_def 8, 17, 1, 7, 342
	warp_def 9, 17, 1, 8, 342

SeafoamIslands_B4F_MapCoordEvents:
	coord_event 26, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D
	coord_event 27, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D
	coord_event 28, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D

SeafoamIslands_B4F_MapBGEvents:
	bg_event 13, 8, 0, 7, 0, 97, 30, 1
	bg_event 30, 2, 0, 0, 0, SeafoamIslands_B4F_EventScript_16322C
	bg_event 14, 18, 0, 0, 0, SeafoamIslands_B4F_EventScript_163223

SeafoamIslands_B4F_MapEvents::
	map_events SeafoamIslands_B4F_EventObjects, SeafoamIslands_B4F_MapWarps, SeafoamIslands_B4F_MapCoordEvents, SeafoamIslands_B4F_MapBGEvents
