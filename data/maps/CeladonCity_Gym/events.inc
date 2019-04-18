CeladonCity_Gym_EventObjects:
	object_event 1, 22, 0, 3, 0, 11, 0, 3, 10, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D111, 0, 0, 0
	object_event 2, 29, 0, 9, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D163, 0, 0, 0
	object_event 3, 40, 0, 10, 0, 7, 0, 3, 8, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D14C, 0, 0, 0
	object_event 4, 29, 0, 2, 0, 6, 0, 3, 8, 17, 0, 1, 0, 4, 0, CeladonCity_Gym_EventScript_16D17A, 0, 0, 0
	object_event 5, 29, 0, 5, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D19E, 0, 0, 0
	object_event 6, 22, 0, 7, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D128, 0, 0, 0
	object_event 7, 83, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_16D061, 0, 0, 0
	object_event 8, 42, 0, 8, 0, 7, 0, 3, 9, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D1B5, 0, 0, 0
	object_event 9, 95, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 18, 0, 0
	object_event 10, 95, 0, 3, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 19, 0, 0
	object_event 11, 95, 0, 9, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 20, 0, 0

CeladonCity_Gym_MapWarps:
	warp_def 5, 18, 3, 6, 774
	warp_def 6, 18, 3, 6, 774
	warp_def 7, 18, 3, 6, 774

CeladonCity_Gym_MapBGEvents:
	bg_event 4, 16, 0, 0, 0, CeladonCity_Gym_EventScript_16D1CC
	bg_event 8, 16, 0, 0, 0, CeladonCity_Gym_EventScript_16D1CC

CeladonCity_Gym_MapEvents::
	map_events CeladonCity_Gym_EventObjects, CeladonCity_Gym_MapWarps, 0x0, CeladonCity_Gym_MapBGEvents
