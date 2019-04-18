FuchsiaCity_SafariZone_Entrance_EventObjects:
	object_event 1, 47, 0, 7, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 47, 0, 1, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D4B7, 0, 0, 0

FuchsiaCity_SafariZone_Entrance_MapWarps:
	warp_def 4, 1, 3, 1, 319
	warp_def 5, 7, 3, 0, 775
	warp_def 4, 7, 3, 0, 775
	warp_def 3, 7, 3, 0, 775

FuchsiaCity_SafariZone_Entrance_MapCoordEvents:
	coord_event 4, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D36D
	coord_event 5, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D379
	coord_event 3, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D385

FuchsiaCity_SafariZone_Entrance_MapEvents::
	map_events FuchsiaCity_SafariZone_Entrance_EventObjects, FuchsiaCity_SafariZone_Entrance_MapWarps, FuchsiaCity_SafariZone_Entrance_MapCoordEvents, 0x0
