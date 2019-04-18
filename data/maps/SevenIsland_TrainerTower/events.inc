SevenIsland_TrainerTower_EventObjects:
	object_event 1, 19, 0, 56, 0, 26, 0, 3, 7, 17, 0, 1, 0, 1, 0, SevenIsland_TrainerTower_EventScript_1AC84D, 0, 0, 0
	object_event 2, 23, 0, 56, 0, 29, 0, 3, 8, 17, 0, 1, 0, 1, 0, SevenIsland_TrainerTower_EventScript_1AC88B, 0, 0, 0

SevenIsland_TrainerTower_MapWarps:
	warp_def 58, 7, 3, 1, 522

SevenIsland_TrainerTower_MapBGEvents:
	bg_event 49, 27, 3, 7, 0, 107, 185, 1
	bg_event 47, 30, 3, 7, 0, 106, 186, 1
	bg_event 59, 32, 3, 7, 0, 150, 187, 1
	bg_event 56, 8, 0, 0, 0, SevenIsland_TrainerTower_EventScript_168BE1
	bg_event 50, 30, 0, 0, 0, SevenIsland_TrainerTower_EventScript_168BEA

SevenIsland_TrainerTower_MapEvents::
	map_events SevenIsland_TrainerTower_EventObjects, SevenIsland_TrainerTower_MapWarps, 0x0, SevenIsland_TrainerTower_MapBGEvents
