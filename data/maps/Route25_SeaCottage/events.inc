Route25_SeaCottage_EventObjects:
	object_event 1, 73, 0, 7, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route25_SeaCottage_EventScript_17054B, 51, 0, 0
	object_event 2, 113, 0, 10, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route25_SeaCottage_EventScript_17054B, 50, 0, 0

Route25_SeaCottage_MapWarps:
	warp_def 6, 9, 3, 0, 812
	warp_def 7, 9, 3, 0, 812
	warp_def 8, 9, 3, 0, 812

Route25_SeaCottage_MapBGEvents:
	bg_event 4, 5, 0, 1, 0, Route25_SeaCottage_EventScript_1706DD

Route25_SeaCottage_MapEvents::
	map_events Route25_SeaCottage_EventObjects, Route25_SeaCottage_MapWarps, 0x0, Route25_SeaCottage_MapBGEvents
