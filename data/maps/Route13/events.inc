Route13_EventObjects:
	object_event 1, 40, 0, 62, 0, 6, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA803, 0, 0, 0
	object_event 2, 26, 0, 63, 0, 12, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA749, 0, 0, 0
	object_event 3, 40, 0, 54, 0, 11, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA841, 0, 0, 0
	object_event 4, 29, 0, 42, 0, 7, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA70B, 0, 0, 0
	object_event 5, 29, 0, 43, 0, 7, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA6CD, 0, 0, 0
	object_event 6, 40, 0, 35, 0, 10, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA87F, 0, 0, 0
	object_event 7, 40, 0, 29, 0, 11, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA8BD, 0, 0, 0
	object_event 8, 26, 0, 9, 0, 14, 0, 3, 7, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA7C5, 0, 0, 0
	object_event 9, 26, 0, 16, 0, 5, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA787, 0, 0, 0
	object_event 10, 53, 0, 14, 0, 8, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA68F, 0, 0, 0
	object_event 11, 95, 0, 44, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route13_EventScript_1BDF13, 18, 0, 0

Route13_MapBGEvents:
	bg_event 41, 12, 0, 0, 0, Route13_EventScript_1680C8
	bg_event 37, 6, 0, 0, 0, Route13_EventScript_1680BF
	bg_event 21, 14, 0, 0, 0, Route13_EventScript_1680B6
	bg_event 23, 14, 3, 7, 0, 69, 15, 1

Route13_MapEvents::
	map_events Route13_EventObjects, 0x0, 0x0, Route13_MapBGEvents
