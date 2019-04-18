CeladonCity_DepartmentStore_2F_EventObjects:
	object_event 1, 22, 0, 5, 0, 10, 0, 3, 3, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BAFE, 0, 0, 0
	object_event 2, 68, 0, 1, 0, 8, 0, 0, 8, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB10, 0, 0, 0
	object_event 3, 68, 0, 1, 0, 6, 0, 3, 10, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB4E, 0, 0, 0
	object_event 4, 23, 0, 11, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_1AD053, 157, 0, 0

CeladonCity_DepartmentStore_2F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 3, 2, 3, 7, 2560
	warp_def 9, 2, 3, 1, 2562

CeladonCity_DepartmentStore_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB07

CeladonCity_DepartmentStore_2F_MapEvents::
	map_events CeladonCity_DepartmentStore_2F_EventObjects, CeladonCity_DepartmentStore_2F_MapWarps, 0x0, CeladonCity_DepartmentStore_2F_MapBGEvents
