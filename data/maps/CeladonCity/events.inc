CeladonCity_EventObjects:
	object_event 1, 49, 0, 48, 0, 15, 0, 3, 5, 20, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CFA, 95, 0, 0
	object_event 2, 27, 0, 38, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CC5, 0, 0, 0
	object_event 3, 112, 0, 36, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CDC, 0, 0, 0
	object_event 4, 17, 0, 11, 0, 18, 0, 3, 52, 68, 0, 0, 0, 0, 0, CeladonCity_EventScript_166C99, 0, 0, 0
	object_event 5, 28, 0, 18, 0, 22, 0, 3, 2, 82, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CAD, 0, 0, 0
	object_event 6, 32, 0, 30, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CB6, 0, 0, 0
	object_event 7, 33, 0, 26, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CBF, 0, 0, 0
	object_event 8, 49, 0, 38, 0, 31, 0, 3, 5, 21, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D03, 95, 0, 0
	object_event 9, 32, 0, 9, 0, 30, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CA2, 0, 0, 0
	object_event 10, 95, 0, 52, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BDF13, 20, 0, 0
	object_event 11, 95, 0, 40, 0, 35, 0, 0, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BDF13, 19, 0, 0
	object_event 12, 19, 0, 25, 0, 10, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D0C, 0, 0, 0
	object_event 13, 65375, 0, 249, 255, 21, 0, 7, 0, 0, 0, 34, 0, 3, 0, 0x0, 0, 0, 0
	object_event 14, 92, 0, 5, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BEBC0, 465, 0, 0
	object_event 15, 55, 0, 47, 0, 24, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D15, 95, 0, 0

CeladonCity_MapWarps:
	warp_def 34, 21, 0, 0, 2574
	warp_def 11, 14, 0, 1, 2560
	warp_def 15, 14, 0, 4, 2560
	warp_def 30, 11, 0, 1, 2567
	warp_def 48, 11, 0, 1, 2572
	warp_def 39, 20, 0, 1, 2575
	warp_def 11, 30, 0, 1, 2576
	warp_def 37, 29, 0, 1, 2577
	warp_def 41, 29, 0, 1, 2578
	warp_def 49, 29, 0, 1, 2579
	warp_def 29, 5, 0, 5, 2567
	warp_def 30, 4, 3, 5, 2567
	warp_def 31, 5, 0, 5, 2567

CeladonCity_MapBGEvents:
	bg_event 45, 23, 0, 0, 0, CeladonCity_EventScript_166D5A
	bg_event 38, 23, 0, 0, 0, CeladonCity_EventScript_166D63
	bg_event 33, 23, 0, 0, 0, CeladonCity_EventScript_166D6C
	bg_event 22, 18, 3, 0, 0, CeladonCity_EventScript_166D27
	bg_event 26, 11, 0, 0, 0, CeladonCity_EventScript_166D48
	bg_event 33, 16, 0, 0, 0, CeladonCity_EventScript_166D1E
	bg_event 18, 14, 3, 0, 0, CeladonCity_EventScript_166D51
	bg_event 16, 31, 0, 0, 0, CeladonCity_EventScript_166D30
	bg_event 55, 20, 3, 7, 0, 69, 47, 1

CeladonCity_MapEvents::
	map_events CeladonCity_EventObjects, CeladonCity_MapWarps, 0x0, CeladonCity_MapBGEvents
