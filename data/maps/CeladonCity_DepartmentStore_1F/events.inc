CeladonCity_DepartmentStore_1F_EventObjects:
	object_event 1, 48, 0, 6, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAD9, 0, 0, 0

CeladonCity_DepartmentStore_1F_MapWarps:
	warp_def 1, 15, 0, 1, 774
	warp_def 2, 14, 3, 1, 774
	warp_def 3, 15, 0, 1, 774
	warp_def 9, 15, 0, 2, 774
	warp_def 10, 14, 3, 2, 774
	warp_def 11, 15, 0, 2, 774
	warp_def 6, 1, 0, 0, 2566
	warp_def 4, 2, 3, 1, 2561

CeladonCity_DepartmentStore_1F_MapBGEvents:
	bg_event 9, 11, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAE2
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAEB

CeladonCity_DepartmentStore_1F_MapEvents::
	map_events CeladonCity_DepartmentStore_1F_EventObjects, CeladonCity_DepartmentStore_1F_MapWarps, 0x0, CeladonCity_DepartmentStore_1F_MapBGEvents
