SSAnne_CaptainsOffice_EventObjects:
	object_event 1, 63, 0, 5, 0, 4, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160B3A, 0, 0, 0

SSAnne_CaptainsOffice_MapWarps:
	warp_def 3, 7, 3, 2, 262

SSAnne_CaptainsOffice_MapBGEvents:
	bg_event 2, 4, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BD2
	bg_event 5, 3, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BC9
	bg_event 2, 3, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BD2

SSAnne_CaptainsOffice_MapEvents::
	map_events SSAnne_CaptainsOffice_EventObjects, SSAnne_CaptainsOffice_MapWarps, 0x0, SSAnne_CaptainsOffice_MapBGEvents
