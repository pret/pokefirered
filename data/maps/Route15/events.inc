Route15_EventObjects:
	object_event 1, 40, 0, 22, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAD67, 0, 0, 0
	object_event 2, 26, 0, 31, 0, 12, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route15_EventScript_1AACEB, 0, 0, 0
	object_event 3, 26, 0, 37, 0, 14, 0, 3, 7, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAD29, 0, 0, 0
	object_event 4, 40, 0, 44, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AADA5, 0, 0, 0
	object_event 5, 29, 0, 50, 0, 12, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AACAD, 0, 0, 0
	object_event 6, 53, 0, 59, 0, 12, 0, 3, 18, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAC31, 0, 0, 0
	object_event 7, 53, 0, 63, 0, 13, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AABF3, 0, 0, 0
	object_event 8, 40, 0, 52, 0, 8, 0, 3, 2, 66, 0, 1, 0, 1, 0, Route15_EventScript_1AADE3, 0, 0, 0
	object_event 9, 29, 0, 54, 0, 12, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAC6F, 0, 0, 0
	object_event 10, 40, 0, 28, 0, 6, 0, 3, 2, 66, 0, 1, 0, 1, 0, Route15_EventScript_1AAE21, 0, 0, 0
	object_event 11, 92, 0, 20, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route15_EventScript_1BE7CA, 384, 0, 0
	object_event 12, 54, 0, 39, 0, 7, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAEA5, 0, 0, 0
	object_event 13, 24, 0, 40, 0, 7, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAE5F, 0, 0, 0
	object_event 14, 65375, 0, 73, 0, 7, 0, 13, 0, 0, 0, 32, 0, 3, 0, 0x0, 0, 0, 0

Route15_MapWarps:
	warp_def 9, 11, 3, 0, 6144
	warp_def 16, 11, 3, 2, 6144

Route15_MapBGEvents:
	bg_event 41, 11, 0, 0, 0, Route15_EventScript_1680DC

Route15_MapEvents::
	map_events Route15_EventObjects, Route15_MapWarps, 0x0, Route15_MapBGEvents
