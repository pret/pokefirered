SSAnne_Exterior_EventObjects:
	object_event 1, 151, 0, 30, 0, 16, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 135, 0, 0

SSAnne_Exterior_MapWarps:
	warp_def 31, 5, 0, 0, 773
	warp_def 32, 5, 3, 1, 773
	warp_def 32, 14, 3, 2, 261
	warp_def 33, 15, 0, 3, 261
	warp_def 33, 5, 0, 2, 773

SSAnne_Exterior_MapBGEvents:
	bg_event 58, 28, 3, 7, 0, 38, 190, 1

SSAnne_Exterior_MapEvents::
	map_events SSAnne_Exterior_EventObjects, SSAnne_Exterior_MapWarps, 0x0, SSAnne_Exterior_MapBGEvents
