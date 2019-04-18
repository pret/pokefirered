CeladonCity_Condominiums_1F_EventObjects:
	object_event 1, 125, 0, 1, 0, 9, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C38E, 0, 0, 0
	object_event 2, 113, 0, 5, 0, 13, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C3A1, 0, 0, 0
	object_event 3, 122, 0, 5, 0, 8, 0, 3, 2, 18, 0, 0, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C3B4, 0, 0, 0
	object_event 4, 35, 0, 2, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C321, 0, 0, 0

CeladonCity_Condominiums_1F_MapWarps:
	warp_def 11, 19, 0, 3, 774
	warp_def 12, 18, 3, 3, 774
	warp_def 13, 19, 0, 3, 774
	warp_def 4, 2, 3, 0, 2568
	warp_def 12, 2, 3, 3, 2568
	warp_def 2, 1, 3, 11, 774

CeladonCity_Condominiums_1F_MapBGEvents:
	bg_event 8, 12, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C3C7
	bg_event 7, 12, 0, 0, 0, CeladonCity_Condominiums_1F_EventScript_16C3C7

CeladonCity_Condominiums_1F_MapEvents::
	map_events CeladonCity_Condominiums_1F_EventObjects, CeladonCity_Condominiums_1F_MapWarps, 0x0, CeladonCity_Condominiums_1F_MapBGEvents
