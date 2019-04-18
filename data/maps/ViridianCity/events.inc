ViridianCity_EventObjects:
	object_event 1, 27, 0, 8, 0, 26, 0, 3, 8, 0, 0, 0, 0, 0, 0, ViridianCity_EventScript_165AF0, 0, 0, 0
	object_event 2, 95, 0, 11, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BDF13, 17, 0, 0
	object_event 3, 32, 0, 34, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659CA, 0, 0, 0
	object_event 4, 240, 0, 21, 0, 6, 0, 3, 1, 50, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659F6, 0, 0, 0
	object_event 5, 31, 0, 20, 0, 12, 0, 3, 7, 49, 0, 0, 0, 0, 0, ViridianCity_EventScript_165AC4, 0, 0, 0
	object_event 6, 18, 0, 33, 0, 26, 0, 3, 3, 32, 0, 0, 0, 0, 0, ViridianCity_EventScript_165A8F, 0, 0, 0
	object_event 7, 19, 0, 16, 0, 22, 0, 3, 2, 33, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659C1, 0, 0, 0
	object_event 8, 95, 0, 18, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BDF13, 18, 0, 0
	object_event 9, 92, 0, 17, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BEB8C, 461, 0, 0

ViridianCity_MapWarps:
	warp_def 26, 26, 0, 1, 1284
	warp_def 25, 11, 3, 1, 1280
	warp_def 36, 10, 0, 1, 1281
	warp_def 25, 18, 0, 1, 1282
	warp_def 36, 19, 0, 1, 1283

ViridianCity_MapCoordEvents:
	coord_event 22, 11, 3, 0, 16465, 0, 0, ViridianCity_EventScript_165AF6
	coord_event 36, 11, 3, 0, 16474, 0, 0, ViridianCity_EventScript_16596D
	coord_event 20, 8, 3, 0, 16465, 1, 0, ViridianCity_EventScript_165B10
	coord_event 22, 8, 3, 0, 16465, 1, 0, ViridianCity_EventScript_165B2E

ViridianCity_MapBGEvents:
	bg_event 23, 1, 3, 0, 0, ViridianCity_EventScript_16599D
	bg_event 32, 10, 0, 0, 0, ViridianCity_EventScript_1659AF
	bg_event 20, 31, 0, 0, 0, ViridianCity_EventScript_1659A6
	bg_event 20, 16, 0, 0, 0, ViridianCity_EventScript_165994
	bg_event 36, 10, 0, 0, 0, ViridianCity_EventScript_1659B8

ViridianCity_MapEvents::
	map_events ViridianCity_EventObjects, ViridianCity_MapWarps, ViridianCity_MapCoordEvents, ViridianCity_MapBGEvents
