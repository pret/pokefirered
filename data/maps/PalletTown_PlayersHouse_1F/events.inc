PalletTown_PlayersHouse_1F_EventObjects:
	object_event 1, 88, 0, 8, 0, 4, 0, 3, 9, 0, 0, 0, 0, 0, 0, PalletTown_PlayersHouse_1F_EventScript_168C09, 0, 0, 0

PalletTown_PlayersHouse_1F_MapWarps:
	warp_def 5, 8, 3, 0, 768
	warp_def 4, 8, 3, 0, 768
	warp_def 10, 2, 3, 0, 1025
	warp_def 3, 9, 0, 0, 768

PalletTown_PlayersHouse_1F_MapBGEvents:
	bg_event 6, 1, 0, 0, 0, PalletTown_PlayersHouse_1F_EventScript_168C62

PalletTown_PlayersHouse_1F_MapEvents::
	map_events PalletTown_PlayersHouse_1F_EventObjects, PalletTown_PlayersHouse_1F_MapWarps, 0x0, PalletTown_PlayersHouse_1F_MapBGEvents
