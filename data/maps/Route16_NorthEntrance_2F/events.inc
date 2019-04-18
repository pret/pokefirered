Route16_NorthEntrance_2F_EventObjects:
	object_event 1, 16, 0, 6, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702BF, 0, 0, 0
	object_event 2, 17, 0, 4, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702C8, 0, 0, 0
	object_event 3, 55, 0, 10, 0, 6, 0, 0, 9, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702E3, 0, 0, 0

Route16_NorthEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 6401

Route16_NorthEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702D1
	bg_event 8, 1, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702DA

Route16_NorthEntrance_2F_MapEvents::
	map_events Route16_NorthEntrance_2F_EventObjects, Route16_NorthEntrance_2F_MapWarps, 0x0, Route16_NorthEntrance_2F_MapBGEvents
