RockTunnel_1F_EventObjects:
	object_event 1, 40, 0, 26, 0, 28, 0, 3, 8, 17, 0, 1, 0, 3, 0, RockTunnel_1F_EventScript_162E73, 0, 0, 0
	object_event 2, 40, 0, 39, 0, 27, 0, 3, 10, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E5C, 0, 0, 0
	object_event 3, 40, 0, 45, 0, 24, 0, 3, 9, 17, 0, 1, 0, 5, 0, RockTunnel_1F_EventScript_162E45, 0, 0, 0
	object_event 4, 56, 0, 20, 0, 17, 0, 3, 9, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E17, 0, 0, 0
	object_event 5, 56, 0, 5, 0, 20, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E00, 0, 0, 0
	object_event 6, 56, 0, 7, 0, 5, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162DE9, 0, 0, 0
	object_event 7, 52, 0, 27, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, RockTunnel_1F_EventScript_162E2E, 0, 0, 0
	object_event 8, 92, 0, 37, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB0A, 451, 0, 0
	object_event 9, 92, 0, 33, 0, 22, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB17, 452, 0, 0
	object_event 10, 92, 0, 22, 0, 22, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB24, 453, 0, 0

RockTunnel_1F_MapWarps:
	warp_def 17, 2, 3, 0, 796
	warp_def 45, 2, 3, 0, 338
	warp_def 4, 2, 3, 1, 338
	warp_def 20, 13, 3, 2, 338
	warp_def 45, 21, 3, 3, 338
	warp_def 18, 37, 3, 1, 796

RockTunnel_1F_MapBGEvents:
	bg_event 14, 33, 3, 0, 0, RockTunnel_1F_EventScript_162DE0

RockTunnel_1F_MapEvents::
	map_events RockTunnel_1F_EventObjects, RockTunnel_1F_MapWarps, 0x0, RockTunnel_1F_MapBGEvents
