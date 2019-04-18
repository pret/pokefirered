LavenderTown_EventObjects:
	object_event 1, 17, 0, 19, 0, 10, 0, 3, 2, 18, 0, 0, 0, 0, 0, LavenderTown_EventScript_16687D, 0, 0, 0
	object_event 2, 47, 0, 12, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_EventScript_1668A6, 0, 0, 0
	object_event 3, 19, 0, 10, 0, 7, 0, 3, 14, 17, 0, 0, 0, 0, 0, LavenderTown_EventScript_1668AF, 0, 0, 0

LavenderTown_MapWarps:
	warp_def 18, 6, 0, 1, 344
	warp_def 6, 5, 0, 1, 2048
	warp_def 10, 11, 0, 1, 2050
	warp_def 5, 16, 0, 1, 2051
	warp_def 10, 16, 0, 1, 2052
	warp_def 20, 15, 0, 1, 2053

LavenderTown_MapBGEvents:
	bg_event 12, 4, 0, 0, 0, LavenderTown_EventScript_1668C1
	bg_event 15, 11, 0, 0, 0, LavenderTown_EventScript_1668B8
	bg_event 21, 7, 0, 0, 0, LavenderTown_EventScript_1668D3
	bg_event 7, 11, 0, 0, 0, LavenderTown_EventScript_1668CA

LavenderTown_MapEvents::
	map_events LavenderTown_EventObjects, LavenderTown_MapWarps, 0x0, LavenderTown_MapBGEvents
