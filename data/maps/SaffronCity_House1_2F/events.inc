SaffronCity_House1_2F_EventObjects:
	object_event 1, 132, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB5D, 0, 0, 0
	object_event 2, 120, 0, 4, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB70, 0, 0, 0
	object_event 3, 115, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB70, 0, 0, 0
	object_event 4, 17, 0, 9, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB7B, 0, 0, 0

SaffronCity_House1_2F_MapWarps:
	warp_def 10, 2, 3, 3, 3584

SaffronCity_House1_2F_MapBGEvents:
	bg_event 1, 1, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EBC9
	bg_event 3, 5, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EBD2
	bg_event 2, 1, 0, 7, 0, 110, 26, 1

SaffronCity_House1_2F_MapEvents::
	map_events SaffronCity_House1_2F_EventObjects, SaffronCity_House1_2F_MapWarps, 0x0, SaffronCity_House1_2F_MapBGEvents
