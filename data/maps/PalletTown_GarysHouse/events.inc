PalletTown_GarysHouse_EventObjects:
	object_event 1, 76, 0, 10, 0, 6, 0, 3, 2, 49, 0, 0, 0, 0, 0, PalletTown_GarysHouse_EventScript_168D56, 0, 0, 0
	object_event 2, 93, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F63, 57, 0, 0

PalletTown_GarysHouse_MapWarps:
	warp_def 4, 8, 3, 1, 768
	warp_def 5, 8, 3, 1, 768
	warp_def 3, 8, 3, 1, 768

PalletTown_GarysHouse_MapBGEvents:
	bg_event 12, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F6C
	bg_event 11, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F6C
	bg_event 9, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F75

PalletTown_GarysHouse_MapEvents::
	map_events PalletTown_GarysHouse_EventObjects, PalletTown_GarysHouse_MapWarps, 0x0, PalletTown_GarysHouse_MapBGEvents
