SixIsland_WaterPath_EventObjects:
	object_event 1, 28, 0, 12, 0, 13, 0, 3, 19, 17, 0, 1, 0, 3, 0, SixIsland_WaterPath_EventScript_1AC555, 0, 0, 0
	object_event 2, 26, 0, 11, 0, 52, 0, 3, 7, 17, 0, 1, 0, 3, 0, SixIsland_WaterPath_EventScript_1AC593, 0, 0, 0
	object_event 3, 43, 0, 13, 0, 35, 0, 1, 1, 17, 0, 1, 0, 4, 0, SixIsland_WaterPath_EventScript_1AC5D1, 0, 0, 0
	object_event 4, 44, 0, 15, 0, 45, 0, 1, 2, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC60F, 0, 0, 0
	object_event 5, 17, 0, 6, 0, 21, 0, 3, 8, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC64D, 0, 0, 0
	object_event 6, 17, 0, 7, 0, 21, 0, 3, 8, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC693, 0, 0, 0
	object_event 7, 56, 0, 11, 0, 76, 0, 3, 15, 17, 0, 1, 0, 4, 0, SixIsland_WaterPath_EventScript_1AC6D9, 0, 0, 0
	object_event 8, 92, 0, 17, 0, 19, 0, 0, 8, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_EventScript_1BEC9D, 482, 0, 0
	object_event 9, 92, 0, 17, 0, 87, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_EventScript_1BECAA, 483, 0, 0

SixIsland_WaterPath_MapWarps:
	warp_def 5, 13, 0, 0, 10496
	warp_def 11, 19, 0, 0, 10497

SixIsland_WaterPath_MapBGEvents:
	bg_event 8, 14, 0, 0, 0, SixIsland_WaterPath_EventScript_168B41
	bg_event 15, 76, 3, 7, 0, 137, 181, 1
	bg_event 3, 8, 3, 7, 0, 139, 182, 1
	bg_event 13, 63, 3, 7, 0, 152, 183, 1
	bg_event 12, 54, 0, 0, 0, SixIsland_WaterPath_EventScript_168B4A

SixIsland_WaterPath_MapEvents::
	map_events SixIsland_WaterPath_EventObjects, SixIsland_WaterPath_MapWarps, 0x0, SixIsland_WaterPath_MapBGEvents
