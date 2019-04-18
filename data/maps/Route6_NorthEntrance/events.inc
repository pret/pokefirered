Route6_NorthEntrance_EventObjects:
	object_event 1, 60, 0, 7, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route6_NorthEntrance_EventScript_16F9C7, 0, 0, 0

Route6_NorthEntrance_MapWarps:
	warp_def 4, 1, 0, 11, 778
	warp_def 5, 1, 0, 11, 778
	warp_def 4, 9, 3, 1, 792
	warp_def 5, 9, 3, 1, 792

Route6_NorthEntrance_MapCoordEvents:
	coord_event 3, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9D0
	coord_event 4, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9DC
	coord_event 5, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9E8

Route6_NorthEntrance_MapEvents::
	map_events Route6_NorthEntrance_EventObjects, Route6_NorthEntrance_MapWarps, Route6_NorthEntrance_MapCoordEvents, 0x0
