Route22_NorthEntrance_EventObjects:
	object_event 1, 60, 0, 8, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route22_NorthEntrance_EventScript_1704FC, 0, 0, 0

Route22_NorthEntrance_MapWarps:
	warp_def 7, 1, 3, 2, 810
	warp_def 6, 10, 3, 0, 809
	warp_def 7, 10, 3, 0, 809
	warp_def 8, 10, 3, 0, 809

Route22_NorthEntrance_MapCoordEvents:
	coord_event 7, 2, 3, 0, 16479, 0, 0, Route22_NorthEntrance_EventScript_17050D

Route22_NorthEntrance_MapEvents::
	map_events Route22_NorthEntrance_EventObjects, Route22_NorthEntrance_MapWarps, Route22_NorthEntrance_MapCoordEvents, 0x0
