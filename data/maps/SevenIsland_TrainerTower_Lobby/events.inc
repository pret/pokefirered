SevenIsland_TrainerTower_Lobby_EventObjects:
	object_event 1, 64, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_16495D, 0, 0, 0
	object_event 2, 66, 0, 14, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164992, 0, 0, 0
	object_event 3, 66, 0, 11, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164966, 0, 0, 0
	object_event 4, 42, 0, 12, 0, 13, 0, 3, 2, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AE6, 0, 0, 0
	object_event 5, 30, 0, 2, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AEF, 0, 0, 0

SevenIsland_TrainerTower_Lobby_MapWarps:
	warp_def 9, 2, 3, 1, 513
	warp_def 9, 15, 3, 0, 830
	warp_def 17, 8, 0, 0, 523

SevenIsland_TrainerTower_Lobby_MapCoordEvents:
	coord_event 9, 7, 3, 0, 16514, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_1649CE

SevenIsland_TrainerTower_Lobby_MapBGEvents:
	bg_event 8, 10, 0, 1, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AD8

SevenIsland_TrainerTower_Lobby_MapEvents::
	map_events SevenIsland_TrainerTower_Lobby_EventObjects, SevenIsland_TrainerTower_Lobby_MapWarps, SevenIsland_TrainerTower_Lobby_MapCoordEvents, SevenIsland_TrainerTower_Lobby_MapBGEvents
