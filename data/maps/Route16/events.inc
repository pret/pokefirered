Route16_EventObjects:
	object_event 1, 53, 0, 16, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAEEB, 0, 0, 0
	object_event 2, 53, 0, 14, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAFA5, 0, 0, 0
	object_event 3, 53, 0, 12, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAFE3, 0, 0, 0
	object_event 4, 53, 0, 8, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAF67, 0, 0, 0
	object_event 5, 53, 0, 10, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAF29, 0, 0, 0
	object_event 6, 53, 0, 6, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB021, 0, 0, 0
	object_event 7, 95, 0, 41, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_EventScript_1BDF13, 18, 0, 0
	object_event 8, 29, 0, 30, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB0A5, 0, 0, 0
	object_event 9, 25, 0, 31, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB05F, 0, 0, 0
	object_event 10, 109, 0, 31, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_EventScript_168121, 128, 0, 0

Route16_MapWarps:
	warp_def 10, 5, 0, 1, 6400
	warp_def 20, 6, 3, 0, 6401
	warp_def 27, 6, 3, 1, 6401
	warp_def 20, 13, 3, 2, 6401
	warp_def 27, 13, 3, 3, 6401

Route16_MapBGEvents:
	bg_event 6, 17, 0, 0, 0, Route16_EventScript_1681B6
	bg_event 33, 11, 0, 0, 0, Route16_EventScript_1681AD
	bg_event 31, 13, 3, 7, 0, 200, 132, 129

Route16_MapEvents::
	map_events Route16_EventObjects, Route16_MapWarps, 0x0, Route16_MapBGEvents
