CeladonCity_DepartmentStore_Elevator_MapWarps:
	warp_def 2, 5, 3, 127, 32639
	warp_def 2, 6, 0, 127, 32639

CeladonCity_DepartmentStore_Elevator_MapBGEvents:
	bg_event 0, 2, 0, 0, 0, CeladonCity_DepartmentStore_Elevator_EventScript_16C153
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_Elevator_EventScript_16C153

CeladonCity_DepartmentStore_Elevator_MapEvents::
	map_events 0x0, CeladonCity_DepartmentStore_Elevator_MapWarps, 0x0, CeladonCity_DepartmentStore_Elevator_MapBGEvents
