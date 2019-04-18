PalletTown_PlayersHouse_2F_MapWarps:
	warp_def 10, 2, 3, 2, 1024

PalletTown_PlayersHouse_2F_MapBGEvents:
	bg_event 6, 5, 3, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CD2
	bg_event 1, 1, 0, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CE4
	bg_event 11, 1, 0, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CDB

PalletTown_PlayersHouse_2F_MapEvents::
	map_events 0x0, PalletTown_PlayersHouse_2F_MapWarps, 0x0, PalletTown_PlayersHouse_2F_MapBGEvents
