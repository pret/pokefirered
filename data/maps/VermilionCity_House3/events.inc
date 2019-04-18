VermilionCity_House3_EventObjects:
	object_event 1, 19, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, VermilionCity_House3_EventScript_16BAAA, 0, 0, 0
	object_event 2, 116, 0, 2, 0, 5, 0, 3, 5, 18, 0, 0, 0, 0, 0, VermilionCity_House3_EventScript_16BABC, 0, 0, 0
	object_event 3, 105, 0, 6, 0, 4, 0, 0, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 4, 22, 0, 2, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_House3_EventScript_16BAB3, 0, 0, 0

VermilionCity_House3_MapWarps:
	warp_def 3, 7, 3, 8, 773
	warp_def 4, 7, 3, 8, 773
	warp_def 5, 7, 3, 8, 773

VermilionCity_House3_MapBGEvents:
	bg_event 6, 4, 3, 0, 0, VermilionCity_House3_EventScript_16BACF

VermilionCity_House3_MapEvents::
	map_events VermilionCity_House3_EventObjects, VermilionCity_House3_MapWarps, 0x0, VermilionCity_House3_MapBGEvents
