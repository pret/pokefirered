CeladonCity_Condominiums_RoofRoom_EventObjects:
	object_event 1, 54, 0, 3, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_RoofRoom_EventScript_16C464, 0, 0, 0
	object_event 2, 92, 0, 7, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Condominiums_RoofRoom_EventScript_16C46D, 87, 0, 0

CeladonCity_Condominiums_RoofRoom_MapWarps:
	warp_def 3, 8, 0, 2, 2570
	warp_def 4, 7, 3, 2, 2570
	warp_def 5, 8, 0, 2, 2570

CeladonCity_Condominiums_RoofRoom_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeladonCity_Condominiums_RoofRoom_EventScript_16C522
	bg_event 5, 1, 0, 0, 0, CeladonCity_Condominiums_RoofRoom_EventScript_16C522
	bg_event 4, 4, 0, 0, 0, CeladonCity_Condominiums_RoofRoom_EventScript_16C519

CeladonCity_Condominiums_RoofRoom_MapEvents::
	map_events CeladonCity_Condominiums_RoofRoom_EventObjects, CeladonCity_Condominiums_RoofRoom_MapWarps, 0x0, CeladonCity_Condominiums_RoofRoom_MapBGEvents
