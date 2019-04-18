CeladonCity_Condominiums_2F_EventObjects:
	object_event 1, 0, 0, 6, 0, 6, 0, 0, 76, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_2F_EventScript_1ACE9D, 158, 0, 0
	object_event 2, 0, 0, 5, 0, 6, 0, 0, 76, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_2F_EventScript_1ACE9D, 158, 0, 0

CeladonCity_Condominiums_2F_MapWarps:
	warp_def 4, 2, 3, 3, 2567
	warp_def 2, 2, 3, 0, 2569
	warp_def 11, 2, 3, 3, 2569
	warp_def 12, 2, 3, 4, 2567

CeladonCity_Condominiums_2F_MapBGEvents:
	bg_event 8, 12, 0, 0, 0, CeladonCity_Condominiums_2F_EventScript_16C3D1
	bg_event 7, 12, 0, 0, 0, CeladonCity_Condominiums_2F_EventScript_16C3D1

CeladonCity_Condominiums_2F_MapEvents::
	map_events CeladonCity_Condominiums_2F_EventObjects, CeladonCity_Condominiums_2F_MapWarps, 0x0, CeladonCity_Condominiums_2F_MapBGEvents
