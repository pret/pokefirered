PewterCity_Museum_2F_EventObjects:
	object_event 1, 55, 0, 10, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A565, 0, 0, 0
	object_event 2, 25, 0, 4, 0, 9, 0, 3, 5, 19, 0, 0, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A553, 0, 0, 0
	object_event 3, 33, 0, 0, 0, 6, 0, 3, 1, 19, 0, 0, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A55C, 0, 0, 0
	object_event 4, 17, 0, 15, 0, 8, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A56E, 0, 0, 0
	object_event 5, 30, 0, 16, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A577, 0, 0, 0

PewterCity_Museum_2F_MapWarps:
	warp_def 11, 8, 3, 5, 1536

PewterCity_Museum_2F_MapBGEvents:
	bg_event 3, 6, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A589
	bg_event 15, 5, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 14, 5, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 16, 5, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 14, 4, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 15, 4, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 16, 4, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A580
	bg_event 3, 5, 0, 0, 0, PewterCity_Museum_2F_EventScript_16A589

PewterCity_Museum_2F_MapEvents::
	map_events PewterCity_Museum_2F_EventObjects, PewterCity_Museum_2F_MapWarps, 0x0, PewterCity_Museum_2F_MapBGEvents
