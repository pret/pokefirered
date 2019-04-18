MtMoon_1F_EventObjects:
	object_event 1, 22, 0, 20, 0, 26, 0, 3, 8, 17, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_16063C, 0, 0, 0
	object_event 2, 20, 0, 36, 0, 30, 0, 3, 10, 17, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_160681, 0, 0, 0
	object_event 3, 55, 0, 30, 0, 35, 0, 3, 1, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_160653, 0, 0, 0
	object_event 4, 22, 0, 33, 0, 4, 0, 3, 47, 53, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_160625, 0, 0, 0
	object_event 5, 20, 0, 7, 0, 26, 0, 3, 8, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_16066A, 0, 0, 0
	object_event 6, 18, 0, 13, 0, 17, 0, 3, 10, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_16060E, 0, 0, 0
	object_event 7, 56, 0, 7, 0, 10, 0, 3, 2, 34, 0, 1, 0, 1, 0, MtMoon_1F_EventScript_1605F7, 0, 0, 0
	object_event 8, 92, 0, 2, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5CF, 345, 0, 0
	object_event 9, 92, 0, 11, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5DC, 346, 0, 0
	object_event 10, 92, 0, 26, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5E9, 347, 0, 0
	object_event 11, 92, 0, 42, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5F6, 348, 0, 0
	object_event 12, 92, 0, 44, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE603, 349, 0, 0
	object_event 13, 92, 0, 3, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE610, 350, 0, 0
	object_event 14, 30, 0, 42, 0, 7, 0, 3, 17, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1ACE03, 0, 0, 0

MtMoon_1F_MapWarps:
	warp_def 5, 6, 3, 0, 258
	warp_def 19, 14, 3, 1, 258
	warp_def 31, 16, 3, 2, 258
	warp_def 18, 37, 3, 0, 790

MtMoon_1F_MapBGEvents:
	bg_event 19, 26, 0, 0, 0, MtMoon_1F_EventScript_1605EE

MtMoon_1F_MapEvents::
	map_events MtMoon_1F_EventObjects, MtMoon_1F_MapWarps, 0x0, MtMoon_1F_MapBGEvents
