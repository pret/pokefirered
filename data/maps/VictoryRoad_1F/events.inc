VictoryRoad_1F_EventObjects:
	object_event 1, 41, 0, 5, 0, 2, 0, 3, 8, 17, 0, 1, 0, 4, 0, VictoryRoad_1F_EventScript_160F7B, 0, 0, 0
	object_event 2, 42, 0, 14, 0, 6, 0, 4, 8, 17, 0, 1, 0, 4, 0, VictoryRoad_1F_EventScript_160F64, 0, 0, 0
	object_event 3, 92, 0, 12, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE9D2, 425, 0, 0
	object_event 4, 92, 0, 14, 0, 1, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE9DF, 426, 0, 0
	object_event 5, 97, 0, 7, 0, 18, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0
	object_event 6, 97, 0, 4, 0, 12, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0
	object_event 7, 97, 0, 16, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0

VictoryRoad_1F_MapWarps:
	warp_def 3, 2, 3, 0, 296
	warp_def 11, 20, 3, 0, 810

VictoryRoad_1F_MapCoordEvents:
	coord_event 20, 16, 3, 0, 16484, 99, 0, VictoryRoad_1F_EventScript_160F33

VictoryRoad_1F_MapBGEvents:
	bg_event 12, 12, 0, 7, 0, 2, 37, 1
	bg_event 16, 1, 0, 7, 0, 19, 38, 1

VictoryRoad_1F_MapEvents::
	map_events VictoryRoad_1F_EventObjects, VictoryRoad_1F_MapWarps, VictoryRoad_1F_MapCoordEvents, VictoryRoad_1F_MapBGEvents
