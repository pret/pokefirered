ViridianForest_EventObjects:
	object_event 1, 18, 0, 29, 0, 58, 0, 3, 7, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_160529, 0, 0, 0
	object_event 2, 19, 0, 45, 0, 58, 0, 3, 9, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_160532, 0, 0, 0
	object_event 3, 20, 0, 47, 0, 45, 0, 3, 9, 17, 0, 1, 0, 5, 0, ViridianForest_EventScript_160571, 0, 0, 0
	object_event 4, 20, 0, 47, 0, 29, 0, 3, 9, 17, 0, 1, 0, 4, 0, ViridianForest_EventScript_160588, 0, 0, 0
	object_event 5, 20, 0, 7, 0, 22, 0, 3, 9, 17, 0, 1, 0, 4, 0, ViridianForest_EventScript_16059F, 0, 0, 0
	object_event 6, 92, 0, 5, 0, 41, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_1BE5A8, 342, 0, 0
	object_event 7, 92, 0, 40, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_1BE5B5, 343, 0, 0
	object_event 8, 92, 0, 21, 0, 34, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_1BE5C2, 344, 0, 0
	object_event 9, 20, 0, 43, 0, 6, 0, 3, 13, 17, 0, 1, 0, 1, 0, ViridianForest_EventScript_1605B6, 0, 0, 0
	object_event 10, 20, 0, 16, 0, 5, 0, 3, 7, 17, 0, 1, 0, 1, 0, ViridianForest_EventScript_1605CD, 0, 0, 0
	object_event 11, 92, 0, 49, 0, 60, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianForest_EventScript_1BEAC9, 446, 0, 0

ViridianForest_MapWarps:
	warp_def 29, 62, 3, 3, 3840
	warp_def 28, 62, 3, 3, 3840
	warp_def 5, 9, 3, 1, 3843
	warp_def 6, 9, 3, 1, 3843
	warp_def 30, 62, 3, 3, 3840
	warp_def 4, 9, 3, 1, 3843

ViridianForest_MapBGEvents:
	bg_event 39, 59, 3, 0, 0, ViridianForest_EventScript_16053B
	bg_event 43, 26, 0, 0, 0, ViridianForest_EventScript_16054D
	bg_event 9, 29, 0, 0, 0, ViridianForest_EventScript_160556
	bg_event 6, 12, 0, 0, 0, ViridianForest_EventScript_160568
	bg_event 28, 44, 0, 0, 0, ViridianForest_EventScript_160544
	bg_event 31, 60, 0, 0, 0, ViridianForest_EventScript_16055F
	bg_event 3, 22, 3, 7, 0, 13, 0, 1
	bg_event 28, 57, 0, 7, 0, 14, 1, 1

ViridianForest_MapEvents::
	map_events ViridianForest_EventObjects, ViridianForest_MapWarps, 0x0, ViridianForest_MapBGEvents
