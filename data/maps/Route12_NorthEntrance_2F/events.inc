Route12_NorthEntrance_2F_EventObjects:
	object_event 1, 22, 0, 7, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE8A, 0, 0, 0

Route12_NorthEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 5888

Route12_NorthEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE78
	bg_event 8, 1, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE81

Route12_NorthEntrance_2F_MapEvents::
	map_events Route12_NorthEntrance_2F_EventObjects, Route12_NorthEntrance_2F_MapWarps, 0x0, Route12_NorthEntrance_2F_MapBGEvents
