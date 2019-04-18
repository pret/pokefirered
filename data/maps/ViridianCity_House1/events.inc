ViridianCity_House1_EventObjects:
	object_event 1, 30, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169E9B, 0, 0, 0
	object_event 2, 17, 0, 2, 0, 5, 0, 3, 3, 33, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169EA4, 0, 0, 0
	object_event 3, 110, 0, 6, 0, 6, 0, 3, 5, 20, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169EAD, 0, 0, 0

ViridianCity_House1_MapWarps:
	warp_def 3, 7, 0, 1, 769
	warp_def 4, 7, 0, 1, 769
	warp_def 5, 7, 3, 1, 769

ViridianCity_House1_MapBGEvents:
	bg_event 7, 1, 0, 0, 0, ViridianCity_House1_EventScript_169EC0

ViridianCity_House1_MapEvents::
	map_events ViridianCity_House1_EventObjects, ViridianCity_House1_MapWarps, 0x0, ViridianCity_House1_MapBGEvents
