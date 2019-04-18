RocketHideout_B3F_EventObjects:
	object_event 1, 49, 0, 19, 0, 9, 0, 3, 7, 17, 0, 1, 0, 4, 0, RocketHideout_B3F_EventScript_1612D1, 173, 0, 0
	object_event 2, 49, 0, 2, 0, 20, 0, 3, 10, 17, 0, 1, 0, 2, 0, RocketHideout_B3F_EventScript_1612BA, 173, 0, 0
	object_event 3, 92, 0, 12, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BE714, 370, 0, 0
	object_event 4, 92, 0, 19, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BE721, 371, 0, 0
	object_event 5, 92, 0, 14, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BEBCD, 466, 0, 0

RocketHideout_B3F_MapWarps:
	warp_def 18, 2, 3, 0, 299
	warp_def 15, 18, 3, 0, 301

RocketHideout_B3F_MapBGEvents:
	bg_event 1, 3, 3, 7, 0, 110, 12, 1

RocketHideout_B3F_MapEvents::
	map_events RocketHideout_B3F_EventObjects, RocketHideout_B3F_MapWarps, 0x0, RocketHideout_B3F_MapBGEvents
