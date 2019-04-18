SaffronCity_House2_EventObjects:
	object_event 1, 116, 0, 0, 0, 5, 0, 3, 3, 65, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF86, 0, 0, 0
	object_event 2, 22, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF74, 0, 0, 0
	object_event 3, 18, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF7D, 0, 0, 0
	object_event 4, 105, 0, 5, 0, 4, 0, 0, 7, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

SaffronCity_House2_MapWarps:
	warp_def 3, 7, 3, 4, 778
	warp_def 4, 7, 3, 4, 778
	warp_def 5, 7, 3, 4, 778

SaffronCity_House2_MapBGEvents:
	bg_event 5, 4, 3, 0, 0, SaffronCity_House2_EventScript_16EF99

SaffronCity_House2_MapEvents::
	map_events SaffronCity_House2_EventObjects, SaffronCity_House2_MapWarps, 0x0, SaffronCity_House2_MapBGEvents
