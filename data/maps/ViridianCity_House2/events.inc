ViridianCity_House2_EventObjects:
	object_event 1, 28, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_House2_EventScript_16A094, 0, 0, 0
	object_event 2, 22, 0, 4, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, ViridianCity_House2_EventScript_16A07D, 0, 0, 0

ViridianCity_House2_MapWarps:
	warp_def 3, 7, 0, 3, 769
	warp_def 4, 7, 0, 3, 769
	warp_def 5, 7, 3, 3, 769

ViridianCity_House2_MapBGEvents:
	bg_event 4, 4, 0, 0, 0, ViridianCity_House2_EventScript_16A0AB
	bg_event 5, 1, 0, 0, 0, ViridianCity_House2_EventScript_16A11D
	bg_event 4, 1, 0, 0, 0, ViridianCity_House2_EventScript_16A11D
	bg_event 9, 2, 0, 1, 0, ViridianCity_House2_EventScript_1ACD65
	bg_event 8, 2, 0, 1, 0, ViridianCity_House2_EventScript_1ACD65

ViridianCity_House2_MapEvents::
	map_events ViridianCity_House2_EventObjects, ViridianCity_House2_MapWarps, 0x0, ViridianCity_House2_MapBGEvents
