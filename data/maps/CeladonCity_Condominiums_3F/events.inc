CeladonCity_Condominiums_3F_EventObjects:
	object_event 1, 26, 0, 0, 0, 10, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C3DB, 0, 0, 0
	object_event 2, 25, 0, 3, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C3F6, 0, 0, 0
	object_event 3, 52, 0, 4, 0, 10, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C3E4, 0, 0, 0
	object_event 4, 27, 0, 0, 0, 13, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C3ED, 0, 0, 0

CeladonCity_Condominiums_3F_MapWarps:
	warp_def 2, 2, 3, 1, 2568
	warp_def 4, 2, 3, 0, 2570
	warp_def 12, 2, 3, 1, 2570
	warp_def 11, 2, 3, 2, 2568

CeladonCity_Condominiums_3F_MapBGEvents:
	bg_event 8, 12, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C435
	bg_event 1, 9, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C43E
	bg_event 5, 9, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C447
	bg_event 1, 12, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C450
	bg_event 7, 12, 0, 0, 0, CeladonCity_Condominiums_3F_EventScript_16C435
	bg_event 0, 12, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C450
	bg_event 0, 9, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C43E
	bg_event 4, 9, 0, 1, 0, CeladonCity_Condominiums_3F_EventScript_16C447

CeladonCity_Condominiums_3F_MapEvents::
	map_events CeladonCity_Condominiums_3F_EventObjects, CeladonCity_Condominiums_3F_MapWarps, 0x0, CeladonCity_Condominiums_3F_MapBGEvents
