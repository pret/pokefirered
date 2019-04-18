PewterCity_Museum_1F_EventObjects:
	object_event 1, 47, 0, 16, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A31B, 0, 0, 0
	object_event 2, 32, 0, 2, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A4A5, 0, 0, 0
	object_event 3, 55, 0, 21, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A4AE, 0, 0, 0
	object_event 4, 101, 0, 22, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A509, 86, 0, 0
	object_event 5, 55, 0, 26, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A49C, 0, 0, 0
	object_event 6, 55, 0, 26, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_Museum_1F_EventScript_1C4BBE, 0, 0, 0

PewterCity_Museum_1F_MapWarps:
	warp_def 13, 9, 3, 0, 770
	warp_def 14, 9, 3, 0, 770
	warp_def 15, 9, 3, 0, 770
	warp_def 21, 9, 3, 1, 770
	warp_def 22, 9, 3, 1, 770
	warp_def 8, 8, 3, 0, 1537

PewterCity_Museum_1F_MapCoordEvents:
	coord_event 12, 5, 3, 0, 16481, 0, 0, PewterCity_Museum_1F_EventScript_16A38F
	coord_event 13, 5, 3, 0, 16481, 0, 0, PewterCity_Museum_1F_EventScript_16A3A5
	coord_event 14, 5, 3, 0, 16481, 0, 0, PewterCity_Museum_1F_EventScript_16A3BB

PewterCity_Museum_1F_MapBGEvents:
	bg_event 4, 4, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A512
	bg_event 4, 7, 0, 0, 0, PewterCity_Museum_1F_EventScript_16A532
	bg_event 27, 1, 0, 1, 0, PewterCity_Museum_1F_EventScript_1ACE1C
	bg_event 26, 1, 0, 1, 0, PewterCity_Museum_1F_EventScript_1ACE1C

PewterCity_Museum_1F_MapEvents::
	map_events PewterCity_Museum_1F_EventObjects, PewterCity_Museum_1F_MapWarps, PewterCity_Museum_1F_MapCoordEvents, PewterCity_Museum_1F_MapBGEvents
