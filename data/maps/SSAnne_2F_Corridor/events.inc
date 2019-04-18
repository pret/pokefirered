SSAnne_2F_Corridor_EventObjects:
	object_event 1, 72, 0, 30, 0, 2, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 61, 0, 0
	object_event 2, 62, 0, 2, 0, 7, 0, 3, 3, 33, 0, 0, 0, 0, 0, SSAnne_2F_Corridor_EventScript_160A54, 0, 0, 0

SSAnne_2F_Corridor_MapWarps:
	warp_def 2, 2, 3, 0, 261
	warp_def 3, 12, 3, 1, 263
	warp_def 30, 2, 3, 0, 267
	warp_def 6, 10, 0, 0, 274
	warp_def 10, 10, 0, 0, 275
	warp_def 14, 10, 0, 0, 276
	warp_def 18, 10, 0, 0, 277
	warp_def 22, 10, 0, 0, 278
	warp_def 26, 10, 0, 0, 279

SSAnne_2F_Corridor_MapCoordEvents:
	coord_event 30, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608DF
	coord_event 31, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608EB
	coord_event 32, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608F7

SSAnne_2F_Corridor_MapEvents::
	map_events SSAnne_2F_Corridor_EventObjects, SSAnne_2F_Corridor_MapWarps, SSAnne_2F_Corridor_MapCoordEvents, 0x0
