Route5_MapWarps:
	warp_def 31, 31, 0, 1, 286
	warp_def 23, 25, 0, 1, 4352
	warp_def 24, 32, 3, 1, 4353
	warp_def 25, 32, 3, 1, 4353

Route5_MapBGEvents:
	bg_event 32, 32, 0, 0, 0, Route5_EventScript_167FA8

Route5_MapEvents::
	map_events 0x0, Route5_MapWarps, 0x0, Route5_MapBGEvents
