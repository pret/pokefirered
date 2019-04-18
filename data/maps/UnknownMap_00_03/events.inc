UnknownMap_00_03_MapWarps:
	warp_def 5, 8, 3, 127, 32639
	warp_def 6, 8, 3, 127, 32639
	warp_def 7, 8, 3, 127, 32639
	warp_def 8, 8, 3, 127, 32639

UnknownMap_00_03_MapCoordEvents:
	coord_event 3, 4, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB8DB
	coord_event 3, 6, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB915
	coord_event 10, 4, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB8F8
	coord_event 10, 6, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB932

UnknownMap_00_03_MapEvents::
	map_events 0x0, UnknownMap_00_03_MapWarps, UnknownMap_00_03_MapCoordEvents, 0x0
