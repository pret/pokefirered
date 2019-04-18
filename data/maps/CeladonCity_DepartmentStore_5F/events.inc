CeladonCity_DepartmentStore_5F_EventObjects:
	object_event 1, 61, 0, 11, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC41, 0, 0, 0
	object_event 2, 62, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC4A, 0, 0, 0
	object_event 3, 68, 0, 1, 0, 7, 0, 3, 8, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC5C, 0, 0, 0
	object_event 4, 68, 0, 1, 0, 6, 0, 3, 10, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC96, 0, 0, 0

CeladonCity_DepartmentStore_5F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 9, 2, 3, 2, 2563
	warp_def 3, 2, 3, 0, 2565

CeladonCity_DepartmentStore_5F_MapBGEvents:
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC53

CeladonCity_DepartmentStore_5F_MapEvents::
	map_events CeladonCity_DepartmentStore_5F_EventObjects, CeladonCity_DepartmentStore_5F_MapWarps, 0x0, CeladonCity_DepartmentStore_5F_MapBGEvents
