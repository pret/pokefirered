Route18_EventObjects:
	object_event 1, 26, 0, 46, 0, 14, 0, 3, 9, 17, 0, 1, 0, 4, 0, Route18_EventScript_1AB3D3, 0, 0, 0
	object_event 2, 26, 0, 41, 0, 15, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route18_EventScript_1AB395, 0, 0, 0
	object_event 3, 26, 0, 39, 0, 12, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route18_EventScript_1AB357, 0, 0, 0

Route18_MapWarps:
	warp_def 41, 9, 3, 0, 6656
	warp_def 48, 9, 3, 1, 6656

Route18_MapBGEvents:
	bg_event 37, 7, 0, 0, 0, Route18_EventScript_168228
	bg_event 52, 7, 0, 0, 0, Route18_EventScript_16821F

Route18_MapEvents::
	map_events Route18_EventObjects, Route18_MapWarps, 0x0, Route18_MapBGEvents
