CeruleanCity_Gym_EventObjects:
	object_event 1, 43, 0, 10, 0, 12, 0, 0, 9, 17, 0, 1, 0, 1, 0, CeruleanCity_Gym_EventScript_16AB5B, 0, 0, 0
	object_event 2, 40, 0, 4, 0, 7, 0, 3, 10, 17, 0, 1, 0, 4, 0, CeruleanCity_Gym_EventScript_16AB44, 0, 0, 0
	object_event 3, 81, 0, 8, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_Gym_EventScript_16AAA1, 0, 0, 0
	object_event 4, 91, 0, 7, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB7F, 0, 0, 0

CeruleanCity_Gym_MapWarps:
	warp_def 7, 18, 3, 4, 771
	warp_def 8, 18, 3, 4, 771
	warp_def 9, 18, 3, 4, 771

CeruleanCity_Gym_MapBGEvents:
	bg_event 6, 17, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB9E
	bg_event 10, 17, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB9E

CeruleanCity_Gym_MapEvents::
	map_events CeruleanCity_Gym_EventObjects, CeruleanCity_Gym_MapWarps, 0x0, CeruleanCity_Gym_MapBGEvents
