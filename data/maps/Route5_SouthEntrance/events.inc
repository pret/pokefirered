Route5_SouthEntrance_EventObjects:
	object_event 1, 60, 0, 1, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route5_SouthEntrance_EventScript_16F901, 0, 0, 0

Route5_SouthEntrance_MapWarps:
	warp_def 3, 9, 3, 9, 778
	warp_def 4, 1, 3, 2, 791
	warp_def 4, 9, 3, 9, 778
	warp_def 5, 1, 0, 3, 791

Route5_SouthEntrance_MapCoordEvents:
	coord_event 3, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F90A
	coord_event 4, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F916
	coord_event 5, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F922

Route5_SouthEntrance_MapEvents::
	map_events Route5_SouthEntrance_EventObjects, Route5_SouthEntrance_MapWarps, Route5_SouthEntrance_MapCoordEvents, 0x0
