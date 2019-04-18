Route18_EastEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route18_EastEntrance_1F_EventScript_170391, 0, 0, 0

Route18_EastEntrance_1F_MapWarps:
	warp_def 1, 6, 3, 0, 804
	warp_def 11, 6, 3, 1, 804
	warp_def 9, 10, 3, 0, 6657

Route18_EastEntrance_1F_MapCoordEvents:
	coord_event 2, 6, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1
	coord_event 6, 4, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_17039A
	coord_event 6, 5, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703A6
	coord_event 6, 6, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703B2
	coord_event 6, 7, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703BE
	coord_event 6, 8, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703CA
	coord_event 10, 6, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 11, 5, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 11, 7, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 1, 5, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1
	coord_event 1, 7, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1

Route18_EastEntrance_1F_MapEvents::
	map_events Route18_EastEntrance_1F_EventObjects, Route18_EastEntrance_1F_MapWarps, Route18_EastEntrance_1F_MapCoordEvents, 0x0
