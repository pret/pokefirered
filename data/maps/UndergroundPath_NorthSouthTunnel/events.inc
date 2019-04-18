UndergroundPath_NorthSouthTunnel_MapWarps:
	warp_def 4, 3, 3, 3, 286
	warp_def 3, 60, 3, 3, 288

UndergroundPath_NorthSouthTunnel_MapBGEvents:
	bg_event 5, 30, 3, 7, 0, 13, 70, 1
	bg_event 5, 6, 3, 7, 0, 14, 71, 1
	bg_event 2, 57, 3, 7, 0, 15, 74, 1
	bg_event 1, 24, 3, 7, 0, 17, 73, 1
	bg_event 6, 53, 3, 7, 0, 16, 75, 1
	bg_event 3, 15, 3, 7, 0, 18, 72, 1
	bg_event 3, 39, 3, 7, 0, 34, 76, 1

UndergroundPath_NorthSouthTunnel_MapEvents::
	map_events 0x0, UndergroundPath_NorthSouthTunnel_MapWarps, 0x0, UndergroundPath_NorthSouthTunnel_MapBGEvents
