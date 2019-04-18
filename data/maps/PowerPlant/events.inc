PowerPlant_EventObjects:
	object_event 1, 92, 0, 7, 0, 27, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE91C, 410, 0, 0
	object_event 2, 92, 0, 40, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE929, 411, 0, 0
	object_event 3, 92, 0, 46, 0, 37, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE936, 412, 0, 0
	object_event 4, 92, 0, 45, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE943, 413, 0, 0
	object_event 5, 92, 0, 26, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE950, 414, 0, 0
	object_event 6, 136, 0, 5, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1637B8, 93, 0, 0
	object_event 7, 92, 0, 36, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_16388D, 134, 0, 0
	object_event 8, 92, 0, 30, 0, 38, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_16382F, 133, 0, 0

PowerPlant_MapWarps:
	warp_def 4, 39, 3, 2, 796
	warp_def 5, 38, 3, 2, 796
	warp_def 6, 39, 3, 2, 796
	warp_def 1, 11, 3, 4, 796
	warp_def 0, 13, 3, 2, 796

PowerPlant_MapBGEvents:
	bg_event 29, 16, 3, 7, 0, 37, 27, 1
	bg_event 8, 12, 3, 7, 0, 96, 28, 1

PowerPlant_MapEvents::
	map_events PowerPlant_EventObjects, PowerPlant_MapWarps, 0x0, PowerPlant_MapBGEvents
