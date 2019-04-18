FuchsiaCity_EventObjects:
	object_event 1, 27, 0, 37, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DAF, 0, 0, 0
	object_event 2, 128, 0, 36, 0, 15, 0, 3, 80, 20, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 3, 127, 0, 33, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 4, 18, 0, 33, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DB8, 0, 0, 0
	object_event 5, 117, 0, 39, 0, 8, 0, 3, 2, 19, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 6, 16, 0, 14, 0, 15, 0, 3, 5, 19, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166D9D, 0, 0, 0
	object_event 7, 135, 0, 12, 0, 20, 0, 1, 2, 18, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 8, 32, 0, 36, 0, 20, 0, 3, 5, 20, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DA6, 0, 0, 0
	object_event 9, 240, 0, 8, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 10, 119, 0, 16, 0, 9, 0, 3, 2, 20, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 11, 95, 0, 30, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 18, 0, 0
	object_event 12, 95, 0, 21, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 19, 0, 0
	object_event 13, 95, 0, 32, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 20, 0, 0
	object_event 14, 95, 0, 24, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 21, 0, 0
	object_event 15, 20, 0, 15, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1C4AEE, 0, 0, 0
	object_event 16, 22, 0, 40, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DC1, 157, 0, 0

FuchsiaCity_MapWarps:
	warp_def 24, 5, 0, 2, 2816
	warp_def 33, 31, 0, 1, 2823
	warp_def 11, 15, 0, 1, 2817
	warp_def 28, 16, 0, 1, 2818
	warp_def 9, 32, 0, 1, 2819
	warp_def 14, 31, 0, 1, 2820
	warp_def 25, 31, 3, 1, 2821
	warp_def 38, 31, 0, 1, 2824
	warp_def 39, 28, 3, 3, 2824
	warp_def 39, 29, 3, 3, 2824
	warp_def 19, 31, 0, 0, 2825

FuchsiaCity_MapBGEvents:
	bg_event 31, 18, 3, 0, 0, FuchsiaCity_EventScript_166DDA
	bg_event 26, 18, 0, 0, 0, FuchsiaCity_EventScript_166DE3
	bg_event 5, 32, 0, 0, 0, FuchsiaCity_EventScript_166E07
	bg_event 31, 31, 0, 0, 0, FuchsiaCity_EventScript_166DF5
	bg_event 35, 10, 0, 0, 0, FuchsiaCity_EventScript_166E38
	bg_event 38, 16, 3, 0, 0, FuchsiaCity_EventScript_166E6A
	bg_event 41, 10, 0, 0, 0, FuchsiaCity_EventScript_166E1F
	bg_event 17, 10, 0, 0, 0, FuchsiaCity_EventScript_166E51
	bg_event 11, 10, 0, 0, 0, FuchsiaCity_EventScript_166E9C
	bg_event 17, 18, 3, 0, 0, FuchsiaCity_EventScript_166E83
	bg_event 22, 7, 0, 0, 0, FuchsiaCity_EventScript_166DEC
	bg_event 33, 26, 3, 7, 0, 25, 133, 1

FuchsiaCity_MapEvents::
	map_events FuchsiaCity_EventObjects, FuchsiaCity_MapWarps, 0x0, FuchsiaCity_MapBGEvents
