SevenIsland_TrainerTower_1F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 6, 0, 0
	object_event 2, 240, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_1F_MapWarps:
	warp_def 15, 6, 3, 1, 514
	warp_def 4, 6, 3, 0, 522

SevenIsland_TrainerTower_1F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54AF
	coord_event 9, 12, 0, 0, 16399, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54EA

SevenIsland_TrainerTower_1F_MapEvents::
	map_events SevenIsland_TrainerTower_1F_EventObjects, SevenIsland_TrainerTower_1F_MapWarps, SevenIsland_TrainerTower_1F_MapCoordEvents, 0x0
