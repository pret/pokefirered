CeruleanCity_BikeShop_EventObjects:
	object_event 1, 25, 0, 9, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16ABBD, 0, 0, 0
	object_event 2, 18, 0, 9, 0, 7, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC75, 0, 0, 0
	object_event 3, 28, 0, 5, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC6C, 0, 0, 0

CeruleanCity_BikeShop_MapWarps:
	warp_def 4, 9, 0, 5, 771
	warp_def 5, 8, 3, 5, 771
	warp_def 6, 9, 0, 5, 771

CeruleanCity_BikeShop_MapBGEvents:
	bg_event 4, 3, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 4, 4, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 4, 5, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 2, 3, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 1, 4, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 2, 5, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 2, 7, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94
	bg_event 2, 8, 0, 0, 0, CeruleanCity_BikeShop_EventScript_16AC94

CeruleanCity_BikeShop_MapEvents::
	map_events CeruleanCity_BikeShop_EventObjects, CeruleanCity_BikeShop_MapWarps, 0x0, CeruleanCity_BikeShop_MapBGEvents
