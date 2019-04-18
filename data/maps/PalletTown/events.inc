PalletTown_EventObjects:
	object_event 1, 23, 0, 3, 0, 10, 0, 3, 2, 65, 0, 0, 0, 0, 0, PalletTown_EventScript_16575C, 0, 0, 0
	object_event 2, 27, 0, 13, 0, 17, 0, 3, 2, 38, 0, 0, 0, 0, 0, PalletTown_EventScript_16582F, 0, 0, 0
	object_event 3, 71, 0, 10, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 44, 0, 0

PalletTown_MapWarps:
	warp_def 6, 7, 0, 1, 1024
	warp_def 15, 7, 0, 0, 1026
	warp_def 16, 13, 0, 0, 1027

PalletTown_MapCoordEvents:
	coord_event 12, 1, 3, 0, 16464, 0, 0, PalletTown_EventScript_1655ED
	coord_event 13, 1, 3, 0, 16464, 0, 0, PalletTown_EventScript_1655F9
	coord_event 13, 2, 3, 0, 16386, 1, 0, PalletTown_EventScript_16587B

PalletTown_MapBGEvents:
	bg_event 16, 16, 0, 0, 0, PalletTown_EventScript_165838
	bg_event 4, 7, 0, 0, 0, PalletTown_EventScript_165850
	bg_event 13, 7, 0, 0, 0, PalletTown_EventScript_165859
	bg_event 9, 11, 0, 0, 0, PalletTown_EventScript_165862
	bg_event 5, 14, 0, 0, 0, PalletTown_EventScript_16586B

PalletTown_MapEvents::
	map_events PalletTown_EventObjects, PalletTown_MapWarps, PalletTown_MapCoordEvents, PalletTown_MapBGEvents
