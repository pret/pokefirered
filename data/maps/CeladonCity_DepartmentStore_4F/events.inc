CeladonCity_DepartmentStore_4F_EventObjects:
	object_event 1, 25, 0, 6, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BBEF, 0, 0, 0
	object_event 2, 18, 0, 10, 0, 11, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BBF8, 0, 0, 0
	object_event 3, 68, 0, 3, 0, 13, 0, 0, 7, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BC0A, 0, 0, 0

CeladonCity_DepartmentStore_4F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 3, 2, 0, 2, 2562
	warp_def 9, 2, 0, 1, 2564

CeladonCity_DepartmentStore_4F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BC01

CeladonCity_DepartmentStore_4F_MapEvents::
	map_events CeladonCity_DepartmentStore_4F_EventObjects, CeladonCity_DepartmentStore_4F_MapWarps, 0x0, CeladonCity_DepartmentStore_4F_MapBGEvents
