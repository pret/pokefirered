VermilionCity_EventObjects:
	object_event 1, 23, 0, 22, 0, 11, 0, 3, 5, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166917, 0, 0, 0
	object_event 2, 32, 0, 17, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166920, 0, 0, 0
	object_event 3, 33, 0, 36, 0, 10, 0, 0, 17, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C2F, 0, 0, 0
	object_event 4, 130, 0, 35, 0, 11, 0, 3, 2, 34, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C38, 0, 0, 0
	object_event 5, 62, 0, 31, 0, 30, 0, 3, 5, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C17, 0, 0, 0
	object_event 6, 62, 0, 24, 0, 33, 0, 3, 7, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166941, 0, 0, 0
	object_event 7, 95, 0, 19, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_1BDF13, 18, 0, 0
	object_event 8, 55, 0, 25, 0, 7, 0, 3, 1, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C20, 161, 0, 0

VermilionCity_MapWarps:
	warp_def 22, 34, 3, 1, 260
	warp_def 23, 34, 3, 1, 260
	warp_def 24, 34, 3, 1, 260
	warp_def 9, 6, 0, 1, 2304
	warp_def 15, 6, 3, 1, 2305
	warp_def 12, 17, 0, 1, 2307
	warp_def 19, 17, 0, 1, 2308
	warp_def 29, 17, 0, 1, 2309
	warp_def 28, 24, 0, 1, 2311
	warp_def 14, 25, 0, 1, 2310

VermilionCity_MapCoordEvents:
	coord_event 22, 33, 0, 0, 16467, 0, 0, VermilionCity_EventScript_166B8A
	coord_event 23, 33, 0, 0, 16467, 0, 0, VermilionCity_EventScript_166B91
	coord_event 22, 32, 0, 0, 16385, 0, 0, VermilionCity_EventScript_166B98
	coord_event 23, 32, 0, 0, 16385, 0, 0, VermilionCity_EventScript_166B98

VermilionCity_MapBGEvents:
	bg_event 33, 6, 0, 0, 0, VermilionCity_EventScript_166C53
	bg_event 10, 17, 3, 0, 0, VermilionCity_EventScript_166C65
	bg_event 10, 24, 0, 0, 0, VermilionCity_EventScript_166C6E
	bg_event 34, 18, 0, 0, 0, VermilionCity_EventScript_166C86
	bg_event 45, 17, 3, 0, 0, VermilionCity_EventScript_166C5C
	bg_event 14, 11, 3, 7, 0, 35, 48, 1

VermilionCity_MapEvents::
	map_events VermilionCity_EventObjects, VermilionCity_MapWarps, VermilionCity_MapCoordEvents, VermilionCity_MapBGEvents
