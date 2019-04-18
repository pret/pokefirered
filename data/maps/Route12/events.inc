Route12_EventObjects:
	object_event 1, 57, 0, 17, 0, 32, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA451, 0, 0, 0
	object_event 2, 57, 0, 9, 0, 40, 0, 3, 14, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA48F, 0, 0, 0
	object_event 3, 57, 0, 16, 0, 47, 0, 3, 17, 17, 0, 1, 0, 4, 0, Route12_EventScript_1AA4CD, 0, 0, 0
	object_event 4, 57, 0, 13, 0, 59, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA50B, 0, 0, 0
	object_event 5, 109, 0, 14, 0, 70, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_168014, 84, 0, 0
	object_event 6, 26, 0, 13, 0, 92, 0, 3, 37, 68, 0, 1, 0, 1, 0, Route12_EventScript_1AA587, 0, 0, 0
	object_event 7, 39, 0, 10, 0, 99, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA5C5, 0, 0, 0
	object_event 8, 57, 0, 18, 0, 108, 0, 3, 14, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA549, 0, 0, 0
	object_event 9, 95, 0, 11, 0, 100, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BDF13, 18, 0, 0
	object_event 10, 92, 0, 18, 0, 36, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BE7B0, 382, 0, 0
	object_event 11, 92, 0, 9, 0, 101, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BE7BD, 383, 0, 0
	object_event 12, 29, 0, 19, 0, 64, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route12_EventScript_1AA649, 0, 0, 0
	object_event 13, 25, 0, 19, 0, 63, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route12_EventScript_1AA603, 0, 0, 0
	object_event 14, 95, 0, 12, 0, 111, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BDF13, 19, 0, 0

Route12_MapWarps:
	warp_def 12, 86, 0, 1, 5890
	warp_def 14, 15, 3, 0, 5888
	warp_def 15, 15, 3, 1, 5888
	warp_def 14, 21, 3, 2, 5888

Route12_MapBGEvents:
	bg_event 17, 13, 0, 0, 0, Route12_EventScript_1680A3
	bg_event 15, 69, 0, 0, 0, Route12_EventScript_1680AC
	bg_event 18, 57, 3, 7, 0, 21, 42, 1
	bg_event 14, 70, 3, 7, 0, 200, 131, 129
	bg_event 9, 116, 3, 7, 0, 68, 130, 1

Route12_MapEvents::
	map_events Route12_EventObjects, Route12_MapWarps, 0x0, Route12_MapBGEvents
