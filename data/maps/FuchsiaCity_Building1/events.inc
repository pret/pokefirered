FuchsiaCity_Building1_EventObjects:
	object_event 1, 33, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D74C, 0, 0, 0
	object_event 2, 97, 0, 11, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1BE11D, 0, 0, 0
	object_event 3, 92, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1BEAA2, 441, 0, 0
	object_event 4, 0, 0, 4, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1ACEB8, 159, 0, 0

FuchsiaCity_Building1_MapWarps:
	warp_def 5, 10, 0, 1, 775
	warp_def 6, 9, 3, 1, 775
	warp_def 7, 10, 0, 1, 775

FuchsiaCity_Building1_MapBGEvents:
	bg_event 7, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D80D
	bg_event 4, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D804
	bg_event 5, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D804
	bg_event 6, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D80D

FuchsiaCity_Building1_MapEvents::
	map_events FuchsiaCity_Building1_EventObjects, FuchsiaCity_Building1_MapWarps, 0x0, FuchsiaCity_Building1_MapBGEvents
