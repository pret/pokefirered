CeladonCity_DepartmentStore_Roof_EventObjects:
	object_event 1, 41, 0, 9, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C022, 0, 0, 0
	object_event 2, 17, 0, 5, 0, 4, 0, 3, 2, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16BCCD, 0, 0, 0

CeladonCity_DepartmentStore_Roof_MapWarps:
	warp_def 15, 6, 3, 2, 2564

CeladonCity_DepartmentStore_Roof_MapBGEvents:
	bg_event 14, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C02B
	bg_event 10, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034
	bg_event 11, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034
	bg_event 12, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034

CeladonCity_DepartmentStore_Roof_MapEvents::
	map_events CeladonCity_DepartmentStore_Roof_EventObjects, CeladonCity_DepartmentStore_Roof_MapWarps, 0x0, CeladonCity_DepartmentStore_Roof_MapBGEvents
