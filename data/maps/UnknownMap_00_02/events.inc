UnknownMap_00_02_EventObjects:
	object_event 1, 66, 0, 10, 0, 5, 0, 0, 8, 0, 0, 0, 0, 0, 0, UnknownMap_00_02_EventScript_1BB9D3, 0, 0, 0

UnknownMap_00_02_MapWarps:
	warp_def 8, 9, 3, 127, 32639
	warp_def 9, 9, 3, 127, 32639
	warp_def 11, 9, 3, 127, 32639
	warp_def 10, 9, 3, 127, 32639

UnknownMap_00_02_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 6, 6, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 13, 4, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 13, 6, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980

UnknownMap_00_02_MapEvents::
	map_events UnknownMap_00_02_EventObjects, UnknownMap_00_02_MapWarps, UnknownMap_00_02_MapCoordEvents, 0x0
