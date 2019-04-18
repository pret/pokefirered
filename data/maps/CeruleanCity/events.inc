CeruleanCity_EventObjects:
	object_event 1, 60, 0, 31, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1666E7, 0, 0, 0
	object_event 2, 49, 0, 33, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166603, 59, 0, 0
	object_event 3, 16, 0, 16, 0, 21, 0, 3, 3, 49, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1666FE, 0, 0, 0
	object_event 4, 30, 0, 9, 0, 23, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16671D, 0, 0, 0
	object_event 5, 129, 0, 32, 0, 29, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1667DD, 0, 0, 0
	object_event 6, 22, 0, 33, 0, 29, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16674F, 0, 0, 0
	object_event 7, 18, 0, 34, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166726, 0, 0, 0
	object_event 8, 72, 0, 22, 0, 0, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 60, 0, 0
	object_event 9, 95, 0, 26, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1BDF13, 19, 0, 0
	object_event 10, 65375, 0, 50, 0, 18, 0, 10, 0, 0, 0, 27, 0, 3, 0, 0x0, 0, 0, 0
	object_event 11, 23, 0, 12, 0, 30, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166738, 0, 0, 0
	object_event 12, 41, 0, 1, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16672F, 92, 0, 0

CeruleanCity_MapWarps:
	warp_def 10, 11, 0, 1, 1792
	warp_def 30, 11, 0, 1, 1793
	warp_def 15, 17, 0, 1, 1794
	warp_def 22, 19, 0, 1, 1795
	warp_def 31, 21, 0, 1, 1797
	warp_def 13, 28, 3, 1, 1798
	warp_def 29, 28, 0, 1, 1799
	warp_def 1, 12, 0, 0, 328
	warp_def 10, 8, 3, 3, 1792
	warp_def 31, 8, 3, 3, 1793
	warp_def 31, 9, 3, 3, 1793
	warp_def 14, 28, 3, 1, 1798
	warp_def 23, 28, 0, 0, 1800
	warp_def 17, 11, 0, 0, 1801

CeruleanCity_MapCoordEvents:
	coord_event 22, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_16649A
	coord_event 23, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_1664A6
	coord_event 24, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_1664B9
	coord_event 33, 5, 3, 0, 16509, 0, 0, CeruleanCity_EventScript_166683
	coord_event 33, 7, 3, 0, 16509, 0, 0, CeruleanCity_EventScript_1666A3

CeruleanCity_MapBGEvents:
	bg_event 20, 25, 0, 0, 0, CeruleanCity_EventScript_166838
	bg_event 27, 21, 0, 0, 0, CeruleanCity_EventScript_166853
	bg_event 11, 28, 0, 0, 0, CeruleanCity_EventScript_16684A
	bg_event 19, 32, 0, 0, 0, CeruleanCity_EventScript_166841
	bg_event 18, 7, 3, 7, 0, 68, 49, 1
	bg_event 11, 25, 0, 0, 0, CeruleanCity_EventScript_16AC94
	bg_event 11, 27, 0, 0, 0, CeruleanCity_EventScript_16AC94
	bg_event 11, 26, 0, 0, 0, CeruleanCity_EventScript_16AC94

CeruleanCity_MapEvents::
	map_events CeruleanCity_EventObjects, CeruleanCity_MapWarps, CeruleanCity_MapCoordEvents, CeruleanCity_MapBGEvents
