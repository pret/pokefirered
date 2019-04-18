PewterCity_Gym_EventObjects:
	object_event 1, 80, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Gym_EventScript_16A593, 0, 0, 0
	object_event 2, 39, 0, 3, 0, 8, 0, 3, 10, 17, 0, 1, 0, 4, 0, PewterCity_Gym_EventScript_16A63E, 0, 0, 0
	object_event 3, 91, 0, 7, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Gym_EventScript_16A655, 0, 0, 0

PewterCity_Gym_MapWarps:
	warp_def 5, 14, 3, 2, 770
	warp_def 6, 14, 3, 2, 770
	warp_def 7, 14, 3, 2, 770

PewterCity_Gym_MapBGEvents:
	bg_event 4, 12, 0, 0, 0, PewterCity_Gym_EventScript_16A6AF
	bg_event 8, 12, 0, 0, 0, PewterCity_Gym_EventScript_16A6AF

PewterCity_Gym_MapEvents::
	map_events PewterCity_Gym_EventObjects, PewterCity_Gym_MapWarps, 0x0, PewterCity_Gym_MapBGEvents
