Route2_EastBuilding_EventObjects:
	object_event 1, 55, 0, 4, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route2_EastBuilding_EventScript_16F67F, 0, 0, 0
	object_event 2, 26, 0, 10, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route2_EastBuilding_EventScript_16F714, 0, 0, 0

Route2_EastBuilding_MapWarps:
	warp_def 6, 10, 0, 5, 788
	warp_def 7, 10, 3, 5, 788
	warp_def 8, 10, 3, 5, 788
	warp_def 7, 1, 3, 6, 788

Route2_EastBuilding_MapEvents::
	map_events Route2_EastBuilding_EventObjects, Route2_EastBuilding_MapWarps, 0x0, 0x0
