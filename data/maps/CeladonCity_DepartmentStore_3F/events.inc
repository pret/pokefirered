CeladonCity_DepartmentStore_3F_EventObjects:
	object_event 1, 68, 0, 10, 0, 9, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB85, 0, 0, 0
	object_event 2, 51, 0, 11, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB8B, 0, 0, 0
	object_event 3, 51, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB9D, 0, 0, 0
	object_event 4, 51, 0, 1, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB94, 0, 0, 0
	object_event 5, 17, 0, 9, 0, 14, 0, 3, 14, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBA6, 0, 0, 0

CeladonCity_DepartmentStore_3F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 9, 2, 0, 2, 2561
	warp_def 3, 2, 0, 1, 2563

CeladonCity_DepartmentStore_3F_MapBGEvents:
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBDC
	bg_event 2, 8, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBB8
	bg_event 5, 8, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBC1
	bg_event 2, 11, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBCA
	bg_event 5, 11, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBD3
	bg_event 1, 8, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 1, 11, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 4, 8, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 4, 11, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 2, 4, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBE5
	bg_event 0, 4, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBE5

CeladonCity_DepartmentStore_3F_MapEvents::
	map_events CeladonCity_DepartmentStore_3F_EventObjects, CeladonCity_DepartmentStore_3F_MapWarps, 0x0, CeladonCity_DepartmentStore_3F_MapBGEvents
