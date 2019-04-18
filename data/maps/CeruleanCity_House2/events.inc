CeruleanCity_House2_EventObjects:
	object_event 1, 56, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_House2_EventScript_16A976, 0, 0, 0
	object_event 2, 22, 0, 7, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeruleanCity_House2_EventScript_16A995, 0, 0, 0

CeruleanCity_House2_MapWarps:
	warp_def 2, 7, 0, 1, 771
	warp_def 3, 7, 0, 1, 771
	warp_def 4, 7, 1, 1, 771
	warp_def 4, 1, 0, 9, 771

CeruleanCity_House2_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeruleanCity_House2_EventScript_16A99E

CeruleanCity_House2_MapEvents::
	map_events CeruleanCity_House2_EventObjects, CeruleanCity_House2_MapWarps, 0x0, CeruleanCity_House2_MapBGEvents
