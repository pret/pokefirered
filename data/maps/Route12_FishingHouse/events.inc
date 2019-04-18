Route12_FishingHouse_EventObjects:
	object_event 1, 57, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_FishingHouse_EventScript_16FF0C, 0, 0, 0

Route12_FishingHouse_MapWarps:
	warp_def 2, 8, 0, 0, 798
	warp_def 3, 7, 3, 0, 798
	warp_def 4, 8, 0, 0, 798

Route12_FishingHouse_MapBGEvents:
	bg_event 9, 1, 0, 0, 0, Route12_FishingHouse_EventScript_170067

Route12_FishingHouse_MapEvents::
	map_events Route12_FishingHouse_EventObjects, Route12_FishingHouse_MapWarps, 0x0, Route12_FishingHouse_MapBGEvents
