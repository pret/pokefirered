Route17_EventObjects:
	object_event 1, 53, 0, 4, 0, 18, 0, 3, 26, 97, 0, 1, 0, 1, 0, Route17_EventScript_1AB319, 0, 0, 0
	object_event 2, 53, 0, 11, 0, 15, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB221, 0, 0, 0
	object_event 3, 53, 0, 15, 0, 24, 0, 3, 52, 36, 0, 1, 0, 1, 0, Route17_EventScript_1AB1E3, 0, 0, 0
	object_event 4, 53, 0, 18, 0, 41, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB129, 0, 0, 0
	object_event 5, 53, 0, 7, 0, 38, 0, 3, 14, 17, 0, 1, 0, 5, 0, Route17_EventScript_1AB0EB, 0, 0, 0
	object_event 6, 53, 0, 2, 0, 61, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route17_EventScript_1AB29D, 0, 0, 0
	object_event 7, 53, 0, 21, 0, 61, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route17_EventScript_1AB25F, 0, 0, 0
	object_event 8, 53, 0, 18, 0, 94, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB2DB, 0, 0, 0
	object_event 9, 53, 0, 16, 0, 134, 0, 3, 47, 24, 0, 1, 0, 1, 0, Route17_EventScript_1AB1A5, 0, 0, 0
	object_event 10, 53, 0, 4, 0, 116, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB167, 0, 0, 0

Route17_MapBGEvents:
	bg_event 12, 97, 0, 0, 0, Route17_EventScript_1681DB
	bg_event 12, 83, 0, 0, 0, Route17_EventScript_1681D2
	bg_event 12, 68, 0, 0, 0, Route17_EventScript_1681C9
	bg_event 12, 53, 0, 0, 0, Route17_EventScript_1681C0
	bg_event 12, 125, 3, 0, 0, Route17_EventScript_1681E4
	bg_event 11, 157, 0, 0, 0, Route17_EventScript_1681ED
	bg_event 18, 83, 3, 7, 0, 68, 17, 1
	bg_event 10, 53, 3, 7, 0, 19, 18, 1
	bg_event 4, 68, 3, 7, 0, 69, 19, 1
	bg_event 4, 125, 3, 7, 0, 25, 20, 1
	bg_event 14, 157, 3, 7, 0, 37, 21, 1

Route17_MapEvents::
	map_events Route17_EventObjects, 0x0, 0x0, Route17_MapBGEvents
