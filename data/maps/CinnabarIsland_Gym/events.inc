CinnabarIsland_Gym_EventObjects:
	object_event 1, 52, 0, 25, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB27, 0, 0, 0
	object_event 2, 55, 0, 25, 0, 4, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DA7F, 0, 0, 0
	object_event 3, 55, 0, 17, 0, 5, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DA96, 0, 0, 0
	object_event 4, 52, 0, 16, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB53, 0, 0, 0
	object_event 5, 55, 0, 16, 0, 18, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DAC2, 0, 0, 0
	object_event 6, 52, 0, 4, 0, 19, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB7F, 0, 0, 0
	object_event 7, 55, 0, 4, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DAFB, 0, 0, 0
	object_event 8, 86, 0, 5, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_Gym_EventScript_16D9D4, 0, 0, 0
	object_event 9, 91, 0, 24, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBAB, 0, 0, 0

CinnabarIsland_Gym_MapWarps:
	warp_def 24, 23, 3, 1, 776
	warp_def 25, 23, 3, 1, 776
	warp_def 26, 23, 3, 1, 776

CinnabarIsland_Gym_MapBGEvents:
	bg_event 23, 20, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBCA
	bg_event 27, 20, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBCA
	bg_event 22, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DBE8
	bg_event 23, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DBF4
	bg_event 15, 2, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DCDD
	bg_event 16, 2, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DCE9
	bg_event 13, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DDBB
	bg_event 14, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DDC7
	bg_event 13, 17, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DE92
	bg_event 14, 17, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DE9E
	bg_event 1, 18, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DF69
	bg_event 2, 18, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DF75
	bg_event 1, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16E040
	bg_event 2, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16E04C
	bg_event 3, 1, 0, 1, 0, CinnabarIsland_Gym_EventScript_1ACF07

CinnabarIsland_Gym_MapEvents::
	map_events CinnabarIsland_Gym_EventObjects, CinnabarIsland_Gym_MapWarps, 0x0, CinnabarIsland_Gym_MapBGEvents
