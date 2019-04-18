SevenIsland_EventObjects:
	object_event 1, 41, 0, 7, 0, 18, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_1C4B56, 0, 0, 0
	object_event 2, 35, 0, 9, 0, 7, 0, 3, 13, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_167EC6, 0, 0, 0
	object_event 3, 55, 0, 15, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_167ECF, 0, 0, 0

SevenIsland_MapWarps:
	warp_def 11, 9, 0, 0, 7936
	warp_def 5, 9, 0, 0, 7938
	warp_def 12, 3, 0, 0, 7939
	warp_def 16, 13, 3, 0, 7942

SevenIsland_MapBGEvents:
	bg_event 17, 9, 0, 0, 0, SevenIsland_EventScript_167EBD

SevenIsland_MapEvents::
	map_events SevenIsland_EventObjects, SevenIsland_MapWarps, 0x0, SevenIsland_MapBGEvents
