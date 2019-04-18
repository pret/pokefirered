RocketHideout_B1F_EventObjects:
	object_event 1, 49, 0, 4, 0, 9, 0, 3, 10, 17, 0, 1, 0, 5, 0, RocketHideout_B1F_EventScript_1611C5, 173, 0, 0
	object_event 2, 49, 0, 24, 0, 12, 0, 3, 9, 17, 0, 1, 0, 2, 0, RocketHideout_B1F_EventScript_1611AE, 173, 0, 0
	object_event 3, 49, 0, 6, 0, 32, 0, 3, 10, 17, 0, 1, 0, 4, 0, RocketHideout_B1F_EventScript_1611F3, 173, 0, 0
	object_event 4, 49, 0, 10, 0, 22, 0, 3, 8, 17, 0, 1, 0, 3, 0, RocketHideout_B1F_EventScript_1611DC, 173, 0, 0
	object_event 5, 49, 0, 21, 0, 27, 0, 3, 16, 17, 0, 1, 0, 3, 0, RocketHideout_B1F_EventScript_16120A, 173, 0, 0
	object_event 6, 92, 0, 5, 0, 16, 0, 0, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B1F_EventScript_1BE6C6, 364, 0, 0
	object_event 7, 92, 0, 1, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B1F_EventScript_1BE6D3, 365, 0, 0

RocketHideout_B1F_MapWarps:
	warp_def 12, 2, 3, 3, 2574
	warp_def 17, 2, 3, 1, 299
	warp_def 15, 30, 3, 2, 299
	warp_def 23, 25, 0, 1, 302
	warp_def 24, 25, 0, 1, 302
	warp_def 25, 25, 0, 1, 302

RocketHideout_B1F_MapBGEvents:
	bg_event 16, 17, 0, 7, 0, 69, 11, 1

RocketHideout_B1F_MapEvents::
	map_events RocketHideout_B1F_EventObjects, RocketHideout_B1F_MapWarps, 0x0, RocketHideout_B1F_MapBGEvents
