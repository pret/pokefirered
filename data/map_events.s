	.include "asm/macros.inc"

	.section .rodata
	.align 2

UnknownMap_00_00_EventObjects:
	object_event 1, 66, 0, 9, 0, 3, 0, 3, 9, 0, 0, 0, 0, 0, 0, UnknownMap_00_00_EventScript_1BB9AF, 0, 0, 0

UnknownMap_00_00_MapWarps:
	warp_def 6, 8, 3, 127, 32639
	warp_def 7, 8, 3, 127, 32639

UnknownMap_00_00_MapCoordEvents:
	coord_event 3, 5, 3, 0, 16384, 0, 0, UnknownMap_00_00_EventScript_1BB8C3
	coord_event 10, 5, 3, 0, 16384, 0, 0, UnknownMap_00_00_EventScript_1BB8CF

gMapEvents_UnknownMap_00_00::
	map_events UnknownMap_00_00_EventObjects, UnknownMap_00_00_MapWarps, UnknownMap_00_00_MapCoordEvents, 0x0

UnknownMap_00_01_EventObjects:
	object_event 1, 66, 0, 9, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, UnknownMap_00_01_EventScript_1BB9C1, 0, 0, 0

UnknownMap_00_01_MapWarps:
	warp_def 5, 8, 3, 127, 32639
	warp_def 6, 8, 3, 127, 32639

UnknownMap_00_01_MapCoordEvents:
	coord_event 4, 5, 3, 0, 16384, 0, 0, UnknownMap_00_01_EventScript_1BB950
	coord_event 7, 5, 3, 0, 16384, 0, 0, UnknownMap_00_01_EventScript_1BB95C

gMapEvents_UnknownMap_00_01::
	map_events UnknownMap_00_01_EventObjects, UnknownMap_00_01_MapWarps, UnknownMap_00_01_MapCoordEvents, 0x0

UnknownMap_00_02_EventObjects:
	object_event 1, 66, 0, 10, 0, 5, 0, 0, 8, 0, 0, 0, 0, 0, 0, UnknownMap_00_02_EventScript_1BB9D3, 0, 0, 0

UnknownMap_00_02_MapWarps:
	warp_def 8, 9, 3, 127, 32639
	warp_def 9, 9, 3, 127, 32639
	warp_def 11, 9, 3, 127, 32639
	warp_def 10, 9, 3, 127, 32639

UnknownMap_00_02_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 6, 6, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 13, 4, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980
	coord_event 13, 6, 3, 0, 16384, 0, 0, UnknownMap_00_02_EventScript_1BB980

gMapEvents_UnknownMap_00_02::
	map_events UnknownMap_00_02_EventObjects, UnknownMap_00_02_MapWarps, UnknownMap_00_02_MapCoordEvents, 0x0


UnknownMap_00_03_MapWarps:
	warp_def 5, 8, 3, 127, 32639
	warp_def 6, 8, 3, 127, 32639
	warp_def 7, 8, 3, 127, 32639
	warp_def 8, 8, 3, 127, 32639

UnknownMap_00_03_MapCoordEvents:
	coord_event 3, 4, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB8DB
	coord_event 3, 6, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB915
	coord_event 10, 4, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB8F8
	coord_event 10, 6, 3, 0, 16384, 0, 0, UnknownMap_00_03_EventScript_1BB932

gMapEvents_UnknownMap_00_03::
	map_events 0x0, UnknownMap_00_03_MapWarps, UnknownMap_00_03_MapCoordEvents, 0x0

UnknownMap_00_04_EventObjects:
	object_event 1, 66, 0, 3, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_16050C, 0, 0, 0
	object_event 2, 243, 0, 1, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604DA, 102, 0, 0
	object_event 3, 247, 0, 7, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_160502, 106, 0, 0
	object_event 4, 246, 0, 1, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604F8, 105, 0, 0
	object_event 5, 245, 0, 7, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604EE, 104, 0, 0
	object_event 6, 244, 0, 13, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604E4, 103, 0, 0
	object_event 7, 242, 0, 10, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604D0, 101, 0, 0
	object_event 8, 241, 0, 13, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604C6, 100, 0, 0
	object_event 9, 240, 0, 4, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, UnknownMap_00_04_EventScript_1604BC, 99, 0, 0

UnknownMap_00_04_MapWarps:
	warp_def 7, 11, 3, 127, 32639

gMapEvents_UnknownMap_00_04::
	map_events UnknownMap_00_04_EventObjects, UnknownMap_00_04_MapWarps, 0x0, 0x0

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

gMapEvents_ViridianForest::
	map_events ViridianForest_EventObjects, ViridianForest_MapWarps, 0x0, ViridianForest_MapBGEvents

MtMoon_1F_EventObjects:
	object_event 1, 22, 0, 20, 0, 26, 0, 3, 8, 17, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_16063C, 0, 0, 0
	object_event 2, 20, 0, 36, 0, 30, 0, 3, 10, 17, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_160681, 0, 0, 0
	object_event 3, 55, 0, 30, 0, 35, 0, 3, 1, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_160653, 0, 0, 0
	object_event 4, 22, 0, 33, 0, 4, 0, 3, 47, 53, 0, 1, 0, 2, 0, MtMoon_1F_EventScript_160625, 0, 0, 0
	object_event 5, 20, 0, 7, 0, 26, 0, 3, 8, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_16066A, 0, 0, 0
	object_event 6, 18, 0, 13, 0, 17, 0, 3, 10, 17, 0, 1, 0, 4, 0, MtMoon_1F_EventScript_16060E, 0, 0, 0
	object_event 7, 56, 0, 7, 0, 10, 0, 3, 2, 34, 0, 1, 0, 1, 0, MtMoon_1F_EventScript_1605F7, 0, 0, 0
	object_event 8, 92, 0, 2, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5CF, 345, 0, 0
	object_event 9, 92, 0, 11, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5DC, 346, 0, 0
	object_event 10, 92, 0, 26, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5E9, 347, 0, 0
	object_event 11, 92, 0, 42, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE5F6, 348, 0, 0
	object_event 12, 92, 0, 44, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE603, 349, 0, 0
	object_event 13, 92, 0, 3, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1BE610, 350, 0, 0
	object_event 14, 30, 0, 42, 0, 7, 0, 3, 17, 17, 0, 0, 0, 0, 0, MtMoon_1F_EventScript_1ACE03, 0, 0, 0

MtMoon_1F_MapWarps:
	warp_def 5, 6, 3, 0, 258
	warp_def 19, 14, 3, 1, 258
	warp_def 31, 16, 3, 2, 258
	warp_def 18, 37, 3, 0, 790

MtMoon_1F_MapBGEvents:
	bg_event 19, 26, 0, 0, 0, MtMoon_1F_EventScript_1605EE

gMapEvents_MtMoon_1F::
	map_events MtMoon_1F_EventObjects, MtMoon_1F_MapWarps, 0x0, MtMoon_1F_MapBGEvents


MtMoon_B1F_MapWarps:
	warp_def 3, 3, 3, 0, 257
	warp_def 25, 4, 3, 1, 257
	warp_def 43, 21, 3, 2, 257
	warp_def 22, 18, 3, 0, 259
	warp_def 17, 5, 3, 1, 259
	warp_def 26, 36, 3, 2, 259
	warp_def 39, 4, 3, 3, 259
	warp_def 45, 4, 3, 1, 790

MtMoon_B1F_MapBGEvents:
	bg_event 46, 2, 0, 7, 0, 103, 84, 1
	bg_event 26, 2, 0, 7, 0, 103, 85, 1
	bg_event 39, 34, 0, 7, 0, 103, 86, 1
	bg_event 24, 35, 0, 7, 0, 104, 87, 1
	bg_event 6, 12, 0, 7, 0, 104, 88, 1
	bg_event 25, 34, 0, 7, 0, 104, 89, 1

gMapEvents_MtMoon_B1F::
	map_events 0x0, MtMoon_B1F_MapWarps, 0x0, MtMoon_B1F_MapBGEvents

MtMoon_B2F_EventObjects:
	object_event 1, 98, 0, 13, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_16071B, 47, 0, 0
	object_event 2, 98, 0, 14, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_16077F, 48, 0, 0
	object_event 3, 55, 0, 13, 0, 11, 0, 3, 10, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1606C2, 0, 0, 0
	object_event 4, 49, 0, 37, 0, 21, 0, 3, 1, 17, 0, 1, 0, 3, 0, MtMoon_B2F_EventScript_160829, 173, 0, 0
	object_event 5, 49, 0, 12, 0, 20, 0, 3, 8, 17, 0, 1, 0, 2, 0, MtMoon_B2F_EventScript_1607E4, 173, 0, 0
	object_event 6, 49, 0, 35, 0, 12, 0, 3, 7, 17, 0, 1, 0, 4, 0, MtMoon_B2F_EventScript_160812, 173, 0, 0
	object_event 7, 49, 0, 18, 0, 27, 0, 3, 8, 17, 0, 1, 0, 4, 0, MtMoon_B2F_EventScript_1607FB, 173, 0, 0
	object_event 8, 92, 0, 30, 0, 26, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BE61D, 351, 0, 0
	object_event 9, 92, 0, 35, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BE62A, 352, 0, 0
	object_event 10, 92, 0, 24, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BEAD6, 447, 0, 0
	object_event 11, 92, 0, 3, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtMoon_B2F_EventScript_1BEAE3, 448, 0, 0

MtMoon_B2F_MapWarps:
	warp_def 25, 21, 3, 3, 258
	warp_def 31, 11, 3, 4, 258
	warp_def 17, 31, 3, 5, 258
	warp_def 5, 10, 3, 6, 258

MtMoon_B2F_MapCoordEvents:
	coord_event 14, 11, 3, 0, 16523, 0, 0, MtMoon_B2F_EventScript_1606B0

MtMoon_B2F_MapBGEvents:
	bg_event 20, 16, 3, 7, 0, 94, 2, 1
	bg_event 39, 11, 3, 7, 0, 34, 3, 1

gMapEvents_MtMoon_B2F::
	map_events MtMoon_B2F_EventObjects, MtMoon_B2F_MapWarps, MtMoon_B2F_MapCoordEvents, MtMoon_B2F_MapBGEvents

SSAnne_Exterior_EventObjects:
	object_event 1, 151, 0, 30, 0, 16, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 135, 0, 0

SSAnne_Exterior_MapWarps:
	warp_def 31, 5, 0, 0, 773
	warp_def 32, 5, 3, 1, 773
	warp_def 32, 14, 3, 2, 261
	warp_def 33, 15, 0, 3, 261
	warp_def 33, 5, 0, 2, 773

SSAnne_Exterior_MapBGEvents:
	bg_event 58, 28, 3, 7, 0, 38, 190, 1

gMapEvents_SSAnne_Exterior::
	map_events SSAnne_Exterior_EventObjects, SSAnne_Exterior_MapWarps, 0x0, SSAnne_Exterior_MapBGEvents

SSAnne_1F_Corridor_EventObjects:
	object_event 1, 62, 0, 18, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_1F_Corridor_EventScript_1608D5, 0, 0, 0
	object_event 2, 47, 0, 12, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_1F_Corridor_EventScript_1608CC, 0, 0, 0

SSAnne_1F_Corridor_MapWarps:
	warp_def 3, 8, 3, 0, 262
	warp_def 2, 18, 3, 0, 266
	warp_def 19, 1, 3, 2, 260
	warp_def 20, 0, 0, 3, 260
	warp_def 3, 20, 0, 0, 266
	warp_def 28, 17, 3, 0, 264
	warp_def 5, 10, 3, 0, 268
	warp_def 8, 10, 3, 0, 269
	warp_def 11, 10, 3, 0, 270
	warp_def 14, 10, 3, 0, 271
	warp_def 17, 10, 3, 0, 272
	warp_def 23, 10, 3, 0, 273
	warp_def 20, 10, 3, 0, 285

gMapEvents_SSAnne_1F_Corridor::
	map_events SSAnne_1F_Corridor_EventObjects, SSAnne_1F_Corridor_MapWarps, 0x0, 0x0

SSAnne_2F_Corridor_EventObjects:
	object_event 1, 72, 0, 30, 0, 2, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 61, 0, 0
	object_event 2, 62, 0, 2, 0, 7, 0, 3, 3, 33, 0, 0, 0, 0, 0, SSAnne_2F_Corridor_EventScript_160A54, 0, 0, 0

SSAnne_2F_Corridor_MapWarps:
	warp_def 2, 2, 3, 0, 261
	warp_def 3, 12, 3, 1, 263
	warp_def 30, 2, 3, 0, 267
	warp_def 6, 10, 0, 0, 274
	warp_def 10, 10, 0, 0, 275
	warp_def 14, 10, 0, 0, 276
	warp_def 18, 10, 0, 0, 277
	warp_def 22, 10, 0, 0, 278
	warp_def 26, 10, 0, 0, 279

SSAnne_2F_Corridor_MapCoordEvents:
	coord_event 30, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608DF
	coord_event 31, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608EB
	coord_event 32, 6, 3, 0, 16475, 0, 0, SSAnne_2F_Corridor_EventScript_1608F7

gMapEvents_SSAnne_2F_Corridor::
	map_events SSAnne_2F_Corridor_EventObjects, SSAnne_2F_Corridor_MapWarps, SSAnne_2F_Corridor_MapCoordEvents, 0x0

SSAnne_3F_Corridor_EventObjects:
	object_event 1, 62, 0, 10, 0, 4, 0, 3, 5, 19, 0, 0, 0, 0, 0, SSAnne_3F_Corridor_EventScript_160A5E, 0, 0, 0

SSAnne_3F_Corridor_MapWarps:
	warp_def 1, 4, 3, 0, 265
	warp_def 18, 2, 3, 1, 262
	warp_def 0, 5, 0, 0, 265

gMapEvents_SSAnne_3F_Corridor::
	map_events SSAnne_3F_Corridor_EventObjects, SSAnne_3F_Corridor_MapWarps, 0x0, 0x0


SSAnne_B1F_Corridor_MapWarps:
	warp_def 19, 3, 3, 5, 261
	warp_def 2, 2, 0, 0, 280
	warp_def 6, 2, 0, 0, 281
	warp_def 10, 2, 0, 0, 282
	warp_def 14, 2, 0, 0, 283
	warp_def 18, 2, 0, 0, 284

SSAnne_B1F_Corridor_MapBGEvents:
	bg_event 21, 5, 3, 7, 0, 21, 8, 1

gMapEvents_SSAnne_B1F_Corridor::
	map_events 0x0, SSAnne_B1F_Corridor_MapWarps, 0x0, SSAnne_B1F_Corridor_MapBGEvents

SSAnne_Deck_EventObjects:
	object_event 1, 62, 0, 12, 0, 10, 0, 3, 7, 17, 0, 1, 0, 2, 0, SSAnne_Deck_EventScript_160A9B, 0, 0, 0
	object_event 2, 30, 0, 14, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_Deck_EventScript_160A72, 0, 0, 0
	object_event 3, 62, 0, 13, 0, 13, 0, 3, 27, 20, 0, 0, 0, 0, 0, SSAnne_Deck_EventScript_160A7B, 0, 0, 0
	object_event 4, 62, 0, 6, 0, 9, 0, 3, 2, 17, 0, 1, 0, 1, 0, SSAnne_Deck_EventScript_160A84, 0, 0, 0
	object_event 5, 18, 0, 11, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, SSAnne_Deck_EventScript_160A69, 0, 0, 0

SSAnne_Deck_MapWarps:
	warp_def 16, 8, 3, 0, 263
	warp_def 16, 9, 3, 0, 263

gMapEvents_SSAnne_Deck::
	map_events SSAnne_Deck_EventObjects, SSAnne_Deck_MapWarps, 0x0, 0x0

SSAnne_Kitchen_EventObjects:
	object_event 1, 59, 0, 1, 0, 5, 0, 3, 3, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160AB3, 0, 0, 0
	object_event 2, 59, 0, 6, 0, 6, 0, 3, 3, 33, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160ABC, 0, 0, 0
	object_event 3, 59, 0, 10, 0, 4, 0, 3, 18, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160AC5, 0, 0, 0
	object_event 4, 59, 0, 8, 0, 9, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160ACE, 0, 0, 0
	object_event 5, 59, 0, 14, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160B1E, 0, 0, 0
	object_event 6, 59, 0, 14, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160B27, 0, 0, 0
	object_event 7, 59, 0, 14, 0, 9, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_160B30, 0, 0, 0
	object_event 8, 92, 0, 1, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen_EventScript_1BE6AC, 362, 0, 0

SSAnne_Kitchen_MapWarps:
	warp_def 7, 1, 0, 1, 261

SSAnne_Kitchen_MapBGEvents:
	bg_event 14, 8, 0, 7, 0, 134, 122, 1
	bg_event 14, 4, 0, 7, 0, 135, 120, 1
	bg_event 14, 6, 0, 7, 0, 133, 121, 1

gMapEvents_SSAnne_Kitchen::
	map_events SSAnne_Kitchen_EventObjects, SSAnne_Kitchen_MapWarps, 0x0, SSAnne_Kitchen_MapBGEvents

SSAnne_CaptainsOffice_EventObjects:
	object_event 1, 63, 0, 5, 0, 4, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160B3A, 0, 0, 0

SSAnne_CaptainsOffice_MapWarps:
	warp_def 3, 7, 3, 2, 262

SSAnne_CaptainsOffice_MapBGEvents:
	bg_event 2, 4, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BD2
	bg_event 5, 3, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BC9
	bg_event 2, 3, 0, 0, 0, SSAnne_CaptainsOffice_EventScript_160BD2

gMapEvents_SSAnne_CaptainsOffice::
	map_events SSAnne_CaptainsOffice_EventObjects, SSAnne_CaptainsOffice_MapWarps, 0x0, SSAnne_CaptainsOffice_MapBGEvents

SSAnne_1F_Room1_EventObjects:
	object_event 1, 61, 0, 2, 0, 5, 0, 3, 5, 18, 0, 0, 0, 0, 0, SSAnne_1F_Room1_EventScript_160BDC, 0, 0, 0

SSAnne_1F_Room1_MapWarps:
	warp_def 2, 1, 0, 6, 261

gMapEvents_SSAnne_1F_Room1::
	map_events SSAnne_1F_Room1_EventObjects, SSAnne_1F_Room1_MapWarps, 0x0, 0x0

SSAnne_1F_Room2_EventObjects:
	object_event 1, 22, 0, 5, 0, 3, 0, 3, 17, 17, 0, 1, 0, 2, 0, SSAnne_1F_Room2_EventScript_160BEF, 0, 0, 0
	object_event 2, 18, 0, 0, 0, 4, 0, 3, 10, 17, 0, 1, 0, 3, 0, SSAnne_1F_Room2_EventScript_160C06, 0, 0, 0
	object_event 3, 28, 0, 2, 0, 6, 0, 3, 9, 17, 0, 0, 0, 1, 0, SSAnne_1F_Room2_EventScript_160BE6, 0, 0, 0
	object_event 4, 92, 0, 5, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_1F_Room2_EventScript_1BE65E, 356, 0, 0

SSAnne_1F_Room2_MapWarps:
	warp_def 2, 1, 0, 7, 261

gMapEvents_SSAnne_1F_Room2::
	map_events SSAnne_1F_Room2_EventObjects, SSAnne_1F_Room2_MapWarps, 0x0, 0x0

SSAnne_1F_Room3_EventObjects:
	object_event 1, 17, 0, 3, 0, 4, 0, 3, 52, 50, 0, 0, 0, 0, 0, SSAnne_1F_Room3_EventScript_160C1E, 0, 0, 0
	object_event 2, 131, 0, 4, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_1F_Room3_EventScript_160C30, 0, 0, 0
	object_event 3, 30, 0, 0, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SSAnne_1F_Room3_EventScript_160C27, 0, 0, 0

SSAnne_1F_Room3_MapWarps:
	warp_def 2, 1, 0, 8, 261

gMapEvents_SSAnne_1F_Room3::
	map_events SSAnne_1F_Room3_EventObjects, SSAnne_1F_Room3_MapWarps, 0x0, 0x0

SSAnne_1F_Room4_EventObjects:
	object_event 1, 23, 0, 2, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SSAnne_1F_Room4_EventScript_160C44, 0, 0, 0

SSAnne_1F_Room4_MapWarps:
	warp_def 2, 1, 0, 9, 261

gMapEvents_SSAnne_1F_Room4::
	map_events SSAnne_1F_Room4_EventObjects, SSAnne_1F_Room4_MapWarps, 0x0, 0x0

SSAnne_1F_Room5_EventObjects:
	object_event 1, 61, 0, 2, 0, 6, 0, 3, 7, 17, 0, 1, 0, 4, 0, SSAnne_1F_Room5_EventScript_160C67, 0, 0, 0

SSAnne_1F_Room5_MapWarps:
	warp_def 2, 1, 0, 10, 261

gMapEvents_SSAnne_1F_Room5::
	map_events SSAnne_1F_Room5_EventObjects, SSAnne_1F_Room5_MapWarps, 0x0, 0x0

SSAnne_1F_Room7_EventObjects:
	object_event 1, 61, 0, 4, 0, 3, 0, 3, 9, 17, 0, 1, 0, 3, 0, SSAnne_1F_Room7_EventScript_160C7F, 0, 0, 0

SSAnne_1F_Room7_MapWarps:
	warp_def 2, 1, 0, 11, 261

gMapEvents_SSAnne_1F_Room7::
	map_events SSAnne_1F_Room7_EventObjects, SSAnne_1F_Room7_MapWarps, 0x0, 0x0

SSAnne_2F_Room1_EventObjects:
	object_event 1, 61, 0, 1, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room1_EventScript_160C97, 0, 0, 0

SSAnne_2F_Room1_MapWarps:
	warp_def 4, 7, 3, 3, 262

gMapEvents_SSAnne_2F_Room1::
	map_events SSAnne_2F_Room1_EventObjects, SSAnne_2F_Room1_MapWarps, 0x0, 0x0

SSAnne_2F_Room2_EventObjects:
	object_event 1, 57, 0, 5, 0, 5, 0, 3, 9, 17, 0, 1, 0, 3, 0, SSAnne_2F_Room2_EventScript_160CB1, 0, 0, 0
	object_event 2, 61, 0, 1, 0, 4, 0, 3, 10, 17, 0, 1, 0, 2, 0, SSAnne_2F_Room2_EventScript_160CC8, 0, 0, 0
	object_event 3, 92, 0, 3, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room2_EventScript_1BE66B, 357, 0, 0

SSAnne_2F_Room2_MapWarps:
	warp_def 4, 7, 3, 4, 262

gMapEvents_SSAnne_2F_Room2::
	map_events SSAnne_2F_Room2_EventObjects, SSAnne_2F_Room2_MapWarps, 0x0, 0x0

SSAnne_2F_Room3_EventObjects:
	object_event 1, 61, 0, 2, 0, 5, 0, 3, 5, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room3_EventScript_160CE0, 0, 0, 0
	object_event 2, 32, 0, 3, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room3_EventScript_160CE9, 0, 0, 0

SSAnne_2F_Room3_MapWarps:
	warp_def 4, 7, 3, 5, 262

gMapEvents_SSAnne_2F_Room3::
	map_events SSAnne_2F_Room3_EventObjects, SSAnne_2F_Room3_MapWarps, 0x0, 0x0

SSAnne_2F_Room4_EventObjects:
	object_event 1, 61, 0, 0, 0, 5, 0, 3, 10, 17, 0, 1, 0, 3, 0, SSAnne_2F_Room4_EventScript_160CF3, 0, 0, 0
	object_event 2, 22, 0, 3, 0, 3, 0, 3, 8, 17, 0, 1, 0, 3, 0, SSAnne_2F_Room4_EventScript_160D0A, 0, 0, 0
	object_event 3, 92, 0, 2, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room4_EventScript_1BE678, 358, 0, 0

SSAnne_2F_Room4_MapWarps:
	warp_def 4, 7, 3, 6, 262

gMapEvents_SSAnne_2F_Room4::
	map_events SSAnne_2F_Room4_EventObjects, SSAnne_2F_Room4_MapWarps, 0x0, 0x0

SSAnne_2F_Room5_EventObjects:
	object_event 1, 61, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room5_EventScript_160D22, 0, 0, 0
	object_event 2, 16, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room5_EventScript_160D2B, 0, 0, 0

SSAnne_2F_Room5_MapWarps:
	warp_def 4, 7, 3, 7, 262

gMapEvents_SSAnne_2F_Room5::
	map_events SSAnne_2F_Room5_EventObjects, SSAnne_2F_Room5_MapWarps, 0x0, 0x0

SSAnne_2F_Room6_EventObjects:
	object_event 1, 31, 0, 1, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room6_EventScript_160D3E, 0, 0, 0
	object_event 2, 23, 0, 4, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, SSAnne_2F_Room6_EventScript_160D35, 0, 0, 0

SSAnne_2F_Room6_MapWarps:
	warp_def 4, 7, 3, 8, 262

gMapEvents_SSAnne_2F_Room6::
	map_events SSAnne_2F_Room6_EventObjects, SSAnne_2F_Room6_MapWarps, 0x0, 0x0

SSAnne_B1F_Room1_EventObjects:
	object_event 1, 57, 0, 5, 0, 2, 0, 3, 8, 17, 0, 1, 0, 2, 0, SSAnne_B1F_Room1_EventScript_160D48, 0, 0, 0
	object_event 2, 62, 0, 3, 0, 2, 0, 3, 8, 17, 0, 1, 0, 2, 0, SSAnne_B1F_Room1_EventScript_160D5F, 0, 0, 0

SSAnne_B1F_Room1_MapWarps:
	warp_def 4, 7, 3, 1, 264

gMapEvents_SSAnne_B1F_Room1::
	map_events SSAnne_B1F_Room1_EventObjects, SSAnne_B1F_Room1_MapWarps, 0x0, 0x0

SSAnne_B1F_Room2_EventObjects:
	object_event 1, 62, 0, 3, 0, 5, 0, 3, 1, 17, 0, 1, 0, 1, 0, SSAnne_B1F_Room2_EventScript_160D77, 0, 0, 0
	object_event 2, 92, 0, 3, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_B1F_Room2_EventScript_1BE685, 359, 0, 0

SSAnne_B1F_Room2_MapWarps:
	warp_def 4, 7, 3, 2, 264

gMapEvents_SSAnne_B1F_Room2::
	map_events SSAnne_B1F_Room2_EventObjects, SSAnne_B1F_Room2_MapWarps, 0x0, 0x0

SSAnne_B1F_Room3_EventObjects:
	object_event 1, 62, 0, 4, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, SSAnne_B1F_Room3_EventScript_160D8F, 0, 0, 0
	object_event 2, 92, 0, 1, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_B1F_Room3_EventScript_1BE692, 360, 0, 0

SSAnne_B1F_Room3_MapWarps:
	warp_def 4, 7, 3, 3, 264

gMapEvents_SSAnne_B1F_Room3::
	map_events SSAnne_B1F_Room3_EventObjects, SSAnne_B1F_Room3_MapWarps, 0x0, 0x0

SSAnne_B1F_Room4_EventObjects:
	object_event 1, 62, 0, 3, 0, 3, 0, 3, 8, 17, 0, 1, 0, 3, 0, SSAnne_B1F_Room4_EventScript_160DBE, 0, 0, 0
	object_event 2, 62, 0, 2, 0, 6, 0, 3, 1, 17, 0, 1, 0, 1, 0, SSAnne_B1F_Room4_EventScript_160DA7, 0, 0, 0

SSAnne_B1F_Room4_MapWarps:
	warp_def 4, 7, 3, 4, 264

gMapEvents_SSAnne_B1F_Room4::
	map_events SSAnne_B1F_Room4_EventObjects, SSAnne_B1F_Room4_MapWarps, 0x0, 0x0

SSAnne_B1F_Room5_EventObjects:
	object_event 1, 19, 0, 3, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_B1F_Room5_EventScript_160DD6, 0, 0, 0
	object_event 2, 134, 0, 2, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_B1F_Room5_EventScript_160DDF, 0, 0, 0
	object_event 3, 92, 0, 2, 0, 2, 0, 0, 8, 17, 0, 0, 0, 0, 0, SSAnne_B1F_Room5_EventScript_1BE69F, 361, 0, 0

SSAnne_B1F_Room5_MapWarps:
	warp_def 4, 7, 3, 5, 264

gMapEvents_SSAnne_B1F_Room5::
	map_events SSAnne_B1F_Room5_EventObjects, SSAnne_B1F_Room5_MapWarps, 0x0, 0x0

SSAnne_1F_Room6_EventObjects:
	object_event 1, 28, 0, 3, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_1F_Room6_EventScript_160DF3, 0, 0, 0

SSAnne_1F_Room6_MapWarps:
	warp_def 2, 1, 0, 12, 261

gMapEvents_SSAnne_1F_Room6::
	map_events SSAnne_1F_Room6_EventObjects, SSAnne_1F_Room6_MapWarps, 0x0, 0x0

UndergroundPath_NorthEntrance_EventObjects:
	object_event 1, 17, 0, 5, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, UndergroundPath_NorthEntrance_EventScript_160E39, 0, 0, 0

UndergroundPath_NorthEntrance_MapWarps:
	warp_def 5, 8, 3, 0, 791
	warp_def 6, 8, 3, 0, 791
	warp_def 7, 8, 3, 0, 791
	warp_def 7, 4, 3, 0, 287

gMapEvents_UndergroundPath_NorthEntrance::
	map_events UndergroundPath_NorthEntrance_EventObjects, UndergroundPath_NorthEntrance_MapWarps, 0x0, 0x0


UndergroundPath_NorthSouthTunnel_MapWarps:
	warp_def 4, 3, 3, 3, 286
	warp_def 3, 60, 3, 3, 288

UndergroundPath_NorthSouthTunnel_MapBGEvents:
	bg_event 5, 30, 3, 7, 0, 13, 70, 1
	bg_event 5, 6, 3, 7, 0, 14, 71, 1
	bg_event 2, 57, 3, 7, 0, 15, 74, 1
	bg_event 1, 24, 3, 7, 0, 17, 73, 1
	bg_event 6, 53, 3, 7, 0, 16, 75, 1
	bg_event 3, 15, 3, 7, 0, 18, 72, 1
	bg_event 3, 39, 3, 7, 0, 34, 76, 1

gMapEvents_UndergroundPath_NorthSouthTunnel::
	map_events 0x0, UndergroundPath_NorthSouthTunnel_MapWarps, 0x0, UndergroundPath_NorthSouthTunnel_MapBGEvents

UndergroundPath_SouthEntrance_EventObjects:
	object_event 1, 28, 0, 5, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, UndergroundPath_SouthEntrance_EventScript_160EC0, 0, 0, 0

UndergroundPath_SouthEntrance_MapWarps:
	warp_def 5, 8, 3, 0, 792
	warp_def 6, 8, 3, 0, 792
	warp_def 7, 8, 3, 0, 792
	warp_def 7, 4, 3, 1, 287

gMapEvents_UndergroundPath_SouthEntrance::
	map_events UndergroundPath_SouthEntrance_EventObjects, UndergroundPath_SouthEntrance_MapWarps, 0x0, 0x0

UndergroundPath_WestEntrance_EventObjects:
	object_event 1, 30, 0, 5, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, UndergroundPath_WestEntrance_EventScript_160ECA, 0, 0, 0

UndergroundPath_WestEntrance_MapWarps:
	warp_def 5, 8, 3, 0, 793
	warp_def 6, 8, 3, 0, 793
	warp_def 7, 8, 3, 0, 793
	warp_def 7, 4, 3, 1, 290

gMapEvents_UndergroundPath_WestEntrance::
	map_events UndergroundPath_WestEntrance_EventObjects, UndergroundPath_WestEntrance_MapWarps, 0x0, 0x0


UndergroundPath_EastWestTunnel_MapWarps:
	warp_def 76, 3, 3, 3, 291
	warp_def 3, 4, 3, 3, 289

UndergroundPath_EastWestTunnel_MapBGEvents:
	bg_event 7, 3, 3, 7, 0, 13, 77, 1
	bg_event 17, 5, 3, 7, 0, 18, 79, 1
	bg_event 31, 4, 3, 7, 0, 17, 80, 1
	bg_event 45, 3, 3, 7, 0, 15, 81, 1
	bg_event 70, 3, 3, 7, 0, 16, 82, 1
	bg_event 55, 2, 3, 7, 0, 34, 83, 1
	bg_event 62, 5, 3, 7, 0, 14, 78, 1

gMapEvents_UndergroundPath_EastWestTunnel::
	map_events 0x0, UndergroundPath_EastWestTunnel_MapWarps, 0x0, UndergroundPath_EastWestTunnel_MapBGEvents

UndergroundPath_EastEntrance_EventObjects:
	object_event 1, 28, 0, 5, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, UndergroundPath_EastEntrance_EventScript_160EDE, 0, 0, 0

UndergroundPath_EastEntrance_MapWarps:
	warp_def 5, 8, 3, 0, 794
	warp_def 6, 8, 3, 0, 794
	warp_def 7, 8, 3, 0, 794
	warp_def 7, 4, 3, 0, 290

gMapEvents_UndergroundPath_EastEntrance::
	map_events UndergroundPath_EastEntrance_EventObjects, UndergroundPath_EastEntrance_MapWarps, 0x0, 0x0

DiglettsCave_NorthEntrance_EventObjects:
	object_event 1, 56, 0, 4, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, DiglettsCave_NorthEntrance_EventScript_160EE8, 0, 0, 0

DiglettsCave_NorthEntrance_MapWarps:
	warp_def 6, 4, 3, 0, 293
	warp_def 4, 6, 3, 3, 788

gMapEvents_DiglettsCave_NorthEntrance::
	map_events DiglettsCave_NorthEntrance_EventObjects, DiglettsCave_NorthEntrance_MapWarps, 0x0, 0x0


DiglettsCave_B1F_MapWarps:
	warp_def 3, 3, 3, 0, 292
	warp_def 82, 71, 3, 1, 294

gMapEvents_DiglettsCave_B1F::
	map_events 0x0, DiglettsCave_B1F_MapWarps, 0x0, 0x0

DiglettsCave_SouthEntrance_EventObjects:
	object_event 1, 32, 0, 4, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, DiglettsCave_SouthEntrance_EventScript_160EFC, 0, 0, 0

DiglettsCave_SouthEntrance_MapWarps:
	warp_def 4, 6, 3, 0, 797
	warp_def 6, 4, 3, 1, 293

gMapEvents_DiglettsCave_SouthEntrance::
	map_events DiglettsCave_SouthEntrance_EventObjects, DiglettsCave_SouthEntrance_MapWarps, 0x0, 0x0

VictoryRoad_1F_EventObjects:
	object_event 1, 41, 0, 5, 0, 2, 0, 3, 8, 17, 0, 1, 0, 4, 0, VictoryRoad_1F_EventScript_160F7B, 0, 0, 0
	object_event 2, 42, 0, 14, 0, 6, 0, 4, 8, 17, 0, 1, 0, 4, 0, VictoryRoad_1F_EventScript_160F64, 0, 0, 0
	object_event 3, 92, 0, 12, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE9D2, 425, 0, 0
	object_event 4, 92, 0, 14, 0, 1, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE9DF, 426, 0, 0
	object_event 5, 97, 0, 7, 0, 18, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0
	object_event 6, 97, 0, 4, 0, 12, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0
	object_event 7, 97, 0, 16, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_1F_EventScript_1BE11D, 0, 0, 0

VictoryRoad_1F_MapWarps:
	warp_def 3, 2, 3, 0, 296
	warp_def 11, 20, 3, 0, 810

VictoryRoad_1F_MapCoordEvents:
	coord_event 20, 16, 3, 0, 16484, 99, 0, VictoryRoad_1F_EventScript_160F33

VictoryRoad_1F_MapBGEvents:
	bg_event 12, 12, 0, 7, 0, 2, 37, 1
	bg_event 16, 1, 0, 7, 0, 19, 38, 1

gMapEvents_VictoryRoad_1F::
	map_events VictoryRoad_1F_EventObjects, VictoryRoad_1F_MapWarps, VictoryRoad_1F_MapCoordEvents, VictoryRoad_1F_MapBGEvents

VictoryRoad_2F_EventObjects:
	object_event 1, 52, 0, 7, 0, 4, 0, 3, 8, 17, 0, 1, 0, 1, 0, VictoryRoad_2F_EventScript_161037, 0, 0, 0
	object_event 2, 54, 0, 20, 0, 11, 0, 4, 17, 17, 0, 1, 0, 4, 0, VictoryRoad_2F_EventScript_16104E, 0, 0, 0
	object_event 3, 26, 0, 31, 0, 16, 0, 4, 9, 17, 0, 1, 0, 4, 0, VictoryRoad_2F_EventScript_161065, 0, 0, 0
	object_event 4, 25, 0, 26, 0, 6, 0, 3, 40, 68, 0, 1, 0, 1, 0, VictoryRoad_2F_EventScript_161093, 0, 0, 0
	object_event 5, 26, 0, 36, 0, 5, 0, 3, 7, 17, 0, 1, 0, 3, 0, VictoryRoad_2F_EventScript_16107C, 0, 0, 0
	object_event 6, 92, 0, 17, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BE9EC, 427, 0, 0
	object_event 7, 92, 0, 40, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BE9F9, 428, 0, 0
	object_event 8, 92, 0, 25, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BEA06, 429, 0, 0
	object_event 9, 92, 0, 14, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BEA13, 430, 0, 0
	object_event 10, 97, 0, 8, 0, 7, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BE11D, 0, 0, 0
	object_event 11, 97, 0, 6, 0, 17, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BE11D, 0, 0, 0
	object_event 12, 97, 0, 33, 0, 19, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1BE11D, 88, 0, 0
	object_event 13, 41, 0, 40, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_2F_EventScript_1C47AE, 0, 0, 0

VictoryRoad_2F_MapWarps:
	warp_def 1, 9, 3, 0, 295
	warp_def 3, 3, 3, 0, 297
	warp_def 34, 9, 3, 1, 297
	warp_def 38, 9, 3, 2, 297
	warp_def 36, 17, 4, 3, 297
	warp_def 49, 13, 0, 1, 810
	warp_def 48, 12, 3, 1, 810
	warp_def 47, 13, 0, 1, 810
	warp_def 34, 19, 3, 4, 297

VictoryRoad_2F_MapCoordEvents:
	coord_event 2, 19, 3, 0, 16485, 99, 0, VictoryRoad_2F_EventScript_160FD5
	coord_event 14, 19, 3, 0, 16486, 99, 0, VictoryRoad_2F_EventScript_161006

gMapEvents_VictoryRoad_2F::
	map_events VictoryRoad_2F_EventObjects, VictoryRoad_2F_MapWarps, VictoryRoad_2F_MapCoordEvents, 0x0

VictoryRoad_3F_EventObjects:
	object_event 1, 41, 0, 40, 0, 7, 0, 3, 9, 17, 0, 1, 0, 1, 0, VictoryRoad_3F_EventScript_161103, 0, 0, 0
	object_event 2, 42, 0, 21, 0, 5, 0, 4, 10, 17, 0, 1, 0, 4, 0, VictoryRoad_3F_EventScript_161148, 0, 0, 0
	object_event 3, 41, 0, 10, 0, 17, 0, 3, 9, 17, 0, 1, 0, 5, 0, VictoryRoad_3F_EventScript_16111A, 0, 0, 0
	object_event 4, 42, 0, 11, 0, 16, 0, 3, 10, 17, 0, 1, 0, 5, 0, VictoryRoad_3F_EventScript_161131, 0, 0, 0
	object_event 5, 92, 0, 38, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_3F_EventScript_1BEA20, 431, 0, 0
	object_event 6, 92, 0, 12, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, VictoryRoad_3F_EventScript_1BEA2D, 432, 0, 0
	object_event 7, 97, 0, 19, 0, 15, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_3F_EventScript_1BE11D, 0, 0, 0
	object_event 8, 97, 0, 33, 0, 18, 0, 0, 8, 0, 0, 88, 0, 0, 0, VictoryRoad_3F_EventScript_1BE11D, 89, 0, 0
	object_event 9, 97, 0, 35, 0, 13, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_3F_EventScript_1BE11D, 0, 0, 0
	object_event 10, 97, 0, 32, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, VictoryRoad_3F_EventScript_1BE11D, 0, 0, 0
	object_event 11, 41, 0, 38, 0, 13, 0, 3, 8, 17, 0, 1, 0, 1, 0, VictoryRoad_3F_EventScript_16115F, 0, 0, 0
	object_event 12, 42, 0, 39, 0, 13, 0, 3, 8, 17, 0, 1, 0, 1, 0, VictoryRoad_3F_EventScript_16117A, 0, 0, 0

VictoryRoad_3F_MapWarps:
	warp_def 5, 2, 3, 1, 296
	warp_def 34, 9, 3, 2, 296
	warp_def 37, 10, 3, 3, 296
	warp_def 39, 17, 3, 4, 296
	warp_def 34, 18, 3, 8, 296

VictoryRoad_3F_MapCoordEvents:
	coord_event 7, 7, 3, 0, 16487, 99, 0, VictoryRoad_3F_EventScript_1610CF

gMapEvents_VictoryRoad_3F::
	map_events VictoryRoad_3F_EventObjects, VictoryRoad_3F_MapWarps, VictoryRoad_3F_MapCoordEvents, 0x0

RocketHideout_B1F_EventObjects:
	object_event 1, 49, 0, 4, 0, 9, 0, 3, 10, 17, 0, 1, 0, 5, 0, RocketHideout_B1F_EventScript_1611C5, 173, 0, 0
	object_event 2, 49, 0, 24, 0, 12, 0, 3, 9, 17, 0, 1, 0, 2, 0, RocketHideout_B1F_EventScript_1611AE, 173, 0, 0
	object_event 3, 49, 0, 6, 0, 32, 0, 3, 10, 17, 0, 1, 0, 4, 0, RocketHideout_B1F_EventScript_1611F3, 173, 0, 0
	object_event 4, 49, 0, 10, 0, 22, 0, 3, 8, 17, 0, 1, 0, 3, 0, RocketHideout_B1F_EventScript_1611DC, 173, 0, 0
	object_event 5, 49, 0, 21, 0, 27, 0, 3, 16, 17, 0, 1, 0, 3, 0, RocketHideout_B1F_EventScript_16120A, 173, 0, 0
	object_event 6, 92, 0, 5, 0, 16, 0, 0, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B1F_EventScript_1BE6C6, 364, 0, 0
	object_event 7, 92, 0, 1, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B1F_EventScript_1BE6D3, 365, 0, 0

RocketHideout_B1F_MapWarps:
	warp_def 12, 2, 3, 3, 2574
	warp_def 17, 2, 3, 1, 299
	warp_def 15, 30, 3, 2, 299
	warp_def 23, 25, 0, 1, 302
	warp_def 24, 25, 0, 1, 302
	warp_def 25, 25, 0, 1, 302

RocketHideout_B1F_MapBGEvents:
	bg_event 16, 17, 0, 7, 0, 69, 11, 1

gMapEvents_RocketHideout_B1F::
	map_events RocketHideout_B1F_EventObjects, RocketHideout_B1F_MapWarps, 0x0, RocketHideout_B1F_MapBGEvents

RocketHideout_B2F_EventObjects:
	object_event 1, 49, 0, 20, 0, 6, 0, 3, 1, 17, 0, 1, 0, 2, 0, RocketHideout_B2F_EventScript_1612A2, 173, 0, 0
	object_event 2, 92, 0, 15, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B2F_EventScript_1BE6E0, 366, 0, 0
	object_event 3, 92, 0, 2, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B2F_EventScript_1BE6ED, 367, 0, 0
	object_event 4, 92, 0, 5, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B2F_EventScript_1BE6FA, 368, 0, 0
	object_event 5, 92, 0, 0, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B2F_EventScript_1BE707, 369, 0, 0

RocketHideout_B2F_MapWarps:
	warp_def 21, 2, 3, 0, 300
	warp_def 28, 2, 3, 1, 298
	warp_def 23, 12, 3, 2, 298
	warp_def 28, 16, 0, 1, 302
	warp_def 29, 16, 0, 1, 302

gMapEvents_RocketHideout_B2F::
	map_events RocketHideout_B2F_EventObjects, RocketHideout_B2F_MapWarps, 0x0, 0x0

RocketHideout_B3F_EventObjects:
	object_event 1, 49, 0, 19, 0, 9, 0, 3, 7, 17, 0, 1, 0, 4, 0, RocketHideout_B3F_EventScript_1612D1, 173, 0, 0
	object_event 2, 49, 0, 2, 0, 20, 0, 3, 10, 17, 0, 1, 0, 2, 0, RocketHideout_B3F_EventScript_1612BA, 173, 0, 0
	object_event 3, 92, 0, 12, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BE714, 370, 0, 0
	object_event 4, 92, 0, 19, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BE721, 371, 0, 0
	object_event 5, 92, 0, 14, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B3F_EventScript_1BEBCD, 466, 0, 0

RocketHideout_B3F_MapWarps:
	warp_def 18, 2, 3, 0, 299
	warp_def 15, 18, 3, 0, 301

RocketHideout_B3F_MapBGEvents:
	bg_event 1, 3, 3, 7, 0, 110, 12, 1

gMapEvents_RocketHideout_B3F::
	map_events RocketHideout_B3F_EventObjects, RocketHideout_B3F_MapWarps, 0x0, RocketHideout_B3F_MapBGEvents

RocketHideout_B4F_EventObjects:
	object_event 1, 87, 0, 19, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_161317, 56, 0, 0
	object_event 2, 92, 0, 20, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_161363, 55, 0, 0
	object_event 3, 49, 0, 4, 0, 2, 0, 3, 8, 17, 0, 1, 0, 1, 0, RocketHideout_B4F_EventScript_161381, 173, 0, 0
	object_event 4, 92, 0, 3, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_1613AD, 54, 0, 0
	object_event 5, 49, 0, 19, 0, 14, 0, 3, 8, 17, 0, 1, 0, 0, 0, RocketHideout_B4F_EventScript_161418, 173, 0, 0
	object_event 6, 49, 0, 16, 0, 14, 0, 3, 8, 17, 0, 1, 0, 0, 0, RocketHideout_B4F_EventScript_1613CE, 173, 0, 0
	object_event 7, 92, 0, 1, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_1BE72E, 372, 0, 0
	object_event 8, 92, 0, 4, 0, 14, 0, 0, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_1BE73B, 373, 0, 0
	object_event 9, 92, 0, 6, 0, 23, 0, 0, 8, 17, 0, 0, 0, 0, 0, RocketHideout_B4F_EventScript_1BE748, 374, 0, 0

RocketHideout_B4F_MapWarps:
	warp_def 11, 15, 3, 1, 300
	warp_def 20, 23, 0, 1, 302
	warp_def 21, 23, 0, 1, 302

RocketHideout_B4F_MapBGEvents:
	bg_event 22, 6, 3, 7, 0, 8, 13, 1
	bg_event 16, 6, 3, 7, 0, 6, 134, 1

gMapEvents_RocketHideout_B4F::
	map_events RocketHideout_B4F_EventObjects, RocketHideout_B4F_MapWarps, 0x0, RocketHideout_B4F_MapBGEvents


RocketHideout_Elevator_MapWarps:
	warp_def 1, 5, 3, 127, 32639
	warp_def 2, 5, 3, 127, 32639

RocketHideout_Elevator_MapBGEvents:
	bg_event 0, 2, 0, 0, 0, RocketHideout_Elevator_EventScript_1614D9

gMapEvents_RocketHideout_Elevator::
	map_events 0x0, RocketHideout_Elevator_MapWarps, 0x0, RocketHideout_Elevator_MapBGEvents

SilphCo_1F_EventObjects:
	object_event 1, 48, 0, 3, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_1F_EventScript_16162F, 63, 0, 0

SilphCo_1F_MapWarps:
	warp_def 7, 21, 0, 0, 778
	warp_def 8, 20, 3, 0, 778
	warp_def 9, 20, 3, 0, 778
	warp_def 31, 2, 3, 3, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_1F_MapBGEvents:
	bg_event 30, 1, 0, 0, 0, SilphCo_1F_EventScript_161638

gMapEvents_SilphCo_1F::
	map_events SilphCo_1F_EventObjects, SilphCo_1F_MapWarps, 0x0, SilphCo_1F_MapBGEvents

SilphCo_2F_EventObjects:
	object_event 1, 49, 0, 29, 0, 12, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_2F_EventScript_1616AE, 83, 0, 0
	object_event 2, 55, 0, 28, 0, 18, 0, 3, 15, 17, 0, 1, 0, 4, 0, SilphCo_2F_EventScript_161680, 83, 0, 0
	object_event 3, 49, 0, 20, 0, 14, 0, 3, 13, 17, 0, 1, 0, 3, 0, SilphCo_2F_EventScript_161697, 83, 0, 0
	object_event 4, 55, 0, 5, 0, 19, 0, 3, 1, 17, 0, 1, 0, 0, 0, SilphCo_2F_EventScript_161669, 83, 0, 0
	object_event 5, 28, 0, 10, 0, 4, 0, 0, 7, 17, 0, 0, 0, 0, 0, SilphCo_2F_EventScript_16165A, 0, 0, 0

SilphCo_2F_MapWarps:
	warp_def 28, 2, 3, 0, 305
	warp_def 2, 6, 3, 8, 305
	warp_def 15, 6, 3, 5, 310
	warp_def 30, 2, 3, 3, 303
	warp_def 7, 19, 3, 1, 308
	warp_def 33, 19, 3, 2, 310
	warp_def 22, 3, 0, 0, 314

SilphCo_2F_MapBGEvents:
	bg_event 5, 8, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 6, 8, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 5, 9, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 6, 9, 0, 0, 0, SilphCo_2F_EventScript_1A891B
	bg_event 5, 15, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 6, 15, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 5, 16, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 6, 16, 0, 0, 0, SilphCo_2F_EventScript_1A8935
	bg_event 11, 21, 0, 7, 0, 2, 135, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_2F_EventScript_161660

gMapEvents_SilphCo_2F::
	map_events SilphCo_2F_EventObjects, SilphCo_2F_MapWarps, 0x0, SilphCo_2F_MapBGEvents

SilphCo_3F_EventObjects:
	object_event 1, 49, 0, 25, 0, 9, 0, 3, 9, 17, 0, 1, 0, 3, 0, SilphCo_3F_EventScript_16171F, 83, 0, 0
	object_event 2, 47, 0, 31, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_3F_EventScript_1616DE, 0, 0, 0
	object_event 3, 55, 0, 4, 0, 12, 0, 3, 1, 17, 0, 1, 0, 0, 0, SilphCo_3F_EventScript_161708, 83, 0, 0
	object_event 4, 92, 0, 8, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_3F_EventScript_1BE866, 396, 0, 0

SilphCo_3F_MapWarps:
	warp_def 28, 2, 3, 0, 304
	warp_def 4, 6, 3, 1, 307
	warp_def 13, 14, 3, 4, 309
	warp_def 30, 2, 3, 2, 306
	warp_def 2, 14, 3, 2, 311
	warp_def 3, 20, 3, 4, 307
	warp_def 29, 14, 3, 7, 305
	warp_def 32, 20, 3, 6, 305
	warp_def 33, 5, 3, 1, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_3F_MapBGEvents:
	bg_event 10, 12, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 10, 13, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 21, 12, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 21, 13, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 9, 12, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 9, 13, 3, 0, 0, SilphCo_3F_EventScript_1A894F
	bg_event 20, 12, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 20, 13, 3, 0, 0, SilphCo_3F_EventScript_1A8969
	bg_event 34, 18, 0, 7, 0, 64, 136, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_3F_EventScript_1616FF

gMapEvents_SilphCo_3F::
	map_events SilphCo_3F_EventObjects, SilphCo_3F_MapWarps, 0x0, SilphCo_3F_MapBGEvents

SilphCo_4F_EventObjects:
	object_event 1, 49, 0, 33, 0, 16, 0, 3, 2, 17, 0, 1, 0, 1, 0, SilphCo_4F_EventScript_1617A7, 83, 0, 0
	object_event 2, 49, 0, 10, 0, 19, 0, 3, 10, 17, 0, 1, 0, 5, 0, SilphCo_4F_EventScript_161790, 83, 0, 0
	object_event 3, 55, 0, 14, 0, 8, 0, 3, 17, 17, 0, 1, 0, 2, 0, SilphCo_4F_EventScript_161779, 83, 0, 0
	object_event 4, 47, 0, 5, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_16174F, 0, 0, 0
	object_event 5, 92, 0, 3, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE873, 397, 0, 0
	object_event 6, 92, 0, 4, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE880, 398, 0, 0
	object_event 7, 92, 0, 2, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BE88D, 399, 0, 0
	object_event 8, 92, 0, 30, 0, 18, 0, 0, 8, 17, 0, 0, 0, 0, 0, SilphCo_4F_EventScript_1BEE09, 510, 0, 0

SilphCo_4F_MapWarps:
	warp_def 28, 2, 3, 0, 307
	warp_def 18, 6, 3, 3, 308
	warp_def 30, 2, 3, 3, 305
	warp_def 12, 9, 3, 1, 312
	warp_def 2, 20, 3, 4, 312
	warp_def 18, 14, 3, 2, 312
	warp_def 22, 3, 0, 0, 314

SilphCo_4F_MapBGEvents:
	bg_event 3, 16, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 4, 16, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 3, 17, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 4, 17, 0, 0, 0, SilphCo_4F_EventScript_1A8983
	bg_event 15, 11, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 14, 11, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 14, 12, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 15, 12, 0, 0, 0, SilphCo_4F_EventScript_1A899D
	bg_event 35, 20, 0, 7, 0, 65, 137, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_4F_EventScript_161770

gMapEvents_SilphCo_4F::
	map_events SilphCo_4F_EventObjects, SilphCo_4F_MapWarps, 0x0, SilphCo_4F_MapBGEvents

SilphCo_5F_EventObjects:
	object_event 1, 49, 0, 35, 0, 7, 0, 3, 7, 17, 0, 1, 0, 2, 0, SilphCo_5F_EventScript_161853, 83, 0, 0
	object_event 2, 26, 0, 23, 0, 13, 0, 3, 13, 17, 0, 1, 0, 4, 0, SilphCo_5F_EventScript_16186A, 83, 0, 0
	object_event 3, 47, 0, 16, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1617E0, 0, 0, 0
	object_event 4, 55, 0, 11, 0, 6, 0, 3, 2, 17, 0, 1, 0, 1, 0, SilphCo_5F_EventScript_161825, 83, 0, 0
	object_event 5, 49, 0, 9, 0, 21, 0, 3, 16, 17, 0, 1, 0, 3, 0, SilphCo_5F_EventScript_16183C, 83, 0, 0
	object_event 6, 92, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE89A, 400, 0, 0
	object_event 7, 92, 0, 1, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE8A7, 401, 0, 0
	object_event 8, 92, 0, 22, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1BE8B4, 402, 0, 0
	object_event 9, 55, 0, 2, 0, 7, 0, 3, 28, 18, 0, 0, 0, 0, 0, SilphCo_5F_EventScript_1AD0D4, 0, 0, 0

SilphCo_5F_MapWarps:
	warp_def 28, 2, 3, 0, 306
	warp_def 15, 7, 3, 1, 305
	warp_def 30, 2, 3, 2, 308
	warp_def 10, 20, 3, 1, 311
	warp_def 2, 20, 3, 5, 305
	warp_def 33, 5, 3, 2, 309
	warp_def 22, 3, 0, 0, 314

SilphCo_5F_MapBGEvents:
	bg_event 13, 16, 0, 7, 0, 36, 24, 1
	bg_event 8, 9, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 8, 10, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 8, 18, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 8, 19, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 19, 13, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 19, 14, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 7, 9, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 7, 10, 0, 0, 0, SilphCo_5F_EventScript_1A89B7
	bg_event 7, 19, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 7, 18, 0, 0, 0, SilphCo_5F_EventScript_1A89D1
	bg_event 18, 13, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 18, 14, 0, 0, 0, SilphCo_5F_EventScript_1A89EB
	bg_event 28, 11, 0, 0, 0, SilphCo_5F_EventScript_161813
	bg_event 30, 13, 0, 0, 0, SilphCo_5F_EventScript_16180A
	bg_event 25, 15, 0, 0, 0, SilphCo_5F_EventScript_161801
	bg_event 32, 9, 0, 7, 0, 69, 138, 1
	bg_event 29, 1, 0, 0, 0, SilphCo_5F_EventScript_16181C

gMapEvents_SilphCo_5F::
	map_events SilphCo_5F_EventObjects, SilphCo_5F_MapWarps, 0x0, SilphCo_5F_MapBGEvents

SilphCo_6F_EventObjects:
	object_event 1, 49, 0, 21, 0, 5, 0, 3, 10, 17, 0, 1, 0, 2, 0, SilphCo_6F_EventScript_161956, 83, 0, 0
	object_event 2, 47, 0, 23, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618D3, 0, 0, 0
	object_event 3, 48, 0, 24, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618F4, 0, 0, 0
	object_event 4, 47, 0, 22, 0, 13, 0, 3, 7, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_161891, 0, 0, 0
	object_event 5, 47, 0, 14, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1618B2, 0, 0, 0
	object_event 6, 48, 0, 16, 0, 12, 0, 3, 10, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_161915, 0, 0, 0
	object_event 7, 55, 0, 9, 0, 11, 0, 3, 8, 17, 0, 1, 0, 4, 0, SilphCo_6F_EventScript_16193F, 83, 0, 0
	object_event 8, 92, 0, 2, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1BE8C1, 403, 0, 0
	object_event 9, 92, 0, 1, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_6F_EventScript_1BE8CE, 404, 0, 0
	object_event 10, 49, 0, 18, 0, 17, 0, 3, 9, 17, 0, 1, 0, 2, 0, SilphCo_6F_EventScript_16196D, 83, 0, 0

SilphCo_6F_MapWarps:
	warp_def 14, 2, 3, 0, 309
	warp_def 29, 5, 3, 4, 304
	warp_def 26, 2, 3, 2, 307
	warp_def 2, 6, 3, 1, 306
	warp_def 20, 3, 0, 0, 314

SilphCo_6F_MapBGEvents:
	bg_event 6, 15, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 6, 16, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 5, 15, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 5, 16, 0, 0, 0, SilphCo_6F_EventScript_1A8A05
	bg_event 1, 8, 0, 7, 0, 66, 139, 1
	bg_event 25, 1, 0, 0, 0, SilphCo_6F_EventScript_161936

gMapEvents_SilphCo_6F::
	map_events SilphCo_6F_EventObjects, SilphCo_6F_MapWarps, 0x0, SilphCo_6F_MapBGEvents

SilphCo_7F_EventObjects:
	object_event 1, 72, 0, 2, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 78, 0, 0
	object_event 2, 47, 0, 0, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161AC8, 0, 0, 0
	object_event 3, 49, 0, 24, 0, 5, 0, 3, 9, 17, 0, 1, 0, 4, 0, SilphCo_7F_EventScript_161C1A, 83, 0, 0
	object_event 4, 49, 0, 24, 0, 15, 0, 3, 10, 17, 0, 1, 0, 2, 0, SilphCo_7F_EventScript_161C31, 83, 0, 0
	object_event 5, 49, 0, 13, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, SilphCo_7F_EventScript_161C48, 83, 0, 0
	object_event 6, 48, 0, 10, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161BD9, 0, 0, 0
	object_event 7, 47, 0, 13, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161B97, 0, 0, 0
	object_event 8, 47, 0, 9, 0, 14, 0, 3, 27, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_161BB8, 0, 0, 0
	object_event 9, 55, 0, 3, 0, 13, 0, 3, 5, 18, 0, 1, 0, 1, 0, SilphCo_7F_EventScript_161C03, 83, 0, 0
	object_event 10, 92, 0, 0, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_1BE8DB, 405, 0, 0
	object_event 11, 92, 0, 30, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_7F_EventScript_1BE8E8, 406, 0, 0

SilphCo_7F_MapWarps:
	warp_def 19, 2, 3, 0, 308
	warp_def 5, 8, 3, 1, 313
	warp_def 25, 17, 3, 5, 307
	warp_def 27, 2, 3, 3, 310
	warp_def 5, 4, 3, 2, 305
	warp_def 23, 3, 0, 0, 314

SilphCo_7F_MapCoordEvents:
	coord_event 2, 4, 3, 0, 16476, 0, 0, SilphCo_7F_EventScript_1619BC
	coord_event 2, 5, 3, 0, 16476, 0, 0, SilphCo_7F_EventScript_1619C8

SilphCo_7F_MapBGEvents:
	bg_event 11, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 12, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 11, 9, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 12, 9, 0, 0, 0, SilphCo_7F_EventScript_1A8A1F
	bg_event 24, 7, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 7, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 24, 8, 0, 0, 0, SilphCo_7F_EventScript_1A8A39
	bg_event 25, 13, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 26, 13, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 25, 14, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 26, 14, 0, 0, 0, SilphCo_7F_EventScript_1A8A53
	bg_event 22, 11, 0, 7, 0, 70, 140, 1
	bg_event 20, 1, 0, 0, 0, SilphCo_7F_EventScript_161BFA

gMapEvents_SilphCo_7F::
	map_events SilphCo_7F_EventObjects, SilphCo_7F_MapWarps, SilphCo_7F_MapCoordEvents, SilphCo_7F_MapBGEvents

SilphCo_8F_EventObjects:
	object_event 1, 49, 0, 28, 0, 5, 0, 3, 9, 17, 0, 1, 0, 4, 0, SilphCo_8F_EventScript_161CB0, 83, 0, 0
	object_event 2, 49, 0, 10, 0, 17, 0, 3, 10, 17, 0, 1, 0, 5, 0, SilphCo_8F_EventScript_161CC7, 83, 0, 0
	object_event 3, 55, 0, 9, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, SilphCo_8F_EventScript_161C99, 83, 0, 0
	object_event 4, 47, 0, 2, 0, 5, 0, 3, 5, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_161C6F, 0, 0, 0
	object_event 5, 92, 0, 24, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_1BEB4B, 456, 0, 0
	object_event 6, 55, 0, 29, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_8F_EventScript_1AD0ED, 0, 0, 0

SilphCo_8F_MapWarps:
	warp_def 16, 2, 3, 0, 311
	warp_def 11, 10, 3, 4, 310
	warp_def 10, 6, 3, 5, 304
	warp_def 28, 2, 3, 3, 309
	warp_def 2, 12, 3, 1, 310
	warp_def 2, 17, 3, 2, 304
	warp_def 22, 3, 0, 0, 314

SilphCo_8F_MapBGEvents:
	bg_event 6, 10, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 6, 11, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 5, 11, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 5, 10, 0, 0, 0, SilphCo_8F_EventScript_1A8A6D
	bg_event 29, 10, 0, 7, 0, 110, 141, 1
	bg_event 27, 1, 0, 0, 0, SilphCo_8F_EventScript_161C90

gMapEvents_SilphCo_8F::
	map_events SilphCo_8F_EventObjects, SilphCo_8F_MapWarps, 0x0, SilphCo_8F_MapBGEvents

SilphCo_9F_EventObjects:
	object_event 1, 55, 0, 26, 0, 16, 0, 3, 3, 17, 0, 1, 0, 2, 0, SilphCo_9F_EventScript_161D41, 83, 0, 0
	object_event 2, 49, 0, 15, 0, 18, 0, 3, 7, 17, 0, 1, 0, 3, 0, SilphCo_9F_EventScript_161D6F, 83, 0, 0
	object_event 3, 28, 0, 2, 0, 16, 0, 0, 8, 17, 0, 0, 0, 0, 0, SilphCo_9F_EventScript_161D09, 0, 0, 0
	object_event 4, 49, 0, 1, 0, 6, 0, 3, 8, 17, 0, 1, 0, 5, 0, SilphCo_9F_EventScript_161D58, 83, 0, 0

SilphCo_9F_MapWarps:
	warp_def 16, 2, 0, 0, 310
	warp_def 22, 18, 3, 3, 307
	warp_def 9, 4, 3, 4, 305
	warp_def 18, 2, 3, 3, 312
	warp_def 24, 3, 0, 0, 314

SilphCo_9F_MapBGEvents:
	bg_event 11, 14, 3, 7, 0, 20, 25, 1
	bg_event 3, 10, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 3, 11, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 13, 16, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 13, 17, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 21, 6, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 22, 6, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 22, 7, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 21, 7, 0, 0, 0, SilphCo_9F_EventScript_1A8ABB
	bg_event 21, 13, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 21, 12, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 22, 12, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 22, 13, 0, 0, 0, SilphCo_9F_EventScript_1A8AD5
	bg_event 2, 11, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 2, 10, 0, 0, 0, SilphCo_9F_EventScript_1A8A87
	bg_event 12, 16, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 12, 17, 0, 0, 0, SilphCo_9F_EventScript_1A8AA1
	bg_event 5, 8, 0, 7, 0, 67, 142, 1
	bg_event 17, 1, 0, 0, 0, SilphCo_9F_EventScript_161D38

gMapEvents_SilphCo_9F::
	map_events SilphCo_9F_EventObjects, SilphCo_9F_MapWarps, 0x0, SilphCo_9F_MapBGEvents

SilphCo_10F_EventObjects:
	object_event 1, 55, 0, 2, 0, 7, 0, 3, 2, 34, 0, 1, 0, 1, 0, SilphCo_10F_EventScript_161DC0, 83, 0, 0
	object_event 2, 48, 0, 10, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_161D96, 0, 0, 0
	object_event 3, 49, 0, 0, 0, 13, 0, 3, 10, 17, 0, 1, 0, 4, 0, SilphCo_10F_EventScript_161DD7, 83, 0, 0
	object_event 4, 92, 0, 5, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE8F5, 407, 0, 0
	object_event 5, 92, 0, 2, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE902, 408, 0, 0
	object_event 6, 92, 0, 3, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_10F_EventScript_1BE90F, 409, 0, 0

SilphCo_10F_MapWarps:
	warp_def 6, 2, 3, 0, 313
	warp_def 10, 14, 3, 3, 306
	warp_def 14, 9, 3, 5, 306
	warp_def 8, 2, 3, 3, 311
	warp_def 14, 17, 3, 4, 306
	warp_def 13, 3, 0, 0, 314

SilphCo_10F_MapBGEvents:
	bg_event 12, 11, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 13, 11, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 12, 12, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 13, 12, 0, 0, 0, SilphCo_10F_EventScript_1A8AEF
	bg_event 9, 9, 0, 7, 0, 63, 143, 1
	bg_event 7, 1, 0, 0, 0, SilphCo_10F_EventScript_161DB7

gMapEvents_SilphCo_10F::
	map_events SilphCo_10F_EventObjects, SilphCo_10F_MapWarps, 0x0, SilphCo_10F_MapBGEvents

SilphCo_11F_EventObjects:
	object_event 1, 33, 0, 9, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_161DFE, 0, 0, 0
	object_event 2, 48, 0, 11, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_161E7F, 0, 0, 0
	object_event 3, 87, 0, 6, 0, 11, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 83, 0, 0
	object_event 4, 49, 0, 16, 0, 12, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_11F_EventScript_161F40, 83, 0, 0
	object_event 5, 92, 0, 16, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SilphCo_11F_EventScript_1BEB58, 457, 0, 0
	object_event 6, 49, 0, 2, 0, 19, 0, 3, 7, 17, 0, 1, 0, 5, 0, SilphCo_11F_EventScript_161F57, 83, 0, 0

SilphCo_11F_MapWarps:
	warp_def 7, 2, 3, 0, 312
	warp_def 2, 5, 3, 1, 309
	warp_def 13, 3, 0, 0, 314

SilphCo_11F_MapCoordEvents:
	coord_event 5, 15, 3, 0, 16480, 0, 0, SilphCo_11F_EventScript_161E88
	coord_event 6, 15, 3, 0, 16480, 0, 0, SilphCo_11F_EventScript_161E94

SilphCo_11F_MapBGEvents:
	bg_event 5, 16, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 5, 17, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 6, 16, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 6, 17, 3, 0, 0, SilphCo_11F_EventScript_1A8B09
	bg_event 10, 18, 0, 7, 0, 24, 144, 1
	bg_event 8, 1, 0, 0, 0, SilphCo_11F_EventScript_161F37

gMapEvents_SilphCo_11F::
	map_events SilphCo_11F_EventObjects, SilphCo_11F_MapWarps, SilphCo_11F_MapCoordEvents, SilphCo_11F_MapBGEvents


SilphCo_Elevator_MapWarps:
	warp_def 2, 5, 3, 127, 32639

SilphCo_Elevator_MapBGEvents:
	bg_event 0, 2, 3, 0, 0, SilphCo_Elevator_EventScript_161F6F

gMapEvents_SilphCo_Elevator::
	map_events 0x0, SilphCo_Elevator_MapWarps, 0x0, SilphCo_Elevator_MapBGEvents

PokemonMansion_1F_EventObjects:
	object_event 1, 55, 0, 22, 0, 24, 0, 3, 9, 17, 0, 1, 0, 4, 0, PokemonMansion_1F_EventScript_162226, 0, 0, 0
	object_event 2, 92, 0, 29, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BE95D, 415, 0, 0
	object_event 3, 92, 0, 22, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BE96A, 416, 0, 0
	object_event 4, 92, 0, 27, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_1F_EventScript_1BEB65, 458, 0, 0
	object_event 5, 18, 0, 8, 0, 8, 0, 3, 5, 18, 0, 1, 0, 1, 0, PokemonMansion_1F_EventScript_16223D, 0, 0, 0

PokemonMansion_1F_MapWarps:
	warp_def 7, 33, 3, 0, 776
	warp_def 8, 33, 3, 0, 776
	warp_def 9, 33, 3, 0, 776
	warp_def 10, 13, 3, 2, 316
	warp_def 25, 27, 3, 0, 318
	warp_def 34, 33, 3, 0, 776
	warp_def 35, 34, 0, 0, 776
	warp_def 19, 22, 3, 3, 317
	warp_def 20, 22, 3, 4, 317
	warp_def 11, 13, 0, 2, 316

PokemonMansion_1F_MapBGEvents:
	bg_event 5, 5, 0, 1, 0, PokemonMansion_1F_EventScript_162212
	bg_event 2, 21, 0, 7, 0, 94, 31, 1

gMapEvents_PokemonMansion_1F::
	map_events PokemonMansion_1F_EventObjects, PokemonMansion_1F_MapWarps, 0x0, PokemonMansion_1F_MapBGEvents

PokemonMansion_2F_EventObjects:
	object_event 1, 52, 0, 5, 0, 23, 0, 3, 1, 17, 0, 1, 0, 1, 0, PokemonMansion_2F_EventScript_16228A, 0, 0, 0
	object_event 2, 92, 0, 36, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BE977, 417, 0, 0
	object_event 3, 92, 0, 18, 0, 23, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BEB72, 459, 0, 0
	object_event 4, 92, 0, 35, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_2F_EventScript_1BEB7F, 460, 0, 0

PokemonMansion_2F_MapWarps:
	warp_def 9, 3, 3, 0, 317
	warp_def 34, 22, 3, 1, 317
	warp_def 6, 14, 3, 3, 315
	warp_def 9, 14, 3, 2, 317
	warp_def 27, 17, 3, 5, 317

PokemonMansion_2F_MapBGEvents:
	bg_event 2, 16, 0, 1, 0, PokemonMansion_2F_EventScript_162264
	bg_event 6, 31, 0, 0, 0, PokemonMansion_2F_EventScript_162281
	bg_event 25, 4, 0, 0, 0, PokemonMansion_2F_EventScript_162278

gMapEvents_PokemonMansion_2F::
	map_events PokemonMansion_2F_EventObjects, PokemonMansion_2F_MapWarps, 0x0, PokemonMansion_2F_MapBGEvents

PokemonMansion_3F_EventObjects:
	object_event 1, 52, 0, 7, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, PokemonMansion_3F_EventScript_1622CE, 0, 0, 0
	object_event 2, 55, 0, 22, 0, 13, 0, 3, 8, 17, 0, 1, 0, 1, 0, PokemonMansion_3F_EventScript_1622E5, 0, 0, 0
	object_event 3, 92, 0, 9, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_3F_EventScript_1BE984, 418, 0, 0
	object_event 4, 92, 0, 32, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_3F_EventScript_1BE991, 419, 0, 0

PokemonMansion_3F_MapWarps:
	warp_def 8, 3, 3, 0, 316
	warp_def 34, 18, 3, 1, 316
	warp_def 11, 11, 3, 3, 316
	warp_def 18, 18, 3, 7, 315
	warp_def 19, 18, 3, 8, 315
	warp_def 23, 18, 3, 4, 316
	warp_def 20, 18, 3, 8, 315
	warp_def 24, 18, 3, 4, 316

PokemonMansion_3F_MapBGEvents:
	bg_event 8, 16, 0, 0, 0, PokemonMansion_3F_EventScript_1622C5
	bg_event 12, 5, 0, 1, 0, PokemonMansion_3F_EventScript_1622B1
	bg_event 36, 13, 3, 7, 0, 68, 32, 1

gMapEvents_PokemonMansion_3F::
	map_events PokemonMansion_3F_EventObjects, PokemonMansion_3F_MapWarps, 0x0, PokemonMansion_3F_MapBGEvents

PokemonMansion_B1F_EventObjects:
	object_event 1, 92, 0, 6, 0, 21, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9B8, 423, 0, 0
	object_event 2, 52, 0, 20, 0, 25, 0, 3, 2, 17, 0, 1, 0, 1, 0, PokemonMansion_B1F_EventScript_162329, 0, 0, 0
	object_event 3, 55, 0, 34, 0, 13, 0, 3, 8, 17, 0, 1, 0, 6, 0, PokemonMansion_B1F_EventScript_162340, 0, 0, 0
	object_event 4, 92, 0, 23, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE99E, 420, 0, 0
	object_event 5, 92, 0, 2, 0, 29, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9AB, 421, 0, 0
	object_event 6, 92, 0, 5, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonMansion_B1F_EventScript_1BE9C5, 424, 0, 0

PokemonMansion_B1F_MapWarps:
	warp_def 34, 29, 3, 4, 315

PokemonMansion_B1F_MapBGEvents:
	bg_event 21, 27, 0, 0, 0, PokemonMansion_B1F_EventScript_162320
	bg_event 24, 29, 0, 1, 0, PokemonMansion_B1F_EventScript_16230C
	bg_event 27, 5, 0, 1, 0, PokemonMansion_B1F_EventScript_16230C
	bg_event 35, 5, 3, 7, 0, 36, 33, 1

gMapEvents_PokemonMansion_B1F::
	map_events PokemonMansion_B1F_EventObjects, PokemonMansion_B1F_MapWarps, 0x0, PokemonMansion_B1F_MapBGEvents

SafariZone_Center_EventObjects:
	object_event 1, 92, 0, 24, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_Center_EventScript_1BE7D7, 385, 0, 0

SafariZone_Center_MapWarps:
	warp_def 25, 30, 3, 0, 2816
	warp_def 26, 30, 3, 0, 2816
	warp_def 27, 30, 3, 0, 2816
	warp_def 25, 5, 3, 9, 321
	warp_def 26, 5, 3, 10, 321
	warp_def 27, 5, 0, 11, 321
	warp_def 8, 17, 3, 6, 322
	warp_def 8, 18, 3, 7, 322
	warp_def 8, 19, 0, 8, 322
	warp_def 43, 15, 3, 3, 320
	warp_def 43, 16, 3, 4, 320
	warp_def 43, 17, 0, 5, 320
	warp_def 29, 25, 0, 1, 323

SafariZone_Center_MapBGEvents:
	bg_event 30, 26, 0, 0, 0, SafariZone_Center_EventScript_162361
	bg_event 25, 27, 0, 0, 0, SafariZone_Center_EventScript_16236A
	bg_event 27, 15, 3, 7, 0, 98, 22, 1
	bg_event 33, 20, 0, 0, 0, SafariZone_Center_EventScript_162373

gMapEvents_SafariZone_Center::
	map_events SafariZone_Center_EventObjects, SafariZone_Center_MapWarps, 0x0, SafariZone_Center_MapBGEvents

SafariZone_East_EventObjects:
	object_event 1, 92, 0, 13, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7E4, 386, 0, 0
	object_event 2, 92, 0, 37, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7F1, 387, 0, 0
	object_event 3, 92, 0, 31, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE7FE, 388, 0, 0
	object_event 4, 92, 0, 36, 0, 17, 0, 4, 8, 17, 0, 0, 0, 0, 0, SafariZone_East_EventScript_1BE80B, 389, 0, 0

SafariZone_East_MapWarps:
	warp_def 8, 9, 3, 6, 321
	warp_def 8, 10, 3, 7, 321
	warp_def 8, 11, 0, 8, 321
	warp_def 8, 26, 3, 9, 319
	warp_def 8, 27, 3, 10, 319
	warp_def 8, 28, 0, 11, 319
	warp_def 40, 14, 0, 1, 324

SafariZone_East_MapBGEvents:
	bg_event 18, 27, 0, 0, 0, SafariZone_East_EventScript_16238F
	bg_event 43, 15, 0, 0, 0, SafariZone_East_EventScript_16237D
	bg_event 17, 8, 0, 0, 0, SafariZone_East_EventScript_162386

gMapEvents_SafariZone_East::
	map_events SafariZone_East_EventObjects, SafariZone_East_MapWarps, 0x0, SafariZone_East_MapBGEvents

SafariZone_North_EventObjects:
	object_event 1, 92, 0, 33, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BE818, 390, 0, 0
	object_event 2, 92, 0, 28, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BE825, 391, 0, 0
	object_event 3, 92, 0, 29, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_North_EventScript_1BEBDA, 467, 0, 0

SafariZone_North_MapWarps:
	warp_def 10, 34, 3, 0, 322
	warp_def 11, 34, 3, 1, 322
	warp_def 12, 34, 0, 2, 322
	warp_def 20, 34, 3, 3, 322
	warp_def 21, 34, 3, 4, 322
	warp_def 22, 34, 0, 5, 322
	warp_def 48, 31, 3, 0, 320
	warp_def 48, 32, 3, 1, 320
	warp_def 48, 33, 0, 2, 320
	warp_def 30, 34, 3, 3, 319
	warp_def 31, 34, 3, 4, 319
	warp_def 32, 34, 0, 5, 319
	warp_def 43, 8, 0, 1, 325

SafariZone_North_MapBGEvents:
	bg_event 13, 27, 0, 0, 0, SafariZone_North_EventScript_1623A2
	bg_event 23, 31, 0, 0, 0, SafariZone_North_EventScript_1623AB
	bg_event 29, 32, 0, 0, 0, SafariZone_North_EventScript_1623B4
	bg_event 34, 28, 0, 0, 0, SafariZone_North_EventScript_1623BD
	bg_event 44, 9, 0, 0, 0, SafariZone_North_EventScript_162399

gMapEvents_SafariZone_North::
	map_events SafariZone_North_EventObjects, SafariZone_North_MapWarps, 0x0, SafariZone_North_MapBGEvents

SafariZone_West_EventObjects:
	object_event 1, 92, 0, 28, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE83F, 393, 0, 0
	object_event 2, 92, 0, 17, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE832, 392, 0, 0
	object_event 3, 92, 0, 16, 0, 27, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE84C, 394, 0, 0
	object_event 4, 92, 0, 27, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_West_EventScript_1BE859, 395, 0, 0

SafariZone_West_MapWarps:
	warp_def 30, 5, 3, 0, 321
	warp_def 31, 5, 3, 1, 321
	warp_def 32, 5, 0, 2, 321
	warp_def 37, 5, 3, 3, 321
	warp_def 38, 5, 3, 4, 321
	warp_def 39, 5, 0, 5, 321
	warp_def 40, 26, 3, 6, 319
	warp_def 40, 27, 3, 7, 319
	warp_def 40, 28, 0, 8, 319
	warp_def 12, 7, 0, 1, 327
	warp_def 19, 18, 0, 1, 326

SafariZone_West_MapBGEvents:
	bg_event 27, 9, 0, 0, 0, SafariZone_West_EventScript_1623D0
	bg_event 36, 10, 0, 0, 0, SafariZone_West_EventScript_1623D9
	bg_event 35, 26, 0, 0, 0, SafariZone_West_EventScript_1623E2
	bg_event 22, 19, 0, 0, 0, SafariZone_West_EventScript_1623C7
	bg_event 13, 11, 3, 7, 0, 24, 23, 1

gMapEvents_SafariZone_West::
	map_events SafariZone_West_EventObjects, SafariZone_West_MapWarps, 0x0, SafariZone_West_MapBGEvents

SafariZone_Building1_EventObjects:
	object_event 1, 55, 0, 3, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SafariZone_Building1_EventScript_1623F5, 0, 0, 0
	object_event 2, 23, 0, 7, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_Building1_EventScript_1623EC, 0, 0, 0

SafariZone_Building1_MapWarps:
	warp_def 3, 9, 3, 12, 319
	warp_def 4, 9, 3, 12, 319
	warp_def 5, 9, 3, 12, 319

gMapEvents_SafariZone_Building1::
	map_events SafariZone_Building1_EventObjects, SafariZone_Building1_MapWarps, 0x0, 0x0

SafariZone_Building2_EventObjects:
	object_event 1, 55, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, SafariZone_Building2_EventScript_162408, 0, 0, 0
	object_event 2, 26, 0, 6, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_Building2_EventScript_1623FF, 0, 0, 0
	object_event 3, 30, 0, 7, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_Building2_EventScript_162411, 0, 0, 0

SafariZone_Building2_MapWarps:
	warp_def 3, 9, 3, 6, 320
	warp_def 4, 9, 3, 6, 320
	warp_def 5, 9, 3, 6, 320

gMapEvents_SafariZone_Building2::
	map_events SafariZone_Building2_EventObjects, SafariZone_Building2_MapWarps, 0x0, 0x0

SafariZone_Building3_EventObjects:
	object_event 1, 61, 0, 3, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SafariZone_Building3_EventScript_16242D, 0, 0, 0
	object_event 2, 55, 0, 7, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, SafariZone_Building3_EventScript_162424, 0, 0, 0
	object_event 3, 57, 0, 6, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, SafariZone_Building3_EventScript_16241B, 0, 0, 0
	object_event 4, 30, 0, 11, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, SafariZone_Building3_EventScript_1ACED3, 0, 0, 0

SafariZone_Building3_MapWarps:
	warp_def 3, 9, 3, 12, 321
	warp_def 4, 9, 3, 12, 321
	warp_def 5, 9, 3, 12, 321

gMapEvents_SafariZone_Building3::
	map_events SafariZone_Building3_EventObjects, SafariZone_Building3_MapWarps, 0x0, 0x0

SafariZone_Building4_EventObjects:
	object_event 1, 55, 0, 3, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SafariZone_Building4_EventScript_162440, 0, 0, 0
	object_event 2, 25, 0, 2, 0, 2, 0, 0, 1, 17, 0, 0, 0, 0, 0, SafariZone_Building4_EventScript_162437, 0, 0, 0
	object_event 3, 42, 0, 7, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, SafariZone_Building4_EventScript_162449, 0, 0, 0

SafariZone_Building4_MapWarps:
	warp_def 3, 9, 3, 10, 322
	warp_def 4, 9, 3, 10, 322
	warp_def 5, 9, 3, 10, 322

gMapEvents_SafariZone_Building4::
	map_events SafariZone_Building4_EventObjects, SafariZone_Building4_MapWarps, 0x0, 0x0

SafariZone_SecretHouse_EventObjects:
	object_event 1, 47, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SafariZone_SecretHouse_EventScript_162453, 0, 0, 0

SafariZone_SecretHouse_MapWarps:
	warp_def 3, 9, 3, 9, 322
	warp_def 4, 9, 3, 9, 322
	warp_def 5, 9, 3, 9, 322

gMapEvents_SafariZone_SecretHouse::
	map_events SafariZone_SecretHouse_EventObjects, SafariZone_SecretHouse_MapWarps, 0x0, 0x0

CeruleanCave_1F_EventObjects:
	object_event 1, 92, 0, 7, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA47, 434, 0, 0
	object_event 2, 92, 0, 11, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA54, 435, 0, 0
	object_event 3, 92, 0, 25, 0, 5, 0, 4, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BEA3A, 433, 0, 0
	object_event 4, 96, 0, 7, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 13, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 5, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 14, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 21, 0, 0
	object_event 8, 96, 0, 11, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 22, 0, 0
	object_event 9, 96, 0, 9, 0, 18, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_1F_EventScript_1BE00C, 23, 0, 0

CeruleanCave_1F_MapWarps:
	warp_def 33, 21, 3, 7, 771
	warp_def 34, 2, 3, 0, 329
	warp_def 1, 7, 3, 0, 330
	warp_def 10, 2, 3, 1, 329
	warp_def 5, 15, 3, 2, 329
	warp_def 30, 10, 4, 3, 329
	warp_def 24, 11, 3, 4, 329
	warp_def 2, 4, 3, 5, 329

CeruleanCave_1F_MapBGEvents:
	bg_event 12, 2, 3, 7, 0, 2, 39, 1

gMapEvents_CeruleanCave_1F::
	map_events CeruleanCave_1F_EventObjects, CeruleanCave_1F_MapWarps, 0x0, CeruleanCave_1F_MapBGEvents

CeruleanCave_2F_EventObjects:
	object_event 1, 92, 0, 9, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BEA6E, 437, 0, 0
	object_event 2, 92, 0, 29, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BEA7B, 438, 0, 0
	object_event 3, 92, 0, 33, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BEA61, 436, 0, 0
	object_event 4, 96, 0, 33, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 33, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 25, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 28, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 21, 0, 0
	object_event 8, 96, 0, 30, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 22, 0, 0
	object_event 9, 96, 0, 9, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 23, 0, 0
	object_event 10, 96, 0, 23, 0, 16, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 24, 0, 0
	object_event 11, 96, 0, 13, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 25, 0, 0
	object_event 12, 96, 0, 4, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 26, 0, 0
	object_event 13, 96, 0, 10, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_2F_EventScript_1BE00C, 27, 0, 0

CeruleanCave_2F_MapWarps:
	warp_def 33, 4, 3, 1, 328
	warp_def 13, 4, 3, 3, 328
	warp_def 7, 14, 3, 4, 328
	warp_def 26, 9, 3, 5, 328
	warp_def 23, 10, 3, 6, 328
	warp_def 5, 6, 3, 7, 328

gMapEvents_CeruleanCave_2F::
	map_events CeruleanCave_2F_EventObjects, CeruleanCave_2F_MapWarps, 0x0, 0x0

CeruleanCave_B1F_EventObjects:
	object_event 1, 92, 0, 31, 0, 9, 0, 4, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BEA95, 440, 0, 0
	object_event 2, 92, 0, 32, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BEA88, 439, 0, 0
	object_event 3, 139, 0, 7, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1624F5, 129, 0, 0
	object_event 4, 96, 0, 37, 0, 1, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 38, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 35, 0, 1, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 37, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 21, 0, 0
	object_event 8, 96, 0, 35, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 22, 0, 0
	object_event 9, 96, 0, 2, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 23, 0, 0
	object_event 10, 96, 0, 4, 0, 1, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 24, 0, 0
	object_event 11, 96, 0, 6, 0, 1, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 25, 0, 0
	object_event 12, 96, 0, 3, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCave_B1F_EventScript_1BE00C, 26, 0, 0

CeruleanCave_B1F_MapWarps:
	warp_def 5, 7, 3, 2, 328

gMapEvents_CeruleanCave_B1F::
	map_events CeruleanCave_B1F_EventObjects, CeruleanCave_B1F_MapWarps, 0x0, 0x0

PokemonLeague_LoreleisRoom_EventObjects:
	object_event 1, 77, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonLeague_LoreleisRoom_EventScript_1625DC, 0, 0, 0

PokemonLeague_LoreleisRoom_MapWarps:
	warp_def 6, 12, 0, 1, 3328
	warp_def 6, 2, 0, 0, 332

gMapEvents_PokemonLeague_LoreleisRoom::
	map_events PokemonLeague_LoreleisRoom_EventObjects, PokemonLeague_LoreleisRoom_MapWarps, 0x0, 0x0

PokemonLeague_BrunosRoom_EventObjects:
	object_event 1, 79, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonLeague_BrunosRoom_EventScript_1626EC, 0, 0, 0

PokemonLeague_BrunosRoom_MapWarps:
	warp_def 6, 12, 0, 1, 331
	warp_def 6, 2, 0, 0, 333

gMapEvents_PokemonLeague_BrunosRoom::
	map_events PokemonLeague_BrunosRoom_EventObjects, PokemonLeague_BrunosRoom_MapWarps, 0x0, 0x0

PokemonLeague_AgathasRoom_EventObjects:
	object_event 1, 75, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonLeague_AgathasRoom_EventScript_162877, 0, 0, 0

PokemonLeague_AgathasRoom_MapWarps:
	warp_def 6, 12, 0, 1, 332
	warp_def 6, 2, 0, 0, 334

gMapEvents_PokemonLeague_AgathasRoom::
	map_events PokemonLeague_AgathasRoom_EventObjects, PokemonLeague_AgathasRoom_MapWarps, 0x0, 0x0

PokemonLeague_LancesRoom_EventObjects:
	object_event 1, 74, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonLeague_LancesRoom_EventScript_162A14, 0, 0, 0

PokemonLeague_LancesRoom_MapWarps:
	warp_def 23, 13, 3, 1, 333
	warp_def 6, 5, 0, 0, 335

gMapEvents_PokemonLeague_LancesRoom::
	map_events PokemonLeague_LancesRoom_EventObjects, PokemonLeague_LancesRoom_MapWarps, 0x0, 0x0

PokemonLeague_ChampionsRoom_EventObjects:
	object_event 1, 72, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 71, 0, 6, 0, 15, 0, 0, 7, 17, 0, 0, 0, 0, 0, 0x0, 90, 0, 0

PokemonLeague_ChampionsRoom_MapWarps:
	warp_def 6, 19, 3, 1, 334
	warp_def 6, 2, 3, 0, 336

gMapEvents_PokemonLeague_ChampionsRoom::
	map_events PokemonLeague_ChampionsRoom_EventObjects, PokemonLeague_ChampionsRoom_MapWarps, 0x0, 0x0

PokemonLeague_HallOfFame_EventObjects:
	object_event 1, 71, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

PokemonLeague_HallOfFame_MapWarps:
	warp_def 5, 12, 3, 1, 335

gMapEvents_PokemonLeague_HallOfFame::
	map_events PokemonLeague_HallOfFame_EventObjects, PokemonLeague_HallOfFame_MapWarps, 0x0, 0x0

RockTunnel_1F_EventObjects:
	object_event 1, 40, 0, 26, 0, 28, 0, 3, 8, 17, 0, 1, 0, 3, 0, RockTunnel_1F_EventScript_162E73, 0, 0, 0
	object_event 2, 40, 0, 39, 0, 27, 0, 3, 10, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E5C, 0, 0, 0
	object_event 3, 40, 0, 45, 0, 24, 0, 3, 9, 17, 0, 1, 0, 5, 0, RockTunnel_1F_EventScript_162E45, 0, 0, 0
	object_event 4, 56, 0, 20, 0, 17, 0, 3, 9, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E17, 0, 0, 0
	object_event 5, 56, 0, 5, 0, 20, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162E00, 0, 0, 0
	object_event 6, 56, 0, 7, 0, 5, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_1F_EventScript_162DE9, 0, 0, 0
	object_event 7, 52, 0, 27, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, RockTunnel_1F_EventScript_162E2E, 0, 0, 0
	object_event 8, 92, 0, 37, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB0A, 451, 0, 0
	object_event 9, 92, 0, 33, 0, 22, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB17, 452, 0, 0
	object_event 10, 92, 0, 22, 0, 22, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_1F_EventScript_1BEB24, 453, 0, 0

RockTunnel_1F_MapWarps:
	warp_def 17, 2, 3, 0, 796
	warp_def 45, 2, 3, 0, 338
	warp_def 4, 2, 3, 1, 338
	warp_def 20, 13, 3, 2, 338
	warp_def 45, 21, 3, 3, 338
	warp_def 18, 37, 3, 1, 796

RockTunnel_1F_MapBGEvents:
	bg_event 14, 33, 3, 0, 0, RockTunnel_1F_EventScript_162DE0

gMapEvents_RockTunnel_1F::
	map_events RockTunnel_1F_EventObjects, RockTunnel_1F_MapWarps, 0x0, RockTunnel_1F_MapBGEvents

RockTunnel_B1F_EventObjects:
	object_event 1, 52, 0, 2, 0, 6, 0, 3, 1, 17, 0, 1, 0, 2, 0, RockTunnel_B1F_EventScript_162EFE, 0, 0, 0
	object_event 2, 56, 0, 5, 0, 11, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_B1F_EventScript_162EB9, 0, 0, 0
	object_event 3, 40, 0, 11, 0, 15, 0, 3, 8, 17, 0, 1, 0, 4, 0, RockTunnel_B1F_EventScript_162E8B, 0, 0, 0
	object_event 4, 56, 0, 36, 0, 11, 0, 3, 8, 17, 0, 1, 0, 3, 0, RockTunnel_B1F_EventScript_162ED0, 0, 0, 0
	object_event 5, 56, 0, 41, 0, 5, 0, 3, 10, 17, 0, 1, 0, 3, 0, RockTunnel_B1F_EventScript_162EE7, 0, 0, 0
	object_event 6, 52, 0, 23, 0, 23, 0, 3, 10, 17, 0, 1, 0, 4, 0, RockTunnel_B1F_EventScript_162F15, 0, 0, 0
	object_event 7, 40, 0, 15, 0, 33, 0, 3, 10, 17, 0, 1, 0, 2, 0, RockTunnel_B1F_EventScript_162EA2, 0, 0, 0
	object_event 8, 52, 0, 29, 0, 35, 0, 3, 8, 17, 0, 1, 0, 3, 0, RockTunnel_B1F_EventScript_162F2C, 0, 0, 0
	object_event 9, 18, 0, 2, 0, 29, 0, 3, 10, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1C487E, 0, 0, 0
	object_event 10, 92, 0, 2, 0, 37, 0, 3, 8, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BEB31, 454, 0, 0
	object_event 11, 92, 0, 9, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BEB3E, 455, 0, 0
	object_event 12, 96, 0, 1, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 18, 0, 0
	object_event 13, 96, 0, 1, 0, 22, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 19, 0, 0
	object_event 14, 96, 0, 4, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 20, 0, 0
	object_event 15, 96, 0, 2, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 21, 0, 0
	object_event 16, 96, 0, 39, 0, 26, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 22, 0, 0
	object_event 17, 96, 0, 42, 0, 26, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 23, 0, 0
	object_event 18, 96, 0, 43, 0, 28, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 24, 0, 0
	object_event 19, 96, 0, 45, 0, 30, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 25, 0, 0
	object_event 20, 96, 0, 45, 0, 33, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 26, 0, 0
	object_event 21, 96, 0, 25, 0, 1, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 27, 0, 0
	object_event 22, 96, 0, 27, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 28, 0, 0
	object_event 23, 96, 0, 23, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 29, 0, 0
	object_event 24, 96, 0, 26, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 30, 0, 0
	object_event 25, 96, 0, 24, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 31, 0, 0
	object_event 26, 96, 0, 27, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, RockTunnel_B1F_EventScript_1BE00C, 17, 0, 0

RockTunnel_B1F_MapWarps:
	warp_def 38, 28, 3, 1, 337
	warp_def 33, 3, 3, 2, 337
	warp_def 27, 12, 3, 3, 337
	warp_def 2, 3, 3, 4, 337

gMapEvents_RockTunnel_B1F::
	map_events RockTunnel_B1F_EventObjects, RockTunnel_B1F_MapWarps, 0x0, 0x0

SeafoamIslands_1F_EventObjects:
	object_event 1, 97, 0, 22, 0, 12, 0, 3, 8, 0, 0, 66, 0, 0, 0, SeafoamIslands_1F_EventScript_1BE11D, 64, 0, 0
	object_event 2, 97, 0, 32, 0, 9, 0, 3, 8, 0, 0, 67, 0, 0, 0, SeafoamIslands_1F_EventScript_1BE11D, 65, 0, 0
	object_event 3, 92, 0, 11, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_1F_EventScript_1BEBE7, 468, 0, 0

SeafoamIslands_1F_MapWarps:
	warp_def 10, 6, 3, 0, 340
	warp_def 31, 4, 3, 1, 340
	warp_def 28, 19, 3, 2, 340
	warp_def 6, 21, 3, 0, 806
	warp_def 32, 21, 3, 1, 806
	warp_def 21, 8, 3, 9, 340
	warp_def 30, 8, 3, 10, 340

gMapEvents_SeafoamIslands_1F::
	map_events SeafoamIslands_1F_EventObjects, SeafoamIslands_1F_MapWarps, 0x0, 0x0

SeafoamIslands_B1F_EventObjects:
	object_event 1, 97, 0, 22, 0, 8, 0, 3, 8, 0, 0, 68, 0, 0, 0, SeafoamIslands_B1F_EventScript_1BE11D, 66, 0, 0
	object_event 2, 97, 0, 30, 0, 8, 0, 3, 8, 0, 0, 69, 0, 0, 0, SeafoamIslands_B1F_EventScript_1BE11D, 67, 0, 0
	object_event 3, 92, 0, 19, 0, 18, 0, 3, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B1F_EventScript_1BEBF4, 469, 0, 0
	object_event 4, 92, 0, 24, 0, 14, 0, 4, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B1F_EventScript_1BEC01, 470, 0, 0

SeafoamIslands_B1F_MapWarps:
	warp_def 10, 6, 4, 0, 339
	warp_def 31, 4, 3, 1, 339
	warp_def 28, 19, 3, 2, 339
	warp_def 7, 3, 3, 3, 341
	warp_def 17, 9, 4, 4, 341
	warp_def 25, 19, 3, 5, 341
	warp_def 32, 14, 3, 6, 341
	warp_def 23, 8, 3, 7, 341
	warp_def 28, 8, 3, 8, 341
	warp_def 21, 8, 3, 5, 339
	warp_def 29, 8, 3, 6, 339

gMapEvents_SeafoamIslands_B1F::
	map_events SeafoamIslands_B1F_EventObjects, SeafoamIslands_B1F_MapWarps, 0x0, 0x0

SeafoamIslands_B2F_EventObjects:
	object_event 1, 97, 0, 22, 0, 8, 0, 3, 8, 0, 0, 70, 0, 0, 0, SeafoamIslands_B2F_EventScript_1BE11D, 68, 0, 0
	object_event 2, 97, 0, 30, 0, 8, 0, 3, 8, 0, 0, 71, 0, 0, 0, SeafoamIslands_B2F_EventScript_1BE11D, 69, 0, 0
	object_event 3, 92, 0, 18, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B2F_EventScript_1BEC0E, 471, 0, 0

SeafoamIslands_B2F_MapWarps:
	warp_def 7, 17, 3, 0, 342
	warp_def 32, 4, 3, 1, 342
	warp_def 31, 17, 4, 2, 342
	warp_def 7, 4, 3, 3, 340
	warp_def 17, 9, 4, 4, 340
	warp_def 25, 19, 3, 5, 340
	warp_def 32, 14, 4, 6, 340
	warp_def 22, 7, 3, 7, 340
	warp_def 29, 8, 3, 8, 340
	warp_def 24, 8, 3, 5, 342
	warp_def 27, 8, 3, 6, 342

gMapEvents_SeafoamIslands_B2F::
	map_events SeafoamIslands_B2F_EventObjects, SeafoamIslands_B2F_MapWarps, 0x0, 0x0

SeafoamIslands_B3F_EventObjects:
	object_event 1, 97, 0, 23, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 70, 0, 0
	object_event 2, 97, 0, 24, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 71, 0, 0
	object_event 3, 97, 0, 12, 0, 16, 0, 3, 8, 0, 0, 77, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 74, 0, 0
	object_event 4, 97, 0, 13, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 75, 0, 0
	object_event 5, 97, 0, 9, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 73, 0, 0
	object_event 6, 97, 0, 6, 0, 17, 0, 3, 8, 0, 0, 76, 0, 0, 0, SeafoamIslands_B3F_EventScript_1BE11D, 72, 0, 0

SeafoamIslands_B3F_MapWarps:
	warp_def 8, 14, 4, 0, 341
	warp_def 31, 4, 3, 1, 341
	warp_def 31, 16, 4, 2, 341
	warp_def 12, 9, 3, 0, 343
	warp_def 29, 5, 3, 1, 343
	warp_def 23, 9, 1, 7, 341
	warp_def 24, 9, 1, 8, 341
	warp_def 6, 18, 3, 2, 343
	warp_def 9, 18, 3, 3, 343

SeafoamIslands_B3F_MapBGEvents:
	bg_event 5, 12, 0, 7, 0, 110, 29, 1

gMapEvents_SeafoamIslands_B3F::
	map_events SeafoamIslands_B3F_EventObjects, SeafoamIslands_B3F_MapWarps, 0x0, SeafoamIslands_B3F_MapBGEvents

SeafoamIslands_B4F_EventObjects:
	object_event 1, 97, 0, 8, 0, 18, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 76, 0, 0
	object_event 2, 97, 0, 9, 0, 18, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 77, 0, 0
	object_event 3, 138, 0, 9, 0, 2, 0, 4, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B4F_EventScript_1631AC, 130, 0, 0
	object_event 4, 92, 0, 22, 0, 19, 0, 4, 8, 17, 0, 0, 0, 0, 0, SeafoamIslands_B4F_EventScript_1BEC1B, 472, 0, 0

SeafoamIslands_B4F_MapWarps:
	warp_def 15, 9, 4, 3, 342
	warp_def 32, 5, 4, 4, 342
	warp_def 8, 17, 1, 7, 342
	warp_def 9, 17, 1, 8, 342

SeafoamIslands_B4F_MapCoordEvents:
	coord_event 26, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D
	coord_event 27, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D
	coord_event 28, 19, 1, 0, 16483, 0, 0, SeafoamIslands_B4F_EventScript_16319D

SeafoamIslands_B4F_MapBGEvents:
	bg_event 13, 8, 0, 7, 0, 97, 30, 1
	bg_event 30, 2, 0, 0, 0, SeafoamIslands_B4F_EventScript_16322C
	bg_event 14, 18, 0, 0, 0, SeafoamIslands_B4F_EventScript_163223

gMapEvents_SeafoamIslands_B4F::
	map_events SeafoamIslands_B4F_EventObjects, SeafoamIslands_B4F_MapWarps, SeafoamIslands_B4F_MapCoordEvents, SeafoamIslands_B4F_MapBGEvents

PokemonTower_1F_EventObjects:
	object_event 1, 48, 0, 18, 0, 13, 0, 3, 7, 17, 0, 0, 0, 0, 0, PokemonTower_1F_EventScript_16327C, 0, 0, 0
	object_event 2, 58, 0, 18, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, PokemonTower_1F_EventScript_16323F, 0, 0, 0
	object_event 3, 28, 0, 15, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, PokemonTower_1F_EventScript_163248, 0, 0, 0
	object_event 4, 31, 0, 7, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, PokemonTower_1F_EventScript_16325A, 0, 0, 0
	object_event 5, 30, 0, 8, 0, 12, 0, 3, 2, 34, 0, 0, 0, 0, 0, PokemonTower_1F_EventScript_163251, 0, 0, 0

PokemonTower_1F_MapWarps:
	warp_def 10, 19, 3, 0, 772
	warp_def 11, 18, 3, 0, 772
	warp_def 12, 19, 3, 0, 772
	warp_def 18, 9, 3, 1, 345

gMapEvents_PokemonTower_1F::
	map_events PokemonTower_1F_EventObjects, PokemonTower_1F_MapWarps, 0x0, 0x0

PokemonTower_2F_EventObjects:
	object_event 1, 72, 0, 16, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 81, 0, 0
	object_event 2, 58, 0, 3, 0, 7, 0, 0, 10, 17, 0, 0, 0, 0, 0, PokemonTower_2F_EventScript_163286, 0, 0, 0

PokemonTower_2F_MapWarps:
	warp_def 4, 10, 3, 0, 346
	warp_def 18, 10, 3, 3, 344

PokemonTower_2F_MapCoordEvents:
	coord_event 17, 5, 3, 0, 16477, 0, 0, PokemonTower_2F_EventScript_16328F
	coord_event 16, 6, 3, 0, 16477, 0, 0, PokemonTower_2F_EventScript_16329B

gMapEvents_PokemonTower_2F::
	map_events PokemonTower_2F_EventObjects, PokemonTower_2F_MapWarps, PokemonTower_2F_MapCoordEvents, 0x0

PokemonTower_3F_EventObjects:
	object_event 1, 58, 0, 10, 0, 14, 0, 3, 8, 17, 0, 1, 0, 3, 0, PokemonTower_3F_EventScript_1633A7, 0, 0, 0
	object_event 2, 58, 0, 9, 0, 9, 0, 3, 8, 17, 0, 1, 0, 3, 0, PokemonTower_3F_EventScript_1633BE, 0, 0, 0
	object_event 3, 58, 0, 12, 0, 4, 0, 3, 13, 17, 0, 1, 0, 2, 0, PokemonTower_3F_EventScript_1633D5, 0, 0, 0
	object_event 4, 92, 0, 13, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_3F_EventScript_1BE755, 375, 0, 0

PokemonTower_3F_MapWarps:
	warp_def 4, 10, 3, 0, 345
	warp_def 18, 10, 3, 1, 347

gMapEvents_PokemonTower_3F::
	map_events PokemonTower_3F_EventObjects, PokemonTower_3F_MapWarps, 0x0, 0x0

PokemonTower_4F_EventObjects:
	object_event 1, 58, 0, 17, 0, 7, 0, 3, 8, 17, 0, 1, 0, 3, 0, PokemonTower_4F_EventScript_163404, 0, 0, 0
	object_event 2, 58, 0, 15, 0, 13, 0, 3, 9, 17, 0, 1, 0, 5, 0, PokemonTower_4F_EventScript_16341B, 0, 0, 0
	object_event 3, 58, 0, 4, 0, 12, 0, 3, 10, 17, 0, 1, 0, 2, 0, PokemonTower_4F_EventScript_1633ED, 0, 0, 0
	object_event 4, 92, 0, 12, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_4F_EventScript_1BE762, 376, 0, 0
	object_event 5, 92, 0, 8, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_4F_EventScript_1BE76F, 377, 0, 0
	object_event 6, 92, 0, 11, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_4F_EventScript_1BE77C, 378, 0, 0

PokemonTower_4F_MapWarps:
	warp_def 4, 10, 3, 0, 348
	warp_def 18, 10, 3, 1, 346

gMapEvents_PokemonTower_4F::
	map_events PokemonTower_4F_EventObjects, PokemonTower_4F_MapWarps, 0x0, 0x0

PokemonTower_5F_EventObjects:
	object_event 1, 58, 0, 11, 0, 4, 0, 3, 1, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_163472, 0, 0, 0
	object_event 2, 58, 0, 19, 0, 7, 0, 3, 9, 17, 0, 1, 0, 3, 0, PokemonTower_5F_EventScript_16345B, 0, 0, 0
	object_event 3, 58, 0, 7, 0, 12, 0, 3, 10, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_163489, 0, 0, 0
	object_event 4, 58, 0, 11, 0, 16, 0, 3, 1, 17, 0, 1, 0, 2, 0, PokemonTower_5F_EventScript_1634A0, 0, 0, 0
	object_event 5, 58, 0, 12, 0, 8, 0, 3, 10, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_163433, 0, 0, 0
	object_event 6, 92, 0, 6, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_1BE789, 379, 0, 0
	object_event 7, 92, 0, 11, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_5F_EventScript_1BEBB3, 464, 0, 0

PokemonTower_5F_MapWarps:
	warp_def 4, 10, 3, 0, 347
	warp_def 18, 10, 3, 1, 349

PokemonTower_5F_MapCoordEvents:
	coord_event 10, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 11, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 12, 8, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 10, 9, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 9, 8, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 12, 9, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 10, 10, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 11, 10, 3, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 12, 10, 0, 0, 16385, 0, 0, PokemonTower_5F_EventScript_16343C
	coord_event 9, 9, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 9, 10, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 10, 11, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 11, 11, 3, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 12, 11, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 8, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 9, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453
	coord_event 13, 10, 0, 0, 16385, 1, 0, PokemonTower_5F_EventScript_163453

PokemonTower_5F_MapBGEvents:
	bg_event 7, 3, 3, 7, 0, 104, 14, 1

gMapEvents_PokemonTower_5F::
	map_events PokemonTower_5F_EventObjects, PokemonTower_5F_MapWarps, PokemonTower_5F_MapCoordEvents, PokemonTower_5F_MapBGEvents

PokemonTower_6F_EventObjects:
	object_event 1, 58, 0, 13, 0, 10, 0, 3, 10, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_163514, 0, 0, 0
	object_event 2, 58, 0, 18, 0, 6, 0, 3, 9, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_163542, 0, 0, 0
	object_event 3, 58, 0, 9, 0, 6, 0, 3, 8, 17, 0, 1, 0, 3, 0, PokemonTower_6F_EventScript_16352B, 0, 0, 0
	object_event 4, 92, 0, 5, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_6F_EventScript_1BE796, 380, 0, 0
	object_event 5, 92, 0, 15, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_6F_EventScript_1BE7A3, 381, 0, 0

PokemonTower_6F_MapWarps:
	warp_def 11, 16, 3, 0, 350
	warp_def 18, 10, 3, 1, 348

PokemonTower_6F_MapCoordEvents:
	coord_event 11, 15, 3, 0, 16473, 0, 0, PokemonTower_6F_EventScript_1634B8
	coord_event 12, 16, 3, 0, 16473, 0, 0, PokemonTower_6F_EventScript_1634B8

gMapEvents_PokemonTower_6F::
	map_events PokemonTower_6F_EventObjects, PokemonTower_6F_MapWarps, PokemonTower_6F_MapCoordEvents, 0x0

PokemonTower_7F_EventObjects:
	object_event 1, 78, 0, 11, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PokemonTower_7F_EventScript_16355A, 52, 0, 0
	object_event 2, 49, 0, 9, 0, 10, 0, 3, 10, 17, 0, 1, 0, 4, 0, PokemonTower_7F_EventScript_163586, 94, 0, 0
	object_event 3, 49, 0, 13, 0, 8, 0, 3, 9, 17, 0, 1, 0, 4, 0, PokemonTower_7F_EventScript_16363D, 131, 0, 0
	object_event 4, 49, 0, 9, 0, 6, 0, 3, 10, 17, 0, 1, 0, 4, 0, PokemonTower_7F_EventScript_1636D6, 132, 0, 0

PokemonTower_7F_MapWarps:
	warp_def 11, 16, 3, 0, 349

PokemonTower_7F_MapBGEvents:
	bg_event 11, 4, 3, 7, 0, 184, 159, 129

gMapEvents_PokemonTower_7F::
	map_events PokemonTower_7F_EventObjects, PokemonTower_7F_MapWarps, 0x0, PokemonTower_7F_MapBGEvents

PowerPlant_EventObjects:
	object_event 1, 92, 0, 7, 0, 27, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE91C, 410, 0, 0
	object_event 2, 92, 0, 40, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE929, 411, 0, 0
	object_event 3, 92, 0, 46, 0, 37, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE936, 412, 0, 0
	object_event 4, 92, 0, 45, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE943, 413, 0, 0
	object_event 5, 92, 0, 26, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1BE950, 414, 0, 0
	object_event 6, 136, 0, 5, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_1637B8, 93, 0, 0
	object_event 7, 92, 0, 36, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_16388D, 134, 0, 0
	object_event 8, 92, 0, 30, 0, 38, 0, 3, 8, 17, 0, 0, 0, 0, 0, PowerPlant_EventScript_16382F, 133, 0, 0

PowerPlant_MapWarps:
	warp_def 4, 39, 3, 2, 796
	warp_def 5, 38, 3, 2, 796
	warp_def 6, 39, 3, 2, 796
	warp_def 1, 11, 3, 4, 796
	warp_def 0, 13, 3, 2, 796

PowerPlant_MapBGEvents:
	bg_event 29, 16, 3, 7, 0, 37, 27, 1
	bg_event 8, 12, 3, 7, 0, 96, 28, 1

gMapEvents_PowerPlant::
	map_events PowerPlant_EventObjects, PowerPlant_MapWarps, 0x0, PowerPlant_MapBGEvents


MtEmber_RubyPath_B4F_MapWarps:
	warp_def 14, 14, 3, 0, 358
	warp_def 4, 2, 3, 2, 362

MtEmber_RubyPath_B4F_MapBGEvents:
	bg_event 3, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638EC
	bg_event 4, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638EC
	bg_event 5, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638EC
	bg_event 4, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638F5
	bg_event 3, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638F5
	bg_event 5, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638F5
	bg_event 3, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638FE
	bg_event 4, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638FE
	bg_event 5, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_1638FE
	bg_event 3, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163907
	bg_event 4, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163907
	bg_event 5, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163907
	bg_event 7, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163910
	bg_event 8, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163910
	bg_event 9, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163910
	bg_event 7, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163919
	bg_event 8, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163919
	bg_event 9, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163919
	bg_event 7, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163922
	bg_event 11, 7, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163934
	bg_event 11, 9, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_16393D
	bg_event 8, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163922
	bg_event 9, 11, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_163922
	bg_event 7, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_16392B
	bg_event 9, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_16392B
	bg_event 8, 13, 0, 1, 0, MtEmber_RubyPath_B4F_EventScript_16392B

gMapEvents_MtEmber_RubyPath_B4F::
	map_events 0x0, MtEmber_RubyPath_B4F_MapWarps, 0x0, MtEmber_RubyPath_B4F_MapBGEvents

MtEmber_Exterior_EventObjects:
	object_event 1, 56, 0, 29, 0, 45, 0, 3, 7, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1C48E6, 0, 0, 0
	object_event 2, 49, 0, 41, 0, 40, 0, 3, 10, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_16397F, 137, 0, 0
	object_event 3, 49, 0, 42, 0, 40, 0, 3, 9, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1639F0, 137, 0, 0
	object_event 4, 24, 0, 22, 0, 35, 0, 3, 46, 53, 0, 1, 0, 1, 0, MtEmber_Exterior_EventScript_163AE2, 0, 0, 0
	object_event 5, 39, 0, 15, 0, 28, 0, 3, 8, 17, 0, 1, 0, 5, 0, MtEmber_Exterior_EventScript_163AB4, 0, 0, 0
	object_event 6, 40, 0, 14, 0, 42, 0, 3, 17, 17, 0, 1, 0, 3, 0, MtEmber_Exterior_EventScript_163ACB, 0, 0, 0
	object_event 7, 96, 0, 29, 0, 41, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 18, 0, 0
	object_event 8, 96, 0, 30, 0, 42, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 19, 0, 0
	object_event 9, 97, 0, 22, 0, 45, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE11D, 0, 0, 0
	object_event 10, 97, 0, 17, 0, 46, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE11D, 0, 0, 0
	object_event 11, 97, 0, 36, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE11D, 0, 0, 0
	object_event 12, 96, 0, 34, 0, 14, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 20, 0, 0
	object_event 13, 96, 0, 36, 0, 15, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 21, 0, 0
	object_event 14, 97, 0, 35, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE11D, 0, 0, 0
	object_event 15, 97, 0, 35, 0, 17, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE11D, 0, 0, 0
	object_event 16, 96, 0, 18, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 22, 0, 0
	object_event 17, 96, 0, 19, 0, 40, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BE00C, 23, 0, 0
	object_event 18, 92, 0, 13, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BED2C, 493, 0, 0
	object_event 19, 92, 0, 38, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BED39, 494, 0, 0
	object_event 20, 92, 0, 48, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtEmber_Exterior_EventScript_1BED46, 495, 0, 0

MtEmber_Exterior_MapWarps:
	warp_def 28, 48, 3, 0, 813
	warp_def 29, 48, 3, 1, 813
	warp_def 14, 24, 3, 0, 354
	warp_def 39, 19, 3, 1, 356
	warp_def 29, 7, 3, 0, 357
	warp_def 42, 39, 0, 0, 359

MtEmber_Exterior_MapCoordEvents:
	coord_event 37, 43, 0, 0, 16511, 1, 0, MtEmber_Exterior_EventScript_163A4E
	coord_event 38, 43, 0, 0, 16511, 1, 0, MtEmber_Exterior_EventScript_163A4E
	coord_event 39, 43, 0, 0, 16511, 1, 0, MtEmber_Exterior_EventScript_163A4E

MtEmber_Exterior_MapBGEvents:
	bg_event 18, 17, 0, 7, 0, 95, 158, 1
	bg_event 8, 30, 3, 7, 0, 2, 162, 1

gMapEvents_MtEmber_Exterior::
	map_events MtEmber_Exterior_EventObjects, MtEmber_Exterior_MapWarps, MtEmber_Exterior_MapCoordEvents, MtEmber_Exterior_MapBGEvents


MtEmber_SummitPath_1F_MapWarps:
	warp_def 2, 15, 0, 2, 353
	warp_def 11, 1, 0, 0, 355

gMapEvents_MtEmber_SummitPath_1F::
	map_events 0x0, MtEmber_SummitPath_1F_MapWarps, 0x0, 0x0

MtEmber_SummitPath_2F_EventObjects:
	object_event 1, 96, 0, 40, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 18, 0, 0
	object_event 2, 96, 0, 33, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 19, 0, 0
	object_event 3, 96, 0, 15, 0, 19, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 20, 0, 0
	object_event 4, 96, 0, 13, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 21, 0, 0
	object_event 5, 96, 0, 13, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 22, 0, 0
	object_event 6, 96, 0, 7, 0, 38, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 23, 0, 0
	object_event 7, 96, 0, 9, 0, 35, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 24, 0, 0
	object_event 8, 96, 0, 7, 0, 34, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 25, 0, 0
	object_event 9, 96, 0, 15, 0, 26, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_SummitPath_2F_EventScript_1BE00C, 26, 0, 0

MtEmber_SummitPath_2F_MapWarps:
	warp_def 8, 39, 0, 1, 354
	warp_def 39, 6, 3, 0, 356

gMapEvents_MtEmber_SummitPath_2F::
	map_events MtEmber_SummitPath_2F_EventObjects, MtEmber_SummitPath_2F_MapWarps, 0x0, 0x0


MtEmber_SummitPath_3F_MapWarps:
	warp_def 2, 4, 0, 1, 355
	warp_def 11, 8, 0, 3, 353

gMapEvents_MtEmber_SummitPath_3F::
	map_events 0x0, MtEmber_SummitPath_3F_MapWarps, 0x0, 0x0

MtEmber_Summit_EventObjects:
	object_event 1, 137, 0, 9, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, MtEmber_Summit_EventScript_163B33, 82, 0, 0
	object_event 2, 97, 0, 10, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Summit_EventScript_1BE11D, 0, 0, 0
	object_event 3, 97, 0, 9, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Summit_EventScript_1BE11D, 0, 0, 0
	object_event 4, 97, 0, 8, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Summit_EventScript_1BE11D, 0, 0, 0
	object_event 5, 97, 0, 8, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_Summit_EventScript_1BE11D, 0, 0, 0

MtEmber_Summit_MapWarps:
	warp_def 9, 15, 0, 4, 353

gMapEvents_MtEmber_Summit::
	map_events MtEmber_Summit_EventObjects, MtEmber_Summit_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B5F_EventObjects:
	object_event 1, 99, 0, 7, 0, 7, 0, 0, 8, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B5F_EventScript_163C49, 138, 0, 0

MtEmber_RubyPath_B5F_MapWarps:
	warp_def 11, 7, 3, 0, 352

MtEmber_RubyPath_B5F_MapBGEvents:
	bg_event 7, 2, 0, 1, 0, MtEmber_RubyPath_B5F_EventScript_163BAB

gMapEvents_MtEmber_RubyPath_B5F::
	map_events MtEmber_RubyPath_B5F_EventObjects, MtEmber_RubyPath_B5F_MapWarps, 0x0, MtEmber_RubyPath_B5F_MapBGEvents

SSAnne_Kitchen3_EventObjects:
	object_event 1, 96, 0, 18, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen3_EventScript_1BE00C, 18, 0, 0
	object_event 2, 96, 0, 23, 0, 16, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen3_EventScript_1BE00C, 19, 0, 0
	object_event 3, 96, 0, 20, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen3_EventScript_1BE00C, 20, 0, 0
	object_event 4, 96, 0, 19, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen3_EventScript_1BE00C, 21, 0, 0
	object_event 5, 96, 0, 21, 0, 15, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSAnne_Kitchen3_EventScript_1BE00C, 22, 0, 0

SSAnne_Kitchen3_MapWarps:
	warp_def 22, 17, 3, 5, 353
	warp_def 1, 1, 0, 0, 360
	warp_def 24, 5, 0, 1, 364

gMapEvents_SSAnne_Kitchen3::
	map_events SSAnne_Kitchen3_EventObjects, SSAnne_Kitchen3_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B1F_EventObjects:
	object_event 1, 96, 0, 1, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B1F_EventScript_1BE00C, 18, 0, 0
	object_event 2, 96, 0, 1, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B1F_EventScript_1BE00C, 19, 0, 0
	object_event 3, 96, 0, 3, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B1F_EventScript_1BE00C, 20, 0, 0
	object_event 4, 96, 0, 5, 0, 14, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B1F_EventScript_1BE00C, 21, 0, 0

MtEmber_RubyPath_B1F_MapWarps:
	warp_def 9, 21, 0, 1, 359
	warp_def 6, 1, 0, 0, 361

gMapEvents_MtEmber_RubyPath_B1F::
	map_events MtEmber_RubyPath_B1F_EventObjects, MtEmber_RubyPath_B1F_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B2F_EventObjects:
	object_event 1, 97, 0, 9, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE11D, 0, 0, 0
	object_event 2, 97, 0, 12, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE11D, 0, 0, 0
	object_event 3, 97, 0, 12, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE11D, 0, 0, 0
	object_event 4, 96, 0, 4, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 1, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 4, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 5, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_EventScript_1BE00C, 21, 0, 0

MtEmber_RubyPath_B2F_MapWarps:
	warp_def 1, 7, 3, 1, 360
	warp_def 13, 9, 3, 0, 362

gMapEvents_MtEmber_RubyPath_B2F::
	map_events MtEmber_RubyPath_B2F_EventObjects, MtEmber_RubyPath_B2F_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B3F_EventObjects:
	object_event 1, 97, 0, 10, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE11D, 0, 0, 0
	object_event 2, 97, 0, 26, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE11D, 0, 0, 0
	object_event 3, 97, 0, 28, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE11D, 0, 0, 0
	object_event 4, 96, 0, 7, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 18, 0, 0
	object_event 5, 96, 0, 4, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 19, 0, 0
	object_event 6, 96, 0, 6, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 20, 0, 0
	object_event 7, 96, 0, 7, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 21, 0, 0
	object_event 8, 96, 0, 4, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 22, 0, 0
	object_event 9, 96, 0, 5, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE00C, 23, 0, 0
	object_event 10, 97, 0, 15, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtEmber_RubyPath_B3F_EventScript_1BE11D, 0, 0, 0

MtEmber_RubyPath_B3F_MapWarps:
	warp_def 1, 4, 0, 1, 361
	warp_def 19, 19, 3, 0, 363
	warp_def 5, 19, 3, 1, 352

gMapEvents_MtEmber_RubyPath_B3F::
	map_events MtEmber_RubyPath_B3F_EventObjects, MtEmber_RubyPath_B3F_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B1F_Stairs_EventObjects:
	object_event 1, 96, 0, 4, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B1F_Stairs_EventScript_1BE00C, 18, 0, 0

MtEmber_RubyPath_B1F_Stairs_MapWarps:
	warp_def 4, 1, 0, 1, 362
	warp_def 1, 5, 0, 0, 364

gMapEvents_MtEmber_RubyPath_B1F_Stairs::
	map_events MtEmber_RubyPath_B1F_Stairs_EventObjects, MtEmber_RubyPath_B1F_Stairs_MapWarps, 0x0, 0x0

MtEmber_RubyPath_B2F_Stairs_EventObjects:
	object_event 1, 96, 0, 4, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_Stairs_EventScript_1BE00C, 18, 0, 0
	object_event 2, 96, 0, 6, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtEmber_RubyPath_B2F_Stairs_EventScript_1BE00C, 19, 0, 0

MtEmber_RubyPath_B2F_Stairs_MapWarps:
	warp_def 6, 1, 0, 1, 363
	warp_def 1, 4, 0, 2, 359

gMapEvents_MtEmber_RubyPath_B2F_Stairs::
	map_events MtEmber_RubyPath_B2F_Stairs_EventObjects, MtEmber_RubyPath_B2F_Stairs_MapWarps, 0x0, 0x0

ThreeIsland_BerryForest_EventObjects:
	object_event 1, 17, 0, 4, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163C83, 122, 0, 0
	object_event 2, 95, 0, 12, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 18, 0, 0
	object_event 3, 95, 0, 19, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 19, 0, 0
	object_event 4, 95, 0, 23, 0, 17, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 20, 0, 0
	object_event 5, 95, 0, 38, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 21, 0, 0
	object_event 6, 95, 0, 44, 0, 23, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 22, 0, 0
	object_event 7, 95, 0, 44, 0, 29, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 23, 0, 0
	object_event 8, 95, 0, 16, 0, 43, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 24, 0, 0
	object_event 9, 95, 0, 17, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 25, 0, 0
	object_event 10, 95, 0, 14, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 26, 0, 0
	object_event 11, 95, 0, 11, 0, 39, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BDF13, 27, 0, 0
	object_event 12, 92, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED05, 490, 0, 0
	object_event 13, 92, 0, 27, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED12, 491, 0, 0
	object_event 14, 92, 0, 12, 0, 43, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_BerryForest_EventScript_1BED1F, 492, 0, 0

ThreeIsland_BerryForest_MapWarps:
	warp_def 43, 41, 3, 0, 816
	warp_def 42, 41, 3, 0, 816
	warp_def 44, 41, 3, 1, 816

ThreeIsland_BerryForest_MapBGEvents:
	bg_event 7, 27, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163D31
	bg_event 39, 35, 0, 0, 0, ThreeIsland_BerryForest_EventScript_163D28
	bg_event 31, 25, 3, 7, 0, 148, 90, 1
	bg_event 15, 15, 3, 7, 0, 149, 91, 1
	bg_event 25, 24, 3, 7, 0, 150, 92, 1
	bg_event 11, 24, 3, 7, 0, 151, 93, 1
	bg_event 37, 18, 3, 7, 0, 139, 94, 1
	bg_event 14, 23, 3, 7, 0, 133, 95, 1
	bg_event 47, 5, 3, 7, 0, 134, 96, 1
	bg_event 7, 30, 3, 7, 0, 135, 97, 1
	bg_event 16, 5, 3, 7, 0, 136, 98, 1
	bg_event 25, 6, 3, 7, 0, 137, 99, 1
	bg_event 46, 32, 3, 7, 0, 140, 100, 1
	bg_event 43, 16, 3, 7, 0, 152, 101, 1
	bg_event 8, 5, 3, 7, 0, 141, 102, 1

gMapEvents_ThreeIsland_BerryForest::
	map_events ThreeIsland_BerryForest_EventObjects, ThreeIsland_BerryForest_MapWarps, 0x0, ThreeIsland_BerryForest_MapBGEvents


FourIsland_IcefallCave_Entrance_MapWarps:
	warp_def 17, 30, 3, 3, 783
	warp_def 10, 21, 3, 0, 367
	warp_def 9, 7, 3, 1, 367

gMapEvents_FourIsland_IcefallCave_Entrance::
	map_events 0x0, FourIsland_IcefallCave_Entrance_MapWarps, 0x0, 0x0

FourIsland_IcefallCave_1F_EventObjects:
	object_event 1, 92, 0, 11, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_IcefallCave_1F_EventScript_1BED53, 496, 0, 0
	object_event 2, 92, 0, 12, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_IcefallCave_1F_EventScript_1BED60, 497, 0, 0

FourIsland_IcefallCave_1F_MapWarps:
	warp_def 3, 17, 0, 1, 366
	warp_def 2, 8, 3, 2, 366
	warp_def 12, 12, 3, 0, 368
	warp_def 12, 3, 3, 1, 368
	warp_def 15, 16, 3, 2, 368
	warp_def 3, 6, 3, 0, 369

gMapEvents_FourIsland_IcefallCave_1F::
	map_events FourIsland_IcefallCave_1F_EventObjects, FourIsland_IcefallCave_1F_MapWarps, 0x0, 0x0

SSAnne_CaptainsOffice2_EventObjects:
	object_event 1, 92, 0, 10, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice2_EventScript_1BED6D, 498, 0, 0
	object_event 2, 92, 0, 21, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice2_EventScript_1BED7A, 499, 0, 0

SSAnne_CaptainsOffice2_MapWarps:
	warp_def 12, 12, 3, 2, 367
	warp_def 12, 3, 3, 3, 367
	warp_def 15, 16, 3, 4, 367

gMapEvents_SSAnne_CaptainsOffice2::
	map_events SSAnne_CaptainsOffice2_EventObjects, SSAnne_CaptainsOffice2_MapWarps, 0x0, 0x0

SSAnne_CaptainsOffice3_EventObjects:
	object_event 1, 49, 0, 11, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 141, 0, 0
	object_event 2, 49, 0, 13, 0, 14, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 141, 0, 0
	object_event 3, 77, 0, 12, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice3_EventScript_163F25, 139, 0, 0
	object_event 4, 49, 0, 10, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 141, 0, 0

SSAnne_CaptainsOffice3_MapWarps:
	warp_def 12, 23, 0, 5, 367

SSAnne_CaptainsOffice3_MapCoordEvents:
	coord_event 11, 18, 3, 0, 16512, 0, 0, SSAnne_CaptainsOffice3_EventScript_163D98
	coord_event 12, 18, 3, 0, 16512, 0, 0, SSAnne_CaptainsOffice3_EventScript_163D98
	coord_event 13, 18, 3, 0, 16512, 0, 0, SSAnne_CaptainsOffice3_EventScript_163D98

gMapEvents_SSAnne_CaptainsOffice3::
	map_events SSAnne_CaptainsOffice3_EventObjects, SSAnne_CaptainsOffice3_MapWarps, SSAnne_CaptainsOffice3_MapCoordEvents, 0x0

SSAnne_CaptainsOffice4_EventObjects:
	object_event 1, 49, 0, 15, 0, 11, 0, 3, 17, 17, 0, 1, 0, 1, 0, SSAnne_CaptainsOffice4_EventScript_163FE6, 136, 0, 0
	object_event 2, 49, 0, 17, 0, 15, 0, 3, 10, 17, 0, 1, 0, 1, 0, SSAnne_CaptainsOffice4_EventScript_163FFD, 136, 0, 0
	object_event 3, 50, 0, 27, 0, 16, 0, 3, 9, 17, 0, 1, 0, 3, 0, SSAnne_CaptainsOffice4_EventScript_164087, 136, 0, 0
	object_event 4, 49, 0, 25, 0, 11, 0, 3, 10, 17, 0, 1, 0, 3, 0, SSAnne_CaptainsOffice4_EventScript_164014, 136, 0, 0
	object_event 5, 50, 0, 6, 0, 6, 0, 3, 16, 17, 0, 1, 0, 3, 0, SSAnne_CaptainsOffice4_EventScript_164070, 136, 0, 0
	object_event 6, 55, 0, 27, 0, 4, 0, 3, 9, 17, 0, 1, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F93, 0, 0, 0
	object_event 7, 92, 0, 8, 0, 25, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_1BED87, 500, 0, 0
	object_event 8, 92, 0, 17, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_1BED94, 501, 0, 0
	object_event 9, 92, 0, 1, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_1BEDA1, 502, 0, 0
	object_event 10, 92, 0, 4, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_1BEDAE, 503, 0, 0

SSAnne_CaptainsOffice4_MapWarps:
	warp_def 24, 25, 3, 0, 824

SSAnne_CaptainsOffice4_MapCoordEvents:
	coord_event 22, 11, 3, 0, 16520, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F81
	coord_event 23, 11, 3, 0, 16520, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F81
	coord_event 24, 11, 3, 0, 16520, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F81

SSAnne_CaptainsOffice4_MapBGEvents:
	bg_event 11, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 26, 11, 0, 3, 0, SSAnne_CaptainsOffice4_EventScript_163F78
	bg_event 27, 2, 0, 7, 0, 8, 68, 1
	bg_event 7, 16, 0, 7, 0, 6, 69, 1
	bg_event 12, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 10, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 9, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 8, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 7, 2, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 11, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 10, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 11, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 10, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 8, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 7, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 8, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 7, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 5, 3, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 4, 3, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 5, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 4, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 3, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 2, 4, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 2, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A
	bg_event 3, 5, 0, 0, 0, SSAnne_CaptainsOffice4_EventScript_163F5A

gMapEvents_SSAnne_CaptainsOffice4::
	map_events SSAnne_CaptainsOffice4_EventObjects, SSAnne_CaptainsOffice4_MapWarps, SSAnne_CaptainsOffice4_MapCoordEvents, SSAnne_CaptainsOffice4_MapBGEvents


SSAnne_CaptainsOffice5_MapWarps:
	warp_def 6, 9, 3, 0, 829
	warp_def 6, 5, 3, 0, 372
	warp_def 13, 5, 3, 0, 376
	warp_def 6, 7, 3, 2, 372

gMapEvents_SSAnne_CaptainsOffice5::
	map_events 0x0, SSAnne_CaptainsOffice5_MapWarps, 0x0, 0x0


SixIsland_DottedHole_B1F_MapWarps:
	warp_def 6, 7, 3, 1, 371
	warp_def 6, 1, 3, 0, 373
	warp_def 11, 5, 3, 3, 371
	warp_def 6, 9, 3, 3, 371
	warp_def 1, 5, 3, 3, 371

SixIsland_DottedHole_B1F_MapBGEvents:
	bg_event 6, 5, 0, 1, 0, SixIsland_DottedHole_B1F_EventScript_16418C

gMapEvents_SixIsland_DottedHole_B1F::
	map_events 0x0, SixIsland_DottedHole_B1F_MapWarps, 0x0, SixIsland_DottedHole_B1F_MapBGEvents


SixIsland_DottedHole_B2F_MapWarps:
	warp_def 6, 7, 3, 1, 372
	warp_def 6, 1, 3, 3, 371
	warp_def 11, 5, 3, 3, 371
	warp_def 6, 9, 3, 3, 371
	warp_def 1, 5, 3, 0, 374

SixIsland_DottedHole_B2F_MapBGEvents:
	bg_event 6, 5, 0, 1, 0, SixIsland_DottedHole_B2F_EventScript_1641A7

gMapEvents_SixIsland_DottedHole_B2F::
	map_events 0x0, SixIsland_DottedHole_B2F_MapWarps, 0x0, SixIsland_DottedHole_B2F_MapBGEvents


SixIsland_DottedHole_B3F_MapWarps:
	warp_def 6, 7, 3, 4, 373
	warp_def 6, 1, 3, 3, 371
	warp_def 11, 5, 3, 0, 375
	warp_def 6, 9, 3, 3, 371
	warp_def 1, 5, 3, 3, 371

SixIsland_DottedHole_B3F_MapBGEvents:
	bg_event 6, 5, 0, 1, 0, SixIsland_DottedHole_B3F_EventScript_16419E

gMapEvents_SixIsland_DottedHole_B3F::
	map_events 0x0, SixIsland_DottedHole_B3F_MapWarps, 0x0, SixIsland_DottedHole_B3F_MapBGEvents


SSAnne_CaptainsOffice9_MapWarps:
	warp_def 6, 7, 3, 2, 374
	warp_def 6, 1, 3, 3, 371
	warp_def 11, 5, 3, 3, 371
	warp_def 6, 9, 3, 1, 376
	warp_def 1, 5, 3, 3, 371

SSAnne_CaptainsOffice9_MapBGEvents:
	bg_event 6, 5, 0, 1, 0, SSAnne_CaptainsOffice9_EventScript_164195

gMapEvents_SSAnne_CaptainsOffice9::
	map_events 0x0, SSAnne_CaptainsOffice9_MapWarps, 0x0, SSAnne_CaptainsOffice9_MapBGEvents

SixIsland_DottedHole_SapphireRoom_EventObjects:
	object_event 1, 100, 0, 7, 0, 7, 0, 0, 8, 17, 0, 0, 0, 0, 0, SixIsland_DottedHole_SapphireRoom_EventScript_1641B5, 143, 0, 0
	object_event 2, 55, 0, 5, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 144, 0, 0

SixIsland_DottedHole_SapphireRoom_MapWarps:
	warp_def 11, 7, 3, 2, 371
	warp_def 5, 9, 3, 3, 375

SixIsland_DottedHole_SapphireRoom_MapBGEvents:
	bg_event 7, 2, 0, 1, 0, SixIsland_DottedHole_SapphireRoom_EventScript_16441F

gMapEvents_SixIsland_DottedHole_SapphireRoom::
	map_events SixIsland_DottedHole_SapphireRoom_EventObjects, SixIsland_DottedHole_SapphireRoom_MapWarps, 0x0, SixIsland_DottedHole_SapphireRoom_MapBGEvents

SSAnne_1F_Room11_EventObjects:
	object_event 1, 28, 0, 48, 0, 15, 0, 3, 20, 17, 0, 1, 0, 3, 0, SSAnne_1F_Room11_EventScript_164590, 0, 0, 0
	object_event 2, 28, 0, 10, 0, 5, 0, 3, 18, 17, 0, 1, 0, 2, 0, SSAnne_1F_Room11_EventScript_1645A7, 0, 0, 0
	object_event 3, 20, 0, 51, 0, 6, 0, 3, 8, 17, 0, 1, 0, 2, 0, SSAnne_1F_Room11_EventScript_1645BE, 0, 0, 0
	object_event 4, 20, 0, 12, 0, 13, 0, 3, 2, 33, 0, 1, 0, 2, 0, SSAnne_1F_Room11_EventScript_1645D5, 0, 0, 0
	object_event 5, 20, 0, 37, 0, 23, 0, 3, 51, 82, 0, 1, 0, 1, 0, SSAnne_1F_Room11_EventScript_1645EC, 0, 0, 0
	object_event 6, 18, 0, 32, 0, 5, 0, 3, 8, 17, 0, 1, 0, 2, 0, SSAnne_1F_Room11_EventScript_164603, 0, 0, 0
	object_event 7, 18, 0, 52, 0, 20, 0, 3, 10, 17, 0, 1, 0, 4, 0, SSAnne_1F_Room11_EventScript_16461A, 0, 0, 0
	object_event 8, 22, 0, 8, 0, 21, 0, 3, 17, 17, 0, 1, 0, 5, 0, SSAnne_1F_Room11_EventScript_164631, 0, 0, 0
	object_event 9, 22, 0, 39, 0, 6, 0, 3, 2, 17, 0, 1, 0, 3, 0, SSAnne_1F_Room11_EventScript_164648, 0, 0, 0
	object_event 10, 39, 0, 3, 0, 9, 0, 3, 3, 33, 0, 1, 0, 3, 0, SSAnne_1F_Room11_EventScript_16465F, 0, 0, 0
	object_event 11, 40, 0, 19, 0, 24, 0, 3, 28, 21, 0, 1, 0, 1, 0, SSAnne_1F_Room11_EventScript_164676, 0, 0, 0
	object_event 12, 56, 0, 30, 0, 19, 0, 3, 7, 17, 0, 1, 0, 3, 0, SSAnne_1F_Room11_EventScript_16468D, 0, 0, 0

SSAnne_1F_Room11_MapWarps:
	warp_def 54, 26, 3, 0, 827
	warp_def 55, 26, 3, 0, 827
	warp_def 56, 26, 3, 1, 827
	warp_def 3, 26, 3, 2, 827
	warp_def 4, 26, 3, 2, 827
	warp_def 5, 26, 3, 3, 827

gMapEvents_SSAnne_1F_Room11::
	map_events SSAnne_1F_Room11_EventObjects, SSAnne_1F_Room11_MapWarps, 0x0, 0x0


SSAnne_1F_Room12_MapWarps:
	warp_def 18, 22, 3, 0, 826

gMapEvents_SSAnne_1F_Room12::
	map_events 0x0, SSAnne_1F_Room12_MapWarps, 0x0, 0x0


NavelRock_Exterior_MapWarps:
	warp_def 9, 8, 3, 1, 548
	warp_def 9, 16, 3, 0, 571

gMapEvents_NavelRock_Exterior::
	map_events 0x0, NavelRock_Exterior_MapWarps, 0x0, 0x0

SevenIsland_TrainerTower_1F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 6, 0, 0
	object_event 2, 240, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_1F_MapWarps:
	warp_def 15, 6, 3, 1, 514
	warp_def 4, 6, 3, 0, 522

SevenIsland_TrainerTower_1F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54AF
	coord_event 9, 12, 0, 0, 16399, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_1F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_1F::
	map_events SevenIsland_TrainerTower_1F_EventObjects, SevenIsland_TrainerTower_1F_MapWarps, SevenIsland_TrainerTower_1F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_2F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_2F_MapWarps:
	warp_def 15, 6, 3, 1, 515
	warp_def 4, 6, 3, 0, 513
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_2F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_2F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_2F::
	map_events SevenIsland_TrainerTower_2F_EventObjects, SevenIsland_TrainerTower_2F_MapWarps, SevenIsland_TrainerTower_2F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_3F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_3F_MapWarps:
	warp_def 15, 6, 3, 1, 516
	warp_def 4, 6, 3, 0, 514
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_3F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_3F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_3F::
	map_events SevenIsland_TrainerTower_3F_EventObjects, SevenIsland_TrainerTower_3F_MapWarps, SevenIsland_TrainerTower_3F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_4F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_4F_MapWarps:
	warp_def 15, 6, 3, 1, 517
	warp_def 4, 6, 3, 0, 515
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_4F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_4F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_4F::
	map_events SevenIsland_TrainerTower_4F_EventObjects, SevenIsland_TrainerTower_4F_MapWarps, SevenIsland_TrainerTower_4F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_5F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_5F_MapWarps:
	warp_def 15, 6, 3, 1, 518
	warp_def 4, 6, 3, 0, 516
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_5F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_5F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_5F::
	map_events SevenIsland_TrainerTower_5F_EventObjects, SevenIsland_TrainerTower_5F_MapWarps, SevenIsland_TrainerTower_5F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_6F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_6F_MapWarps:
	warp_def 15, 6, 3, 1, 519
	warp_def 4, 6, 3, 0, 517
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_6F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_6F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_6F::
	map_events SevenIsland_TrainerTower_6F_EventObjects, SevenIsland_TrainerTower_6F_MapWarps, SevenIsland_TrainerTower_6F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_7F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_7F_MapWarps:
	warp_def 15, 6, 3, 1, 520
	warp_def 4, 6, 3, 0, 518
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_7F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_7F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_7F::
	map_events SevenIsland_TrainerTower_7F_EventObjects, SevenIsland_TrainerTower_7F_MapWarps, SevenIsland_TrainerTower_7F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_8F_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1646E0, 6, 0, 0
	object_event 2, 240, 0, 10, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1646C8, 2, 0, 0
	object_event 3, 241, 0, 15, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1646CE, 3, 0, 0
	object_event 4, 242, 0, 10, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1646D4, 4, 0, 0
	object_event 5, 243, 0, 11, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1646DA, 5, 0, 0

SevenIsland_TrainerTower_8F_MapWarps:
	warp_def 15, 6, 3, 1, 521
	warp_def 4, 6, 3, 0, 519
	warp_def 13, 5, 0, 0, 523

SevenIsland_TrainerTower_8F_MapCoordEvents:
	coord_event 10, 13, 3, 0, 16398, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1C54AF
	coord_event 9, 12, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1C54B4
	coord_event 9, 13, 3, 0, 16399, 0, 0, SevenIsland_TrainerTower_8F_EventScript_1C54EA

gMapEvents_SevenIsland_TrainerTower_8F::
	map_events SevenIsland_TrainerTower_8F_EventObjects, SevenIsland_TrainerTower_8F_MapWarps, SevenIsland_TrainerTower_8F_MapCoordEvents, 0x0

SevenIsland_TrainerTower_Roof_EventObjects:
	object_event 1, 70, 0, 9, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Roof_EventScript_1646E0, 6, 0, 0

SevenIsland_TrainerTower_Roof_MapWarps:
	warp_def 13, 5, 0, 0, 523
	warp_def 4, 6, 3, 0, 520

gMapEvents_SevenIsland_TrainerTower_Roof::
	map_events SevenIsland_TrainerTower_Roof_EventObjects, SevenIsland_TrainerTower_Roof_MapWarps, 0x0, 0x0

SevenIsland_TrainerTower_Lobby_EventObjects:
	object_event 1, 64, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_16495D, 0, 0, 0
	object_event 2, 66, 0, 14, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164992, 0, 0, 0
	object_event 3, 66, 0, 11, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164966, 0, 0, 0
	object_event 4, 42, 0, 12, 0, 13, 0, 3, 2, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AE6, 0, 0, 0
	object_event 5, 30, 0, 2, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AEF, 0, 0, 0

SevenIsland_TrainerTower_Lobby_MapWarps:
	warp_def 9, 2, 3, 1, 513
	warp_def 9, 15, 3, 0, 830
	warp_def 17, 8, 0, 0, 523

SevenIsland_TrainerTower_Lobby_MapCoordEvents:
	coord_event 9, 7, 3, 0, 16514, 0, 0, SevenIsland_TrainerTower_Lobby_EventScript_1649CE

SevenIsland_TrainerTower_Lobby_MapBGEvents:
	bg_event 8, 10, 0, 1, 0, SevenIsland_TrainerTower_Lobby_EventScript_164AD8

gMapEvents_SevenIsland_TrainerTower_Lobby::
	map_events SevenIsland_TrainerTower_Lobby_EventObjects, SevenIsland_TrainerTower_Lobby_MapWarps, SevenIsland_TrainerTower_Lobby_MapCoordEvents, SevenIsland_TrainerTower_Lobby_MapBGEvents


SevenIsland_TrainerTower_Elevator_MapWarps:
	warp_def 2, 5, 3, 127, 32639

SevenIsland_TrainerTower_Elevator_MapBGEvents:
	bg_event 0, 2, 0, 0, 0, SevenIsland_TrainerTower_Elevator_EventScript_164B03

gMapEvents_SevenIsland_TrainerTower_Elevator::
	map_events 0x0, SevenIsland_TrainerTower_Elevator_MapWarps, 0x0, SevenIsland_TrainerTower_Elevator_MapBGEvents


FiveIsland_LostCave_Entrance_MapWarps:
	warp_def 5, 8, 3, 0, 822
	warp_def 5, 5, 3, 0, 525

gMapEvents_FiveIsland_LostCave_Entrance::
	map_events 0x0, FiveIsland_LostCave_Entrance_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room1_EventObjects:
	object_event 1, 56, 0, 5, 0, 4, 0, 3, 2, 17, 0, 1, 0, 1, 0, FiveIsland_LostCave_Room1_EventScript_164BF7, 0, 0, 0

FiveIsland_LostCave_Room1_MapWarps:
	warp_def 8, 2, 3, 1, 524
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 3, 526
	warp_def 5, 8, 3, 1, 525
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room1::
	map_events FiveIsland_LostCave_Room1_EventObjects, FiveIsland_LostCave_Room1_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room2_MapWarps:
	warp_def 5, 1, 3, 2, 527
	warp_def 8, 5, 3, 4, 525
	warp_def 5, 8, 3, 0, 535
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room2::
	map_events 0x0, FiveIsland_LostCave_Room2_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room3_MapWarps:
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 4, 525
	warp_def 5, 8, 3, 0, 528
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room3::
	map_events 0x0, FiveIsland_LostCave_Room3_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room4_EventObjects:
	object_event 1, 23, 0, 6, 0, 4, 0, 3, 8, 17, 0, 1, 0, 1, 0, FiveIsland_LostCave_Room4_EventScript_164C11, 0, 0, 0

FiveIsland_LostCave_Room4_MapWarps:
	warp_def 5, 1, 3, 0, 536
	warp_def 8, 5, 3, 4, 525
	warp_def 5, 8, 3, 0, 529
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room4::
	map_events FiveIsland_LostCave_Room4_EventObjects, FiveIsland_LostCave_Room4_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room5_MapWarps:
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 3, 530
	warp_def 5, 8, 3, 1, 525
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room5::
	map_events 0x0, FiveIsland_LostCave_Room5_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room6_MapWarps:
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 0, 537
	warp_def 5, 8, 3, 1, 525
	warp_def 2, 5, 3, 1, 531

gMapEvents_FiveIsland_LostCave_Room6::
	map_events 0x0, FiveIsland_LostCave_Room6_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room7_MapWarps:
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 4, 525
	warp_def 5, 8, 3, 0, 532
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room7::
	map_events 0x0, FiveIsland_LostCave_Room7_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room8_MapWarps:
	warp_def 5, 1, 3, 3, 525
	warp_def 8, 5, 3, 3, 533
	warp_def 5, 8, 3, 1, 525
	warp_def 2, 5, 3, 0, 538

gMapEvents_FiveIsland_LostCave_Room8::
	map_events 0x0, FiveIsland_LostCave_Room8_MapWarps, 0x0, 0x0


FiveIsland_LostCave_Room9_MapWarps:
	warp_def 5, 1, 3, 0, 534
	warp_def 8, 5, 3, 4, 525
	warp_def 5, 8, 3, 1, 525
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room9::
	map_events 0x0, FiveIsland_LostCave_Room9_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room10_EventObjects:
	object_event 1, 28, 0, 5, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 147, 0, 0
	object_event 2, 92, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_LostCave_Room10_EventScript_1BEDBB, 504, 0, 0

FiveIsland_LostCave_Room10_MapWarps:
	warp_def 5, 8, 3, 1, 525

gMapEvents_FiveIsland_LostCave_Room10::
	map_events FiveIsland_LostCave_Room10_EventObjects, FiveIsland_LostCave_Room10_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room11_EventObjects:
	object_event 1, 92, 0, 5, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_LostCave_Room11_EventScript_1BEDC8, 505, 0, 0

FiveIsland_LostCave_Room11_MapWarps:
	warp_def 5, 1, 3, 3, 525

gMapEvents_FiveIsland_LostCave_Room11::
	map_events FiveIsland_LostCave_Room11_EventObjects, FiveIsland_LostCave_Room11_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room12_EventObjects:
	object_event 1, 92, 0, 5, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_LostCave_Room12_EventScript_1BEDD5, 506, 0, 0

FiveIsland_LostCave_Room12_MapWarps:
	warp_def 5, 8, 3, 1, 525

gMapEvents_FiveIsland_LostCave_Room12::
	map_events FiveIsland_LostCave_Room12_EventObjects, FiveIsland_LostCave_Room12_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room13_EventObjects:
	object_event 1, 92, 0, 5, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_LostCave_Room13_EventScript_1BEDE2, 507, 0, 0

FiveIsland_LostCave_Room13_MapWarps:
	warp_def 2, 5, 3, 2, 525

gMapEvents_FiveIsland_LostCave_Room13::
	map_events FiveIsland_LostCave_Room13_EventObjects, FiveIsland_LostCave_Room13_MapWarps, 0x0, 0x0

FiveIsland_LostCave_Room14_EventObjects:
	object_event 1, 92, 0, 5, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_LostCave_Room14_EventScript_1BEDEF, 508, 0, 0

FiveIsland_LostCave_Room14_MapWarps:
	warp_def 8, 5, 3, 4, 525

gMapEvents_FiveIsland_LostCave_Room14::
	map_events FiveIsland_LostCave_Room14_EventObjects, FiveIsland_LostCave_Room14_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_MoneanChamber_MapWarps:
	warp_def 11, 15, 3, 0, 833

gMapEvents_SevenIsland_TanobyRuins_MoneanChamber::
	map_events 0x0, SevenIsland_TanobyRuins_MoneanChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_LiptooChamber_MapWarps:
	warp_def 11, 15, 3, 1, 833

gMapEvents_SevenIsland_TanobyRuins_LiptooChamber::
	map_events 0x0, SevenIsland_TanobyRuins_LiptooChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_WeepthChamber_MapWarps:
	warp_def 11, 15, 3, 2, 833

gMapEvents_SevenIsland_TanobyRuins_WeepthChamber::
	map_events 0x0, SevenIsland_TanobyRuins_WeepthChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_DilfordChamber_MapWarps:
	warp_def 11, 15, 3, 3, 833

gMapEvents_SevenIsland_TanobyRuins_DilfordChamber::
	map_events 0x0, SevenIsland_TanobyRuins_DilfordChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_ScufibChamber_MapWarps:
	warp_def 11, 15, 3, 4, 833

gMapEvents_SevenIsland_TanobyRuins_ScufibChamber::
	map_events 0x0, SevenIsland_TanobyRuins_ScufibChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_RixyChamber_MapWarps:
	warp_def 11, 15, 3, 5, 833

gMapEvents_SevenIsland_TanobyRuins_RixyChamber::
	map_events 0x0, SevenIsland_TanobyRuins_RixyChamber_MapWarps, 0x0, 0x0


SevenIsland_TanobyRuins_ViapoisChamber_MapWarps:
	warp_def 11, 15, 3, 6, 833

gMapEvents_SevenIsland_TanobyRuins_ViapoisChamber::
	map_events 0x0, SevenIsland_TanobyRuins_ViapoisChamber_MapWarps, 0x0, 0x0

ThreeIsland_DunsparceTunnel_EventObjects:
	object_event 1, 27, 0, 23, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_DunsparceTunnel_EventScript_164D60, 0, 0, 0

ThreeIsland_DunsparceTunnel_MapWarps:
	warp_def 3, 4, 3, 0, 817
	warp_def 25, 5, 3, 1, 817

ThreeIsland_DunsparceTunnel_MapBGEvents:
	bg_event 21, 3, 0, 7, 0, 110, 163, 1

gMapEvents_ThreeIsland_DunsparceTunnel::
	map_events ThreeIsland_DunsparceTunnel_EventObjects, ThreeIsland_DunsparceTunnel_MapWarps, 0x0, ThreeIsland_DunsparceTunnel_MapBGEvents

SevenIsland_SeavaultCanyon_TanobyKey_EventObjects:
	object_event 1, 97, 0, 7, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 2, 97, 0, 8, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 3, 97, 0, 8, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 4, 97, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 5, 97, 0, 8, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 6, 97, 0, 6, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0
	object_event 7, 97, 0, 6, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_1BE11D, 0, 0, 0

SevenIsland_SeavaultCanyon_TanobyKey_MapWarps:
	warp_def 7, 13, 3, 0, 832

SevenIsland_SeavaultCanyon_TanobyKey_MapCoordEvents:
	coord_event 7, 2, 3, 0, 16385, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164E39
	coord_event 9, 8, 3, 0, 16391, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164F0B
	coord_event 5, 8, 3, 0, 16390, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164EE8
	coord_event 9, 6, 3, 0, 16389, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164EC5
	coord_event 5, 6, 3, 0, 16388, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164EA2
	coord_event 10, 4, 3, 0, 16387, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164E7F
	coord_event 4, 4, 3, 0, 16386, 99, 0, SevenIsland_SeavaultCanyon_TanobyKey_EventScript_164E5C

gMapEvents_SevenIsland_SeavaultCanyon_TanobyKey::
	map_events SevenIsland_SeavaultCanyon_TanobyKey_EventObjects, SevenIsland_SeavaultCanyon_TanobyKey_MapWarps, SevenIsland_SeavaultCanyon_TanobyKey_MapCoordEvents, 0x0


NavelRock_1F_MapWarps:
	warp_def 8, 4, 3, 0, 566
	warp_def 8, 23, 3, 0, 512

gMapEvents_NavelRock_1F::
	map_events 0x0, NavelRock_1F_MapWarps, 0x0, 0x0

NavelRock_Summit_EventObjects:
	object_event 1, 145, 0, 9, 0, 6, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 156, 0, 0

NavelRock_Summit_MapWarps:
	warp_def 10, 18, 3, 1, 554

NavelRock_Summit_MapCoordEvents:
	coord_event 9, 12, 3, 0, 16385, 0, 0, NavelRock_Summit_EventScript_164FFB

NavelRock_Summit_MapBGEvents:
	bg_event 9, 11, 3, 7, 0, 45, 160, 129

gMapEvents_NavelRock_Summit::
	map_events NavelRock_Summit_EventObjects, NavelRock_Summit_MapWarps, NavelRock_Summit_MapCoordEvents, NavelRock_Summit_MapBGEvents

NavelRock_Base_EventObjects:
	object_event 1, 144, 0, 10, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, NavelRock_Base_EventScript_165134, 155, 0, 0

NavelRock_Base_MapWarps:
	warp_def 13, 20, 3, 1, 565

gMapEvents_NavelRock_Base::
	map_events NavelRock_Base_EventObjects, NavelRock_Base_MapWarps, 0x0, 0x0


NavelRock_SummitPath_2F_MapWarps:
	warp_def 4, 4, 3, 1, 567
	warp_def 2, 2, 3, 0, 552

gMapEvents_NavelRock_SummitPath_2F::
	map_events 0x0, NavelRock_SummitPath_2F_MapWarps, 0x0, 0x0


NavelRock_SummitPath_3F_MapWarps:
	warp_def 2, 2, 3, 1, 551
	warp_def 4, 4, 3, 0, 553

gMapEvents_NavelRock_SummitPath_3F::
	map_events 0x0, NavelRock_SummitPath_3F_MapWarps, 0x0, 0x0


NavelRock_SummitPath_4F_MapWarps:
	warp_def 4, 4, 3, 1, 552
	warp_def 2, 2, 3, 0, 554

gMapEvents_NavelRock_SummitPath_4F::
	map_events 0x0, NavelRock_SummitPath_4F_MapWarps, 0x0, 0x0


NavelRock_SummitPath_5F_MapWarps:
	warp_def 2, 2, 3, 1, 553
	warp_def 4, 4, 3, 0, 549

gMapEvents_NavelRock_SummitPath_5F::
	map_events 0x0, NavelRock_SummitPath_5F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B1F_MapWarps:
	warp_def 2, 2, 3, 2, 567
	warp_def 4, 4, 3, 0, 556

gMapEvents_NavelRock_BasePath_B1F::
	map_events 0x0, NavelRock_BasePath_B1F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B2F_MapWarps:
	warp_def 4, 4, 3, 1, 555
	warp_def 2, 2, 3, 0, 557

gMapEvents_NavelRock_BasePath_B2F::
	map_events 0x0, NavelRock_BasePath_B2F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B3F_MapWarps:
	warp_def 2, 2, 3, 1, 556
	warp_def 4, 4, 3, 0, 558

gMapEvents_NavelRock_BasePath_B3F::
	map_events 0x0, NavelRock_BasePath_B3F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B4F_MapWarps:
	warp_def 4, 4, 3, 1, 557
	warp_def 2, 2, 3, 0, 559

gMapEvents_NavelRock_BasePath_B4F::
	map_events 0x0, NavelRock_BasePath_B4F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B5F_MapWarps:
	warp_def 2, 2, 3, 1, 558
	warp_def 4, 4, 3, 0, 560

gMapEvents_NavelRock_BasePath_B5F::
	map_events 0x0, NavelRock_BasePath_B5F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B6F_MapWarps:
	warp_def 4, 4, 3, 1, 559
	warp_def 2, 2, 3, 0, 561

gMapEvents_NavelRock_BasePath_B6F::
	map_events 0x0, NavelRock_BasePath_B6F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B7F_MapWarps:
	warp_def 2, 2, 3, 1, 560
	warp_def 4, 4, 3, 0, 562

gMapEvents_NavelRock_BasePath_B7F::
	map_events 0x0, NavelRock_BasePath_B7F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B8F_MapWarps:
	warp_def 4, 4, 3, 1, 561
	warp_def 2, 2, 3, 0, 563

gMapEvents_NavelRock_BasePath_B8F::
	map_events 0x0, NavelRock_BasePath_B8F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B9F_MapWarps:
	warp_def 2, 2, 3, 1, 562
	warp_def 4, 4, 3, 0, 564

gMapEvents_NavelRock_BasePath_B9F::
	map_events 0x0, NavelRock_BasePath_B9F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B10F_MapWarps:
	warp_def 4, 4, 3, 1, 563
	warp_def 2, 2, 3, 0, 565

gMapEvents_NavelRock_BasePath_B10F::
	map_events 0x0, NavelRock_BasePath_B10F_MapWarps, 0x0, 0x0


NavelRock_BasePath_B11F_MapWarps:
	warp_def 2, 2, 3, 1, 564
	warp_def 4, 4, 3, 0, 550

gMapEvents_NavelRock_BasePath_B11F::
	map_events 0x0, NavelRock_BasePath_B11F_MapWarps, 0x0, 0x0


NavelRock_B1F_MapWarps:
	warp_def 4, 2, 3, 0, 548
	warp_def 11, 5, 3, 0, 567

gMapEvents_NavelRock_B1F::
	map_events 0x0, NavelRock_B1F_MapWarps, 0x0, 0x0


NavelRock_Fork_MapWarps:
	warp_def 13, 95, 3, 1, 566
	warp_def 3, 1, 3, 0, 551
	warp_def 26, 1, 3, 0, 555

gMapEvents_NavelRock_Fork::
	map_events 0x0, NavelRock_Fork_MapWarps, 0x0, 0x0

BirthIsland_Exterior_EventObjects:
	object_event 1, 106, 0, 15, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, BirthIsland_Exterior_EventScript_165271, 154, 0, 0
	object_event 2, 240, 0, 15, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 153, 0, 0

BirthIsland_Exterior_MapWarps:
	warp_def 15, 24, 3, 0, 570

gMapEvents_BirthIsland_Exterior::
	map_events BirthIsland_Exterior_EventObjects, BirthIsland_Exterior_MapWarps, 0x0, 0x0

OneIsland_KindleRoad_EmberSpa_EventObjects:
	object_event 1, 32, 0, 11, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_16535C, 0, 0, 0
	object_event 2, 30, 0, 15, 0, 11, 0, 3, 18, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_165365, 0, 0, 0
	object_event 3, 54, 0, 6, 0, 8, 0, 3, 5, 18, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_165380, 157, 0, 0
	object_event 4, 35, 0, 20, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_165377, 0, 0, 0
	object_event 5, 32, 0, 10, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_165399, 0, 0, 0
	object_event 6, 30, 0, 11, 0, 20, 0, 3, 5, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_16536E, 0, 0, 0

OneIsland_KindleRoad_EmberSpa_MapWarps:
	warp_def 13, 36, 3, 2, 813

OneIsland_KindleRoad_EmberSpa_MapCoordEvents:
	coord_event 13, 13, 3, 0, 16385, 0, 0, OneIsland_KindleRoad_EmberSpa_EventScript_1653CF

gMapEvents_OneIsland_KindleRoad_EmberSpa::
	map_events OneIsland_KindleRoad_EmberSpa_EventObjects, OneIsland_KindleRoad_EmberSpa_MapWarps, OneIsland_KindleRoad_EmberSpa_MapCoordEvents, 0x0

BirthIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, BirthIsland_Harbor_EventScript_1653E7, 0, 0, 0

BirthIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 0, 568

gMapEvents_BirthIsland_Harbor::
	map_events BirthIsland_Harbor_EventObjects, BirthIsland_Harbor_MapWarps, 0x0, 0x0

NavelRock_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, NavelRock_Harbor_EventScript_165421, 0, 0, 0

NavelRock_Harbor_MapWarps:
	warp_def 8, 2, 3, 1, 512

gMapEvents_NavelRock_Harbor::
	map_events NavelRock_Harbor_EventObjects, NavelRock_Harbor_MapWarps, 0x0, 0x0

PalletTown_EventObjects:
	object_event 1, 23, 0, 3, 0, 10, 0, 3, 2, 65, 0, 0, 0, 0, 0, PalletTown_EventScript_16575C, 0, 0, 0
	object_event 2, 27, 0, 13, 0, 17, 0, 3, 2, 38, 0, 0, 0, 0, 0, PalletTown_EventScript_16582F, 0, 0, 0
	object_event 3, 71, 0, 10, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 44, 0, 0

PalletTown_MapWarps:
	warp_def 6, 7, 0, 1, 1024
	warp_def 15, 7, 0, 0, 1026
	warp_def 16, 13, 0, 0, 1027

PalletTown_MapCoordEvents:
	coord_event 12, 1, 3, 0, 16464, 0, 0, PalletTown_EventScript_1655ED
	coord_event 13, 1, 3, 0, 16464, 0, 0, PalletTown_EventScript_1655F9
	coord_event 13, 2, 3, 0, 16386, 1, 0, PalletTown_EventScript_16587B

PalletTown_MapBGEvents:
	bg_event 16, 16, 0, 0, 0, PalletTown_EventScript_165838
	bg_event 4, 7, 0, 0, 0, PalletTown_EventScript_165850
	bg_event 13, 7, 0, 0, 0, PalletTown_EventScript_165859
	bg_event 9, 11, 0, 0, 0, PalletTown_EventScript_165862
	bg_event 5, 14, 0, 0, 0, PalletTown_EventScript_16586B

gMapEvents_PalletTown::
	map_events PalletTown_EventObjects, PalletTown_MapWarps, PalletTown_MapCoordEvents, PalletTown_MapBGEvents

ViridianCity_EventObjects:
	object_event 1, 27, 0, 8, 0, 26, 0, 3, 8, 0, 0, 0, 0, 0, 0, ViridianCity_EventScript_165AF0, 0, 0, 0
	object_event 2, 95, 0, 11, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BDF13, 17, 0, 0
	object_event 3, 32, 0, 34, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659CA, 0, 0, 0
	object_event 4, 240, 0, 21, 0, 6, 0, 3, 1, 50, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659F6, 0, 0, 0
	object_event 5, 31, 0, 20, 0, 12, 0, 3, 7, 49, 0, 0, 0, 0, 0, ViridianCity_EventScript_165AC4, 0, 0, 0
	object_event 6, 18, 0, 33, 0, 26, 0, 3, 3, 32, 0, 0, 0, 0, 0, ViridianCity_EventScript_165A8F, 0, 0, 0
	object_event 7, 19, 0, 16, 0, 22, 0, 3, 2, 33, 0, 0, 0, 0, 0, ViridianCity_EventScript_1659C1, 0, 0, 0
	object_event 8, 95, 0, 18, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BDF13, 18, 0, 0
	object_event 9, 92, 0, 17, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_EventScript_1BEB8C, 461, 0, 0

ViridianCity_MapWarps:
	warp_def 26, 26, 0, 1, 1284
	warp_def 25, 11, 3, 1, 1280
	warp_def 36, 10, 0, 1, 1281
	warp_def 25, 18, 0, 1, 1282
	warp_def 36, 19, 0, 1, 1283

ViridianCity_MapCoordEvents:
	coord_event 22, 11, 3, 0, 16465, 0, 0, ViridianCity_EventScript_165AF6
	coord_event 36, 11, 3, 0, 16474, 0, 0, ViridianCity_EventScript_16596D
	coord_event 20, 8, 3, 0, 16465, 1, 0, ViridianCity_EventScript_165B10
	coord_event 22, 8, 3, 0, 16465, 1, 0, ViridianCity_EventScript_165B2E

ViridianCity_MapBGEvents:
	bg_event 23, 1, 3, 0, 0, ViridianCity_EventScript_16599D
	bg_event 32, 10, 0, 0, 0, ViridianCity_EventScript_1659AF
	bg_event 20, 31, 0, 0, 0, ViridianCity_EventScript_1659A6
	bg_event 20, 16, 0, 0, 0, ViridianCity_EventScript_165994
	bg_event 36, 10, 0, 0, 0, ViridianCity_EventScript_1659B8

gMapEvents_ViridianCity::
	map_events ViridianCity_EventObjects, ViridianCity_MapWarps, ViridianCity_MapCoordEvents, ViridianCity_MapBGEvents

PewterCity_EventObjects:
	object_event 1, 22, 0, 6, 0, 15, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_166075, 0, 0, 0
	object_event 2, 25, 0, 33, 0, 17, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_16607E, 80, 0, 0
	object_event 3, 27, 0, 21, 0, 28, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_16622B, 0, 0, 0
	object_event 4, 20, 0, 33, 0, 27, 0, 3, 5, 18, 0, 0, 0, 0, 0, PewterCity_EventScript_166244, 0, 0, 0
	object_event 5, 19, 0, 42, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_165B9D, 46, 0, 0
	object_event 6, 95, 0, 30, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_1BDF13, 18, 0, 0
	object_event 7, 55, 0, 46, 0, 20, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_EventScript_1662A9, 146, 0, 0

PewterCity_MapWarps:
	warp_def 17, 6, 0, 1, 1536
	warp_def 25, 4, 0, 3, 1536
	warp_def 15, 16, 0, 1, 1538
	warp_def 28, 18, 0, 1, 1539
	warp_def 33, 11, 0, 1, 1540
	warp_def 17, 25, 0, 1, 1541
	warp_def 9, 30, 0, 1, 1543

PewterCity_MapCoordEvents:
	coord_event 42, 21, 3, 0, 16492, 0, 0, PewterCity_EventScript_165D8E
	coord_event 42, 22, 3, 0, 16492, 0, 0, PewterCity_EventScript_165D9A
	coord_event 42, 23, 3, 0, 16492, 0, 0, PewterCity_EventScript_165DA6
	coord_event 43, 23, 3, 0, 16492, 0, 0, PewterCity_EventScript_165DB2
	coord_event 46, 21, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662B7
	coord_event 46, 22, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662C4
	coord_event 46, 23, 3, 0, 16492, 1, 0, PewterCity_EventScript_1662D1

PewterCity_MapBGEvents:
	bg_event 19, 7, 0, 0, 0, PewterCity_EventScript_16627F
	bg_event 39, 19, 0, 0, 0, PewterCity_EventScript_166276
	bg_event 11, 16, 0, 0, 0, PewterCity_EventScript_166288
	bg_event 20, 30, 0, 0, 0, PewterCity_EventScript_16626D
	bg_event 31, 25, 0, 0, 0, PewterCity_EventScript_1662A0
	bg_event 6, 3, 3, 7, 0, 4, 112, 1

gMapEvents_PewterCity::
	map_events PewterCity_EventObjects, PewterCity_MapWarps, PewterCity_MapCoordEvents, PewterCity_MapBGEvents

CeruleanCity_EventObjects:
	object_event 1, 60, 0, 31, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1666E7, 0, 0, 0
	object_event 2, 49, 0, 33, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166603, 59, 0, 0
	object_event 3, 16, 0, 16, 0, 21, 0, 3, 3, 49, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1666FE, 0, 0, 0
	object_event 4, 30, 0, 9, 0, 23, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16671D, 0, 0, 0
	object_event 5, 129, 0, 32, 0, 29, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1667DD, 0, 0, 0
	object_event 6, 22, 0, 33, 0, 29, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16674F, 0, 0, 0
	object_event 7, 18, 0, 34, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166726, 0, 0, 0
	object_event 8, 72, 0, 22, 0, 0, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 60, 0, 0
	object_event 9, 95, 0, 26, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_1BDF13, 19, 0, 0
	object_event 10, 65375, 0, 50, 0, 18, 0, 10, 0, 0, 0, 27, 0, 3, 0, 0x0, 0, 0, 0
	object_event 11, 23, 0, 12, 0, 30, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_166738, 0, 0, 0
	object_event 12, 41, 0, 1, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_EventScript_16672F, 92, 0, 0

CeruleanCity_MapWarps:
	warp_def 10, 11, 0, 1, 1792
	warp_def 30, 11, 0, 1, 1793
	warp_def 15, 17, 0, 1, 1794
	warp_def 22, 19, 0, 1, 1795
	warp_def 31, 21, 0, 1, 1797
	warp_def 13, 28, 3, 1, 1798
	warp_def 29, 28, 0, 1, 1799
	warp_def 1, 12, 0, 0, 328
	warp_def 10, 8, 3, 3, 1792
	warp_def 31, 8, 3, 3, 1793
	warp_def 31, 9, 3, 3, 1793
	warp_def 14, 28, 3, 1, 1798
	warp_def 23, 28, 0, 0, 1800
	warp_def 17, 11, 0, 0, 1801

CeruleanCity_MapCoordEvents:
	coord_event 22, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_16649A
	coord_event 23, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_1664A6
	coord_event 24, 6, 3, 0, 16466, 0, 0, CeruleanCity_EventScript_1664B9
	coord_event 33, 5, 3, 0, 16509, 0, 0, CeruleanCity_EventScript_166683
	coord_event 33, 7, 3, 0, 16509, 0, 0, CeruleanCity_EventScript_1666A3

CeruleanCity_MapBGEvents:
	bg_event 20, 25, 0, 0, 0, CeruleanCity_EventScript_166838
	bg_event 27, 21, 0, 0, 0, CeruleanCity_EventScript_166853
	bg_event 11, 28, 0, 0, 0, CeruleanCity_EventScript_16684A
	bg_event 19, 32, 0, 0, 0, CeruleanCity_EventScript_166841
	bg_event 18, 7, 3, 7, 0, 68, 49, 1
	bg_event 11, 25, 0, 0, 0, CeruleanCity_EventScript_16AC94
	bg_event 11, 27, 0, 0, 0, CeruleanCity_EventScript_16AC94
	bg_event 11, 26, 0, 0, 0, CeruleanCity_EventScript_16AC94

gMapEvents_CeruleanCity::
	map_events CeruleanCity_EventObjects, CeruleanCity_MapWarps, CeruleanCity_MapCoordEvents, CeruleanCity_MapBGEvents

LavenderTown_EventObjects:
	object_event 1, 17, 0, 19, 0, 10, 0, 3, 2, 18, 0, 0, 0, 0, 0, LavenderTown_EventScript_16687D, 0, 0, 0
	object_event 2, 47, 0, 12, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_EventScript_1668A6, 0, 0, 0
	object_event 3, 19, 0, 10, 0, 7, 0, 3, 14, 17, 0, 0, 0, 0, 0, LavenderTown_EventScript_1668AF, 0, 0, 0

LavenderTown_MapWarps:
	warp_def 18, 6, 0, 1, 344
	warp_def 6, 5, 0, 1, 2048
	warp_def 10, 11, 0, 1, 2050
	warp_def 5, 16, 0, 1, 2051
	warp_def 10, 16, 0, 1, 2052
	warp_def 20, 15, 0, 1, 2053

LavenderTown_MapBGEvents:
	bg_event 12, 4, 0, 0, 0, LavenderTown_EventScript_1668C1
	bg_event 15, 11, 0, 0, 0, LavenderTown_EventScript_1668B8
	bg_event 21, 7, 0, 0, 0, LavenderTown_EventScript_1668D3
	bg_event 7, 11, 0, 0, 0, LavenderTown_EventScript_1668CA

gMapEvents_LavenderTown::
	map_events LavenderTown_EventObjects, LavenderTown_MapWarps, 0x0, LavenderTown_MapBGEvents

VermilionCity_EventObjects:
	object_event 1, 23, 0, 22, 0, 11, 0, 3, 5, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166917, 0, 0, 0
	object_event 2, 32, 0, 17, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166920, 0, 0, 0
	object_event 3, 33, 0, 36, 0, 10, 0, 0, 17, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C2F, 0, 0, 0
	object_event 4, 130, 0, 35, 0, 11, 0, 3, 2, 34, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C38, 0, 0, 0
	object_event 5, 62, 0, 31, 0, 30, 0, 3, 5, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C17, 0, 0, 0
	object_event 6, 62, 0, 24, 0, 33, 0, 3, 7, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_166941, 0, 0, 0
	object_event 7, 95, 0, 19, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_EventScript_1BDF13, 18, 0, 0
	object_event 8, 55, 0, 25, 0, 7, 0, 3, 1, 20, 0, 0, 0, 0, 0, VermilionCity_EventScript_166C20, 161, 0, 0

VermilionCity_MapWarps:
	warp_def 22, 34, 3, 1, 260
	warp_def 23, 34, 3, 1, 260
	warp_def 24, 34, 3, 1, 260
	warp_def 9, 6, 0, 1, 2304
	warp_def 15, 6, 3, 1, 2305
	warp_def 12, 17, 0, 1, 2307
	warp_def 19, 17, 0, 1, 2308
	warp_def 29, 17, 0, 1, 2309
	warp_def 28, 24, 0, 1, 2311
	warp_def 14, 25, 0, 1, 2310

VermilionCity_MapCoordEvents:
	coord_event 22, 33, 0, 0, 16467, 0, 0, VermilionCity_EventScript_166B8A
	coord_event 23, 33, 0, 0, 16467, 0, 0, VermilionCity_EventScript_166B91
	coord_event 22, 32, 0, 0, 16385, 0, 0, VermilionCity_EventScript_166B98
	coord_event 23, 32, 0, 0, 16385, 0, 0, VermilionCity_EventScript_166B98

VermilionCity_MapBGEvents:
	bg_event 33, 6, 0, 0, 0, VermilionCity_EventScript_166C53
	bg_event 10, 17, 3, 0, 0, VermilionCity_EventScript_166C65
	bg_event 10, 24, 0, 0, 0, VermilionCity_EventScript_166C6E
	bg_event 34, 18, 0, 0, 0, VermilionCity_EventScript_166C86
	bg_event 45, 17, 3, 0, 0, VermilionCity_EventScript_166C5C
	bg_event 14, 11, 3, 7, 0, 35, 48, 1

gMapEvents_VermilionCity::
	map_events VermilionCity_EventObjects, VermilionCity_MapWarps, VermilionCity_MapCoordEvents, VermilionCity_MapBGEvents

CeladonCity_EventObjects:
	object_event 1, 49, 0, 48, 0, 15, 0, 3, 5, 20, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CFA, 95, 0, 0
	object_event 2, 27, 0, 38, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CC5, 0, 0, 0
	object_event 3, 112, 0, 36, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CDC, 0, 0, 0
	object_event 4, 17, 0, 11, 0, 18, 0, 3, 52, 68, 0, 0, 0, 0, 0, CeladonCity_EventScript_166C99, 0, 0, 0
	object_event 5, 28, 0, 18, 0, 22, 0, 3, 2, 82, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CAD, 0, 0, 0
	object_event 6, 32, 0, 30, 0, 24, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CB6, 0, 0, 0
	object_event 7, 33, 0, 26, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CBF, 0, 0, 0
	object_event 8, 49, 0, 38, 0, 31, 0, 3, 5, 21, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D03, 95, 0, 0
	object_event 9, 32, 0, 9, 0, 30, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166CA2, 0, 0, 0
	object_event 10, 95, 0, 52, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BDF13, 20, 0, 0
	object_event 11, 95, 0, 40, 0, 35, 0, 0, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BDF13, 19, 0, 0
	object_event 12, 19, 0, 25, 0, 10, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D0C, 0, 0, 0
	object_event 13, 65375, 0, 249, 255, 21, 0, 7, 0, 0, 0, 34, 0, 3, 0, 0x0, 0, 0, 0
	object_event 14, 92, 0, 5, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_1BEBC0, 465, 0, 0
	object_event 15, 55, 0, 47, 0, 24, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeladonCity_EventScript_166D15, 95, 0, 0

CeladonCity_MapWarps:
	warp_def 34, 21, 0, 0, 2574
	warp_def 11, 14, 0, 1, 2560
	warp_def 15, 14, 0, 4, 2560
	warp_def 30, 11, 0, 1, 2567
	warp_def 48, 11, 0, 1, 2572
	warp_def 39, 20, 0, 1, 2575
	warp_def 11, 30, 0, 1, 2576
	warp_def 37, 29, 0, 1, 2577
	warp_def 41, 29, 0, 1, 2578
	warp_def 49, 29, 0, 1, 2579
	warp_def 29, 5, 0, 5, 2567
	warp_def 30, 4, 3, 5, 2567
	warp_def 31, 5, 0, 5, 2567

CeladonCity_MapBGEvents:
	bg_event 45, 23, 0, 0, 0, CeladonCity_EventScript_166D5A
	bg_event 38, 23, 0, 0, 0, CeladonCity_EventScript_166D63
	bg_event 33, 23, 0, 0, 0, CeladonCity_EventScript_166D6C
	bg_event 22, 18, 3, 0, 0, CeladonCity_EventScript_166D27
	bg_event 26, 11, 0, 0, 0, CeladonCity_EventScript_166D48
	bg_event 33, 16, 0, 0, 0, CeladonCity_EventScript_166D1E
	bg_event 18, 14, 3, 0, 0, CeladonCity_EventScript_166D51
	bg_event 16, 31, 0, 0, 0, CeladonCity_EventScript_166D30
	bg_event 55, 20, 3, 7, 0, 69, 47, 1

gMapEvents_CeladonCity::
	map_events CeladonCity_EventObjects, CeladonCity_MapWarps, 0x0, CeladonCity_MapBGEvents

FuchsiaCity_EventObjects:
	object_event 1, 27, 0, 37, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DAF, 0, 0, 0
	object_event 2, 128, 0, 36, 0, 15, 0, 3, 80, 20, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 3, 127, 0, 33, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 4, 18, 0, 33, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DB8, 0, 0, 0
	object_event 5, 117, 0, 39, 0, 8, 0, 3, 2, 19, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 6, 16, 0, 14, 0, 15, 0, 3, 5, 19, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166D9D, 0, 0, 0
	object_event 7, 135, 0, 12, 0, 20, 0, 1, 2, 18, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 8, 32, 0, 36, 0, 20, 0, 3, 5, 20, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DA6, 0, 0, 0
	object_event 9, 240, 0, 8, 0, 8, 0, 1, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 10, 119, 0, 16, 0, 9, 0, 3, 2, 20, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 11, 95, 0, 30, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 18, 0, 0
	object_event 12, 95, 0, 21, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 19, 0, 0
	object_event 13, 95, 0, 32, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 20, 0, 0
	object_event 14, 95, 0, 24, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1BDF13, 21, 0, 0
	object_event 15, 20, 0, 15, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_1C4AEE, 0, 0, 0
	object_event 16, 22, 0, 40, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_EventScript_166DC1, 157, 0, 0

FuchsiaCity_MapWarps:
	warp_def 24, 5, 0, 2, 2816
	warp_def 33, 31, 0, 1, 2823
	warp_def 11, 15, 0, 1, 2817
	warp_def 28, 16, 0, 1, 2818
	warp_def 9, 32, 0, 1, 2819
	warp_def 14, 31, 0, 1, 2820
	warp_def 25, 31, 3, 1, 2821
	warp_def 38, 31, 0, 1, 2824
	warp_def 39, 28, 3, 3, 2824
	warp_def 39, 29, 3, 3, 2824
	warp_def 19, 31, 0, 0, 2825

FuchsiaCity_MapBGEvents:
	bg_event 31, 18, 3, 0, 0, FuchsiaCity_EventScript_166DDA
	bg_event 26, 18, 0, 0, 0, FuchsiaCity_EventScript_166DE3
	bg_event 5, 32, 0, 0, 0, FuchsiaCity_EventScript_166E07
	bg_event 31, 31, 0, 0, 0, FuchsiaCity_EventScript_166DF5
	bg_event 35, 10, 0, 0, 0, FuchsiaCity_EventScript_166E38
	bg_event 38, 16, 3, 0, 0, FuchsiaCity_EventScript_166E6A
	bg_event 41, 10, 0, 0, 0, FuchsiaCity_EventScript_166E1F
	bg_event 17, 10, 0, 0, 0, FuchsiaCity_EventScript_166E51
	bg_event 11, 10, 0, 0, 0, FuchsiaCity_EventScript_166E9C
	bg_event 17, 18, 3, 0, 0, FuchsiaCity_EventScript_166E83
	bg_event 22, 7, 0, 0, 0, FuchsiaCity_EventScript_166DEC
	bg_event 33, 26, 3, 7, 0, 25, 133, 1

gMapEvents_FuchsiaCity::
	map_events FuchsiaCity_EventObjects, FuchsiaCity_MapWarps, 0x0, FuchsiaCity_MapBGEvents

CinnabarIsland_EventObjects:
	object_event 1, 28, 0, 14, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CinnabarIsland_EventScript_1671EF, 0, 0, 0
	object_event 2, 32, 0, 11, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, CinnabarIsland_EventScript_167208, 0, 0, 0
	object_event 3, 73, 0, 20, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 98, 0, 0
	object_event 4, 108, 0, 23, 0, 7, 0, 1, 9, 17, 0, 0, 0, 0, 0, 0x0, 107, 0, 0

CinnabarIsland_MapWarps:
	warp_def 8, 3, 0, 1, 315
	warp_def 20, 4, 0, 1, 3072
	warp_def 8, 9, 0, 1, 3073
	warp_def 14, 11, 0, 0, 3077
	warp_def 19, 11, 0, 1, 3079

CinnabarIsland_MapCoordEvents:
	coord_event 20, 5, 3, 0, 16385, 0, 0, CinnabarIsland_EventScript_1671CA

CinnabarIsland_MapBGEvents:
	bg_event 12, 3, 0, 0, 0, CinnabarIsland_EventScript_167211
	bg_event 9, 9, 0, 0, 0, CinnabarIsland_EventScript_16721A
	bg_event 22, 5, 0, 0, 0, CinnabarIsland_EventScript_167223
	bg_event 10, 9, 0, 0, 0, CinnabarIsland_EventScript_16721A

gMapEvents_CinnabarIsland::
	map_events CinnabarIsland_EventObjects, CinnabarIsland_MapWarps, CinnabarIsland_MapCoordEvents, CinnabarIsland_MapBGEvents

IndigoPlateau_Exterior_EventObjects:
	object_event 1, 72, 0, 11, 0, 6, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 163, 0, 0
	object_event 2, 71, 0, 11, 0, 6, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 164, 0, 0

IndigoPlateau_Exterior_MapWarps:
	warp_def 11, 6, 0, 0, 3328

gMapEvents_IndigoPlateau_Exterior::
	map_events IndigoPlateau_Exterior_EventObjects, IndigoPlateau_Exterior_MapWarps, 0x0, 0x0

SaffronCity_Duplicate_EventObjects:
	object_event 1, 49, 0, 22, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_16737A, 62, 0, 0
	object_event 2, 49, 0, 26, 0, 16, 0, 3, 5, 20, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_167383, 62, 0, 0
	object_event 3, 49, 0, 46, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_16738C, 62, 0, 0
	object_event 4, 49, 0, 27, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_167395, 62, 0, 0
	object_event 5, 49, 0, 25, 0, 33, 0, 3, 5, 23, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_16739E, 62, 0, 0
	object_event 6, 49, 0, 34, 0, 31, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673B9, 62, 0, 0
	object_event 7, 49, 0, 30, 0, 39, 0, 3, 5, 21, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673B0, 62, 0, 0
	object_event 8, 49, 0, 48, 0, 24, 0, 3, 5, 20, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673A7, 62, 0, 0
	object_event 9, 18, 0, 37, 0, 32, 0, 3, 1, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673EC, 63, 0, 0
	object_event 10, 47, 0, 21, 0, 23, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673E3, 63, 0, 0
	object_event 11, 25, 0, 39, 0, 16, 0, 3, 7, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_16741A, 63, 0, 0
	object_event 12, 19, 0, 44, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673FE, 63, 0, 0
	object_event 13, 114, 0, 45, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_167407, 63, 0, 0
	object_event 14, 22, 0, 32, 0, 39, 0, 3, 5, 21, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1673F5, 63, 0, 0
	object_event 15, 24, 0, 47, 0, 24, 0, 3, 5, 17, 0, 0, 0, 0, 0, SaffronCity_Duplicate_EventScript_1AD03A, 157, 0, 0

SaffronCity_Duplicate_MapWarps:
	warp_def 33, 30, 0, 1, 303
	warp_def 22, 14, 0, 1, 3584
	warp_def 40, 12, 0, 1, 3586
	warp_def 46, 12, 0, 1, 3587
	warp_def 27, 21, 0, 1, 3588
	warp_def 40, 21, 0, 1, 3589
	warp_def 24, 38, 0, 1, 3590
	warp_def 43, 38, 0, 1, 3592
	warp_def 8, 27, 3, 2, 4864
	warp_def 34, 5, 3, 2, 4353
	warp_def 58, 27, 3, 1, 5120
	warp_def 34, 46, 3, 0, 4608
	warp_def 35, 46, 3, 0, 4608
	warp_def 35, 5, 3, 2, 4353
	warp_def 47, 21, 0, 0, 3593

SaffronCity_Duplicate_MapBGEvents:
	bg_event 29, 14, 0, 0, 0, SaffronCity_Duplicate_EventScript_167423
	bg_event 42, 14, 0, 0, 0, SaffronCity_Duplicate_EventScript_16742C
	bg_event 13, 25, 0, 0, 0, SaffronCity_Duplicate_EventScript_167471
	bg_event 18, 30, 0, 0, 0, SaffronCity_Duplicate_EventScript_167456
	bg_event 29, 31, 0, 0, 0, SaffronCity_Duplicate_EventScript_16745F
	bg_event 54, 25, 0, 0, 0, SaffronCity_Duplicate_EventScript_16744D
	bg_event 50, 14, 0, 0, 0, SaffronCity_Duplicate_EventScript_167435
	bg_event 40, 38, 0, 0, 0, SaffronCity_Duplicate_EventScript_167468
	bg_event 49, 22, 0, 0, 0, SaffronCity_Duplicate_EventScript_16747A

gMapEvents_SaffronCity_Duplicate::
	map_events SaffronCity_Duplicate_EventObjects, SaffronCity_Duplicate_MapWarps, 0x0, SaffronCity_Duplicate_MapBGEvents


gMapEvents_SaffronCity::
	map_events 0x0, 0x0, 0x0, 0x0

OneIsland_EventObjects:
	object_event 1, 73, 0, 12, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 113, 0, 0
	object_event 2, 32, 0, 16, 0, 12, 0, 3, 2, 17, 0, 0, 0, 0, 0, OneIsland_EventScript_167517, 0, 0, 0
	object_event 3, 30, 0, 13, 0, 9, 0, 3, 13, 17, 0, 0, 0, 0, 0, OneIsland_EventScript_167549, 0, 0, 0

OneIsland_MapWarps:
	warp_def 14, 5, 0, 0, 8192
	warp_def 19, 9, 0, 0, 8194
	warp_def 8, 11, 0, 0, 8195
	warp_def 12, 18, 3, 0, 8196

OneIsland_MapBGEvents:
	bg_event 14, 13, 0, 0, 0, OneIsland_EventScript_167552
	bg_event 15, 6, 0, 0, 0, OneIsland_EventScript_16755B

gMapEvents_OneIsland::
	map_events OneIsland_EventObjects, OneIsland_MapWarps, 0x0, OneIsland_MapBGEvents

TwoIsland_EventObjects:
	object_event 1, 68, 0, 28, 0, 4, 0, 3, 8, 33, 0, 0, 0, 0, 0, TwoIsland_EventScript_16760F, 0, 0, 0
	object_event 2, 23, 0, 31, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167755, 123, 0, 0
	object_event 3, 29, 0, 30, 0, 11, 0, 3, 7, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_16775E, 124, 0, 0
	object_event 4, 62, 0, 26, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_16774C, 0, 0, 0
	object_event 5, 52, 0, 27, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167777, 125, 0, 0
	object_event 6, 95, 0, 30, 0, 16, 0, 3, 1, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_1BDF13, 18, 0, 0
	object_event 7, 92, 0, 39, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_1BEAAF, 442, 0, 0
	object_event 8, 16, 0, 37, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167789, 0, 0, 0
	object_event 9, 19, 0, 24, 0, 12, 0, 3, 2, 17, 0, 0, 0, 0, 0, TwoIsland_EventScript_167780, 0, 0, 0

TwoIsland_MapWarps:
	warp_def 39, 9, 0, 0, 8448
	warp_def 33, 9, 0, 0, 8449
	warp_def 21, 7, 0, 0, 8450
	warp_def 10, 8, 3, 0, 8452

TwoIsland_MapBGEvents:
	bg_event 29, 8, 0, 0, 0, TwoIsland_EventScript_167792
	bg_event 40, 10, 0, 0, 0, TwoIsland_EventScript_16779B
	bg_event 8, 3, 0, 0, 0, TwoIsland_EventScript_1677A4

gMapEvents_TwoIsland::
	map_events TwoIsland_EventObjects, TwoIsland_MapWarps, 0x0, TwoIsland_MapBGEvents

ThreeIsland_EventObjects:
	object_event 1, 25, 0, 7, 0, 24, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677E5, 126, 0, 0
	object_event 2, 25, 0, 8, 0, 23, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167989, 126, 0, 0
	object_event 3, 53, 0, 8, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 145, 0, 0
	object_event 4, 53, 0, 9, 0, 23, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 5, 53, 0, 9, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 6, 53, 0, 10, 0, 22, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 7, 53, 0, 10, 0, 24, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 8, 53, 0, 11, 0, 23, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1677D8, 121, 0, 0
	object_event 9, 95, 0, 20, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1BDF13, 18, 0, 0
	object_event 10, 92, 0, 18, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_1BEABC, 443, 0, 0
	object_event 11, 23, 0, 15, 0, 7, 0, 3, 5, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C77, 0, 0, 0
	object_event 12, 16, 0, 14, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C80, 0, 0, 0
	object_event 13, 132, 0, 15, 0, 14, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167C89, 0, 0, 0
	object_event 14, 53, 0, 15, 0, 31, 0, 3, 5, 17, 0, 0, 0, 0, 0, ThreeIsland_EventScript_167CA5, 121, 0, 0

ThreeIsland_MapWarps:
	warp_def 3, 31, 0, 0, 8704
	warp_def 14, 27, 0, 0, 8705
	warp_def 18, 12, 0, 0, 8707
	warp_def 4, 6, 0, 0, 8708
	warp_def 12, 6, 0, 0, 8709
	warp_def 12, 12, 0, 0, 8710
	warp_def 13, 19, 0, 0, 8711

ThreeIsland_MapCoordEvents:
	coord_event 7, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 8, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 9, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 10, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 7, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A1D
	coord_event 8, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A29
	coord_event 9, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A35
	coord_event 11, 27, 3, 0, 16507, 2, 0, ThreeIsland_EventScript_1679B5
	coord_event 10, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A41
	coord_event 11, 26, 3, 0, 16507, 3, 0, ThreeIsland_EventScript_167A4D

ThreeIsland_MapBGEvents:
	bg_event 12, 31, 0, 0, 0, ThreeIsland_EventScript_167C9C
	bg_event 5, 13, 3, 7, 0, 69, 164, 1

gMapEvents_ThreeIsland::
	map_events ThreeIsland_EventObjects, ThreeIsland_MapWarps, ThreeIsland_MapCoordEvents, ThreeIsland_MapBGEvents

FourIsland_EventObjects:
	object_event 1, 32, 0, 16, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167D55, 0, 0, 0
	object_event 2, 132, 0, 12, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 3, 122, 0, 13, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 4, 123, 0, 14, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 5, 121, 0, 17, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 6, 35, 0, 26, 0, 19, 0, 3, 9, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E2E, 0, 0, 0
	object_event 7, 96, 0, 5, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BE00C, 18, 0, 0
	object_event 8, 92, 0, 5, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BEC28, 473, 0, 0
	object_event 9, 92, 0, 32, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_1BEC35, 474, 0, 0
	object_event 10, 72, 0, 8, 0, 25, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 151, 0, 0
	object_event 11, 27, 0, 36, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E73, 0, 0, 0
	object_event 12, 17, 0, 31, 0, 21, 0, 3, 10, 17, 0, 0, 0, 0, 0, FourIsland_EventScript_167E5A, 0, 0, 0

FourIsland_MapWarps:
	warp_def 18, 20, 0, 0, 8961
	warp_def 12, 13, 0, 0, 8960
	warp_def 25, 14, 0, 0, 8963
	warp_def 38, 12, 0, 0, 366
	warp_def 33, 23, 0, 0, 8964
	warp_def 25, 26, 0, 0, 8966
	warp_def 10, 28, 3, 0, 8965
	warp_def 22, 26, 0, 0, 8967

FourIsland_MapBGEvents:
	bg_event 13, 19, 0, 0, 0, FourIsland_EventScript_167E7C
	bg_event 22, 34, 3, 7, 0, 106, 168, 1
	bg_event 6, 21, 3, 7, 0, 2, 169, 1
	bg_event 31, 23, 0, 0, 0, FourIsland_EventScript_167E85

gMapEvents_FourIsland::
	map_events FourIsland_EventObjects, FourIsland_MapWarps, 0x0, FourIsland_MapBGEvents

FiveIsland_EventObjects:
	object_event 1, 57, 0, 8, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, FiveIsland_EventScript_167EAA, 0, 0, 0
	object_event 2, 20, 0, 16, 0, 10, 0, 3, 2, 17, 0, 0, 0, 0, 0, FiveIsland_EventScript_167EA1, 0, 0, 0
	object_event 3, 65375, 0, 32, 0, 9, 0, 4, 0, 0, 0, 56, 0, 3, 0, 0x0, 0, 0, 0

FiveIsland_MapWarps:
	warp_def 12, 14, 3, 0, 9218
	warp_def 18, 6, 0, 0, 9216
	warp_def 12, 6, 0, 0, 9219
	warp_def 22, 9, 0, 0, 9220

FiveIsland_MapBGEvents:
	bg_event 20, 8, 0, 0, 0, FiveIsland_EventScript_167E98

gMapEvents_FiveIsland::
	map_events FiveIsland_EventObjects, FiveIsland_MapWarps, 0x0, FiveIsland_MapBGEvents

SevenIsland_EventObjects:
	object_event 1, 41, 0, 7, 0, 18, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_1C4B56, 0, 0, 0
	object_event 2, 35, 0, 9, 0, 7, 0, 3, 13, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_167EC6, 0, 0, 0
	object_event 3, 55, 0, 15, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, SevenIsland_EventScript_167ECF, 0, 0, 0

SevenIsland_MapWarps:
	warp_def 11, 9, 0, 0, 7936
	warp_def 5, 9, 0, 0, 7938
	warp_def 12, 3, 0, 0, 7939
	warp_def 16, 13, 3, 0, 7942

SevenIsland_MapBGEvents:
	bg_event 17, 9, 0, 0, 0, SevenIsland_EventScript_167EBD

gMapEvents_SevenIsland::
	map_events SevenIsland_EventObjects, SevenIsland_MapWarps, 0x0, SevenIsland_MapBGEvents

SixIsland_EventObjects:
	object_event 1, 19, 0, 10, 0, 15, 0, 3, 9, 17, 0, 0, 0, 0, 0, SixIsland_EventScript_167EEB, 0, 0, 0
	object_event 2, 56, 0, 15, 0, 13, 0, 3, 18, 17, 0, 0, 0, 0, 0, SixIsland_EventScript_167EE2, 0, 0, 0

SixIsland_MapWarps:
	warp_def 11, 23, 3, 0, 9474
	warp_def 11, 11, 0, 0, 9472
	warp_def 16, 17, 0, 0, 9475
	warp_def 20, 11, 0, 0, 9476

SixIsland_MapBGEvents:
	bg_event 9, 17, 0, 0, 0, SixIsland_EventScript_167EF4
	bg_event 9, 7, 3, 7, 0, 138, 184, 1

gMapEvents_SixIsland::
	map_events SixIsland_EventObjects, SixIsland_MapWarps, 0x0, SixIsland_MapBGEvents

Route1_EventObjects:
	object_event 1, 68, 0, 6, 0, 28, 0, 3, 3, 17, 0, 0, 0, 0, 0, Route1_EventScript_167EFE, 0, 0, 0
	object_event 2, 19, 0, 19, 0, 16, 0, 3, 5, 49, 0, 0, 0, 0, 0, Route1_EventScript_167F52, 0, 0, 0

Route1_MapBGEvents:
	bg_event 9, 31, 0, 0, 0, Route1_EventScript_167F5B

gMapEvents_Route1::
	map_events Route1_EventObjects, 0x0, 0x0, Route1_MapBGEvents

Route2_EventObjects:
	object_event 1, 95, 0, 16, 0, 62, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 20, 0, 0
	object_event 2, 95, 0, 15, 0, 69, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 19, 0, 0
	object_event 3, 95, 0, 11, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 21, 0, 0
	object_event 4, 95, 0, 18, 0, 26, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BDF13, 22, 0, 0
	object_event 5, 92, 0, 17, 0, 54, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BE58E, 340, 0, 0
	object_event 6, 92, 0, 17, 0, 64, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_EventScript_1BE59B, 341, 0, 0
	object_event 7, 65375, 0, 6, 0, 85, 0, 8, 0, 0, 0, 1, 0, 3, 0, 0x0, 0, 0, 0

Route2_MapWarps:
	warp_def 5, 13, 3, 3, 3843
	warp_def 6, 13, 3, 3, 3843
	warp_def 5, 51, 3, 1, 3840
	warp_def 17, 11, 3, 1, 292
	warp_def 17, 22, 0, 1, 3841
	warp_def 18, 46, 3, 1, 3842
	warp_def 18, 41, 3, 3, 3842
	warp_def 19, 41, 3, 3, 3842
	warp_def 19, 46, 3, 1, 3842
	warp_def 6, 51, 3, 1, 3840

Route2_MapBGEvents:
	bg_event 14, 12, 0, 0, 0, Route2_EventScript_167F6E
	bg_event 7, 73, 0, 0, 0, Route2_EventScript_167F65

gMapEvents_Route2::
	map_events Route2_EventObjects, Route2_MapWarps, 0x0, Route2_MapBGEvents

Route3_EventObjects:
	object_event 1, 18, 0, 70, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route3_EventScript_167F78, 0, 0, 0
	object_event 2, 22, 0, 40, 0, 11, 0, 3, 3, 17, 0, 1, 0, 3, 0, Route3_EventScript_1A957B, 0, 0, 0
	object_event 3, 20, 0, 32, 0, 6, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route3_EventScript_1A94C1, 0, 0, 0
	object_event 4, 22, 0, 30, 0, 3, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route3_EventScript_1A953D, 0, 0, 0
	object_event 5, 20, 0, 25, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route3_EventScript_1A9483, 0, 0, 0
	object_event 6, 18, 0, 29, 0, 10, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route3_EventScript_1A9407, 0, 0, 0
	object_event 7, 22, 0, 19, 0, 9, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route3_EventScript_1A94FF, 0, 0, 0
	object_event 8, 20, 0, 12, 0, 6, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route3_EventScript_1A9445, 0, 0, 0
	object_event 9, 18, 0, 17, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route3_EventScript_1A93C9, 0, 0, 0

Route3_MapBGEvents:
	bg_event 72, 11, 0, 0, 0, Route3_EventScript_167F81
	bg_event 26, 9, 3, 7, 0, 139, 113, 1

gMapEvents_Route3::
	map_events Route3_EventObjects, 0x0, 0x0, Route3_MapBGEvents

Route4_EventObjects:
	object_event 1, 23, 0, 9, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route4_EventScript_167F8C, 0, 0, 0
	object_event 2, 22, 0, 75, 0, 3, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route4_EventScript_1A95B9, 0, 0, 0
	object_event 3, 92, 0, 67, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route4_EventScript_1BE637, 353, 0, 0
	object_event 4, 19, 0, 15, 0, 14, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route4_EventScript_1ACDEA, 0, 0, 0
	object_event 5, 54, 0, 47, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route4_EventScript_1C494E, 0, 0, 0
	object_event 6, 54, 0, 50, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route4_EventScript_1C49B6, 0, 0, 0
	object_event 7, 65321, 0, 109, 0, 3, 0, 12, 0, 0, 0, 3, 0, 3, 0, 0x0, 0, 0, 0

Route4_MapWarps:
	warp_def 19, 5, 3, 3, 257
	warp_def 32, 5, 0, 7, 258
	warp_def 12, 5, 0, 1, 4096

Route4_MapBGEvents:
	bg_event 18, 7, 0, 0, 0, Route4_EventScript_167F95
	bg_event 34, 7, 0, 0, 0, Route4_EventScript_167F9E
	bg_event 43, 2, 3, 7, 0, 3, 50, 1
	bg_event 5, 4, 3, 7, 0, 140, 114, 1
	bg_event 67, 17, 3, 7, 0, 148, 156, 1

gMapEvents_Route4::
	map_events Route4_EventObjects, Route4_MapWarps, 0x0, Route4_MapBGEvents


Route5_MapWarps:
	warp_def 31, 31, 0, 1, 286
	warp_def 23, 25, 0, 1, 4352
	warp_def 24, 32, 3, 1, 4353
	warp_def 25, 32, 3, 1, 4353

Route5_MapBGEvents:
	bg_event 32, 32, 0, 0, 0, Route5_EventScript_167FA8

gMapEvents_Route5::
	map_events 0x0, Route5_MapWarps, 0x0, Route5_MapBGEvents

Route6_EventObjects:
	object_event 1, 20, 0, 3, 0, 16, 0, 3, 10, 17, 0, 1, 0, 5, 0, Route6_EventScript_1A9999, 0, 0, 0
	object_event 2, 39, 0, 12, 0, 21, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route6_EventScript_1A9A15, 0, 0, 0
	object_event 3, 40, 0, 13, 0, 21, 0, 3, 9, 17, 0, 1, 0, 0, 0, Route6_EventScript_1A9A91, 0, 0, 0
	object_event 4, 20, 0, 20, 0, 25, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A99D7, 0, 0, 0
	object_event 5, 40, 0, 13, 0, 32, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A9ACF, 0, 0, 0
	object_event 6, 39, 0, 13, 0, 33, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route6_EventScript_1A9A53, 0, 0, 0

Route6_MapWarps:
	warp_def 19, 13, 0, 1, 288
	warp_def 12, 5, 3, 2, 4608
	warp_def 13, 5, 3, 2, 4608

Route6_MapBGEvents:
	bg_event 21, 15, 0, 0, 0, Route6_EventScript_167FB2
	bg_event 5, 5, 3, 7, 0, 142, 118, 1
	bg_event 19, 5, 3, 7, 0, 68, 119, 1

gMapEvents_Route6::
	map_events Route6_EventObjects, Route6_MapWarps, 0x0, Route6_MapBGEvents

Route7_EventObjects:
	object_event 1, 65375, 0, 248, 255, 12, 0, 10, 0, 0, 0, 6, 0, 3, 0, 0x0, 0, 0, 0

Route7_MapWarps:
	warp_def 7, 14, 0, 1, 289
	warp_def 15, 10, 3, 0, 4864

Route7_MapBGEvents:
	bg_event 5, 14, 0, 0, 0, Route7_EventScript_167FBC
	bg_event 16, 15, 3, 7, 0, 151, 152, 1

gMapEvents_Route7::
	map_events Route7_EventObjects, Route7_MapWarps, 0x0, Route7_MapBGEvents

Route8_EventObjects:
	object_event 1, 22, 0, 62, 0, 14, 0, 3, 9, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA1D5, 0, 0, 0
	object_event 2, 32, 0, 55, 0, 15, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA30B, 0, 0, 0
	object_event 3, 55, 0, 51, 0, 6, 0, 3, 1, 17, 0, 1, 0, 4, 0, Route8_EventScript_1AA251, 0, 0, 0
	object_event 4, 22, 0, 29, 0, 3, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA11B, 0, 0, 0
	object_event 5, 55, 0, 29, 0, 4, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA28F, 0, 0, 0
	object_event 6, 22, 0, 29, 0, 5, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route8_EventScript_1AA159, 0, 0, 0
	object_event 7, 22, 0, 29, 0, 6, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route8_EventScript_1AA197, 0, 0, 0
	object_event 8, 32, 0, 21, 0, 3, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA2CD, 0, 0, 0
	object_event 9, 55, 0, 9, 0, 6, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route8_EventScript_1AA213, 0, 0, 0
	object_event 10, 95, 0, 33, 0, 15, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_EventScript_1BDF13, 18, 0, 0
	object_event 11, 95, 0, 47, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_EventScript_1BDF13, 19, 0, 0
	object_event 12, 17, 0, 40, 0, 3, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA349, 0, 0, 0
	object_event 13, 17, 0, 41, 0, 3, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route8_EventScript_1AA38F, 0, 0, 0
	object_event 14, 53, 0, 14, 0, 16, 0, 3, 52, 37, 0, 1, 0, 1, 0, Route8_EventScript_1AA3D5, 0, 0, 0
	object_event 15, 53, 0, 24, 0, 17, 0, 3, 41, 85, 0, 1, 0, 1, 0, Route8_EventScript_1AA413, 0, 0, 0

Route8_MapWarps:
	warp_def 13, 4, 0, 1, 291
	warp_def 7, 10, 3, 2, 5120

Route8_MapBGEvents:
	bg_event 16, 5, 0, 0, 0, Route8_EventScript_167FC6
	bg_event 42, 10, 3, 7, 0, 136, 127, 1
	bg_event 38, 11, 3, 7, 0, 141, 128, 1
	bg_event 42, 15, 3, 7, 0, 138, 129, 1

gMapEvents_Route8::
	map_events Route8_EventObjects, Route8_MapWarps, 0x0, Route8_MapBGEvents

Route9_EventObjects:
	object_event 1, 40, 0, 14, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9E71, 0, 0, 0
	object_event 2, 56, 0, 20, 0, 17, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route9_EventScript_1A9F69, 0, 0, 0
	object_event 3, 56, 0, 61, 0, 16, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route9_EventScript_1A9EED, 0, 0, 0
	object_event 4, 39, 0, 26, 0, 7, 0, 3, 1, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9DF5, 0, 0, 0
	object_event 5, 20, 0, 26, 0, 1, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route9_EventScript_1A9D79, 0, 0, 0
	object_event 6, 20, 0, 49, 0, 7, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route9_EventScript_1A9DB7, 0, 0, 0
	object_event 7, 56, 0, 53, 0, 2, 0, 3, 5, 19, 0, 1, 0, 1, 0, Route9_EventScript_1A9F2B, 0, 0, 0
	object_event 8, 40, 0, 60, 0, 9, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route9_EventScript_1A9EAF, 0, 0, 0
	object_event 9, 39, 0, 36, 0, 6, 0, 3, 10, 17, 0, 1, 0, 5, 0, Route9_EventScript_1A9E33, 0, 0, 0
	object_event 10, 95, 0, 2, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BDF13, 18, 0, 0
	object_event 11, 92, 0, 12, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BE6B9, 363, 0, 0
	object_event 12, 92, 0, 65, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route9_EventScript_1BEAFD, 450, 0, 0

Route9_MapBGEvents:
	bg_event 29, 7, 0, 0, 0, Route9_EventScript_167FD0
	bg_event 15, 7, 0, 7, 0, 34, 6, 1
	bg_event 63, 2, 3, 7, 0, 68, 123, 1
	bg_event 48, 2, 3, 7, 0, 134, 150, 1

gMapEvents_Route9::
	map_events Route9_EventObjects, 0x0, 0x0, Route9_MapBGEvents

Route10_EventObjects:
	object_event 1, 40, 0, 7, 0, 60, 0, 3, 1, 17, 0, 1, 0, 2, 0, Route10_EventScript_1A9FE5, 0, 0, 0
	object_event 2, 56, 0, 4, 0, 62, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route10_EventScript_1AA09F, 0, 0, 0
	object_event 3, 52, 0, 15, 0, 70, 0, 3, 5, 18, 0, 1, 0, 2, 0, Route10_EventScript_1AA061, 0, 0, 0
	object_event 4, 56, 0, 4, 0, 68, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route10_EventScript_1AA0DD, 0, 0, 0
	object_event 5, 52, 0, 13, 0, 44, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route10_EventScript_1AA023, 0, 0, 0
	object_event 6, 40, 0, 9, 0, 27, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route10_EventScript_1A9FA7, 0, 0, 0
	object_event 7, 95, 0, 10, 0, 20, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 18, 0, 0
	object_event 8, 95, 0, 10, 0, 22, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 19, 0, 0
	object_event 9, 95, 0, 10, 0, 24, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 20, 0, 0
	object_event 10, 95, 0, 10, 0, 26, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_EventScript_1BDF13, 21, 0, 0

Route10_MapWarps:
	warp_def 8, 19, 3, 0, 337
	warp_def 8, 57, 3, 5, 337
	warp_def 7, 40, 3, 1, 351
	warp_def 13, 20, 0, 1, 5376
	warp_def 2, 37, 3, 3, 351

Route10_MapBGEvents:
	bg_event 15, 59, 0, 0, 0, Route10_EventScript_167FE4
	bg_event 6, 42, 0, 0, 0, Route10_EventScript_167FED
	bg_event 7, 21, 0, 0, 0, Route10_EventScript_167FDB
	bg_event 10, 19, 0, 7, 0, 22, 9, 1
	bg_event 12, 40, 3, 7, 0, 35, 10, 1
	bg_event 6, 26, 3, 7, 0, 133, 126, 1
	bg_event 17, 29, 3, 7, 0, 140, 125, 1
	bg_event 20, 57, 3, 7, 0, 150, 151, 1

gMapEvents_Route10::
	map_events Route10_EventObjects, Route10_MapWarps, 0x0, Route10_MapBGEvents

Route11_EventObjects:
	object_event 1, 18, 0, 19, 0, 8, 0, 3, 17, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9B0D, 0, 0, 0
	object_event 2, 32, 0, 16, 0, 17, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9C81, 0, 0, 0
	object_event 3, 18, 0, 31, 0, 8, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9B4B, 0, 0, 0
	object_event 4, 18, 0, 28, 0, 10, 0, 3, 40, 72, 0, 1, 0, 1, 0, Route11_EventScript_1A9BC7, 0, 0, 0
	object_event 5, 32, 0, 38, 0, 15, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9CBF, 0, 0, 0
	object_event 6, 32, 0, 50, 0, 4, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9D3B, 0, 0, 0
	object_event 7, 30, 0, 42, 0, 8, 0, 3, 14, 17, 0, 1, 0, 4, 0, Route11_EventScript_1A9C05, 0, 0, 0
	object_event 8, 18, 0, 50, 0, 14, 0, 3, 25, 65, 0, 1, 0, 1, 0, Route11_EventScript_1A9B89, 0, 0, 0
	object_event 9, 32, 0, 57, 0, 16, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route11_EventScript_1A9CFD, 0, 0, 0
	object_event 10, 30, 0, 32, 0, 18, 0, 3, 14, 17, 0, 1, 0, 6, 0, Route11_EventScript_1A9C43, 0, 0, 0
	object_event 11, 92, 0, 42, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEAF0, 449, 0, 0
	object_event 12, 92, 0, 63, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEB99, 462, 0, 0
	object_event 13, 92, 0, 13, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EventScript_1BEBA6, 463, 0, 0

Route11_MapWarps:
	warp_def 6, 7, 0, 0, 294
	warp_def 58, 10, 3, 0, 5632
	warp_def 65, 10, 3, 2, 5632

Route11_MapBGEvents:
	bg_event 3, 7, 3, 0, 0, Route11_EventScript_167FF7
	bg_event 58, 5, 0, 7, 0, 85, 41, 1

gMapEvents_Route11::
	map_events Route11_EventObjects, Route11_MapWarps, 0x0, Route11_MapBGEvents

Route12_EventObjects:
	object_event 1, 57, 0, 17, 0, 32, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA451, 0, 0, 0
	object_event 2, 57, 0, 9, 0, 40, 0, 3, 14, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA48F, 0, 0, 0
	object_event 3, 57, 0, 16, 0, 47, 0, 3, 17, 17, 0, 1, 0, 4, 0, Route12_EventScript_1AA4CD, 0, 0, 0
	object_event 4, 57, 0, 13, 0, 59, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA50B, 0, 0, 0
	object_event 5, 109, 0, 14, 0, 70, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_168014, 84, 0, 0
	object_event 6, 26, 0, 13, 0, 92, 0, 3, 37, 68, 0, 1, 0, 1, 0, Route12_EventScript_1AA587, 0, 0, 0
	object_event 7, 39, 0, 10, 0, 99, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA5C5, 0, 0, 0
	object_event 8, 57, 0, 18, 0, 108, 0, 3, 14, 17, 0, 1, 0, 1, 0, Route12_EventScript_1AA549, 0, 0, 0
	object_event 9, 95, 0, 11, 0, 100, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BDF13, 18, 0, 0
	object_event 10, 92, 0, 18, 0, 36, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BE7B0, 382, 0, 0
	object_event 11, 92, 0, 9, 0, 101, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BE7BD, 383, 0, 0
	object_event 12, 29, 0, 19, 0, 64, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route12_EventScript_1AA649, 0, 0, 0
	object_event 13, 25, 0, 19, 0, 63, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route12_EventScript_1AA603, 0, 0, 0
	object_event 14, 95, 0, 12, 0, 111, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_EventScript_1BDF13, 19, 0, 0

Route12_MapWarps:
	warp_def 12, 86, 0, 1, 5890
	warp_def 14, 15, 3, 0, 5888
	warp_def 15, 15, 3, 1, 5888
	warp_def 14, 21, 3, 2, 5888

Route12_MapBGEvents:
	bg_event 17, 13, 0, 0, 0, Route12_EventScript_1680A3
	bg_event 15, 69, 0, 0, 0, Route12_EventScript_1680AC
	bg_event 18, 57, 3, 7, 0, 21, 42, 1
	bg_event 14, 70, 3, 7, 0, 200, 131, 129
	bg_event 9, 116, 3, 7, 0, 68, 130, 1

gMapEvents_Route12::
	map_events Route12_EventObjects, Route12_MapWarps, 0x0, Route12_MapBGEvents

Route13_EventObjects:
	object_event 1, 40, 0, 62, 0, 6, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA803, 0, 0, 0
	object_event 2, 26, 0, 63, 0, 12, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA749, 0, 0, 0
	object_event 3, 40, 0, 54, 0, 11, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA841, 0, 0, 0
	object_event 4, 29, 0, 42, 0, 7, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA70B, 0, 0, 0
	object_event 5, 29, 0, 43, 0, 7, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA6CD, 0, 0, 0
	object_event 6, 40, 0, 35, 0, 10, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA87F, 0, 0, 0
	object_event 7, 40, 0, 29, 0, 11, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA8BD, 0, 0, 0
	object_event 8, 26, 0, 9, 0, 14, 0, 3, 7, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA7C5, 0, 0, 0
	object_event 9, 26, 0, 16, 0, 5, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route13_EventScript_1AA787, 0, 0, 0
	object_event 10, 53, 0, 14, 0, 8, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route13_EventScript_1AA68F, 0, 0, 0
	object_event 11, 95, 0, 44, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route13_EventScript_1BDF13, 18, 0, 0

Route13_MapBGEvents:
	bg_event 41, 12, 0, 0, 0, Route13_EventScript_1680C8
	bg_event 37, 6, 0, 0, 0, Route13_EventScript_1680BF
	bg_event 21, 14, 0, 0, 0, Route13_EventScript_1680B6
	bg_event 23, 14, 3, 7, 0, 69, 15, 1

gMapEvents_Route13::
	map_events Route13_EventObjects, 0x0, 0x0, Route13_MapBGEvents

Route14_EventObjects:
	object_event 1, 53, 0, 7, 0, 37, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route14_EventScript_1AA9B5, 0, 0, 0
	object_event 2, 26, 0, 18, 0, 35, 0, 3, 2, 34, 0, 1, 0, 1, 0, Route14_EventScript_1AA9F3, 0, 0, 0
	object_event 3, 26, 0, 10, 0, 14, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route14_EventScript_1AAAEB, 0, 0, 0
	object_event 4, 26, 0, 16, 0, 16, 0, 3, 7, 17, 0, 1, 0, 3, 0, Route14_EventScript_1AAB29, 0, 0, 0
	object_event 5, 53, 0, 7, 0, 31, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route14_EventScript_1AA977, 0, 0, 0
	object_event 6, 53, 0, 7, 0, 34, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route14_EventScript_1AA8FB, 0, 0, 0
	object_event 7, 26, 0, 8, 0, 9, 0, 3, 5, 17, 0, 1, 0, 1, 0, Route14_EventScript_1AAAAD, 0, 0, 0
	object_event 8, 26, 0, 7, 0, 6, 0, 3, 10, 17, 0, 1, 0, 1, 0, Route14_EventScript_1AAA6F, 0, 0, 0
	object_event 9, 53, 0, 10, 0, 37, 0, 3, 25, 97, 0, 1, 0, 1, 0, Route14_EventScript_1AA939, 0, 0, 0
	object_event 10, 26, 0, 18, 0, 47, 0, 3, 2, 34, 0, 1, 0, 1, 0, Route14_EventScript_1AAA31, 0, 0, 0
	object_event 11, 95, 0, 7, 0, 26, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route14_EventScript_1BDF13, 18, 0, 0
	object_event 12, 95, 0, 12, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route14_EventScript_1BDF13, 19, 0, 0
	object_event 13, 95, 0, 1, 0, 47, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route14_EventScript_1BDF13, 20, 0, 0
	object_event 14, 17, 0, 13, 0, 51, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route14_EventScript_1AABAD, 0, 0, 0
	object_event 15, 17, 0, 12, 0, 51, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route14_EventScript_1AAB67, 0, 0, 0

Route14_MapBGEvents:
	bg_event 17, 12, 0, 0, 0, Route14_EventScript_1680D2
	bg_event 9, 20, 3, 7, 0, 70, 149, 1
	bg_event 19, 53, 3, 7, 0, 152, 157, 1

gMapEvents_Route14::
	map_events Route14_EventObjects, 0x0, 0x0, Route14_MapBGEvents

Route15_EventObjects:
	object_event 1, 40, 0, 22, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAD67, 0, 0, 0
	object_event 2, 26, 0, 31, 0, 12, 0, 3, 9, 17, 0, 1, 0, 5, 0, Route15_EventScript_1AACEB, 0, 0, 0
	object_event 3, 26, 0, 37, 0, 14, 0, 3, 7, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAD29, 0, 0, 0
	object_event 4, 40, 0, 44, 0, 13, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AADA5, 0, 0, 0
	object_event 5, 29, 0, 50, 0, 12, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AACAD, 0, 0, 0
	object_event 6, 53, 0, 59, 0, 12, 0, 3, 18, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAC31, 0, 0, 0
	object_event 7, 53, 0, 63, 0, 13, 0, 3, 13, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AABF3, 0, 0, 0
	object_event 8, 40, 0, 52, 0, 8, 0, 3, 2, 66, 0, 1, 0, 1, 0, Route15_EventScript_1AADE3, 0, 0, 0
	object_event 9, 29, 0, 54, 0, 12, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route15_EventScript_1AAC6F, 0, 0, 0
	object_event 10, 40, 0, 28, 0, 6, 0, 3, 2, 66, 0, 1, 0, 1, 0, Route15_EventScript_1AAE21, 0, 0, 0
	object_event 11, 92, 0, 20, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route15_EventScript_1BE7CA, 384, 0, 0
	object_event 12, 54, 0, 39, 0, 7, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAEA5, 0, 0, 0
	object_event 13, 24, 0, 40, 0, 7, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route15_EventScript_1AAE5F, 0, 0, 0
	object_event 14, 65375, 0, 73, 0, 7, 0, 13, 0, 0, 0, 32, 0, 3, 0, 0x0, 0, 0, 0

Route15_MapWarps:
	warp_def 9, 11, 3, 0, 6144
	warp_def 16, 11, 3, 2, 6144

Route15_MapBGEvents:
	bg_event 41, 11, 0, 0, 0, Route15_EventScript_1680DC

gMapEvents_Route15::
	map_events Route15_EventObjects, Route15_MapWarps, 0x0, Route15_MapBGEvents

Route16_EventObjects:
	object_event 1, 53, 0, 16, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAEEB, 0, 0, 0
	object_event 2, 53, 0, 14, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAFA5, 0, 0, 0
	object_event 3, 53, 0, 12, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAFE3, 0, 0, 0
	object_event 4, 53, 0, 8, 0, 12, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAF67, 0, 0, 0
	object_event 5, 53, 0, 10, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AAF29, 0, 0, 0
	object_event 6, 53, 0, 6, 0, 14, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB021, 0, 0, 0
	object_event 7, 95, 0, 41, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_EventScript_1BDF13, 18, 0, 0
	object_event 8, 29, 0, 30, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB0A5, 0, 0, 0
	object_event 9, 25, 0, 31, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route16_EventScript_1AB05F, 0, 0, 0
	object_event 10, 109, 0, 31, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_EventScript_168121, 128, 0, 0

Route16_MapWarps:
	warp_def 10, 5, 0, 1, 6400
	warp_def 20, 6, 3, 0, 6401
	warp_def 27, 6, 3, 1, 6401
	warp_def 20, 13, 3, 2, 6401
	warp_def 27, 13, 3, 3, 6401

Route16_MapBGEvents:
	bg_event 6, 17, 0, 0, 0, Route16_EventScript_1681B6
	bg_event 33, 11, 0, 0, 0, Route16_EventScript_1681AD
	bg_event 31, 13, 3, 7, 0, 200, 132, 129

gMapEvents_Route16::
	map_events Route16_EventObjects, Route16_MapWarps, 0x0, Route16_MapBGEvents

Route17_EventObjects:
	object_event 1, 53, 0, 4, 0, 18, 0, 3, 26, 97, 0, 1, 0, 1, 0, Route17_EventScript_1AB319, 0, 0, 0
	object_event 2, 53, 0, 11, 0, 15, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB221, 0, 0, 0
	object_event 3, 53, 0, 15, 0, 24, 0, 3, 52, 36, 0, 1, 0, 1, 0, Route17_EventScript_1AB1E3, 0, 0, 0
	object_event 4, 53, 0, 18, 0, 41, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB129, 0, 0, 0
	object_event 5, 53, 0, 7, 0, 38, 0, 3, 14, 17, 0, 1, 0, 5, 0, Route17_EventScript_1AB0EB, 0, 0, 0
	object_event 6, 53, 0, 2, 0, 61, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route17_EventScript_1AB29D, 0, 0, 0
	object_event 7, 53, 0, 21, 0, 61, 0, 3, 9, 17, 0, 1, 0, 3, 0, Route17_EventScript_1AB25F, 0, 0, 0
	object_event 8, 53, 0, 18, 0, 94, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB2DB, 0, 0, 0
	object_event 9, 53, 0, 16, 0, 134, 0, 3, 47, 24, 0, 1, 0, 1, 0, Route17_EventScript_1AB1A5, 0, 0, 0
	object_event 10, 53, 0, 4, 0, 116, 0, 3, 26, 81, 0, 1, 0, 1, 0, Route17_EventScript_1AB167, 0, 0, 0

Route17_MapBGEvents:
	bg_event 12, 97, 0, 0, 0, Route17_EventScript_1681DB
	bg_event 12, 83, 0, 0, 0, Route17_EventScript_1681D2
	bg_event 12, 68, 0, 0, 0, Route17_EventScript_1681C9
	bg_event 12, 53, 0, 0, 0, Route17_EventScript_1681C0
	bg_event 12, 125, 3, 0, 0, Route17_EventScript_1681E4
	bg_event 11, 157, 0, 0, 0, Route17_EventScript_1681ED
	bg_event 18, 83, 3, 7, 0, 68, 17, 1
	bg_event 10, 53, 3, 7, 0, 19, 18, 1
	bg_event 4, 68, 3, 7, 0, 69, 19, 1
	bg_event 4, 125, 3, 7, 0, 25, 20, 1
	bg_event 14, 157, 3, 7, 0, 37, 21, 1

gMapEvents_Route17::
	map_events Route17_EventObjects, 0x0, 0x0, Route17_MapBGEvents

Route18_EventObjects:
	object_event 1, 26, 0, 46, 0, 14, 0, 3, 9, 17, 0, 1, 0, 4, 0, Route18_EventScript_1AB3D3, 0, 0, 0
	object_event 2, 26, 0, 41, 0, 15, 0, 3, 1, 17, 0, 1, 0, 1, 0, Route18_EventScript_1AB395, 0, 0, 0
	object_event 3, 26, 0, 39, 0, 12, 0, 3, 10, 17, 0, 1, 0, 6, 0, Route18_EventScript_1AB357, 0, 0, 0

Route18_MapWarps:
	warp_def 41, 9, 3, 0, 6656
	warp_def 48, 9, 3, 1, 6656

Route18_MapBGEvents:
	bg_event 37, 7, 0, 0, 0, Route18_EventScript_168228
	bg_event 52, 7, 0, 0, 0, Route18_EventScript_16821F

gMapEvents_Route18::
	map_events Route18_EventObjects, Route18_MapWarps, 0x0, Route18_MapBGEvents

Route19_EventObjects:
	object_event 1, 45, 0, 15, 0, 10, 0, 3, 9, 54, 0, 1, 0, 3, 0, Route19_EventScript_1AB44F, 0, 0, 0
	object_event 2, 45, 0, 10, 0, 9, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route19_EventScript_1AB411, 0, 0, 0
	object_event 3, 43, 0, 12, 0, 17, 0, 1, 1, 17, 0, 1, 0, 3, 0, Route19_EventScript_1AB547, 0, 0, 0
	object_event 4, 43, 0, 18, 0, 33, 0, 1, 51, 53, 0, 1, 0, 1, 0, Route19_EventScript_1AB48D, 0, 0, 0
	object_event 5, 43, 0, 8, 0, 27, 0, 1, 2, 34, 0, 1, 0, 1, 0, Route19_EventScript_1AB4CB, 0, 0, 0
	object_event 6, 43, 0, 16, 0, 22, 0, 1, 14, 17, 0, 1, 0, 6, 0, Route19_EventScript_1AB509, 0, 0, 0
	object_event 7, 43, 0, 11, 0, 47, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB585, 0, 0, 0
	object_event 8, 44, 0, 14, 0, 48, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB601, 0, 0, 0
	object_event 9, 44, 0, 12, 0, 49, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB63F, 0, 0, 0
	object_event 10, 44, 0, 9, 0, 48, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB5C3, 0, 0, 0
	object_event 11, 44, 0, 8, 0, 41, 0, 1, 8, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB67D, 0, 0, 0
	object_event 12, 36, 0, 9, 0, 41, 0, 1, 8, 17, 0, 1, 0, 1, 0, Route19_EventScript_1AB6C3, 0, 0, 0

Route19_MapBGEvents:
	bg_event 13, 12, 0, 0, 0, Route19_EventScript_168232

gMapEvents_Route19::
	map_events Route19_EventObjects, 0x0, 0x0, Route19_MapBGEvents

Route20_EventObjects:
	object_event 1, 44, 0, 8, 0, 11, 0, 1, 13, 17, 0, 1, 0, 3, 0, Route20_EventScript_1AB83F, 0, 0, 0
	object_event 2, 40, 0, 16, 0, 14, 0, 3, 8, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB8F9, 0, 0, 0
	object_event 3, 44, 0, 34, 0, 7, 0, 1, 8, 17, 0, 1, 0, 4, 0, Route20_EventScript_1AB801, 0, 0, 0
	object_event 4, 26, 0, 43, 0, 9, 0, 3, 2, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB8BB, 0, 0, 0
	object_event 5, 43, 0, 23, 0, 10, 0, 1, 52, 69, 0, 1, 0, 1, 0, Route20_EventScript_1AB747, 0, 0, 0
	object_event 6, 40, 0, 73, 0, 16, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route20_EventScript_1AB937, 0, 0, 0
	object_event 7, 43, 0, 111, 0, 9, 0, 1, 45, 53, 0, 1, 0, 1, 0, Route20_EventScript_1AB709, 0, 0, 0
	object_event 8, 43, 0, 106, 0, 11, 0, 1, 50, 53, 0, 1, 0, 1, 0, Route20_EventScript_1AB785, 0, 0, 0
	object_event 9, 44, 0, 93, 0, 10, 0, 1, 1, 17, 0, 1, 0, 5, 0, Route20_EventScript_1AB87D, 0, 0, 0
	object_event 10, 44, 0, 54, 0, 11, 0, 1, 1, 17, 0, 1, 0, 1, 0, Route20_EventScript_1AB7C3, 0, 0, 0
	object_event 11, 39, 0, 69, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route20_EventScript_1ACE36, 0, 0, 0

Route20_MapWarps:
	warp_def 60, 8, 3, 3, 339
	warp_def 72, 14, 3, 4, 339

Route20_MapBGEvents:
	bg_event 68, 14, 0, 0, 0, Route20_EventScript_168280
	bg_event 64, 8, 0, 0, 0, Route20_EventScript_168280
	bg_event 23, 6, 3, 7, 0, 108, 153, 1

gMapEvents_Route20::
	map_events Route20_EventObjects, Route20_MapWarps, 0x0, Route20_MapBGEvents

Route21_North_EventObjects:
	object_event 1, 57, 0, 7, 0, 27, 0, 3, 7, 17, 0, 1, 0, 0, 0, Route21_North_EventScript_1AB975, 0, 0, 0
	object_event 2, 57, 0, 16, 0, 26, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route21_North_EventScript_1AB9F1, 0, 0, 0
	object_event 3, 43, 0, 12, 0, 44, 0, 1, 51, 36, 0, 1, 0, 1, 0, Route21_North_EventScript_1ABA6D, 0, 0, 0
	object_event 4, 44, 0, 14, 0, 35, 0, 1, 8, 17, 0, 1, 0, 1, 0, Route21_North_EventScript_1ABB65, 0, 0, 0
	object_event 5, 36, 0, 15, 0, 35, 0, 1, 8, 17, 0, 1, 0, 1, 0, Route21_North_EventScript_1ABBAB, 0, 0, 0
	object_event 6, 65307, 0, 13, 0, 253, 255, 2, 0, 0, 0, 0, 0, 3, 0, 0x0, 0, 0, 0

Route21_North_MapBGEvents:
	bg_event 17, 42, 3, 7, 0, 106, 154, 1

gMapEvents_Route21_North::
	map_events Route21_North_EventObjects, 0x0, 0x0, Route21_North_MapBGEvents

Route21_South_EventObjects:
	object_event 1, 57, 0, 11, 0, 8, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route21_South_EventScript_1AB9B3, 0, 0, 0
	object_event 2, 57, 0, 14, 0, 15, 0, 3, 9, 17, 0, 1, 0, 0, 0, Route21_South_EventScript_1ABA2F, 0, 0, 0
	object_event 3, 43, 0, 15, 0, 24, 0, 1, 14, 17, 0, 1, 0, 3, 0, Route21_South_EventScript_1ABAAB, 0, 0, 0
	object_event 4, 43, 0, 15, 0, 38, 0, 1, 9, 17, 0, 1, 0, 3, 0, Route21_South_EventScript_1ABAE9, 0, 0, 0
	object_event 5, 43, 0, 10, 0, 29, 0, 1, 2, 34, 0, 1, 0, 4, 0, Route21_South_EventScript_1ABB27, 0, 0, 0

gMapEvents_Route21_South::
	map_events Route21_South_EventObjects, 0x0, 0x0, 0x0

Route22_EventObjects:
	object_event 1, 72, 0, 25, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, 79, 0, 0

Route22_MapWarps:
	warp_def 8, 5, 0, 2, 7168
	warp_def 9, 5, 0, 2, 7168

Route22_MapCoordEvents:
	coord_event 33, 4, 3, 0, 16468, 1, 0, Route22_EventScript_16828C
	coord_event 33, 5, 3, 0, 16468, 1, 0, Route22_EventScript_168298
	coord_event 33, 6, 0, 0, 16468, 1, 0, Route22_EventScript_1682AB
	coord_event 33, 4, 3, 0, 16468, 3, 0, Route22_EventScript_1683ED
	coord_event 33, 5, 3, 0, 16468, 3, 0, Route22_EventScript_1683F9
	coord_event 33, 6, 0, 0, 16468, 3, 0, Route22_EventScript_16840C

Route22_MapBGEvents:
	bg_event 7, 12, 0, 0, 0, Route22_EventScript_1684E2

gMapEvents_Route22::
	map_events Route22_EventObjects, Route22_MapWarps, Route22_MapCoordEvents, Route22_MapBGEvents

Route23_EventObjects:
	object_event 1, 60, 0, 15, 0, 149, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_16850C, 0, 0, 0
	object_event 2, 60, 0, 8, 0, 140, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_16851D, 0, 0, 0
	object_event 3, 60, 0, 14, 0, 123, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_16852E, 0, 0, 0
	object_event 4, 60, 0, 16, 0, 112, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_16853F, 0, 0, 0
	object_event 5, 60, 0, 10, 0, 94, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_168550, 0, 0, 0
	object_event 6, 60, 0, 14, 0, 61, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_168561, 0, 0, 0
	object_event 7, 60, 0, 6, 0, 35, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route23_EventScript_168572, 0, 0, 0

Route23_MapWarps:
	warp_def 5, 28, 3, 1, 295
	warp_def 18, 28, 3, 6, 296
	warp_def 8, 153, 3, 0, 7168
	warp_def 9, 154, 0, 0, 7168

Route23_MapCoordEvents:
	coord_event 13, 149, 3, 0, 16479, 1, 0, Route23_EventScript_168583
	coord_event 7, 140, 3, 0, 16479, 2, 0, Route23_EventScript_168598
	coord_event 12, 123, 3, 0, 16479, 3, 0, Route23_EventScript_1685AD
	coord_event 11, 111, 0, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 9, 94, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 12, 61, 3, 0, 16479, 6, 0, Route23_EventScript_1685EC
	coord_event 1, 35, 0, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 1, 34, 0, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 1, 32, 3, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 1, 33, 0, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 1, 31, 0, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 1, 36, 0, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 5, 35, 3, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 4, 35, 3, 0, 16479, 7, 0, Route23_EventScript_168601
	coord_event 10, 60, 0, 0, 16479, 6, 0, Route23_EventScript_1685EC
	coord_event 13, 61, 3, 0, 16479, 6, 0, Route23_EventScript_1685EC
	coord_event 11, 60, 0, 0, 16479, 6, 0, Route23_EventScript_1685EC
	coord_event 8, 94, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 5, 92, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 7, 94, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 4, 92, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 3, 92, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 2, 92, 1, 0, 16479, 5, 0, Route23_EventScript_1685D7
	coord_event 4, 139, 0, 0, 16479, 2, 0, Route23_EventScript_168598
	coord_event 5, 139, 0, 0, 16479, 2, 0, Route23_EventScript_168598
	coord_event 6, 140, 3, 0, 16479, 2, 0, Route23_EventScript_168598
	coord_event 10, 122, 0, 0, 16479, 3, 0, Route23_EventScript_1685AD
	coord_event 11, 122, 0, 0, 16479, 3, 0, Route23_EventScript_1685AD
	coord_event 13, 123, 3, 0, 16479, 3, 0, Route23_EventScript_1685AD
	coord_event 8, 109, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 9, 109, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 10, 109, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 11, 109, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 12, 109, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 12, 111, 0, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 14, 112, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 13, 112, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 15, 112, 1, 0, 16479, 4, 0, Route23_EventScript_1685C2
	coord_event 12, 148, 0, 0, 16479, 1, 0, Route23_EventScript_168583
	coord_event 11, 148, 0, 0, 16479, 1, 0, Route23_EventScript_168583
	coord_event 14, 149, 3, 0, 16479, 1, 0, Route23_EventScript_168583
	coord_event 10, 148, 0, 0, 16479, 1, 0, Route23_EventScript_168583

Route23_MapBGEvents:
	bg_event 19, 42, 0, 7, 0, 19, 34, 1
	bg_event 20, 72, 0, 7, 0, 2, 35, 1
	bg_event 11, 101, 3, 7, 0, 35, 36, 1
	bg_event 3, 18, 3, 7, 0, 141, 145, 1
	bg_event 2, 29, 3, 7, 0, 142, 146, 1
	bg_event 10, 67, 3, 7, 0, 137, 147, 1
	bg_event 3, 128, 3, 7, 0, 138, 148, 1
	bg_event 9, 8, 3, 7, 0, 37, 155, 1
	bg_event 3, 31, 0, 0, 0, Route23_EventScript_168616

gMapEvents_Route23::
	map_events Route23_EventObjects, Route23_MapWarps, Route23_MapCoordEvents, Route23_MapBGEvents

Route24_EventObjects:
	object_event 1, 25, 0, 12, 0, 15, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route24_EventScript_168620, 49, 0, 0
	object_event 2, 39, 0, 12, 0, 19, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route24_EventScript_1A972D, 0, 0, 0
	object_event 3, 22, 0, 10, 0, 22, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route24_EventScript_1A9673, 0, 0, 0
	object_event 4, 18, 0, 12, 0, 25, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route24_EventScript_1A95F7, 0, 0, 0
	object_event 5, 22, 0, 10, 0, 28, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route24_EventScript_1A96B1, 0, 0, 0
	object_event 6, 20, 0, 12, 0, 31, 0, 3, 9, 17, 0, 1, 0, 2, 0, Route24_EventScript_1A9635, 0, 0, 0
	object_event 7, 39, 0, 5, 0, 21, 0, 3, 7, 17, 0, 1, 0, 5, 0, Route24_EventScript_1A96EF, 0, 0, 0
	object_event 8, 92, 0, 11, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route24_EventScript_1BE644, 354, 0, 0

Route24_MapCoordEvents:
	coord_event 10, 15, 3, 0, 16491, 0, 0, Route24_EventScript_168660
	coord_event 11, 15, 3, 0, 16491, 0, 0, Route24_EventScript_16866C

Route24_MapBGEvents:
	bg_event 19, 4, 3, 7, 0, 135, 115, 1

gMapEvents_Route24::
	map_events Route24_EventObjects, 0x0, Route24_MapCoordEvents, Route24_MapBGEvents

Route25_EventObjects:
	object_event 1, 56, 0, 11, 0, 4, 0, 3, 10, 17, 0, 1, 0, 4, 0, Route25_EventScript_1A98A1, 0, 0, 0
	object_event 2, 18, 0, 18, 0, 2, 0, 3, 8, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A976B, 0, 0, 0
	object_event 3, 56, 0, 17, 0, 7, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A991D, 0, 0, 0
	object_event 4, 18, 0, 22, 0, 4, 0, 3, 1, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A97A9, 0, 0, 0
	object_event 5, 40, 0, 22, 0, 8, 0, 3, 10, 17, 0, 1, 0, 2, 0, Route25_EventScript_1A9825, 0, 0, 0
	object_event 6, 56, 0, 27, 0, 9, 0, 3, 7, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A98DF, 0, 0, 0
	object_event 7, 39, 0, 28, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A995B, 0, 0, 0
	object_event 8, 18, 0, 36, 0, 4, 0, 3, 26, 49, 0, 1, 0, 2, 0, Route25_EventScript_1A97E7, 0, 0, 0
	object_event 9, 22, 0, 42, 0, 5, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route25_EventScript_1A9863, 0, 0, 0
	object_event 10, 92, 0, 26, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route25_EventScript_1BE651, 355, 0, 0
	object_event 11, 95, 0, 30, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route25_EventScript_1BDF13, 18, 0, 0
	object_event 12, 29, 0, 49, 0, 10, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route25_EventScript_1ACE4F, 0, 0, 0
	object_event 13, 25, 0, 49, 0, 11, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route25_EventScript_16874F, 0, 0, 0

Route25_MapWarps:
	warp_def 51, 4, 0, 1, 7680

Route25_MapBGEvents:
	bg_event 48, 4, 0, 0, 0, Route25_EventScript_168746
	bg_event 14, 2, 3, 7, 0, 36, 4, 1
	bg_event 58, 6, 3, 7, 0, 34, 5, 1
	bg_event 33, 8, 3, 7, 0, 139, 116, 1
	bg_event 40, 3, 3, 7, 0, 149, 117, 1

gMapEvents_Route25::
	map_events Route25_EventObjects, Route25_MapWarps, 0x0, Route25_MapBGEvents

OneIsland_KindleRoad_EventObjects:
	object_event 1, 44, 0, 11, 0, 32, 0, 1, 14, 17, 0, 1, 0, 4, 0, OneIsland_KindleRoad_EventScript_1ABBF1, 0, 0, 0
	object_event 2, 46, 0, 17, 0, 132, 0, 3, 8, 17, 0, 1, 0, 2, 0, OneIsland_KindleRoad_EventScript_1ABC2F, 0, 0, 0
	object_event 3, 43, 0, 7, 0, 39, 0, 1, 52, 54, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABC6D, 0, 0, 0
	object_event 4, 45, 0, 19, 0, 79, 0, 3, 8, 17, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABCAB, 0, 0, 0
	object_event 5, 57, 0, 15, 0, 25, 0, 3, 9, 17, 0, 1, 0, 0, 0, OneIsland_KindleRoad_EventScript_1ABCE9, 0, 0, 0
	object_event 6, 24, 0, 9, 0, 53, 0, 3, 26, 113, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABD27, 0, 0, 0
	object_event 7, 24, 0, 18, 0, 105, 0, 4, 50, 65, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABD65, 0, 0, 0
	object_event 8, 54, 0, 16, 0, 64, 0, 3, 27, 18, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABDA3, 0, 0, 0
	object_event 9, 54, 0, 11, 0, 64, 0, 3, 28, 18, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABDE1, 0, 0, 0
	object_event 10, 39, 0, 11, 0, 89, 0, 3, 14, 17, 0, 1, 0, 3, 0, OneIsland_KindleRoad_EventScript_1ABE1F, 0, 0, 0
	object_event 11, 40, 0, 9, 0, 108, 0, 3, 1, 17, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABE5D, 0, 0, 0
	object_event 12, 54, 0, 8, 0, 68, 0, 3, 8, 17, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABEE1, 0, 0, 0
	object_event 13, 24, 0, 9, 0, 68, 0, 3, 8, 17, 0, 1, 0, 1, 0, OneIsland_KindleRoad_EventScript_1ABE9B, 0, 0, 0
	object_event 14, 96, 0, 8, 0, 104, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 19, 0, 0
	object_event 15, 96, 0, 11, 0, 95, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 21, 0, 0
	object_event 16, 96, 0, 12, 0, 96, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 22, 0, 0
	object_event 17, 96, 0, 10, 0, 95, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 23, 0, 0
	object_event 18, 96, 0, 9, 0, 105, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 24, 0, 0
	object_event 19, 96, 0, 15, 0, 75, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 25, 0, 0
	object_event 20, 96, 0, 9, 0, 84, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 26, 0, 0
	object_event 21, 96, 0, 15, 0, 74, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 27, 0, 0
	object_event 22, 96, 0, 15, 0, 73, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 28, 0, 0
	object_event 23, 96, 0, 18, 0, 111, 0, 4, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 29, 0, 0
	object_event 24, 96, 0, 10, 0, 86, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 30, 0, 0
	object_event 25, 96, 0, 9, 0, 110, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 31, 0, 0
	object_event 26, 96, 0, 18, 0, 112, 0, 4, 1, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BE00C, 17, 0, 0
	object_event 27, 92, 0, 15, 0, 70, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BEC42, 475, 0, 0
	object_event 28, 92, 0, 17, 0, 103, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BEC4F, 476, 0, 0
	object_event 29, 92, 0, 18, 0, 114, 0, 4, 8, 17, 0, 0, 0, 0, 0, OneIsland_KindleRoad_EventScript_1BEC5C, 477, 0, 0

OneIsland_KindleRoad_MapWarps:
	warp_def 11, 6, 3, 0, 353
	warp_def 12, 6, 3, 1, 353
	warp_def 15, 58, 3, 0, 569

OneIsland_KindleRoad_MapBGEvents:
	bg_event 13, 59, 0, 0, 0, OneIsland_KindleRoad_EventScript_168762
	bg_event 8, 115, 0, 0, 0, OneIsland_KindleRoad_EventScript_168759

gMapEvents_OneIsland_KindleRoad::
	map_events OneIsland_KindleRoad_EventObjects, OneIsland_KindleRoad_MapWarps, 0x0, OneIsland_KindleRoad_MapBGEvents

OneIsland_TreasureBeach_EventObjects:
	object_event 1, 44, 0, 8, 0, 11, 0, 1, 2, 18, 0, 1, 0, 1, 0, OneIsland_TreasureBeach_EventScript_1ABF27, 0, 0, 0
	object_event 2, 19, 0, 13, 0, 20, 0, 3, 2, 17, 0, 0, 0, 0, 0, OneIsland_TreasureBeach_EventScript_16876C, 0, 0, 0

OneIsland_TreasureBeach_MapBGEvents:
	bg_event 8, 20, 3, 7, 0, 108, 103, 1
	bg_event 13, 27, 3, 7, 0, 108, 104, 1
	bg_event 11, 31, 3, 7, 0, 106, 105, 1
	bg_event 9, 34, 3, 7, 0, 106, 106, 1
	bg_event 15, 22, 3, 7, 0, 2, 107, 1
	bg_event 16, 33, 3, 7, 0, 2, 108, 1
	bg_event 15, 29, 3, 7, 0, 109, 109, 1
	bg_event 8, 27, 3, 7, 0, 107, 110, 1

gMapEvents_OneIsland_TreasureBeach::
	map_events OneIsland_TreasureBeach_EventObjects, 0x0, 0x0, OneIsland_TreasureBeach_MapBGEvents


TwoIsland_CapeBrink_MapWarps:
	warp_def 12, 16, 0, 0, 10240

TwoIsland_CapeBrink_MapBGEvents:
	bg_event 16, 28, 3, 7, 0, 71, 161, 129
	bg_event 15, 13, 3, 7, 0, 68, 111, 1

gMapEvents_TwoIsland_CapeBrink::
	map_events 0x0, TwoIsland_CapeBrink_MapWarps, 0x0, TwoIsland_CapeBrink_MapBGEvents

ThreeIsland_BondBridge_EventObjects:
	object_event 1, 28, 0, 27, 0, 10, 0, 3, 2, 17, 0, 1, 0, 5, 0, ThreeIsland_BondBridge_EventScript_1ABF65, 0, 0, 0
	object_event 2, 28, 0, 68, 0, 10, 0, 3, 9, 17, 0, 1, 0, 2, 0, ThreeIsland_BondBridge_EventScript_1ABFA3, 0, 0, 0
	object_event 3, 37, 0, 33, 0, 13, 0, 3, 10, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1ABFE1, 0, 0, 0
	object_event 4, 37, 0, 50, 0, 11, 0, 3, 27, 18, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC01F, 0, 0, 0
	object_event 5, 44, 0, 36, 0, 4, 0, 1, 1, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC05D, 0, 0, 0
	object_event 6, 17, 0, 77, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC09B, 0, 0, 0
	object_event 7, 17, 0, 78, 0, 5, 0, 3, 8, 17, 0, 1, 0, 1, 0, ThreeIsland_BondBridge_EventScript_1AC0E1, 0, 0, 0
	object_event 8, 95, 0, 72, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BondBridge_EventScript_1BDF13, 18, 0, 0
	object_event 9, 95, 0, 86, 0, 13, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_BondBridge_EventScript_1BDF13, 19, 0, 0

ThreeIsland_BondBridge_MapWarps:
	warp_def 12, 6, 3, 0, 365
	warp_def 13, 6, 3, 0, 365

ThreeIsland_BondBridge_MapBGEvents:
	bg_event 14, 7, 0, 0, 0, ThreeIsland_BondBridge_EventScript_168777
	bg_event 61, 5, 0, 7, 0, 84, 165, 1
	bg_event 44, 12, 3, 7, 0, 106, 166, 1
	bg_event 33, 7, 3, 7, 0, 108, 167, 1
	bg_event 91, 9, 0, 0, 0, ThreeIsland_BondBridge_EventScript_168780

gMapEvents_ThreeIsland_BondBridge::
	map_events ThreeIsland_BondBridge_EventObjects, ThreeIsland_BondBridge_MapWarps, 0x0, ThreeIsland_BondBridge_MapBGEvents

ThreeIsland_Port_EventObjects:
	object_event 1, 31, 0, 14, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, ThreeIsland_Port_EventScript_168796, 0, 0, 0
	object_event 2, 53, 0, 8, 0, 8, 0, 3, 28, 19, 0, 0, 0, 0, 0, ThreeIsland_Port_EventScript_1687CC, 121, 0, 0
	object_event 3, 53, 0, 13, 0, 10, 0, 3, 49, 34, 0, 0, 0, 0, 0, ThreeIsland_Port_EventScript_1687D5, 121, 0, 0

ThreeIsland_Port_MapWarps:
	warp_def 16, 4, 0, 0, 546
	warp_def 38, 5, 3, 1, 546
	warp_def 12, 13, 3, 0, 9728

gMapEvents_ThreeIsland_Port::
	map_events ThreeIsland_Port_EventObjects, ThreeIsland_Port_MapWarps, 0x0, 0x0


gMapEvents_UnknownMap_03_50::
	map_events 0x0, 0x0, 0x0, 0x0


gMapEvents_UnknownMap_03_51::
	map_events 0x0, 0x0, 0x0, 0x0


gMapEvents_UnknownMap_03_52::
	map_events 0x0, 0x0, 0x0, 0x0


gMapEvents_UnknownMap_03_53::
	map_events 0x0, 0x0, 0x0, 0x0

FiveIsland_ResortGorgeous_EventObjects:
	object_event 1, 22, 0, 44, 0, 10, 0, 3, 18, 17, 0, 1, 0, 3, 0, FiveIsland_ResortGorgeous_EventScript_1AC127, 0, 0, 0
	object_event 2, 22, 0, 33, 0, 12, 0, 3, 7, 17, 0, 1, 0, 4, 0, FiveIsland_ResortGorgeous_EventScript_1AC165, 0, 0, 0
	object_event 3, 22, 0, 12, 0, 10, 0, 3, 8, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC1A3, 0, 0, 0
	object_event 4, 28, 0, 23, 0, 9, 0, 3, 2, 18, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC1E1, 0, 0, 0
	object_event 5, 28, 0, 33, 0, 8, 0, 3, 8, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC21F, 0, 0, 0
	object_event 6, 18, 0, 33, 0, 3, 0, 3, 46, 26, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC25D, 0, 0, 0
	object_event 7, 43, 0, 56, 0, 7, 0, 1, 1, 17, 0, 1, 0, 1, 0, FiveIsland_ResortGorgeous_EventScript_1AC29B, 0, 0, 0
	object_event 8, 28, 0, 39, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, 148, 0, 0

FiveIsland_ResortGorgeous_MapWarps:
	warp_def 64, 13, 3, 0, 524
	warp_def 39, 8, 0, 0, 9984

FiveIsland_ResortGorgeous_MapBGEvents:
	bg_event 10, 7, 3, 7, 0, 8, 174, 1
	bg_event 27, 11, 3, 7, 0, 108, 175, 1
	bg_event 40, 12, 3, 7, 0, 109, 176, 1
	bg_event 27, 5, 3, 7, 0, 108, 177, 1
	bg_event 42, 9, 0, 0, 0, FiveIsland_ResortGorgeous_EventScript_168844

gMapEvents_FiveIsland_ResortGorgeous::
	map_events FiveIsland_ResortGorgeous_EventObjects, FiveIsland_ResortGorgeous_MapWarps, 0x0, FiveIsland_ResortGorgeous_MapBGEvents

FiveIsland_WaterLabyrinth_EventObjects:
	object_event 1, 61, 0, 14, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_WaterLabyrinth_EventScript_16884E, 0, 0, 0
	object_event 2, 28, 0, 9, 0, 7, 0, 3, 2, 17, 0, 1, 0, 1, 0, FiveIsland_WaterLabyrinth_EventScript_1AC2D9, 0, 0, 0

gMapEvents_FiveIsland_WaterLabyrinth::
	map_events FiveIsland_WaterLabyrinth_EventObjects, 0x0, 0x0, 0x0

FiveIsland_Meadow_EventObjects:
	object_event 1, 50, 0, 18, 0, 18, 0, 3, 2, 17, 0, 1, 0, 1, 0, FiveIsland_Meadow_EventScript_1689BB, 136, 0, 0
	object_event 2, 49, 0, 17, 0, 5, 0, 3, 17, 17, 0, 1, 0, 5, 0, FiveIsland_Meadow_EventScript_16898D, 136, 0, 0
	object_event 3, 49, 0, 11, 0, 27, 0, 3, 10, 17, 0, 1, 0, 3, 0, FiveIsland_Meadow_EventScript_1689A4, 136, 0, 0
	object_event 4, 95, 0, 8, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, FiveIsland_Meadow_EventScript_1BDF13, 18, 0, 0
	object_event 5, 95, 0, 19, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, FiveIsland_Meadow_EventScript_1BDF13, 19, 0, 0
	object_event 6, 92, 0, 12, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_Meadow_EventScript_1BEC69, 478, 0, 0
	object_event 7, 92, 0, 3, 0, 22, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_Meadow_EventScript_1BEC76, 479, 0, 0

FiveIsland_Meadow_MapWarps:
	warp_def 12, 21, 0, 0, 370

FiveIsland_Meadow_MapBGEvents:
	bg_event 12, 21, 0, 0, 0, FiveIsland_Meadow_EventScript_168942

gMapEvents_FiveIsland_Meadow::
	map_events FiveIsland_Meadow_EventObjects, FiveIsland_Meadow_MapWarps, 0x0, FiveIsland_Meadow_MapBGEvents

FiveIsland_MemorialPillar_EventObjects:
	object_event 1, 25, 0, 8, 0, 44, 0, 4, 15, 17, 0, 0, 0, 0, 0, FiveIsland_MemorialPillar_EventScript_1689D3, 0, 0, 0
	object_event 2, 26, 0, 12, 0, 6, 0, 3, 21, 17, 0, 1, 0, 3, 0, FiveIsland_MemorialPillar_EventScript_1AC317, 0, 0, 0
	object_event 3, 26, 0, 14, 0, 17, 0, 3, 19, 17, 0, 1, 0, 2, 0, FiveIsland_MemorialPillar_EventScript_1AC355, 0, 0, 0
	object_event 4, 26, 0, 17, 0, 31, 0, 3, 2, 17, 0, 1, 0, 3, 0, FiveIsland_MemorialPillar_EventScript_1AC393, 0, 0, 0
	object_event 5, 92, 0, 4, 0, 47, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_MemorialPillar_EventScript_1BEC83, 480, 0, 0

FiveIsland_MemorialPillar_MapBGEvents:
	bg_event 9, 43, 0, 1, 0, FiveIsland_MemorialPillar_EventScript_168A48
	bg_event 8, 52, 3, 7, 0, 107, 170, 1
	bg_event 15, 7, 3, 7, 0, 148, 171, 1
	bg_event 17, 22, 3, 7, 0, 142, 172, 1
	bg_event 14, 25, 3, 7, 0, 149, 173, 1

gMapEvents_FiveIsland_MemorialPillar::
	map_events FiveIsland_MemorialPillar_EventObjects, 0x0, 0x0, FiveIsland_MemorialPillar_MapBGEvents

SixIsland_OutcastIsland_EventObjects:
	object_event 1, 49, 0, 9, 0, 24, 0, 3, 1, 17, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_168B16, 136, 0, 0
	object_event 2, 57, 0, 12, 0, 15, 0, 3, 7, 17, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_1AC3D1, 0, 0, 0
	object_event 3, 43, 0, 13, 0, 34, 0, 1, 1, 17, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_1AC40F, 0, 0, 0
	object_event 4, 44, 0, 14, 0, 61, 0, 1, 50, 66, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_1AC44D, 0, 0, 0
	object_event 5, 44, 0, 10, 0, 44, 0, 1, 7, 17, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_1AC48B, 0, 0, 0
	object_event 6, 36, 0, 11, 0, 44, 0, 1, 7, 17, 0, 1, 0, 1, 0, SixIsland_OutcastIsland_EventScript_1AC4D1, 0, 0, 0
	object_event 7, 92, 0, 11, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_OutcastIsland_EventScript_1BEC90, 481, 0, 0

SixIsland_OutcastIsland_MapWarps:
	warp_def 7, 21, 3, 0, 378

SixIsland_OutcastIsland_MapBGEvents:
	bg_event 16, 23, 3, 7, 0, 109, 178, 1
	bg_event 6, 24, 3, 7, 0, 6, 179, 1

gMapEvents_SixIsland_OutcastIsland::
	map_events SixIsland_OutcastIsland_EventObjects, SixIsland_OutcastIsland_MapWarps, 0x0, SixIsland_OutcastIsland_MapBGEvents

SixIsland_GreenPath_EventObjects:
	object_event 1, 23, 0, 11, 0, 8, 0, 3, 20, 17, 0, 1, 0, 2, 0, SixIsland_GreenPath_EventScript_1AC517, 0, 0, 0

SixIsland_GreenPath_MapWarps:
	warp_def 63, 10, 3, 1, 377
	warp_def 64, 10, 3, 1, 377
	warp_def 45, 10, 3, 4, 377
	warp_def 46, 10, 3, 4, 377

SixIsland_GreenPath_MapBGEvents:
	bg_event 40, 10, 0, 0, 0, SixIsland_GreenPath_EventScript_168B37
	bg_event 69, 10, 0, 0, 0, SixIsland_GreenPath_EventScript_168B2E
	bg_event 12, 9, 3, 7, 0, 2, 180, 1

gMapEvents_SixIsland_GreenPath::
	map_events SixIsland_GreenPath_EventObjects, SixIsland_GreenPath_MapWarps, 0x0, SixIsland_GreenPath_MapBGEvents

SixIsland_WaterPath_EventObjects:
	object_event 1, 28, 0, 12, 0, 13, 0, 3, 19, 17, 0, 1, 0, 3, 0, SixIsland_WaterPath_EventScript_1AC555, 0, 0, 0
	object_event 2, 26, 0, 11, 0, 52, 0, 3, 7, 17, 0, 1, 0, 3, 0, SixIsland_WaterPath_EventScript_1AC593, 0, 0, 0
	object_event 3, 43, 0, 13, 0, 35, 0, 1, 1, 17, 0, 1, 0, 4, 0, SixIsland_WaterPath_EventScript_1AC5D1, 0, 0, 0
	object_event 4, 44, 0, 15, 0, 45, 0, 1, 2, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC60F, 0, 0, 0
	object_event 5, 17, 0, 6, 0, 21, 0, 3, 8, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC64D, 0, 0, 0
	object_event 6, 17, 0, 7, 0, 21, 0, 3, 8, 17, 0, 1, 0, 1, 0, SixIsland_WaterPath_EventScript_1AC693, 0, 0, 0
	object_event 7, 56, 0, 11, 0, 76, 0, 3, 15, 17, 0, 1, 0, 4, 0, SixIsland_WaterPath_EventScript_1AC6D9, 0, 0, 0
	object_event 8, 92, 0, 17, 0, 19, 0, 0, 8, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_EventScript_1BEC9D, 482, 0, 0
	object_event 9, 92, 0, 17, 0, 87, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_EventScript_1BECAA, 483, 0, 0

SixIsland_WaterPath_MapWarps:
	warp_def 5, 13, 0, 0, 10496
	warp_def 11, 19, 0, 0, 10497

SixIsland_WaterPath_MapBGEvents:
	bg_event 8, 14, 0, 0, 0, SixIsland_WaterPath_EventScript_168B41
	bg_event 15, 76, 3, 7, 0, 137, 181, 1
	bg_event 3, 8, 3, 7, 0, 139, 182, 1
	bg_event 13, 63, 3, 7, 0, 152, 183, 1
	bg_event 12, 54, 0, 0, 0, SixIsland_WaterPath_EventScript_168B4A

gMapEvents_SixIsland_WaterPath::
	map_events SixIsland_WaterPath_EventObjects, SixIsland_WaterPath_MapWarps, 0x0, SixIsland_WaterPath_MapBGEvents

SixIsland_RuinValley_EventObjects:
	object_event 1, 55, 0, 24, 0, 25, 0, 3, 7, 17, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_168B6D, 142, 0, 0
	object_event 2, 56, 0, 32, 0, 11, 0, 5, 17, 17, 0, 1, 0, 4, 0, SixIsland_RuinValley_EventScript_1AC717, 0, 0, 0
	object_event 3, 56, 0, 33, 0, 16, 0, 5, 14, 17, 0, 1, 0, 2, 0, SixIsland_RuinValley_EventScript_1AC755, 0, 0, 0
	object_event 4, 56, 0, 31, 0, 24, 0, 5, 9, 17, 0, 1, 0, 1, 0, SixIsland_RuinValley_EventScript_1AC793, 0, 0, 0
	object_event 5, 56, 0, 14, 0, 10, 0, 5, 8, 17, 0, 1, 0, 2, 0, SixIsland_RuinValley_EventScript_1AC7D1, 0, 0, 0
	object_event 6, 52, 0, 21, 0, 29, 0, 5, 2, 50, 0, 1, 0, 1, 0, SixIsland_RuinValley_EventScript_1AC80F, 0, 0, 0
	object_event 7, 97, 0, 17, 0, 10, 0, 5, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 8, 97, 0, 17, 0, 12, 0, 5, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 9, 97, 0, 18, 0, 11, 0, 5, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 10, 97, 0, 6, 0, 33, 0, 3, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 11, 97, 0, 6, 0, 34, 0, 3, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 12, 97, 0, 41, 0, 32, 0, 3, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 13, 97, 0, 41, 0, 33, 0, 3, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 14, 97, 0, 42, 0, 33, 0, 3, 1, 0, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BE11D, 0, 0, 0
	object_event 15, 92, 0, 5, 0, 33, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BECC4, 485, 0, 0
	object_event 16, 92, 0, 19, 0, 11, 0, 5, 8, 17, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BECB7, 484, 0, 0
	object_event 17, 92, 0, 43, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_RuinValley_EventScript_1BECD1, 486, 0, 0

SixIsland_RuinValley_MapWarps:
	warp_def 24, 24, 3, 0, 371

SixIsland_RuinValley_MapBGEvents:
	bg_event 24, 24, 3, 0, 0, SixIsland_RuinValley_EventScript_168B94

gMapEvents_SixIsland_RuinValley::
	map_events SixIsland_RuinValley_EventObjects, SixIsland_RuinValley_MapWarps, 0x0, SixIsland_RuinValley_MapBGEvents

SevenIsland_TrainerTower_EventObjects:
	object_event 1, 19, 0, 56, 0, 26, 0, 3, 7, 17, 0, 1, 0, 1, 0, SevenIsland_TrainerTower_EventScript_1AC84D, 0, 0, 0
	object_event 2, 23, 0, 56, 0, 29, 0, 3, 8, 17, 0, 1, 0, 1, 0, SevenIsland_TrainerTower_EventScript_1AC88B, 0, 0, 0

SevenIsland_TrainerTower_MapWarps:
	warp_def 58, 7, 3, 1, 522

SevenIsland_TrainerTower_MapBGEvents:
	bg_event 49, 27, 3, 7, 0, 107, 185, 1
	bg_event 47, 30, 3, 7, 0, 106, 186, 1
	bg_event 59, 32, 3, 7, 0, 150, 187, 1
	bg_event 56, 8, 0, 0, 0, SevenIsland_TrainerTower_EventScript_168BE1
	bg_event 50, 30, 0, 0, 0, SevenIsland_TrainerTower_EventScript_168BEA

gMapEvents_SevenIsland_TrainerTower::
	map_events SevenIsland_TrainerTower_EventObjects, SevenIsland_TrainerTower_MapWarps, 0x0, SevenIsland_TrainerTower_MapBGEvents

SevenIsland_SevaultCanyon_Entrance_EventObjects:
	object_event 1, 28, 0, 12, 0, 6, 0, 3, 9, 17, 0, 1, 0, 5, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1AC8C9, 0, 0, 0
	object_event 2, 29, 0, 3, 0, 34, 0, 3, 10, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1AC907, 0, 0, 0
	object_event 3, 25, 0, 4, 0, 34, 0, 3, 9, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1AC94D, 0, 0, 0
	object_event 4, 39, 0, 11, 0, 26, 0, 3, 20, 17, 0, 1, 0, 2, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1AC9D1, 0, 0, 0
	object_event 5, 40, 0, 10, 0, 26, 0, 3, 19, 17, 0, 1, 0, 2, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1ACA0F, 0, 0, 0
	object_event 6, 26, 0, 11, 0, 17, 0, 5, 23, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_1AC993, 0, 0, 0
	object_event 7, 65321, 0, 7, 0, 254, 255, 1, 0, 0, 0, 17, 0, 3, 0, 0x0, 0, 0, 0

SevenIsland_SevaultCanyon_Entrance_MapBGEvents:
	bg_event 8, 29, 5, 7, 0, 136, 188, 1
	bg_event 14, 26, 0, 0, 0, SevenIsland_SevaultCanyon_Entrance_EventScript_168BF4

gMapEvents_SevenIsland_SevaultCanyon_Entrance::
	map_events SevenIsland_SevaultCanyon_Entrance_EventObjects, 0x0, 0x0, SevenIsland_SevaultCanyon_Entrance_MapBGEvents

SevenIsland_SevaultCanyon_EventObjects:
	object_event 1, 24, 0, 13, 0, 43, 0, 3, 7, 17, 0, 1, 0, 2, 0, SevenIsland_SevaultCanyon_EventScript_1ACA4D, 0, 0, 0
	object_event 2, 25, 0, 13, 0, 36, 0, 3, 18, 17, 0, 1, 0, 2, 0, SevenIsland_SevaultCanyon_EventScript_1ACA8B, 0, 0, 0
	object_event 3, 39, 0, 3, 0, 35, 0, 3, 21, 17, 0, 1, 0, 3, 0, SevenIsland_SevaultCanyon_EventScript_1ACAC9, 0, 0, 0
	object_event 4, 40, 0, 3, 0, 36, 0, 3, 22, 17, 0, 1, 0, 3, 0, SevenIsland_SevaultCanyon_EventScript_1ACB07, 0, 0, 0
	object_event 5, 41, 0, 7, 0, 56, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_EventScript_1ACB45, 0, 0, 0
	object_event 6, 42, 0, 11, 0, 63, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_EventScript_1ACB83, 0, 0, 0
	object_event 7, 41, 0, 14, 0, 13, 0, 3, 10, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_EventScript_1ACBC1, 0, 0, 0
	object_event 8, 42, 0, 14, 0, 14, 0, 3, 10, 17, 0, 1, 0, 1, 0, SevenIsland_SevaultCanyon_EventScript_1ACC07, 0, 0, 0
	object_event 9, 96, 0, 3, 0, 41, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 18, 0, 0
	object_event 10, 97, 0, 13, 0, 47, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE11D, 0, 0, 0
	object_event 11, 96, 0, 7, 0, 44, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 19, 0, 0
	object_event 12, 96, 0, 12, 0, 47, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 21, 0, 0
	object_event 13, 96, 0, 15, 0, 46, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 22, 0, 0
	object_event 14, 96, 0, 16, 0, 47, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 23, 0, 0
	object_event 15, 97, 0, 17, 0, 47, 0, 3, 1, 0, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE11D, 0, 0, 0
	object_event 16, 96, 0, 11, 0, 31, 0, 3, 1, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BE00C, 27, 0, 0
	object_event 17, 92, 0, 18, 0, 45, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BECDE, 487, 0, 0
	object_event 18, 92, 0, 7, 0, 38, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BECEB, 488, 0, 0
	object_event 19, 92, 0, 17, 0, 23, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1BECF8, 489, 0, 0
	object_event 20, 54, 0, 8, 0, 26, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_1ACF95, 0, 0, 0

SevenIsland_SevaultCanyon_MapWarps:
	warp_def 7, 17, 5, 0, 547
	warp_def 14, 61, 0, 0, 10752

SevenIsland_SevaultCanyon_MapBGEvents:
	bg_event 15, 66, 3, 7, 0, 133, 63, 1
	bg_event 16, 71, 0, 0, 0, SevenIsland_SevaultCanyon_EventScript_168BFE

gMapEvents_SevenIsland_SevaultCanyon::
	map_events SevenIsland_SevaultCanyon_EventObjects, SevenIsland_SevaultCanyon_MapWarps, 0x0, SevenIsland_SevaultCanyon_MapBGEvents

SevenIsland_TanobyRuins_EventObjects:
	object_event 1, 56, 0, 35, 0, 7, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACC4D, 0, 0, 0
	object_event 2, 56, 0, 121, 0, 11, 0, 3, 1, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACC8B, 0, 0, 0
	object_event 3, 22, 0, 85, 0, 8, 0, 3, 10, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACCC9, 0, 0, 0
	object_event 4, 61, 0, 85, 0, 5, 0, 3, 2, 17, 0, 1, 0, 1, 0, SevenIsland_TanobyRuins_EventScript_1ACD07, 0, 0, 0

SevenIsland_TanobyRuins_MapWarps:
	warp_def 120, 10, 3, 0, 539
	warp_def 103, 10, 3, 0, 540
	warp_def 88, 8, 3, 0, 541
	warp_def 44, 11, 3, 0, 542
	warp_def 32, 9, 3, 0, 543
	warp_def 12, 15, 3, 0, 544
	warp_def 11, 6, 3, 0, 545

SevenIsland_TanobyRuins_MapBGEvents:
	bg_event 33, 10, 3, 7, 0, 111, 65, 1
	bg_event 86, 9, 3, 7, 0, 111, 66, 1
	bg_event 125, 5, 3, 7, 0, 111, 67, 1
	bg_event 8, 2, 3, 7, 0, 111, 64, 1

gMapEvents_SevenIsland_TanobyRuins::
	map_events SevenIsland_TanobyRuins_EventObjects, SevenIsland_TanobyRuins_MapWarps, 0x0, SevenIsland_TanobyRuins_MapBGEvents

PalletTown_PlayersHouse_1F_EventObjects:
	object_event 1, 88, 0, 8, 0, 4, 0, 3, 9, 0, 0, 0, 0, 0, 0, PalletTown_PlayersHouse_1F_EventScript_168C09, 0, 0, 0

PalletTown_PlayersHouse_1F_MapWarps:
	warp_def 5, 8, 3, 0, 768
	warp_def 4, 8, 3, 0, 768
	warp_def 10, 2, 3, 0, 1025
	warp_def 3, 9, 0, 0, 768

PalletTown_PlayersHouse_1F_MapBGEvents:
	bg_event 6, 1, 0, 0, 0, PalletTown_PlayersHouse_1F_EventScript_168C62

gMapEvents_PalletTown_PlayersHouse_1F::
	map_events PalletTown_PlayersHouse_1F_EventObjects, PalletTown_PlayersHouse_1F_MapWarps, 0x0, PalletTown_PlayersHouse_1F_MapBGEvents


PalletTown_PlayersHouse_2F_MapWarps:
	warp_def 10, 2, 3, 2, 1024

PalletTown_PlayersHouse_2F_MapBGEvents:
	bg_event 6, 5, 3, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CD2
	bg_event 1, 1, 0, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CE4
	bg_event 11, 1, 0, 0, 0, PalletTown_PlayersHouse_2F_EventScript_168CDB

gMapEvents_PalletTown_PlayersHouse_2F::
	map_events 0x0, PalletTown_PlayersHouse_2F_MapWarps, 0x0, PalletTown_PlayersHouse_2F_MapBGEvents

PalletTown_GarysHouse_EventObjects:
	object_event 1, 76, 0, 10, 0, 6, 0, 3, 2, 49, 0, 0, 0, 0, 0, PalletTown_GarysHouse_EventScript_168D56, 0, 0, 0
	object_event 2, 93, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F63, 57, 0, 0

PalletTown_GarysHouse_MapWarps:
	warp_def 4, 8, 3, 1, 768
	warp_def 5, 8, 3, 1, 768
	warp_def 3, 8, 3, 1, 768

PalletTown_GarysHouse_MapBGEvents:
	bg_event 12, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F6C
	bg_event 11, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F6C
	bg_event 9, 1, 0, 0, 0, PalletTown_GarysHouse_EventScript_168F75

gMapEvents_PalletTown_GarysHouse::
	map_events PalletTown_GarysHouse_EventObjects, PalletTown_GarysHouse_MapWarps, 0x0, PalletTown_GarysHouse_MapBGEvents

PalletTown_ProfessorOaksLab_EventObjects:
	object_event 1, 55, 0, 3, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169DEE, 0, 0, 0
	object_event 2, 48, 0, 2, 0, 10, 0, 3, 3, 64, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E46, 0, 0, 0
	object_event 3, 55, 0, 11, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E1A, 0, 0, 0
	object_event 4, 71, 0, 6, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169595, 43, 0, 0
	object_event 5, 92, 0, 8, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169BAB, 40, 0, 0
	object_event 6, 92, 0, 9, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169D78, 41, 0, 0
	object_event 7, 92, 0, 10, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169DAE, 42, 0, 0
	object_event 8, 72, 0, 5, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_16955F, 45, 0, 0
	object_event 9, 94, 0, 4, 0, 1, 0, 0, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E5F, 58, 0, 0
	object_event 10, 94, 0, 5, 0, 1, 0, 0, 8, 17, 0, 0, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E5F, 58, 0, 0

PalletTown_ProfessorOaksLab_MapWarps:
	warp_def 6, 12, 3, 2, 768
	warp_def 7, 12, 3, 2, 768
	warp_def 5, 12, 3, 2, 768

PalletTown_ProfessorOaksLab_MapCoordEvents:
	coord_event 5, 8, 3, 0, 16469, 2, 0, PalletTown_ProfessorOaksLab_EventScript_1692C3
	coord_event 6, 8, 3, 0, 16469, 2, 0, PalletTown_ProfessorOaksLab_EventScript_1692C3
	coord_event 7, 8, 3, 0, 16469, 2, 0, PalletTown_ProfessorOaksLab_EventScript_1692C3
	coord_event 5, 8, 3, 0, 16469, 3, 0, PalletTown_ProfessorOaksLab_EventScript_1692E7
	coord_event 6, 8, 3, 0, 16469, 3, 0, PalletTown_ProfessorOaksLab_EventScript_1692F3
	coord_event 7, 8, 3, 0, 16469, 3, 0, PalletTown_ProfessorOaksLab_EventScript_1692FF

PalletTown_ProfessorOaksLab_MapBGEvents:
	bg_event 2, 1, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E68
	bg_event 3, 1, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E68
	bg_event 6, 1, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E71
	bg_event 7, 1, 0, 0, 0, PalletTown_ProfessorOaksLab_EventScript_169E7A

gMapEvents_PalletTown_ProfessorOaksLab::
	map_events PalletTown_ProfessorOaksLab_EventObjects, PalletTown_ProfessorOaksLab_MapWarps, PalletTown_ProfessorOaksLab_MapCoordEvents, PalletTown_ProfessorOaksLab_MapBGEvents

ViridianCity_House1_EventObjects:
	object_event 1, 30, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169E9B, 0, 0, 0
	object_event 2, 17, 0, 2, 0, 5, 0, 3, 3, 33, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169EA4, 0, 0, 0
	object_event 3, 110, 0, 6, 0, 6, 0, 3, 5, 20, 0, 0, 0, 0, 0, ViridianCity_House1_EventScript_169EAD, 0, 0, 0

ViridianCity_House1_MapWarps:
	warp_def 3, 7, 0, 1, 769
	warp_def 4, 7, 0, 1, 769
	warp_def 5, 7, 3, 1, 769

ViridianCity_House1_MapBGEvents:
	bg_event 7, 1, 0, 0, 0, ViridianCity_House1_EventScript_169EC0

gMapEvents_ViridianCity_House1::
	map_events ViridianCity_House1_EventObjects, ViridianCity_House1_MapWarps, 0x0, ViridianCity_House1_MapBGEvents

ViridianCity_Gym_EventObjects:
	object_event 1, 54, 0, 10, 0, 2, 0, 3, 8, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_169FD6, 0, 0, 0
	object_event 2, 41, 0, 12, 0, 10, 0, 3, 8, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_16A004, 0, 0, 0
	object_event 3, 54, 0, 11, 0, 14, 0, 3, 7, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_169FA8, 0, 0, 0
	object_event 4, 25, 0, 10, 0, 10, 0, 3, 8, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_169F7A, 0, 0, 0
	object_event 5, 25, 0, 2, 0, 21, 0, 3, 10, 17, 0, 1, 0, 2, 0, ViridianCity_Gym_EventScript_169F91, 0, 0, 0
	object_event 6, 54, 0, 3, 0, 11, 0, 3, 9, 17, 0, 1, 0, 2, 0, ViridianCity_Gym_EventScript_169FBF, 0, 0, 0
	object_event 7, 41, 0, 6, 0, 8, 0, 3, 8, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_169FED, 0, 0, 0
	object_event 8, 87, 0, 2, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_Gym_EventScript_169ECA, 85, 0, 0
	object_event 9, 41, 0, 13, 0, 7, 0, 3, 10, 17, 0, 1, 0, 3, 0, ViridianCity_Gym_EventScript_16A01B, 0, 0, 0
	object_event 10, 91, 0, 16, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_Gym_EventScript_16A032, 0, 0, 0

ViridianCity_Gym_MapWarps:
	warp_def 16, 22, 3, 2, 769
	warp_def 17, 22, 3, 2, 769
	warp_def 18, 22, 3, 2, 769

ViridianCity_Gym_MapBGEvents:
	bg_event 15, 20, 0, 0, 0, ViridianCity_Gym_EventScript_16A05E
	bg_event 19, 20, 0, 0, 0, ViridianCity_Gym_EventScript_16A05E
	bg_event 2, 2, 3, 7, 0, 181, 189, 129

gMapEvents_ViridianCity_Gym::
	map_events ViridianCity_Gym_EventObjects, ViridianCity_Gym_MapWarps, 0x0, ViridianCity_Gym_MapBGEvents

ViridianCity_House2_EventObjects:
	object_event 1, 28, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_House2_EventScript_16A094, 0, 0, 0
	object_event 2, 22, 0, 4, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, ViridianCity_House2_EventScript_16A07D, 0, 0, 0

ViridianCity_House2_MapWarps:
	warp_def 3, 7, 0, 3, 769
	warp_def 4, 7, 0, 3, 769
	warp_def 5, 7, 3, 3, 769

ViridianCity_House2_MapBGEvents:
	bg_event 4, 4, 0, 0, 0, ViridianCity_House2_EventScript_16A0AB
	bg_event 5, 1, 0, 0, 0, ViridianCity_House2_EventScript_16A11D
	bg_event 4, 1, 0, 0, 0, ViridianCity_House2_EventScript_16A11D
	bg_event 9, 2, 0, 1, 0, ViridianCity_House2_EventScript_1ACD65
	bg_event 8, 2, 0, 1, 0, ViridianCity_House2_EventScript_1ACD65

gMapEvents_ViridianCity_House2::
	map_events ViridianCity_House2_EventObjects, ViridianCity_House2_MapWarps, 0x0, ViridianCity_House2_MapBGEvents

ViridianCity_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, ViridianCity_Mart_EventScript_16A268, 0, 0, 0
	object_event 2, 18, 0, 6, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, ViridianCity_Mart_EventScript_16A2B7, 0, 0, 0
	object_event 3, 23, 0, 9, 0, 5, 0, 3, 3, 17, 0, 0, 0, 0, 0, ViridianCity_Mart_EventScript_16A2AE, 0, 0, 0

ViridianCity_Mart_MapWarps:
	warp_def 3, 7, 3, 4, 769
	warp_def 4, 7, 3, 4, 769
	warp_def 5, 7, 3, 4, 769

gMapEvents_ViridianCity_Mart::
	map_events ViridianCity_Mart_EventObjects, ViridianCity_Mart_MapWarps, 0x0, 0x0

ViridianCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_1F_EventScript_16A2CF, 0, 0, 0
	object_event 2, 61, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_1F_EventScript_16A2E1, 0, 0, 0
	object_event 3, 19, 0, 4, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_1F_EventScript_16A2D8, 0, 0, 0
	object_event 4, 18, 0, 2, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_1F_EventScript_16A2EA, 0, 0, 0

ViridianCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 0, 769
	warp_def 7, 8, 3, 0, 769
	warp_def 8, 8, 3, 0, 769
	warp_def 1, 6, 4, 0, 1285

gMapEvents_ViridianCity_PokemonCenter_1F::
	map_events ViridianCity_PokemonCenter_1F_EventObjects, ViridianCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

ViridianCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ViridianCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

ViridianCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 1284
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_ViridianCity_PokemonCenter_2F::
	map_events ViridianCity_PokemonCenter_2F_EventObjects, ViridianCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

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

gMapEvents_PewterCity_Museum_1F::
	map_events PewterCity_Museum_1F_EventObjects, PewterCity_Museum_1F_MapWarps, PewterCity_Museum_1F_MapCoordEvents, PewterCity_Museum_1F_MapBGEvents

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

gMapEvents_PewterCity_Museum_2F::
	map_events PewterCity_Museum_2F_EventObjects, PewterCity_Museum_2F_MapWarps, 0x0, PewterCity_Museum_2F_MapBGEvents

PewterCity_Gym_EventObjects:
	object_event 1, 80, 0, 6, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Gym_EventScript_16A593, 0, 0, 0
	object_event 2, 39, 0, 3, 0, 8, 0, 3, 10, 17, 0, 1, 0, 4, 0, PewterCity_Gym_EventScript_16A63E, 0, 0, 0
	object_event 3, 91, 0, 7, 0, 12, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_Gym_EventScript_16A655, 0, 0, 0

PewterCity_Gym_MapWarps:
	warp_def 5, 14, 3, 2, 770
	warp_def 6, 14, 3, 2, 770
	warp_def 7, 14, 3, 2, 770

PewterCity_Gym_MapBGEvents:
	bg_event 4, 12, 0, 0, 0, PewterCity_Gym_EventScript_16A6AF
	bg_event 8, 12, 0, 0, 0, PewterCity_Gym_EventScript_16A6AF

gMapEvents_PewterCity_Gym::
	map_events PewterCity_Gym_EventObjects, PewterCity_Gym_MapWarps, 0x0, PewterCity_Gym_MapBGEvents

PewterCity_Mart_EventObjects:
	object_event 1, 18, 0, 8, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_Mart_EventScript_16A6CE, 0, 0, 0
	object_event 2, 19, 0, 6, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, PewterCity_Mart_EventScript_16A6D7, 0, 0, 0
	object_event 3, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, PewterCity_Mart_EventScript_16A6E0, 0, 0, 0

PewterCity_Mart_MapWarps:
	warp_def 3, 7, 3, 3, 770
	warp_def 4, 7, 3, 3, 770
	warp_def 5, 7, 3, 3, 770

gMapEvents_PewterCity_Mart::
	map_events PewterCity_Mart_EventObjects, PewterCity_Mart_MapWarps, 0x0, 0x0

PewterCity_House1_EventObjects:
	object_event 1, 30, 0, 1, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, PewterCity_House1_EventScript_16A71D, 0, 0, 0
	object_event 2, 16, 0, 5, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_House1_EventScript_16A726, 0, 0, 0
	object_event 3, 123, 0, 6, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, PewterCity_House1_EventScript_16A736, 0, 0, 0

PewterCity_House1_MapWarps:
	warp_def 3, 7, 0, 4, 770
	warp_def 4, 7, 0, 4, 770
	warp_def 5, 7, 0, 4, 770

gMapEvents_PewterCity_House1::
	map_events PewterCity_House1_EventObjects, PewterCity_House1_MapWarps, 0x0, 0x0

PewterCity_PokemonCenter_1F_EventObjects:
	object_event 1, 115, 0, 2, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A781, 0, 0, 0
	object_event 2, 61, 0, 4, 0, 8, 0, 3, 14, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A778, 0, 0, 0
	object_event 3, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A76F, 0, 0, 0
	object_event 4, 18, 0, 1, 0, 2, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A798, 0, 0, 0
	object_event 5, 23, 0, 13, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_1BEE16, 0, 0, 0
	object_event 6, 51, 0, 10, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A7A1, 0, 0, 0
	object_event 7, 51, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_1F_EventScript_16A7AC, 0, 0, 0

PewterCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 0, 5, 770
	warp_def 7, 8, 3, 5, 770
	warp_def 8, 8, 0, 5, 770
	warp_def 1, 6, 4, 0, 1542

gMapEvents_PewterCity_PokemonCenter_1F::
	map_events PewterCity_PokemonCenter_1F_EventObjects, PewterCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

PewterCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, PewterCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

PewterCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 1541
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_PewterCity_PokemonCenter_2F::
	map_events PewterCity_PokemonCenter_2F_EventObjects, PewterCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

PewterCity_House2_EventObjects:
	object_event 1, 32, 0, 3, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, PewterCity_House2_EventScript_16A7DD, 0, 0, 0
	object_event 2, 16, 0, 5, 0, 3, 0, 3, 13, 17, 0, 0, 0, 0, 0, PewterCity_House2_EventScript_16A7E6, 0, 0, 0

PewterCity_House2_MapWarps:
	warp_def 3, 7, 0, 6, 770
	warp_def 4, 7, 0, 6, 770
	warp_def 5, 7, 0, 6, 770

gMapEvents_PewterCity_House2::
	map_events PewterCity_House2_EventObjects, PewterCity_House2_MapWarps, 0x0, 0x0

CeruleanCity_House1_EventObjects:
	object_event 1, 61, 0, 6, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeruleanCity_House1_EventScript_16A7F0, 0, 0, 0

CeruleanCity_House1_MapWarps:
	warp_def 2, 9, 0, 0, 771
	warp_def 3, 8, 3, 0, 771
	warp_def 4, 9, 0, 0, 771
	warp_def 3, 1, 3, 8, 771

gMapEvents_CeruleanCity_House1::
	map_events CeruleanCity_House1_EventObjects, CeruleanCity_House1_MapWarps, 0x0, 0x0

CeruleanCity_House2_EventObjects:
	object_event 1, 56, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_House2_EventScript_16A976, 0, 0, 0
	object_event 2, 22, 0, 7, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeruleanCity_House2_EventScript_16A995, 0, 0, 0

CeruleanCity_House2_MapWarps:
	warp_def 2, 7, 0, 1, 771
	warp_def 3, 7, 0, 1, 771
	warp_def 4, 7, 1, 1, 771
	warp_def 4, 1, 0, 9, 771

CeruleanCity_House2_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeruleanCity_House2_EventScript_16A99E

gMapEvents_CeruleanCity_House2::
	map_events CeruleanCity_House2_EventObjects, CeruleanCity_House2_MapWarps, 0x0, CeruleanCity_House2_MapBGEvents

CeruleanCity_House3_EventObjects:
	object_event 1, 32, 0, 2, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeruleanCity_House3_EventScript_16A9B1, 0, 0, 0
	object_event 2, 35, 0, 7, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeruleanCity_House3_EventScript_16A9A8, 0, 0, 0

CeruleanCity_House3_MapWarps:
	warp_def 3, 7, 0, 2, 771
	warp_def 4, 7, 0, 2, 771
	warp_def 5, 7, 0, 2, 771

gMapEvents_CeruleanCity_House3::
	map_events CeruleanCity_House3_EventObjects, CeruleanCity_House3_MapWarps, 0x0, 0x0

CeruleanCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_16AA3C, 0, 0, 0
	object_event 2, 61, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_16AA45, 0, 0, 0
	object_event 3, 26, 0, 5, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_16AA4E, 0, 0, 0
	object_event 4, 18, 0, 4, 0, 8, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_16AA57, 0, 0, 0
	object_event 5, 22, 0, 3, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_16AA70, 0, 0, 0
	object_event 6, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_1ACE68, 157, 0, 0
	object_event 7, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_1F_EventScript_1ACE68, 157, 0, 0

CeruleanCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 0, 3, 771
	warp_def 7, 8, 0, 3, 771
	warp_def 8, 8, 0, 3, 771
	warp_def 1, 6, 4, 0, 1796

gMapEvents_CeruleanCity_PokemonCenter_1F::
	map_events CeruleanCity_PokemonCenter_1F_EventObjects, CeruleanCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

CeruleanCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

CeruleanCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 1795
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_CeruleanCity_PokemonCenter_2F::
	map_events CeruleanCity_PokemonCenter_2F_EventObjects, CeruleanCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

CeruleanCity_Gym_EventObjects:
	object_event 1, 43, 0, 10, 0, 12, 0, 0, 9, 17, 0, 1, 0, 1, 0, CeruleanCity_Gym_EventScript_16AB5B, 0, 0, 0
	object_event 2, 40, 0, 4, 0, 7, 0, 3, 10, 17, 0, 1, 0, 4, 0, CeruleanCity_Gym_EventScript_16AB44, 0, 0, 0
	object_event 3, 81, 0, 8, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_Gym_EventScript_16AAA1, 0, 0, 0
	object_event 4, 91, 0, 7, 0, 16, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB7F, 0, 0, 0

CeruleanCity_Gym_MapWarps:
	warp_def 7, 18, 3, 4, 771
	warp_def 8, 18, 3, 4, 771
	warp_def 9, 18, 3, 4, 771

CeruleanCity_Gym_MapBGEvents:
	bg_event 6, 17, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB9E
	bg_event 10, 17, 0, 0, 0, CeruleanCity_Gym_EventScript_16AB9E

gMapEvents_CeruleanCity_Gym::
	map_events CeruleanCity_Gym_EventObjects, CeruleanCity_Gym_MapWarps, 0x0, CeruleanCity_Gym_MapBGEvents

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

gMapEvents_CeruleanCity_BikeShop::
	map_events CeruleanCity_BikeShop_EventObjects, CeruleanCity_BikeShop_MapWarps, 0x0, CeruleanCity_BikeShop_MapBGEvents

CeruleanCity_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, CeruleanCity_Mart_EventScript_16ACB0, 0, 0, 0
	object_event 2, 23, 0, 9, 0, 2, 0, 3, 5, 20, 0, 0, 0, 0, 0, CeruleanCity_Mart_EventScript_16ACA7, 0, 0, 0
	object_event 3, 18, 0, 1, 0, 7, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeruleanCity_Mart_EventScript_16AC9E, 0, 0, 0

CeruleanCity_Mart_MapWarps:
	warp_def 3, 7, 3, 6, 771
	warp_def 4, 7, 3, 6, 771
	warp_def 5, 7, 3, 6, 771

gMapEvents_CeruleanCity_Mart::
	map_events CeruleanCity_Mart_EventObjects, CeruleanCity_Mart_MapWarps, 0x0, 0x0

CeruleanCity_House4_EventObjects:
	object_event 1, 32, 0, 5, 0, 3, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeruleanCity_House4_EventScript_16ACEF, 0, 0, 0

CeruleanCity_House4_MapWarps:
	warp_def 4, 7, 3, 12, 771

gMapEvents_CeruleanCity_House4::
	map_events CeruleanCity_House4_EventObjects, CeruleanCity_House4_MapWarps, 0x0, 0x0

CeruleanCity_House5_EventObjects:
	object_event 1, 33, 0, 7, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeruleanCity_House5_EventScript_16AE50, 0, 0, 0

CeruleanCity_House5_MapWarps:
	warp_def 4, 7, 3, 13, 771

CeruleanCity_House5_MapBGEvents:
	bg_event 3, 1, 0, 0, 0, CeruleanCity_House5_EventScript_16B0DA

gMapEvents_CeruleanCity_House5::
	map_events CeruleanCity_House5_EventObjects, CeruleanCity_House5_MapWarps, 0x0, CeruleanCity_House5_MapBGEvents

LavenderTown_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_1F_EventScript_16B0FE, 0, 0, 0
	object_event 2, 61, 0, 9, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_1F_EventScript_16B107, 0, 0, 0
	object_event 3, 22, 0, 5, 0, 6, 0, 3, 3, 33, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_1F_EventScript_16B110, 0, 0, 0
	object_event 4, 18, 0, 2, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_1F_EventScript_16B119, 0, 0, 0
	object_event 5, 30, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_1F_EventScript_1AD0A0, 157, 0, 0

LavenderTown_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 1, 772
	warp_def 7, 8, 3, 1, 772
	warp_def 8, 8, 3, 1, 772
	warp_def 1, 6, 4, 0, 2049

gMapEvents_LavenderTown_PokemonCenter_1F::
	map_events LavenderTown_PokemonCenter_1F_EventObjects, LavenderTown_PokemonCenter_1F_MapWarps, 0x0, 0x0

LavenderTown_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

LavenderTown_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 2048
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_LavenderTown_PokemonCenter_2F::
	map_events LavenderTown_PokemonCenter_2F_EventObjects, LavenderTown_PokemonCenter_2F_MapWarps, 0x0, 0x0

LavenderTown_VolunteerPokemonHouse_EventObjects:
	object_event 1, 78, 0, 3, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B14A, 53, 0, 0
	object_event 2, 124, 0, 1, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1EB, 0, 0, 0
	object_event 3, 121, 0, 9, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1FE, 0, 0, 0
	object_event 4, 16, 0, 9, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1C3, 0, 0, 0
	object_event 5, 18, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1CC, 0, 0, 0
	object_event 6, 17, 0, 7, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B1AA, 0, 0, 0

LavenderTown_VolunteerPokemonHouse_MapWarps:
	warp_def 3, 7, 3, 2, 772
	warp_def 4, 7, 3, 2, 772
	warp_def 5, 7, 3, 2, 772

LavenderTown_VolunteerPokemonHouse_MapBGEvents:
	bg_event 5, 4, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B211
	bg_event 3, 1, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B229
	bg_event 4, 1, 0, 0, 0, LavenderTown_VolunteerPokemonHouse_EventScript_16B229

gMapEvents_LavenderTown_VolunteerPokemonHouse::
	map_events LavenderTown_VolunteerPokemonHouse_EventObjects, LavenderTown_VolunteerPokemonHouse_MapWarps, 0x0, LavenderTown_VolunteerPokemonHouse_MapBGEvents

LavenderTown_House1_EventObjects:
	object_event 1, 42, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_House1_EventScript_16B233, 0, 0, 0
	object_event 2, 111, 0, 8, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_House1_EventScript_16B252, 0, 0, 0

LavenderTown_House1_MapWarps:
	warp_def 3, 7, 3, 3, 772
	warp_def 4, 7, 3, 3, 772
	warp_def 5, 7, 3, 3, 772

gMapEvents_LavenderTown_House1::
	map_events LavenderTown_House1_EventObjects, LavenderTown_House1_MapWarps, 0x0, 0x0

LavenderTown_House2_EventObjects:
	object_event 1, 61, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, LavenderTown_House2_EventScript_16B266, 0, 0, 0

LavenderTown_House2_MapWarps:
	warp_def 3, 7, 3, 4, 772
	warp_def 4, 7, 3, 4, 772
	warp_def 5, 7, 3, 4, 772

gMapEvents_LavenderTown_House2::
	map_events LavenderTown_House2_EventObjects, LavenderTown_House2_MapWarps, 0x0, 0x0

LavenderTown_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, LavenderTown_Mart_EventScript_16B36B, 0, 0, 0
	object_event 2, 30, 0, 6, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_Mart_EventScript_16B350, 0, 0, 0
	object_event 3, 26, 0, 9, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, LavenderTown_Mart_EventScript_16B359, 0, 0, 0
	object_event 4, 18, 0, 9, 0, 5, 0, 3, 14, 17, 0, 0, 0, 0, 0, LavenderTown_Mart_EventScript_16B362, 0, 0, 0

LavenderTown_Mart_MapWarps:
	warp_def 3, 7, 3, 5, 772
	warp_def 4, 7, 3, 5, 772
	warp_def 5, 7, 3, 5, 772

gMapEvents_LavenderTown_Mart::
	map_events LavenderTown_Mart_EventObjects, LavenderTown_Mart_MapWarps, 0x0, 0x0

VermilionCity_House1_EventObjects:
	object_event 1, 57, 0, 4, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_House1_EventScript_16B3A7, 0, 0, 0

VermilionCity_House1_MapWarps:
	warp_def 3, 7, 3, 3, 773
	warp_def 4, 7, 3, 3, 773
	warp_def 5, 7, 3, 3, 773

gMapEvents_VermilionCity_House1::
	map_events VermilionCity_House1_EventObjects, VermilionCity_House1_MapWarps, 0x0, 0x0

VermilionCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_16B433, 0, 0, 0
	object_event 2, 25, 0, 4, 0, 8, 0, 3, 5, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_16B43C, 0, 0, 0
	object_event 3, 56, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_16B445, 0, 0, 0
	object_event 4, 18, 0, 14, 0, 4, 0, 3, 3, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_16B44E, 0, 0, 0
	object_event 5, 42, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_1A8D08, 0, 0, 0
	object_event 6, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_1ACE83, 160, 0, 0
	object_event 7, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_1F_EventScript_1ACE83, 160, 0, 0

VermilionCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 4, 773
	warp_def 7, 8, 3, 4, 773
	warp_def 8, 8, 3, 4, 773
	warp_def 1, 6, 4, 0, 2306

gMapEvents_VermilionCity_PokemonCenter_1F::
	map_events VermilionCity_PokemonCenter_1F_EventObjects, VermilionCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

VermilionCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

VermilionCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 2305
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_VermilionCity_PokemonCenter_2F::
	map_events VermilionCity_PokemonCenter_2F_EventObjects, VermilionCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

VermilionCity_PokemonFanClub_EventObjects:
	object_event 1, 61, 0, 5, 0, 4, 0, 4, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B47F, 0, 0, 0
	object_event 2, 48, 0, 6, 0, 4, 0, 4, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B4FC, 0, 0, 0
	object_event 3, 120, 0, 7, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B59E, 0, 0, 0
	object_event 4, 126, 0, 4, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5B1, 0, 0, 0
	object_event 5, 23, 0, 4, 0, 5, 0, 0, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B528, 0, 0, 0
	object_event 6, 27, 0, 7, 0, 5, 0, 0, 8, 17, 0, 0, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B563, 0, 0, 0

VermilionCity_PokemonFanClub_MapWarps:
	warp_def 4, 10, 3, 5, 773
	warp_def 5, 10, 3, 5, 773
	warp_def 6, 10, 3, 5, 773

VermilionCity_PokemonFanClub_MapBGEvents:
	bg_event 2, 1, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5C4
	bg_event 9, 1, 0, 0, 0, VermilionCity_PokemonFanClub_EventScript_16B5CD

gMapEvents_VermilionCity_PokemonFanClub::
	map_events VermilionCity_PokemonFanClub_EventObjects, VermilionCity_PokemonFanClub_MapWarps, 0x0, VermilionCity_PokemonFanClub_MapBGEvents

VermilionCity_House2_EventObjects:
	object_event 1, 17, 0, 4, 0, 4, 0, 3, 7, 17, 0, 0, 0, 0, 0, VermilionCity_House2_EventScript_16B5D7, 0, 0, 0

VermilionCity_House2_MapWarps:
	warp_def 3, 7, 3, 6, 773
	warp_def 4, 7, 3, 6, 773
	warp_def 5, 7, 3, 6, 773

gMapEvents_VermilionCity_House2::
	map_events VermilionCity_House2_EventObjects, VermilionCity_House2_MapWarps, 0x0, 0x0

VermilionCity_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, VermilionCity_Mart_EventScript_16B666, 0, 0, 0
	object_event 2, 42, 0, 4, 0, 2, 0, 3, 9, 17, 0, 0, 0, 0, 0, VermilionCity_Mart_EventScript_16B654, 0, 0, 0
	object_event 3, 30, 0, 9, 0, 4, 0, 3, 2, 33, 0, 0, 0, 0, 0, VermilionCity_Mart_EventScript_16B65D, 0, 0, 0

VermilionCity_Mart_MapWarps:
	warp_def 3, 7, 3, 7, 773
	warp_def 4, 7, 3, 7, 773
	warp_def 5, 7, 3, 7, 773

gMapEvents_VermilionCity_Mart::
	map_events VermilionCity_Mart_EventObjects, VermilionCity_Mart_MapWarps, 0x0, 0x0

VermilionCity_Gym_EventObjects:
	object_event 1, 82, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_Gym_EventScript_16B94A, 0, 0, 0
	object_event 2, 30, 0, 2, 0, 11, 0, 3, 1, 17, 0, 1, 0, 3, 0, VermilionCity_Gym_EventScript_16BA1E, 0, 0, 0
	object_event 3, 62, 0, 8, 0, 13, 0, 3, 1, 17, 0, 1, 0, 3, 0, VermilionCity_Gym_EventScript_16B9FA, 0, 0, 0
	object_event 4, 91, 0, 4, 0, 17, 0, 3, 8, 17, 0, 0, 0, 0, 0, VermilionCity_Gym_EventScript_16BA6C, 0, 0, 0
	object_event 5, 61, 0, 7, 0, 8, 0, 3, 9, 17, 0, 1, 0, 3, 0, VermilionCity_Gym_EventScript_16BA35, 0, 0, 0

VermilionCity_Gym_MapWarps:
	warp_def 4, 19, 3, 9, 773
	warp_def 5, 19, 3, 9, 773
	warp_def 6, 19, 3, 9, 773

VermilionCity_Gym_MapBGEvents:
	bg_event 3, 17, 0, 0, 0, VermilionCity_Gym_EventScript_16BA8B
	bg_event 7, 17, 0, 0, 0, VermilionCity_Gym_EventScript_16BA8B
	bg_event 1, 10, 0, 0, 0, VermilionCity_Gym_EventScript_16B78F
	bg_event 3, 10, 0, 0, 0, VermilionCity_Gym_EventScript_16B79B
	bg_event 5, 10, 0, 0, 0, VermilionCity_Gym_EventScript_16B7A7
	bg_event 7, 10, 0, 0, 0, VermilionCity_Gym_EventScript_16B7B3
	bg_event 9, 10, 0, 0, 0, VermilionCity_Gym_EventScript_16B7BF
	bg_event 1, 12, 0, 0, 0, VermilionCity_Gym_EventScript_16B7CB
	bg_event 3, 12, 0, 0, 0, VermilionCity_Gym_EventScript_16B7D7
	bg_event 5, 12, 0, 0, 0, VermilionCity_Gym_EventScript_16B7E3
	bg_event 7, 12, 0, 0, 0, VermilionCity_Gym_EventScript_16B7EF
	bg_event 9, 12, 0, 0, 0, VermilionCity_Gym_EventScript_16B7FB
	bg_event 1, 14, 0, 0, 0, VermilionCity_Gym_EventScript_16B807
	bg_event 3, 14, 0, 0, 0, VermilionCity_Gym_EventScript_16B813
	bg_event 5, 14, 0, 0, 0, VermilionCity_Gym_EventScript_16B81F
	bg_event 7, 14, 0, 0, 0, VermilionCity_Gym_EventScript_16B82B
	bg_event 9, 14, 0, 0, 0, VermilionCity_Gym_EventScript_16B837

gMapEvents_VermilionCity_Gym::
	map_events VermilionCity_Gym_EventObjects, VermilionCity_Gym_MapWarps, 0x0, VermilionCity_Gym_MapBGEvents

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

gMapEvents_VermilionCity_House3::
	map_events VermilionCity_House3_EventObjects, VermilionCity_House3_MapWarps, 0x0, VermilionCity_House3_MapBGEvents

CeladonCity_DepartmentStore_1F_EventObjects:
	object_event 1, 48, 0, 6, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAD9, 0, 0, 0

CeladonCity_DepartmentStore_1F_MapWarps:
	warp_def 1, 15, 0, 1, 774
	warp_def 2, 14, 3, 1, 774
	warp_def 3, 15, 0, 1, 774
	warp_def 9, 15, 0, 2, 774
	warp_def 10, 14, 3, 2, 774
	warp_def 11, 15, 0, 2, 774
	warp_def 6, 1, 0, 0, 2566
	warp_def 4, 2, 3, 1, 2561

CeladonCity_DepartmentStore_1F_MapBGEvents:
	bg_event 9, 11, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAE2
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_1F_EventScript_16BAEB

gMapEvents_CeladonCity_DepartmentStore_1F::
	map_events CeladonCity_DepartmentStore_1F_EventObjects, CeladonCity_DepartmentStore_1F_MapWarps, 0x0, CeladonCity_DepartmentStore_1F_MapBGEvents

CeladonCity_DepartmentStore_2F_EventObjects:
	object_event 1, 22, 0, 5, 0, 10, 0, 3, 3, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BAFE, 0, 0, 0
	object_event 2, 68, 0, 1, 0, 8, 0, 0, 8, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB10, 0, 0, 0
	object_event 3, 68, 0, 1, 0, 6, 0, 3, 10, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB4E, 0, 0, 0
	object_event 4, 23, 0, 11, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_1AD053, 157, 0, 0

CeladonCity_DepartmentStore_2F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 3, 2, 3, 7, 2560
	warp_def 9, 2, 3, 1, 2562

CeladonCity_DepartmentStore_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_2F_EventScript_16BB07

gMapEvents_CeladonCity_DepartmentStore_2F::
	map_events CeladonCity_DepartmentStore_2F_EventObjects, CeladonCity_DepartmentStore_2F_MapWarps, 0x0, CeladonCity_DepartmentStore_2F_MapBGEvents

CeladonCity_DepartmentStore_3F_EventObjects:
	object_event 1, 68, 0, 10, 0, 9, 0, 3, 7, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB85, 0, 0, 0
	object_event 2, 51, 0, 11, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB8B, 0, 0, 0
	object_event 3, 51, 0, 4, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB9D, 0, 0, 0
	object_event 4, 51, 0, 1, 0, 9, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BB94, 0, 0, 0
	object_event 5, 17, 0, 9, 0, 14, 0, 3, 14, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBA6, 0, 0, 0

CeladonCity_DepartmentStore_3F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 9, 2, 0, 2, 2561
	warp_def 3, 2, 0, 1, 2563

CeladonCity_DepartmentStore_3F_MapBGEvents:
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBDC
	bg_event 2, 8, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBB8
	bg_event 5, 8, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBC1
	bg_event 2, 11, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBCA
	bg_event 5, 11, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBD3
	bg_event 1, 8, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 1, 11, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 4, 8, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 4, 11, 0, 0, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBAF
	bg_event 2, 4, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBE5
	bg_event 0, 4, 0, 1, 0, CeladonCity_DepartmentStore_3F_EventScript_16BBE5

gMapEvents_CeladonCity_DepartmentStore_3F::
	map_events CeladonCity_DepartmentStore_3F_EventObjects, CeladonCity_DepartmentStore_3F_MapWarps, 0x0, CeladonCity_DepartmentStore_3F_MapBGEvents

CeladonCity_DepartmentStore_4F_EventObjects:
	object_event 1, 25, 0, 6, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BBEF, 0, 0, 0
	object_event 2, 18, 0, 10, 0, 11, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BBF8, 0, 0, 0
	object_event 3, 68, 0, 3, 0, 13, 0, 0, 7, 19, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BC0A, 0, 0, 0

CeladonCity_DepartmentStore_4F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 3, 2, 0, 2, 2562
	warp_def 9, 2, 0, 1, 2564

CeladonCity_DepartmentStore_4F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_4F_EventScript_16BC01

gMapEvents_CeladonCity_DepartmentStore_4F::
	map_events CeladonCity_DepartmentStore_4F_EventObjects, CeladonCity_DepartmentStore_4F_MapWarps, 0x0, CeladonCity_DepartmentStore_4F_MapBGEvents

CeladonCity_DepartmentStore_5F_EventObjects:
	object_event 1, 61, 0, 11, 0, 6, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC41, 0, 0, 0
	object_event 2, 62, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC4A, 0, 0, 0
	object_event 3, 68, 0, 1, 0, 7, 0, 3, 8, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC5C, 0, 0, 0
	object_event 4, 68, 0, 1, 0, 6, 0, 3, 10, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC96, 0, 0, 0

CeladonCity_DepartmentStore_5F_MapWarps:
	warp_def 6, 1, 0, 0, 2566
	warp_def 9, 2, 3, 2, 2563
	warp_def 3, 2, 3, 0, 2565

CeladonCity_DepartmentStore_5F_MapBGEvents:
	bg_event 8, 1, 0, 0, 0, CeladonCity_DepartmentStore_5F_EventScript_16BC53

gMapEvents_CeladonCity_DepartmentStore_5F::
	map_events CeladonCity_DepartmentStore_5F_EventObjects, CeladonCity_DepartmentStore_5F_MapWarps, 0x0, CeladonCity_DepartmentStore_5F_MapBGEvents

CeladonCity_DepartmentStore_Roof_EventObjects:
	object_event 1, 41, 0, 9, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C022, 0, 0, 0
	object_event 2, 17, 0, 5, 0, 4, 0, 3, 2, 18, 0, 0, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16BCCD, 0, 0, 0

CeladonCity_DepartmentStore_Roof_MapWarps:
	warp_def 15, 6, 3, 2, 2564

CeladonCity_DepartmentStore_Roof_MapBGEvents:
	bg_event 14, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C02B
	bg_event 10, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034
	bg_event 11, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034
	bg_event 12, 3, 0, 0, 0, CeladonCity_DepartmentStore_Roof_EventScript_16C034

gMapEvents_CeladonCity_DepartmentStore_Roof::
	map_events CeladonCity_DepartmentStore_Roof_EventObjects, CeladonCity_DepartmentStore_Roof_MapWarps, 0x0, CeladonCity_DepartmentStore_Roof_MapBGEvents


CeladonCity_DepartmentStore_Elevator_MapWarps:
	warp_def 2, 5, 3, 127, 32639
	warp_def 2, 6, 0, 127, 32639

CeladonCity_DepartmentStore_Elevator_MapBGEvents:
	bg_event 0, 2, 0, 0, 0, CeladonCity_DepartmentStore_Elevator_EventScript_16C153
	bg_event 4, 1, 0, 0, 0, CeladonCity_DepartmentStore_Elevator_EventScript_16C153

gMapEvents_CeladonCity_DepartmentStore_Elevator::
	map_events 0x0, CeladonCity_DepartmentStore_Elevator_MapWarps, 0x0, CeladonCity_DepartmentStore_Elevator_MapBGEvents

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

gMapEvents_CeladonCity_Condominiums_1F::
	map_events CeladonCity_Condominiums_1F_EventObjects, CeladonCity_Condominiums_1F_MapWarps, 0x0, CeladonCity_Condominiums_1F_MapBGEvents

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

gMapEvents_CeladonCity_Condominiums_2F::
	map_events CeladonCity_Condominiums_2F_EventObjects, CeladonCity_Condominiums_2F_MapWarps, 0x0, CeladonCity_Condominiums_2F_MapBGEvents

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

gMapEvents_CeladonCity_Condominiums_3F::
	map_events CeladonCity_Condominiums_3F_EventObjects, CeladonCity_Condominiums_3F_MapWarps, 0x0, CeladonCity_Condominiums_3F_MapBGEvents


CeladonCity_Condominiums_Roof_MapWarps:
	warp_def 4, 2, 3, 1, 2569
	warp_def 10, 2, 3, 2, 2569
	warp_def 2, 12, 3, 1, 2571

CeladonCity_Condominiums_Roof_MapBGEvents:
	bg_event 4, 12, 0, 0, 0, CeladonCity_Condominiums_Roof_EventScript_16C45A
	bg_event 3, 12, 0, 0, 0, CeladonCity_Condominiums_Roof_EventScript_16C45A

gMapEvents_CeladonCity_Condominiums_Roof::
	map_events 0x0, CeladonCity_Condominiums_Roof_MapWarps, 0x0, CeladonCity_Condominiums_Roof_MapBGEvents

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

gMapEvents_CeladonCity_Condominiums_RoofRoom::
	map_events CeladonCity_Condominiums_RoofRoom_EventObjects, CeladonCity_Condominiums_RoofRoom_MapWarps, 0x0, CeladonCity_Condominiums_RoofRoom_MapBGEvents

CeladonCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_1F_EventScript_16C5FB, 0, 0, 0
	object_event 2, 61, 0, 4, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_1F_EventScript_16C604, 0, 0, 0
	object_event 3, 42, 0, 10, 0, 6, 0, 3, 5, 18, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_1F_EventScript_16C60D, 0, 0, 0
	object_event 4, 18, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_1F_EventScript_16C616, 0, 0, 0

CeladonCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 4, 774
	warp_def 7, 8, 3, 4, 774
	warp_def 8, 8, 3, 4, 774
	warp_def 1, 6, 4, 0, 2573

gMapEvents_CeladonCity_PokemonCenter_1F::
	map_events CeladonCity_PokemonCenter_1F_EventObjects, CeladonCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

CeladonCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

CeladonCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 2572
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_CeladonCity_PokemonCenter_2F::
	map_events CeladonCity_PokemonCenter_2F_EventObjects, CeladonCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

CeladonCity_GameCorner_EventObjects:
	object_event 1, 48, 0, 4, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C684, 0, 0, 0
	object_event 2, 47, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C68D, 0, 0, 0
	object_event 3, 30, 0, 1, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C7BA, 0, 0, 0
	object_event 4, 28, 0, 1, 0, 8, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C7D7, 0, 0, 0
	object_event 5, 57, 0, 4, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C7E7, 0, 0, 0
	object_event 6, 91, 0, 7, 0, 10, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C857, 0, 0, 0
	object_event 7, 23, 0, 7, 0, 8, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C87E, 0, 0, 0
	object_event 8, 33, 0, 10, 0, 9, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C88E, 0, 0, 0
	object_event 9, 55, 0, 13, 0, 7, 0, 3, 9, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C89E, 0, 0, 0
	object_event 10, 61, 0, 16, 0, 10, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_EventScript_16C8FE, 0, 0, 0
	object_event 11, 49, 0, 11, 0, 2, 0, 3, 7, 17, 0, 1, 0, 0, 0, CeladonCity_GameCorner_EventScript_16CAF5, 91, 0, 0

CeladonCity_GameCorner_MapWarps:
	warp_def 9, 13, 0, 0, 774
	warp_def 10, 13, 0, 0, 774
	warp_def 11, 13, 0, 0, 774
	warp_def 15, 2, 3, 0, 298

CeladonCity_GameCorner_MapBGEvents:
	bg_event 2, 4, 3, 7, 0, 0, 51, 10
	bg_event 3, 8, 3, 7, 0, 0, 52, 10
	bg_event 2, 11, 3, 7, 0, 0, 53, 20
	bg_event 6, 12, 3, 7, 0, 0, 54, 10
	bg_event 9, 9, 3, 7, 0, 0, 55, 10
	bg_event 8, 5, 3, 7, 0, 0, 56, 20
	bg_event 10, 4, 3, 7, 0, 0, 57, 10
	bg_event 13, 3, 3, 7, 0, 0, 58, 10
	bg_event 15, 5, 3, 7, 0, 0, 59, 10
	bg_event 17, 5, 3, 7, 0, 0, 60, 40
	bg_event 15, 13, 3, 7, 0, 0, 61, 100
	bg_event 12, 12, 3, 7, 0, 0, 62, 10
	bg_event 0, 7, 0, 4, 0, CeladonCity_GameCorner_EventScript_16C95E
	bg_event 0, 9, 0, 4, 0, CeladonCity_GameCorner_EventScript_16C9A4
	bg_event 0, 10, 0, 4, 0, CeladonCity_GameCorner_EventScript_16C9B0
	bg_event 5, 6, 0, 3, 0, CeladonCity_GameCorner_EventScript_16C9BC
	bg_event 5, 8, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CB5A
	bg_event 5, 9, 0, 3, 0, CeladonCity_GameCorner_EventScript_16C9D4
	bg_event 5, 10, 0, 3, 0, CeladonCity_GameCorner_EventScript_16C9E0
	bg_event 6, 6, 0, 4, 0, CeladonCity_GameCorner_EventScript_16C9EC
	bg_event 6, 7, 0, 4, 0, CeladonCity_GameCorner_EventScript_16C9F8
	bg_event 6, 9, 0, 4, 0, CeladonCity_GameCorner_EventScript_16CA04
	bg_event 11, 6, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA10
	bg_event 11, 7, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA1C
	bg_event 11, 8, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA28
	bg_event 11, 10, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA34
	bg_event 12, 6, 0, 4, 0, CeladonCity_GameCorner_EventScript_16CA40
	bg_event 12, 8, 0, 4, 0, CeladonCity_GameCorner_EventScript_16CB63
	bg_event 12, 9, 0, 4, 0, CeladonCity_GameCorner_EventScript_16CA58
	bg_event 12, 10, 0, 4, 0, CeladonCity_GameCorner_EventScript_16CA64
	bg_event 17, 6, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CB6C
	bg_event 17, 7, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA7C
	bg_event 17, 8, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA88
	bg_event 17, 9, 0, 3, 0, CeladonCity_GameCorner_EventScript_16CA94
	bg_event 11, 1, 0, 0, 0, CeladonCity_GameCorner_EventScript_16CAAA
	bg_event 17, 13, 0, 3, 0, CeladonCity_GameCorner_EventScript_1B2867

gMapEvents_CeladonCity_GameCorner::
	map_events CeladonCity_GameCorner_EventObjects, CeladonCity_GameCorner_MapWarps, 0x0, CeladonCity_GameCorner_MapBGEvents

CeladonCity_GameCorner_PrizeRoom_EventObjects:
	object_event 1, 30, 0, 2, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_PrizeRoom_EventScript_16CB76, 0, 0, 0
	object_event 2, 33, 0, 6, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_PrizeRoom_EventScript_16CB7F, 0, 0, 0
	object_event 3, 47, 0, 4, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_PrizeRoom_EventScript_16CB88, 0, 0, 0
	object_event 4, 47, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_PrizeRoom_EventScript_16CE1D, 0, 0, 0
	object_event 5, 47, 0, 2, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_GameCorner_PrizeRoom_EventScript_16CF88, 0, 0, 0

CeladonCity_GameCorner_PrizeRoom_MapWarps:
	warp_def 3, 9, 0, 5, 774
	warp_def 4, 8, 3, 5, 774
	warp_def 5, 9, 0, 5, 774

gMapEvents_CeladonCity_GameCorner_PrizeRoom::
	map_events CeladonCity_GameCorner_PrizeRoom_EventObjects, CeladonCity_GameCorner_PrizeRoom_MapWarps, 0x0, 0x0

CeladonCity_Gym_EventObjects:
	object_event 1, 22, 0, 3, 0, 11, 0, 3, 10, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D111, 0, 0, 0
	object_event 2, 29, 0, 9, 0, 10, 0, 3, 9, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D163, 0, 0, 0
	object_event 3, 40, 0, 10, 0, 7, 0, 3, 8, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D14C, 0, 0, 0
	object_event 4, 29, 0, 2, 0, 6, 0, 3, 8, 17, 0, 1, 0, 4, 0, CeladonCity_Gym_EventScript_16D17A, 0, 0, 0
	object_event 5, 29, 0, 5, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, CeladonCity_Gym_EventScript_16D19E, 0, 0, 0
	object_event 6, 22, 0, 7, 0, 4, 0, 3, 8, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D128, 0, 0, 0
	object_event 7, 83, 0, 6, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_16D061, 0, 0, 0
	object_event 8, 42, 0, 8, 0, 7, 0, 3, 9, 17, 0, 1, 0, 2, 0, CeladonCity_Gym_EventScript_16D1B5, 0, 0, 0
	object_event 9, 95, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 18, 0, 0
	object_event 10, 95, 0, 3, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 19, 0, 0
	object_event 11, 95, 0, 9, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Gym_EventScript_1BDF13, 20, 0, 0

CeladonCity_Gym_MapWarps:
	warp_def 5, 18, 3, 6, 774
	warp_def 6, 18, 3, 6, 774
	warp_def 7, 18, 3, 6, 774

CeladonCity_Gym_MapBGEvents:
	bg_event 4, 16, 0, 0, 0, CeladonCity_Gym_EventScript_16D1CC
	bg_event 8, 16, 0, 0, 0, CeladonCity_Gym_EventScript_16D1CC

gMapEvents_CeladonCity_Gym::
	map_events CeladonCity_Gym_EventObjects, CeladonCity_Gym_MapWarps, 0x0, CeladonCity_Gym_MapBGEvents

CeladonCity_Restaurant_EventObjects:
	object_event 1, 59, 0, 12, 0, 7, 0, 3, 5, 18, 0, 0, 0, 0, 0, CeladonCity_Restaurant_EventScript_16D1EB, 0, 0, 0
	object_event 2, 28, 0, 11, 0, 4, 0, 3, 3, 33, 0, 0, 0, 0, 0, CeladonCity_Restaurant_EventScript_16D1F4, 0, 0, 0
	object_event 3, 27, 0, 9, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_Restaurant_EventScript_16D25E, 0, 0, 0
	object_event 4, 30, 0, 1, 0, 2, 0, 0, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Restaurant_EventScript_16D1FD, 0, 0, 0
	object_event 5, 47, 0, 3, 0, 7, 0, 0, 9, 17, 0, 0, 0, 0, 0, CeladonCity_Restaurant_EventScript_16D255, 0, 0, 0

CeladonCity_Restaurant_MapWarps:
	warp_def 5, 9, 0, 7, 774
	warp_def 6, 9, 0, 7, 774
	warp_def 7, 9, 0, 7, 774

gMapEvents_CeladonCity_Restaurant::
	map_events CeladonCity_Restaurant_EventObjects, CeladonCity_Restaurant_MapWarps, 0x0, 0x0

CeladonCity_House1_EventObjects:
	object_event 1, 33, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_House1_EventScript_16D268, 0, 0, 0
	object_event 2, 49, 0, 2, 0, 4, 0, 3, 3, 81, 0, 0, 0, 0, 0, CeladonCity_House1_EventScript_16D271, 0, 0, 0
	object_event 3, 49, 0, 8, 0, 4, 0, 3, 3, 81, 0, 0, 0, 0, 0, CeladonCity_House1_EventScript_16D27A, 0, 0, 0

CeladonCity_House1_MapWarps:
	warp_def 3, 7, 3, 8, 774
	warp_def 4, 7, 3, 8, 774
	warp_def 5, 7, 3, 8, 774

gMapEvents_CeladonCity_House1::
	map_events CeladonCity_House1_EventObjects, CeladonCity_House1_MapWarps, 0x0, 0x0

CeladonCity_Hotel_EventObjects:
	object_event 1, 35, 0, 5, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, CeladonCity_Hotel_EventScript_16D284, 0, 0, 0
	object_event 2, 29, 0, 3, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, CeladonCity_Hotel_EventScript_16D28D, 0, 0, 0
	object_event 3, 25, 0, 9, 0, 7, 0, 3, 5, 17, 0, 0, 0, 0, 0, CeladonCity_Hotel_EventScript_16D296, 0, 0, 0
	object_event 4, 16, 0, 2, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, CeladonCity_Hotel_EventScript_16D29F, 0, 0, 0

CeladonCity_Hotel_MapWarps:
	warp_def 3, 10, 0, 9, 774
	warp_def 4, 9, 0, 9, 774
	warp_def 5, 10, 0, 9, 774

gMapEvents_CeladonCity_Hotel::
	map_events CeladonCity_Hotel_EventObjects, CeladonCity_Hotel_MapWarps, 0x0, 0x0

FuchsiaCity_SafariZone_Entrance_EventObjects:
	object_event 1, 47, 0, 7, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 47, 0, 1, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D4B7, 0, 0, 0

FuchsiaCity_SafariZone_Entrance_MapWarps:
	warp_def 4, 1, 3, 1, 319
	warp_def 5, 7, 3, 0, 775
	warp_def 4, 7, 3, 0, 775
	warp_def 3, 7, 3, 0, 775

FuchsiaCity_SafariZone_Entrance_MapCoordEvents:
	coord_event 4, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D36D
	coord_event 5, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D379
	coord_event 3, 3, 3, 0, 16385, 0, 0, FuchsiaCity_SafariZone_Entrance_EventScript_16D385

gMapEvents_FuchsiaCity_SafariZone_Entrance::
	map_events FuchsiaCity_SafariZone_Entrance_EventObjects, FuchsiaCity_SafariZone_Entrance_MapWarps, FuchsiaCity_SafariZone_Entrance_MapCoordEvents, 0x0

FuchsiaCity_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_Mart_EventScript_16D4F3, 0, 0, 0
	object_event 2, 61, 0, 6, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, FuchsiaCity_Mart_EventScript_16D4EA, 0, 0, 0
	object_event 3, 42, 0, 9, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, FuchsiaCity_Mart_EventScript_16D4E1, 0, 0, 0

FuchsiaCity_Mart_MapWarps:
	warp_def 3, 7, 3, 2, 775
	warp_def 4, 7, 3, 2, 775
	warp_def 5, 7, 3, 2, 775

gMapEvents_FuchsiaCity_Mart::
	map_events FuchsiaCity_Mart_EventObjects, FuchsiaCity_Mart_MapWarps, 0x0, 0x0

FuchsiaCity_ZooBuilding_EventObjects:
	object_event 1, 47, 0, 2, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_ZooBuilding_EventScript_16D532, 0, 0, 0
	object_event 2, 47, 0, 12, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, FuchsiaCity_ZooBuilding_EventScript_16D53B, 0, 0, 0
	object_event 3, 47, 0, 6, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_ZooBuilding_EventScript_16D529, 0, 0, 0
	object_event 4, 47, 0, 10, 0, 8, 0, 3, 9, 18, 0, 0, 0, 0, 0, FuchsiaCity_ZooBuilding_EventScript_16D544, 0, 0, 0

FuchsiaCity_ZooBuilding_MapWarps:
	warp_def 5, 9, 0, 3, 775
	warp_def 6, 9, 0, 3, 775
	warp_def 7, 9, 3, 3, 775

gMapEvents_FuchsiaCity_ZooBuilding::
	map_events FuchsiaCity_ZooBuilding_EventObjects, FuchsiaCity_ZooBuilding_MapWarps, 0x0, 0x0

FuchsiaCity_Gym_EventObjects:
	object_event 1, 26, 0, 12, 0, 16, 0, 3, 18, 17, 0, 1, 0, 4, 0, FuchsiaCity_Gym_EventScript_16D65A, 0, 0, 0
	object_event 2, 26, 0, 2, 0, 9, 0, 3, 9, 17, 0, 1, 0, 1, 0, FuchsiaCity_Gym_EventScript_16D643, 0, 0, 0
	object_event 3, 26, 0, 11, 0, 11, 0, 3, 10, 17, 0, 1, 0, 3, 0, FuchsiaCity_Gym_EventScript_16D61F, 0, 0, 0
	object_event 4, 25, 0, 13, 0, 4, 0, 3, 1, 17, 0, 1, 0, 2, 0, FuchsiaCity_Gym_EventScript_16D608, 0, 0, 0
	object_event 5, 25, 0, 4, 0, 6, 0, 3, 1, 17, 0, 1, 0, 2, 0, FuchsiaCity_Gym_EventScript_16D5F1, 0, 0, 0
	object_event 6, 26, 0, 2, 0, 16, 0, 3, 8, 17, 0, 1, 0, 4, 0, FuchsiaCity_Gym_EventScript_16D671, 0, 0, 0
	object_event 7, 84, 0, 7, 0, 13, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_Gym_EventScript_16D54E, 0, 0, 0
	object_event 8, 91, 0, 11, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_Gym_EventScript_16D688, 0, 0, 0

FuchsiaCity_Gym_MapWarps:
	warp_def 6, 21, 3, 4, 775
	warp_def 7, 21, 3, 4, 775
	warp_def 8, 21, 3, 4, 775

FuchsiaCity_Gym_MapBGEvents:
	bg_event 4, 19, 0, 0, 0, FuchsiaCity_Gym_EventScript_16D6A7
	bg_event 10, 19, 0, 0, 0, FuchsiaCity_Gym_EventScript_16D6A7

gMapEvents_FuchsiaCity_Gym::
	map_events FuchsiaCity_Gym_EventObjects, FuchsiaCity_Gym_MapWarps, 0x0, FuchsiaCity_Gym_MapBGEvents

FuchsiaCity_House1_EventObjects:
	object_event 1, 32, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, FuchsiaCity_House1_EventScript_16D6CF, 0, 0, 0
	object_event 2, 28, 0, 1, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_House1_EventScript_16D6C6, 0, 0, 0
	object_event 3, 16, 0, 2, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, FuchsiaCity_House1_EventScript_16D6E8, 0, 0, 0

FuchsiaCity_House1_MapWarps:
	warp_def 3, 7, 3, 5, 775
	warp_def 4, 7, 3, 5, 775
	warp_def 5, 7, 3, 5, 775

gMapEvents_FuchsiaCity_House1::
	map_events FuchsiaCity_House1_EventObjects, FuchsiaCity_House1_MapWarps, 0x0, 0x0

FuchsiaCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_1F_EventScript_16D700, 0, 0, 0
	object_event 2, 25, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_1F_EventScript_16D709, 0, 0, 0
	object_event 3, 42, 0, 13, 0, 3, 0, 3, 7, 17, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_1F_EventScript_16D712, 0, 0, 0
	object_event 4, 18, 0, 4, 0, 8, 0, 3, 5, 17, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_1F_EventScript_16D71B, 0, 0, 0

FuchsiaCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 6, 775
	warp_def 7, 8, 3, 6, 775
	warp_def 8, 8, 3, 6, 775
	warp_def 1, 6, 4, 0, 2822

gMapEvents_FuchsiaCity_PokemonCenter_1F::
	map_events FuchsiaCity_PokemonCenter_1F_EventObjects, FuchsiaCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

FuchsiaCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

FuchsiaCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 2821
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_FuchsiaCity_PokemonCenter_2F::
	map_events FuchsiaCity_PokemonCenter_2F_EventObjects, FuchsiaCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

FuchsiaCity_Building1_EventObjects:
	object_event 1, 33, 0, 3, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D74C, 0, 0, 0
	object_event 2, 97, 0, 11, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1BE11D, 0, 0, 0
	object_event 3, 92, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1BEAA2, 441, 0, 0
	object_event 4, 0, 0, 4, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, FuchsiaCity_Building1_EventScript_1ACEB8, 159, 0, 0

FuchsiaCity_Building1_MapWarps:
	warp_def 5, 10, 0, 1, 775
	warp_def 6, 9, 3, 1, 775
	warp_def 7, 10, 0, 1, 775

FuchsiaCity_Building1_MapBGEvents:
	bg_event 7, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D80D
	bg_event 4, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D804
	bg_event 5, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D804
	bg_event 6, 4, 0, 0, 0, FuchsiaCity_Building1_EventScript_16D80D

gMapEvents_FuchsiaCity_Building1::
	map_events FuchsiaCity_Building1_EventObjects, FuchsiaCity_Building1_MapWarps, 0x0, FuchsiaCity_Building1_MapBGEvents

FuchsiaCity_House2_EventObjects:
	object_event 1, 57, 0, 6, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_House2_EventScript_16D817, 0, 0, 0

FuchsiaCity_House2_MapWarps:
	warp_def 2, 9, 0, 7, 775
	warp_def 3, 8, 3, 7, 775
	warp_def 4, 9, 0, 7, 775
	warp_def 3, 1, 3, 8, 775

gMapEvents_FuchsiaCity_House2::
	map_events FuchsiaCity_House2_EventObjects, FuchsiaCity_House2_MapWarps, 0x0, 0x0

FuchsiaCity_House3_EventObjects:
	object_event 1, 30, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, FuchsiaCity_House3_EventScript_16D895, 0, 0, 0

FuchsiaCity_House3_MapWarps:
	warp_def 4, 7, 3, 10, 775

gMapEvents_FuchsiaCity_House3::
	map_events FuchsiaCity_House3_EventObjects, FuchsiaCity_House3_MapWarps, 0x0, 0x0

CinnabarIsland_Gym_EventObjects:
	object_event 1, 52, 0, 25, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB27, 0, 0, 0
	object_event 2, 55, 0, 25, 0, 4, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DA7F, 0, 0, 0
	object_event 3, 55, 0, 17, 0, 5, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DA96, 0, 0, 0
	object_event 4, 52, 0, 16, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB53, 0, 0, 0
	object_event 5, 55, 0, 16, 0, 18, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DAC2, 0, 0, 0
	object_event 6, 52, 0, 4, 0, 19, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DB7F, 0, 0, 0
	object_event 7, 55, 0, 4, 0, 11, 0, 3, 8, 17, 0, 1, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DAFB, 0, 0, 0
	object_event 8, 86, 0, 5, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_Gym_EventScript_16D9D4, 0, 0, 0
	object_event 9, 91, 0, 24, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBAB, 0, 0, 0

CinnabarIsland_Gym_MapWarps:
	warp_def 24, 23, 3, 1, 776
	warp_def 25, 23, 3, 1, 776
	warp_def 26, 23, 3, 1, 776

CinnabarIsland_Gym_MapBGEvents:
	bg_event 23, 20, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBCA
	bg_event 27, 20, 0, 0, 0, CinnabarIsland_Gym_EventScript_16DBCA
	bg_event 22, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DBE8
	bg_event 23, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DBF4
	bg_event 15, 2, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DCDD
	bg_event 16, 2, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DCE9
	bg_event 13, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DDBB
	bg_event 14, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DDC7
	bg_event 13, 17, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DE92
	bg_event 14, 17, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DE9E
	bg_event 1, 18, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DF69
	bg_event 2, 18, 0, 1, 0, CinnabarIsland_Gym_EventScript_16DF75
	bg_event 1, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16E040
	bg_event 2, 10, 0, 1, 0, CinnabarIsland_Gym_EventScript_16E04C
	bg_event 3, 1, 0, 1, 0, CinnabarIsland_Gym_EventScript_1ACF07

gMapEvents_CinnabarIsland_Gym::
	map_events CinnabarIsland_Gym_EventObjects, CinnabarIsland_Gym_MapWarps, 0x0, CinnabarIsland_Gym_MapBGEvents

CinnabarIsland_PokemonLab_Entrance_EventObjects:
	object_event 1, 55, 0, 2, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E28B, 0, 0, 0

CinnabarIsland_PokemonLab_Entrance_MapWarps:
	warp_def 3, 9, 3, 2, 776
	warp_def 4, 9, 3, 2, 776
	warp_def 5, 9, 3, 2, 776
	warp_def 13, 5, 0, 0, 3074
	warp_def 19, 5, 0, 0, 3075
	warp_def 25, 5, 0, 0, 3076

CinnabarIsland_PokemonLab_Entrance_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E294
	bg_event 12, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E29D
	bg_event 18, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E2A6
	bg_event 24, 5, 0, 0, 0, CinnabarIsland_PokemonLab_Entrance_EventScript_16E2AF

gMapEvents_CinnabarIsland_PokemonLab_Entrance::
	map_events CinnabarIsland_PokemonLab_Entrance_EventObjects, CinnabarIsland_PokemonLab_Entrance_MapWarps, 0x0, CinnabarIsland_PokemonLab_Entrance_MapBGEvents

CinnabarIsland_PokemonLab_Lounge_EventObjects:
	object_event 1, 55, 0, 5, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_Lounge_EventScript_16E2B9, 0, 0, 0
	object_event 2, 33, 0, 4, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_Lounge_EventScript_16E2C2, 0, 0, 0
	object_event 3, 28, 0, 10, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_Lounge_EventScript_16E33E, 0, 0, 0

CinnabarIsland_PokemonLab_Lounge_MapWarps:
	warp_def 7, 9, 3, 3, 3073

gMapEvents_CinnabarIsland_PokemonLab_Lounge::
	map_events CinnabarIsland_PokemonLab_Lounge_EventObjects, CinnabarIsland_PokemonLab_Lounge_MapWarps, 0x0, 0x0

CinnabarIsland_PokemonLab_ResearchRoom_EventObjects:
	object_event 1, 52, 0, 5, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3DF, 0, 0, 0
	object_event 2, 55, 0, 10, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3E5, 0, 0, 0

CinnabarIsland_PokemonLab_ResearchRoom_MapWarps:
	warp_def 7, 9, 3, 4, 3073

CinnabarIsland_PokemonLab_ResearchRoom_MapBGEvents:
	bg_event 6, 1, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3F7
	bg_event 3, 1, 0, 0, 0, CinnabarIsland_PokemonLab_ResearchRoom_EventScript_16E3EE

gMapEvents_CinnabarIsland_PokemonLab_ResearchRoom::
	map_events CinnabarIsland_PokemonLab_ResearchRoom_EventObjects, CinnabarIsland_PokemonLab_ResearchRoom_MapWarps, 0x0, CinnabarIsland_PokemonLab_ResearchRoom_MapBGEvents

CinnabarIsland_PokemonLab_ExperimentRoom_EventObjects:
	object_event 1, 19, 0, 11, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_16E401, 0, 0, 0
	object_event 2, 55, 0, 12, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_16E47D, 0, 0, 0

CinnabarIsland_PokemonLab_ExperimentRoom_MapWarps:
	warp_def 7, 9, 3, 5, 3073

gMapEvents_CinnabarIsland_PokemonLab_ExperimentRoom::
	map_events CinnabarIsland_PokemonLab_ExperimentRoom_EventObjects, CinnabarIsland_PokemonLab_ExperimentRoom_MapWarps, 0x0, 0x0

CinnabarIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_16E8E6, 0, 0, 0
	object_event 2, 42, 0, 2, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_16E8F8, 0, 0, 0
	object_event 3, 61, 0, 9, 0, 7, 0, 3, 2, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_16E8EF, 0, 0, 0
	object_event 4, 18, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_16E901, 0, 0, 0
	object_event 5, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_1AD0B9, 157, 0, 0
	object_event 6, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_1AD0B9, 157, 0, 0
	object_event 7, 73, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_1F_EventScript_16E90A, 162, 0, 0

CinnabarIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 0, 3, 776
	warp_def 6, 8, 3, 3, 776
	warp_def 8, 8, 0, 3, 776
	warp_def 1, 6, 4, 0, 3078

gMapEvents_CinnabarIsland_PokemonCenter_1F::
	map_events CinnabarIsland_PokemonCenter_1F_EventObjects, CinnabarIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

CinnabarIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, CinnabarIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

CinnabarIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 3077
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_CinnabarIsland_PokemonCenter_2F::
	map_events CinnabarIsland_PokemonCenter_2F_EventObjects, CinnabarIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

CinnabarIsland_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, CinnabarIsland_Mart_EventScript_16EA22, 0, 0, 0
	object_event 2, 28, 0, 6, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, CinnabarIsland_Mart_EventScript_16EA10, 0, 0, 0
	object_event 3, 55, 0, 8, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, CinnabarIsland_Mart_EventScript_16EA19, 0, 0, 0

CinnabarIsland_Mart_MapWarps:
	warp_def 3, 7, 3, 4, 776
	warp_def 4, 7, 3, 4, 776
	warp_def 5, 7, 3, 4, 776

gMapEvents_CinnabarIsland_Mart::
	map_events CinnabarIsland_Mart_EventObjects, CinnabarIsland_Mart_MapWarps, 0x0, 0x0

IndigoPlateau_PokemonCenter_1F_EventObjects:
	object_event 1, 68, 0, 0, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_16EACC, 0, 0, 0
	object_event 2, 64, 0, 13, 0, 10, 0, 3, 8, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_16EB06, 0, 0, 0
	object_event 3, 91, 0, 7, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_16EAC3, 0, 0, 0
	object_event 4, 42, 0, 5, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_16EA8A, 0, 0, 0
	object_event 5, 54, 0, 23, 0, 13, 0, 3, 10, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_1ACFAE, 157, 0, 0
	object_event 6, 0, 0, 22, 0, 9, 0, 0, 76, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_1AD06C, 157, 0, 0
	object_event 7, 41, 0, 16, 0, 15, 0, 3, 2, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_1AD087, 157, 0, 0
	object_event 8, 0, 0, 23, 0, 9, 0, 0, 76, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_1F_EventScript_1AD06C, 157, 0, 0

IndigoPlateau_PokemonCenter_1F_MapWarps:
	warp_def 11, 16, 3, 0, 777
	warp_def 4, 1, 3, 0, 331
	warp_def 1, 14, 4, 0, 3329

gMapEvents_IndigoPlateau_PokemonCenter_1F::
	map_events IndigoPlateau_PokemonCenter_1F_EventObjects, IndigoPlateau_PokemonCenter_1F_MapWarps, 0x0, 0x0

IndigoPlateau_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, IndigoPlateau_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

IndigoPlateau_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 2, 3328
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_IndigoPlateau_PokemonCenter_2F::
	map_events IndigoPlateau_PokemonCenter_2F_EventObjects, IndigoPlateau_PokemonCenter_2F_MapWarps, 0x0, 0x0

SaffronCity_House1_1F_EventObjects:
	object_event 1, 30, 0, 8, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, SaffronCity_House1_1F_EventScript_16EB40, 0, 0, 0
	object_event 2, 31, 0, 3, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House1_1F_EventScript_16EB37, 0, 0, 0
	object_event 3, 117, 0, 4, 0, 4, 0, 3, 3, 33, 0, 0, 0, 0, 0, SaffronCity_House1_1F_EventScript_16EB49, 0, 0, 0

SaffronCity_House1_1F_MapWarps:
	warp_def 3, 8, 3, 1, 778
	warp_def 4, 8, 3, 1, 778
	warp_def 5, 8, 3, 1, 778
	warp_def 10, 2, 3, 0, 3585

gMapEvents_SaffronCity_House1_1F::
	map_events SaffronCity_House1_1F_EventObjects, SaffronCity_House1_1F_MapWarps, 0x0, 0x0

SaffronCity_House1_2F_EventObjects:
	object_event 1, 132, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB5D, 0, 0, 0
	object_event 2, 120, 0, 4, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB70, 0, 0, 0
	object_event 3, 115, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB70, 0, 0, 0
	object_event 4, 17, 0, 9, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EB7B, 0, 0, 0

SaffronCity_House1_2F_MapWarps:
	warp_def 10, 2, 3, 3, 3584

SaffronCity_House1_2F_MapBGEvents:
	bg_event 1, 1, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EBC9
	bg_event 3, 5, 0, 0, 0, SaffronCity_House1_2F_EventScript_16EBD2
	bg_event 2, 1, 0, 7, 0, 110, 26, 1

gMapEvents_SaffronCity_House1_2F::
	map_events SaffronCity_House1_2F_EventObjects, SaffronCity_House1_2F_MapWarps, 0x0, SaffronCity_House1_2F_MapBGEvents

SaffronCity_Dojo_EventObjects:
	object_event 1, 54, 0, 11, 0, 10, 0, 3, 9, 17, 0, 1, 0, 7, 0, SaffronCity_Dojo_EventScript_16ED46, 0, 0, 0
	object_event 2, 54, 0, 1, 0, 10, 0, 3, 10, 17, 0, 1, 0, 7, 0, SaffronCity_Dojo_EventScript_16ED5D, 0, 0, 0
	object_event 3, 54, 0, 11, 0, 8, 0, 3, 9, 17, 0, 1, 0, 7, 0, SaffronCity_Dojo_EventScript_16ED74, 0, 0, 0
	object_event 4, 54, 0, 1, 0, 8, 0, 3, 10, 17, 0, 1, 0, 7, 0, SaffronCity_Dojo_EventScript_16ED8B, 0, 0, 0
	object_event 5, 54, 0, 6, 0, 5, 0, 3, 8, 17, 0, 1, 0, 2, 0, SaffronCity_Dojo_EventScript_16EDA2, 0, 0, 0
	object_event 6, 92, 0, 5, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Dojo_EventScript_16EC00, 96, 0, 0
	object_event 7, 92, 0, 7, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Dojo_EventScript_16EC46, 97, 0, 0

SaffronCity_Dojo_MapWarps:
	warp_def 5, 14, 3, 2, 778
	warp_def 6, 14, 3, 2, 778
	warp_def 7, 14, 3, 2, 778

SaffronCity_Dojo_MapCoordEvents:
	coord_event 5, 5, 3, 0, 16513, 0, 0, SaffronCity_Dojo_EventScript_16EBDC
	coord_event 7, 5, 3, 0, 16513, 0, 0, SaffronCity_Dojo_EventScript_16EBEE

SaffronCity_Dojo_MapBGEvents:
	bg_event 3, 13, 0, 0, 0, SaffronCity_Dojo_EventScript_16ED2B
	bg_event 9, 13, 0, 0, 0, SaffronCity_Dojo_EventScript_16ED2B
	bg_event 5, 2, 0, 0, 0, SaffronCity_Dojo_EventScript_16ED34
	bg_event 7, 2, 0, 0, 0, SaffronCity_Dojo_EventScript_16ED3D

gMapEvents_SaffronCity_Dojo::
	map_events SaffronCity_Dojo_EventObjects, SaffronCity_Dojo_MapWarps, SaffronCity_Dojo_MapCoordEvents, SaffronCity_Dojo_MapBGEvents

SaffronCity_Gym_EventObjects:
	object_event 1, 41, 0, 24, 0, 18, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EEC3, 0, 0, 0
	object_event 2, 41, 0, 24, 0, 2, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EE88, 0, 0, 0
	object_event 3, 41, 0, 4, 0, 2, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EEDA, 0, 0, 0
	object_event 4, 58, 0, 14, 0, 2, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EEF1, 0, 0, 0
	object_event 5, 58, 0, 4, 0, 10, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EF08, 0, 0, 0
	object_event 6, 58, 0, 4, 0, 18, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EF1F, 0, 0, 0
	object_event 7, 85, 0, 14, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Gym_EventScript_16EDD8, 0, 0, 0
	object_event 8, 41, 0, 24, 0, 10, 0, 3, 8, 17, 0, 1, 0, 3, 0, SaffronCity_Gym_EventScript_16EE9F, 0, 0, 0
	object_event 9, 91, 0, 15, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_Gym_EventScript_16EF36, 0, 0, 0

SaffronCity_Gym_MapWarps:
	warp_def 13, 23, 3, 3, 778
	warp_def 14, 23, 3, 3, 778
	warp_def 15, 23, 3, 3, 778
	warp_def 18, 20, 3, 32, 3587
	warp_def 0, 4, 3, 22, 3587
	warp_def 0, 7, 3, 20, 3587
	warp_def 0, 12, 3, 30, 3587
	warp_def 0, 15, 3, 11, 3587
	warp_def 0, 20, 3, 28, 3587
	warp_def 0, 23, 3, 19, 3587
	warp_def 8, 4, 3, 18, 3587
	warp_def 8, 7, 3, 7, 3587
	warp_def 8, 12, 3, 17, 3587
	warp_def 8, 15, 3, 15, 3587
	warp_def 8, 20, 3, 26, 3587
	warp_def 8, 23, 3, 13, 3587
	warp_def 12, 4, 3, 24, 3587
	warp_def 12, 7, 3, 12, 3587
	warp_def 16, 4, 3, 10, 3587
	warp_def 16, 7, 3, 9, 3587
	warp_def 18, 15, 3, 5, 3587
	warp_def 20, 4, 3, 23, 3587
	warp_def 20, 7, 3, 4, 3587
	warp_def 20, 12, 3, 21, 3587
	warp_def 20, 15, 3, 16, 3587
	warp_def 20, 20, 3, 27, 3587
	warp_def 20, 23, 3, 14, 3587
	warp_def 28, 4, 3, 25, 3587
	warp_def 28, 7, 3, 8, 3587
	warp_def 28, 12, 3, 31, 3587
	warp_def 28, 15, 3, 6, 3587
	warp_def 28, 20, 3, 29, 3587
	warp_def 28, 23, 3, 3, 3587

SaffronCity_Gym_MapBGEvents:
	bg_event 12, 20, 0, 0, 0, SaffronCity_Gym_EventScript_16EF55
	bg_event 16, 20, 0, 0, 0, SaffronCity_Gym_EventScript_16EF55

gMapEvents_SaffronCity_Gym::
	map_events SaffronCity_Gym_EventObjects, SaffronCity_Gym_MapWarps, 0x0, SaffronCity_Gym_MapBGEvents

SaffronCity_House2_EventObjects:
	object_event 1, 116, 0, 0, 0, 5, 0, 3, 3, 65, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF86, 0, 0, 0
	object_event 2, 22, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF74, 0, 0, 0
	object_event 3, 18, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_House2_EventScript_16EF7D, 0, 0, 0
	object_event 4, 105, 0, 5, 0, 4, 0, 0, 7, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

SaffronCity_House2_MapWarps:
	warp_def 3, 7, 3, 4, 778
	warp_def 4, 7, 3, 4, 778
	warp_def 5, 7, 3, 4, 778

SaffronCity_House2_MapBGEvents:
	bg_event 5, 4, 3, 0, 0, SaffronCity_House2_EventScript_16EF99

gMapEvents_SaffronCity_House2::
	map_events SaffronCity_House2_EventObjects, SaffronCity_House2_MapWarps, 0x0, SaffronCity_House2_MapBGEvents

SaffronCity_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, SaffronCity_Mart_EventScript_16EFB5, 0, 0, 0
	object_event 2, 18, 0, 1, 0, 7, 0, 3, 10, 17, 0, 0, 0, 0, 0, SaffronCity_Mart_EventScript_16EFAC, 0, 0, 0
	object_event 3, 22, 0, 9, 0, 5, 0, 3, 3, 17, 0, 0, 0, 0, 0, SaffronCity_Mart_EventScript_16EFA3, 0, 0, 0

SaffronCity_Mart_MapWarps:
	warp_def 3, 7, 3, 5, 778
	warp_def 4, 7, 3, 5, 778
	warp_def 5, 7, 3, 5, 778

gMapEvents_SaffronCity_Mart::
	map_events SaffronCity_Mart_EventObjects, SaffronCity_Mart_MapWarps, 0x0, 0x0

SaffronCity_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_16EFFB, 0, 0, 0
	object_event 2, 61, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_16F004, 0, 0, 0
	object_event 3, 31, 0, 4, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_16F00D, 0, 0, 0
	object_event 4, 18, 0, 9, 0, 6, 0, 3, 3, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_16F016, 0, 0, 0
	object_event 5, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_1ACEEC, 174, 0, 0
	object_event 6, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_1F_EventScript_1ACEEC, 174, 0, 0

SaffronCity_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 6, 778
	warp_def 7, 8, 3, 6, 778
	warp_def 8, 8, 3, 6, 778
	warp_def 1, 6, 4, 0, 3591

gMapEvents_SaffronCity_PokemonCenter_1F::
	map_events SaffronCity_PokemonCenter_1F_EventObjects, SaffronCity_PokemonCenter_1F_MapWarps, 0x0, 0x0

SaffronCity_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

SaffronCity_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 3590
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_SaffronCity_PokemonCenter_2F::
	map_events SaffronCity_PokemonCenter_2F_EventObjects, SaffronCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

SaffronCity_House3_EventObjects:
	object_event 1, 30, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, SaffronCity_House3_EventScript_16F05F, 0, 0, 0

SaffronCity_House3_MapWarps:
	warp_def 3, 7, 3, 7, 778
	warp_def 4, 7, 3, 7, 778
	warp_def 5, 7, 3, 7, 778

gMapEvents_SaffronCity_House3::
	map_events SaffronCity_House3_EventObjects, SaffronCity_House3_MapWarps, 0x0, 0x0

SaffronCity_PokemonTrainerFanClub_EventObjects:
	object_event 1, 24, 0, 7, 0, 13, 0, 3, 9, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F281, 0, 0, 0
	object_event 2, 17, 0, 6, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F2F8, 0, 0, 0
	object_event 3, 18, 0, 3, 0, 13, 0, 3, 10, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F36F, 0, 0, 0
	object_event 4, 61, 0, 3, 0, 12, 0, 3, 10, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F3E6, 0, 0, 0
	object_event 5, 31, 0, 9, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F45D, 110, 0, 0
	object_event 6, 26, 0, 7, 0, 12, 0, 3, 9, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F4BF, 109, 0, 0
	object_event 7, 29, 0, 9, 0, 12, 0, 3, 7, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F521, 111, 0, 0
	object_event 8, 54, 0, 5, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_16F583, 108, 0, 0
	object_event 9, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_1ACF7A, 157, 0, 0
	object_event 10, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SaffronCity_PokemonTrainerFanClub_EventScript_1ACF7A, 157, 0, 0

SaffronCity_PokemonTrainerFanClub_MapWarps:
	warp_def 5, 15, 3, 14, 778

gMapEvents_SaffronCity_PokemonTrainerFanClub::
	map_events SaffronCity_PokemonTrainerFanClub_EventObjects, SaffronCity_PokemonTrainerFanClub_MapWarps, 0x0, 0x0

Route2_ViridianForest_SouthEntrance_EventObjects:
	object_event 1, 28, 0, 10, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route2_ViridianForest_SouthEntrance_EventScript_16F5E6, 0, 0, 0
	object_event 2, 23, 0, 4, 0, 7, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route2_ViridianForest_SouthEntrance_EventScript_16F5EF, 0, 0, 0

Route2_ViridianForest_SouthEntrance_MapWarps:
	warp_def 6, 10, 3, 2, 788
	warp_def 7, 10, 3, 2, 788
	warp_def 8, 10, 3, 2, 788
	warp_def 7, 1, 3, 0, 256

gMapEvents_Route2_ViridianForest_SouthEntrance::
	map_events Route2_ViridianForest_SouthEntrance_EventObjects, Route2_ViridianForest_SouthEntrance_MapWarps, 0x0, 0x0

Route2_House_EventObjects:
	object_event 1, 55, 0, 4, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route2_House_EventScript_16F5F9, 0, 0, 0
	object_event 2, 51, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route2_House_EventScript_16F602, 0, 0, 0

Route2_House_MapWarps:
	warp_def 3, 7, 0, 4, 788
	warp_def 4, 7, 0, 4, 788
	warp_def 5, 7, 0, 4, 788

gMapEvents_Route2_House::
	map_events Route2_House_EventObjects, Route2_House_MapWarps, 0x0, 0x0

Route2_EastBuilding_EventObjects:
	object_event 1, 55, 0, 4, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route2_EastBuilding_EventScript_16F67F, 0, 0, 0
	object_event 2, 26, 0, 10, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route2_EastBuilding_EventScript_16F714, 0, 0, 0

Route2_EastBuilding_MapWarps:
	warp_def 6, 10, 0, 5, 788
	warp_def 7, 10, 3, 5, 788
	warp_def 8, 10, 3, 5, 788
	warp_def 7, 1, 3, 6, 788

gMapEvents_Route2_EastBuilding::
	map_events Route2_EastBuilding_EventObjects, Route2_EastBuilding_MapWarps, 0x0, 0x0

Route2_ViridianForest_NorthEntrance_EventObjects:
	object_event 1, 18, 0, 5, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route2_ViridianForest_NorthEntrance_EventScript_16F71E, 0, 0, 0
	object_event 2, 32, 0, 4, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route2_ViridianForest_NorthEntrance_EventScript_16F727, 0, 0, 0
	object_event 3, 42, 0, 10, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route2_ViridianForest_NorthEntrance_EventScript_16F730, 0, 0, 0

Route2_ViridianForest_NorthEntrance_MapWarps:
	warp_def 6, 10, 3, 2, 256
	warp_def 7, 10, 3, 2, 256
	warp_def 8, 10, 3, 2, 256
	warp_def 7, 1, 3, 0, 788

gMapEvents_Route2_ViridianForest_NorthEntrance::
	map_events Route2_ViridianForest_NorthEntrance_EventObjects, Route2_ViridianForest_NorthEntrance_MapWarps, 0x0, 0x0

Route4_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F8BB, 0, 0, 0
	object_event 2, 30, 0, 1, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F75F, 0, 0, 0
	object_event 3, 61, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F754, 0, 0, 0
	object_event 4, 19, 0, 5, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F74B, 0, 0, 0
	object_event 5, 18, 0, 14, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F8C4, 0, 0, 0
	object_event 6, 105, 0, 12, 0, 6, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_1F_EventScript_16F8CD, 0, 0, 0

Route4_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 2, 790
	warp_def 7, 8, 3, 2, 790
	warp_def 8, 8, 3, 2, 790
	warp_def 1, 6, 4, 0, 4097

gMapEvents_Route4_PokemonCenter_1F::
	map_events Route4_PokemonCenter_1F_EventObjects, Route4_PokemonCenter_1F_MapWarps, 0x0, 0x0

Route4_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route4_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route4_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route4_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route4_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

Route4_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 4096
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_Route4_PokemonCenter_2F::
	map_events Route4_PokemonCenter_2F_EventObjects, Route4_PokemonCenter_2F_MapWarps, 0x0, 0x0

Route5_PokemonDayCare_EventObjects:
	object_event 1, 61, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route5_PokemonDayCare_EventScript_1BF398, 0, 0, 0

Route5_PokemonDayCare_MapWarps:
	warp_def 3, 7, 0, 1, 791
	warp_def 4, 7, 0, 1, 791
	warp_def 5, 7, 0, 1, 791

gMapEvents_Route5_PokemonDayCare::
	map_events Route5_PokemonDayCare_EventObjects, Route5_PokemonDayCare_MapWarps, 0x0, 0x0

Route5_SouthEntrance_EventObjects:
	object_event 1, 60, 0, 1, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route5_SouthEntrance_EventScript_16F901, 0, 0, 0

Route5_SouthEntrance_MapWarps:
	warp_def 3, 9, 3, 9, 778
	warp_def 4, 1, 3, 2, 791
	warp_def 4, 9, 3, 9, 778
	warp_def 5, 1, 0, 3, 791

Route5_SouthEntrance_MapCoordEvents:
	coord_event 3, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F90A
	coord_event 4, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F916
	coord_event 5, 5, 3, 0, 16482, 0, 0, Route5_SouthEntrance_EventScript_16F922

gMapEvents_Route5_SouthEntrance::
	map_events Route5_SouthEntrance_EventObjects, Route5_SouthEntrance_MapWarps, Route5_SouthEntrance_MapCoordEvents, 0x0

Route6_NorthEntrance_EventObjects:
	object_event 1, 60, 0, 7, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route6_NorthEntrance_EventScript_16F9C7, 0, 0, 0

Route6_NorthEntrance_MapWarps:
	warp_def 4, 1, 0, 11, 778
	warp_def 5, 1, 0, 11, 778
	warp_def 4, 9, 3, 1, 792
	warp_def 5, 9, 3, 1, 792

Route6_NorthEntrance_MapCoordEvents:
	coord_event 3, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9D0
	coord_event 4, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9DC
	coord_event 5, 5, 3, 0, 16482, 0, 0, Route6_NorthEntrance_EventScript_16F9E8

gMapEvents_Route6_NorthEntrance::
	map_events Route6_NorthEntrance_EventObjects, Route6_NorthEntrance_MapWarps, Route6_NorthEntrance_MapCoordEvents, 0x0


gMapEvents_UnknownMap_18_01::
	map_events 0x0, 0x0, 0x0, 0x0

Route7_EastEntrance_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route7_EastEntrance_EventScript_16FA8E, 0, 0, 0

Route7_EastEntrance_MapWarps:
	warp_def 1, 5, 3, 1, 793
	warp_def 1, 6, 3, 1, 793
	warp_def 11, 5, 3, 8, 778
	warp_def 11, 6, 3, 8, 778

Route7_EastEntrance_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FA97
	coord_event 6, 5, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FAA3
	coord_event 6, 6, 3, 0, 16482, 0, 0, Route7_EastEntrance_EventScript_16FAAF

gMapEvents_Route7_EastEntrance::
	map_events Route7_EastEntrance_EventObjects, Route7_EastEntrance_MapWarps, Route7_EastEntrance_MapCoordEvents, 0x0

Route8_WestEntrance_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route8_WestEntrance_EventScript_16FB54, 0, 0, 0

Route8_WestEntrance_MapWarps:
	warp_def 1, 4, 3, 10, 778
	warp_def 1, 5, 3, 10, 778
	warp_def 11, 5, 3, 1, 794
	warp_def 11, 6, 3, 1, 794

Route8_WestEntrance_MapCoordEvents:
	coord_event 6, 4, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB5D
	coord_event 6, 5, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB69
	coord_event 6, 6, 3, 0, 16482, 0, 0, Route8_WestEntrance_EventScript_16FB75

gMapEvents_Route8_WestEntrance::
	map_events Route8_WestEntrance_EventObjects, Route8_WestEntrance_MapWarps, Route8_WestEntrance_MapCoordEvents, 0x0

Route10_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 0, 8, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_1F_EventScript_16FC41, 0, 0, 0
	object_event 2, 61, 0, 9, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_1F_EventScript_16FC53, 0, 0, 0
	object_event 3, 27, 0, 2, 0, 3, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_1F_EventScript_16FC4A, 0, 0, 0
	object_event 4, 18, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_1F_EventScript_16FC5C, 0, 0, 0
	object_event 5, 55, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_1F_EventScript_16FC65, 0, 0, 0

Route10_PokemonCenter_1F_MapWarps:
	warp_def 6, 8, 3, 3, 796
	warp_def 7, 8, 3, 3, 796
	warp_def 8, 8, 3, 3, 796
	warp_def 1, 6, 4, 0, 5377

gMapEvents_Route10_PokemonCenter_1F::
	map_events Route10_PokemonCenter_1F_EventObjects, Route10_PokemonCenter_1F_MapWarps, 0x0, 0x0

Route10_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route10_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route10_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route10_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route10_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

Route10_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 3, 5376
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_Route10_PokemonCenter_2F::
	map_events Route10_PokemonCenter_2F_EventObjects, Route10_PokemonCenter_2F_MapWarps, 0x0, 0x0

Route11_EastEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route11_EastEntrance_1F_EventScript_16FD22, 0, 0, 0
	object_event 2, 60, 0, 4, 0, 10, 0, 0, 7, 17, 0, 0, 0, 0, 0, Route11_EastEntrance_1F_EventScript_16FD2B, 0, 0, 0

Route11_EastEntrance_1F_MapWarps:
	warp_def 1, 6, 3, 1, 797
	warp_def 1, 7, 3, 1, 797
	warp_def 11, 6, 3, 2, 797
	warp_def 11, 7, 3, 2, 797
	warp_def 9, 10, 3, 0, 5633

gMapEvents_Route11_EastEntrance_1F::
	map_events Route11_EastEntrance_1F_EventObjects, Route11_EastEntrance_1F_MapWarps, 0x0, 0x0

Route11_EastEntrance_2F_EventObjects:
	object_event 1, 18, 0, 7, 0, 3, 0, 3, 5, 18, 0, 0, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD5C, 0, 0, 0
	object_event 2, 55, 0, 2, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FDD8, 0, 0, 0

Route11_EastEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 5632

Route11_EastEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD35
	bg_event 8, 1, 0, 0, 0, Route11_EastEntrance_2F_EventScript_16FD53

gMapEvents_Route11_EastEntrance_2F::
	map_events Route11_EastEntrance_2F_EventObjects, Route11_EastEntrance_2F_MapWarps, 0x0, Route11_EastEntrance_2F_MapBGEvents

Route12_NorthEntrance_1F_EventObjects:
	object_event 1, 60, 0, 1, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route12_NorthEntrance_1F_EventScript_16FE6E, 0, 0, 0

Route12_NorthEntrance_1F_MapWarps:
	warp_def 5, 1, 3, 1, 798
	warp_def 6, 1, 0, 2, 798
	warp_def 5, 11, 3, 3, 798
	warp_def 6, 11, 3, 3, 798
	warp_def 8, 10, 3, 0, 5889

gMapEvents_Route12_NorthEntrance_1F::
	map_events Route12_NorthEntrance_1F_EventObjects, Route12_NorthEntrance_1F_MapWarps, 0x0, 0x0

Route12_NorthEntrance_2F_EventObjects:
	object_event 1, 22, 0, 7, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE8A, 0, 0, 0

Route12_NorthEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 5888

Route12_NorthEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE78
	bg_event 8, 1, 0, 0, 0, Route12_NorthEntrance_2F_EventScript_16FE81

gMapEvents_Route12_NorthEntrance_2F::
	map_events Route12_NorthEntrance_2F_EventObjects, Route12_NorthEntrance_2F_MapWarps, 0x0, Route12_NorthEntrance_2F_MapBGEvents

Route12_FishingHouse_EventObjects:
	object_event 1, 57, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route12_FishingHouse_EventScript_16FF0C, 0, 0, 0

Route12_FishingHouse_MapWarps:
	warp_def 2, 8, 0, 0, 798
	warp_def 3, 7, 3, 0, 798
	warp_def 4, 8, 0, 0, 798

Route12_FishingHouse_MapBGEvents:
	bg_event 9, 1, 0, 0, 0, Route12_FishingHouse_EventScript_170067

gMapEvents_Route12_FishingHouse::
	map_events Route12_FishingHouse_EventObjects, Route12_FishingHouse_MapWarps, 0x0, Route12_FishingHouse_MapBGEvents

Route15_WestEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route15_WestEntrance_1F_EventScript_170089, 0, 0, 0

Route15_WestEntrance_1F_MapWarps:
	warp_def 1, 6, 3, 0, 801
	warp_def 1, 7, 3, 0, 801
	warp_def 11, 6, 3, 1, 801
	warp_def 11, 7, 3, 1, 801
	warp_def 9, 10, 3, 0, 6145

gMapEvents_Route15_WestEntrance_1F::
	map_events Route15_WestEntrance_1F_EventObjects, Route15_WestEntrance_1F_MapWarps, 0x0, 0x0

Route15_WestEntrance_2F_EventObjects:
	object_event 1, 55, 0, 5, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, Route15_WestEntrance_2F_EventScript_1700B9, 0, 0, 0

Route15_WestEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 6144

Route15_WestEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route15_WestEntrance_2F_EventScript_170093
	bg_event 8, 1, 0, 0, 0, Route15_WestEntrance_2F_EventScript_1700B0

gMapEvents_Route15_WestEntrance_2F::
	map_events Route15_WestEntrance_2F_EventObjects, Route15_WestEntrance_2F_MapWarps, 0x0, Route15_WestEntrance_2F_MapBGEvents

Route16_House_EventObjects:
	object_event 1, 23, 0, 4, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_House_EventScript_17014F, 0, 0, 0
	object_event 2, 133, 0, 9, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_House_EventScript_1701AF, 0, 0, 0

Route16_House_MapWarps:
	warp_def 3, 7, 3, 0, 802
	warp_def 4, 7, 3, 0, 802
	warp_def 5, 7, 3, 0, 802

gMapEvents_Route16_House::
	map_events Route16_House_EventObjects, Route16_House_MapWarps, 0x0, 0x0

Route16_NorthEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 8, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_1F_EventScript_1701DB, 0, 0, 0
	object_event 2, 32, 0, 7, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_1F_EventScript_1702B5, 0, 0, 0

Route16_NorthEntrance_1F_MapWarps:
	warp_def 1, 3, 3, 1, 802
	warp_def 11, 3, 3, 2, 802
	warp_def 1, 12, 3, 3, 802
	warp_def 11, 12, 3, 4, 802
	warp_def 9, 16, 3, 0, 6402

Route16_NorthEntrance_1F_MapCoordEvents:
	coord_event 10, 12, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 2, 12, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 6, 10, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701E4
	coord_event 6, 11, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701F0
	coord_event 1, 13, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 1, 11, 3, 0, 16478, 0, 0, Route16_NorthEntrance_1F_EventScript_1A77C1
	coord_event 11, 11, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 11, 13, 3, 0, 16478, 1, 0, Route16_NorthEntrance_1F_EventScript_1A77B6
	coord_event 6, 12, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_1701FC
	coord_event 6, 13, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_170208
	coord_event 6, 14, 3, 0, 16385, 0, 0, Route16_NorthEntrance_1F_EventScript_170214

gMapEvents_Route16_NorthEntrance_1F::
	map_events Route16_NorthEntrance_1F_EventObjects, Route16_NorthEntrance_1F_MapWarps, Route16_NorthEntrance_1F_MapCoordEvents, 0x0

Route16_NorthEntrance_2F_EventObjects:
	object_event 1, 16, 0, 6, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702BF, 0, 0, 0
	object_event 2, 17, 0, 4, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702C8, 0, 0, 0
	object_event 3, 55, 0, 10, 0, 6, 0, 0, 9, 17, 0, 0, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702E3, 0, 0, 0

Route16_NorthEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 4, 6401

Route16_NorthEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702D1
	bg_event 8, 1, 0, 0, 0, Route16_NorthEntrance_2F_EventScript_1702DA

gMapEvents_Route16_NorthEntrance_2F::
	map_events Route16_NorthEntrance_2F_EventObjects, Route16_NorthEntrance_2F_MapWarps, 0x0, Route16_NorthEntrance_2F_MapBGEvents

Route18_EastEntrance_1F_EventObjects:
	object_event 1, 60, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route18_EastEntrance_1F_EventScript_170391, 0, 0, 0

Route18_EastEntrance_1F_MapWarps:
	warp_def 1, 6, 3, 0, 804
	warp_def 11, 6, 3, 1, 804
	warp_def 9, 10, 3, 0, 6657

Route18_EastEntrance_1F_MapCoordEvents:
	coord_event 2, 6, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1
	coord_event 6, 4, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_17039A
	coord_event 6, 5, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703A6
	coord_event 6, 6, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703B2
	coord_event 6, 7, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703BE
	coord_event 6, 8, 3, 0, 16385, 0, 0, Route18_EastEntrance_1F_EventScript_1703CA
	coord_event 10, 6, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 11, 5, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 11, 7, 3, 0, 16478, 1, 0, Route18_EastEntrance_1F_EventScript_1A77B6
	coord_event 1, 5, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1
	coord_event 1, 7, 3, 0, 16478, 0, 0, Route18_EastEntrance_1F_EventScript_1A77C1

gMapEvents_Route18_EastEntrance_1F::
	map_events Route18_EastEntrance_1F_EventObjects, Route18_EastEntrance_1F_MapWarps, Route18_EastEntrance_1F_MapCoordEvents, 0x0

Route18_EastEntrance_2F_EventObjects:
	object_event 1, 19, 0, 5, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route18_EastEntrance_2F_EventScript_17047E, 0, 0, 0

Route18_EastEntrance_2F_MapWarps:
	warp_def 10, 9, 3, 2, 6656

Route18_EastEntrance_2F_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, Route18_EastEntrance_2F_EventScript_17046C
	bg_event 8, 1, 0, 0, 0, Route18_EastEntrance_2F_EventScript_170475

gMapEvents_Route18_EastEntrance_2F::
	map_events Route18_EastEntrance_2F_EventObjects, Route18_EastEntrance_2F_MapWarps, 0x0, Route18_EastEntrance_2F_MapBGEvents


gMapEvents_UnusedHouse_27_00::
	map_events 0x0, 0x0, 0x0, 0x0

Route22_NorthEntrance_EventObjects:
	object_event 1, 60, 0, 8, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route22_NorthEntrance_EventScript_1704FC, 0, 0, 0

Route22_NorthEntrance_MapWarps:
	warp_def 7, 1, 3, 2, 810
	warp_def 6, 10, 3, 0, 809
	warp_def 7, 10, 3, 0, 809
	warp_def 8, 10, 3, 0, 809

Route22_NorthEntrance_MapCoordEvents:
	coord_event 7, 2, 3, 0, 16479, 0, 0, Route22_NorthEntrance_EventScript_17050D

gMapEvents_Route22_NorthEntrance::
	map_events Route22_NorthEntrance_EventObjects, Route22_NorthEntrance_MapWarps, Route22_NorthEntrance_MapCoordEvents, 0x0


gMapEvents_UnusedHouse_29_00::
	map_events 0x0, 0x0, 0x0, 0x0

Route25_SeaCottage_EventObjects:
	object_event 1, 73, 0, 7, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route25_SeaCottage_EventScript_17054B, 51, 0, 0
	object_event 2, 113, 0, 10, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route25_SeaCottage_EventScript_17054B, 50, 0, 0

Route25_SeaCottage_MapWarps:
	warp_def 6, 9, 3, 0, 812
	warp_def 7, 9, 3, 0, 812
	warp_def 8, 9, 3, 0, 812

Route25_SeaCottage_MapBGEvents:
	bg_event 4, 5, 0, 1, 0, Route25_SeaCottage_EventScript_1706DD

gMapEvents_Route25_SeaCottage::
	map_events Route25_SeaCottage_EventObjects, Route25_SeaCottage_MapWarps, 0x0, Route25_SeaCottage_MapBGEvents

SevenIsland_House_Room1_EventObjects:
	object_event 1, 35, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SevenIsland_House_Room1_EventScript_170958, 0, 0, 0

SevenIsland_House_Room1_MapWarps:
	warp_def 4, 7, 3, 0, 785
	warp_def 4, 1, 0, 0, 7937

SevenIsland_House_Room1_MapBGEvents:
	bg_event 4, 1, 0, 0, 0, SevenIsland_House_Room1_EventScript_170A75

gMapEvents_SevenIsland_House_Room1::
	map_events SevenIsland_House_Room1_EventObjects, SevenIsland_House_Room1_MapWarps, 0x0, SevenIsland_House_Room1_MapBGEvents

SevenIsland_House_Room2_EventObjects:
	object_event 1, 240, 0, 6, 0, 5, 0, 0, 9, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

SevenIsland_House_Room2_MapWarps:
	warp_def 3, 1, 0, 1, 7936

gMapEvents_SevenIsland_House_Room2::
	map_events SevenIsland_House_Room2_EventObjects, SevenIsland_House_Room2_MapWarps, 0x0, 0x0

SevenIsland_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, SevenIsland_Mart_EventScript_170B31, 0, 0, 0
	object_event 2, 22, 0, 6, 0, 2, 0, 3, 16, 17, 0, 0, 0, 0, 0, SevenIsland_Mart_EventScript_170B6E, 0, 0, 0
	object_event 3, 57, 0, 9, 0, 5, 0, 3, 3, 17, 0, 0, 0, 0, 0, SevenIsland_Mart_EventScript_170B80, 0, 0, 0
	object_event 4, 56, 0, 5, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_Mart_EventScript_170B77, 0, 0, 0

SevenIsland_Mart_MapWarps:
	warp_def 4, 7, 3, 1, 785

gMapEvents_SevenIsland_Mart::
	map_events SevenIsland_Mart_EventObjects, SevenIsland_Mart_MapWarps, 0x0, 0x0

SevenIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_170B98, 0, 0, 0
	object_event 2, 32, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_170BA1, 0, 0, 0
	object_event 3, 62, 0, 14, 0, 6, 0, 3, 9, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_170BAA, 0, 0, 0
	object_event 4, 29, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_170BB3, 0, 0, 0
	object_event 5, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_1ACFD4, 157, 0, 0
	object_event 6, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_1F_EventScript_1ACFD4, 157, 0, 0

SevenIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 2, 785
	warp_def 1, 6, 4, 0, 7940

gMapEvents_SevenIsland_PokemonCenter_1F::
	map_events SevenIsland_PokemonCenter_1F_EventObjects, SevenIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

SevenIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

SevenIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 7939
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_SevenIsland_PokemonCenter_2F::
	map_events SevenIsland_PokemonCenter_2F_EventObjects, SevenIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0


gMapEvents_UnusedHouse_31_05::
	map_events 0x0, 0x0, 0x0, 0x0

SevenIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, SevenIsland_Harbor_EventScript_170BE5, 0, 0, 0

SevenIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 3, 785

gMapEvents_SevenIsland_Harbor::
	map_events SevenIsland_Harbor_EventObjects, SevenIsland_Harbor_MapWarps, 0x0, 0x0

OneIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 5, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170E94, 0, 0, 0
	object_event 2, 73, 0, 14, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170E9D, 114, 0, 0
	object_event 3, 89, 0, 15, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_170EC5, 115, 0, 0
	object_event 4, 16, 0, 6, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171148, 0, 0, 0
	object_event 5, 56, 0, 3, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171151, 0, 0, 0
	object_event 6, 24, 0, 7, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_17115A, 0, 0, 0

OneIsland_PokemonCenter_1F_MapWarps:
	warp_def 9, 9, 3, 0, 780
	warp_def 1, 5, 4, 0, 8193

OneIsland_PokemonCenter_1F_MapCoordEvents:
	coord_event 12, 6, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711AA
	coord_event 12, 7, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711B6
	coord_event 12, 8, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711C2
	coord_event 12, 9, 3, 0, 16502, 2, 0, OneIsland_PokemonCenter_1F_EventScript_1711CE

OneIsland_PokemonCenter_1F_MapBGEvents:
	bg_event 12, 2, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 3, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 4, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 12, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 13, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 15, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 14, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 16, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179
	bg_event 17, 5, 0, 0, 0, OneIsland_PokemonCenter_1F_EventScript_171179

gMapEvents_OneIsland_PokemonCenter_1F::
	map_events OneIsland_PokemonCenter_1F_EventObjects, OneIsland_PokemonCenter_1F_MapWarps, OneIsland_PokemonCenter_1F_MapCoordEvents, OneIsland_PokemonCenter_1F_MapBGEvents

OneIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, OneIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

OneIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 8192
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_OneIsland_PokemonCenter_2F::
	map_events OneIsland_PokemonCenter_2F_EventObjects, OneIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

OneIsland_House1_EventObjects:
	object_event 1, 32, 0, 4, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, OneIsland_House1_EventScript_17135C, 0, 0, 0
	object_event 2, 35, 0, 7, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, OneIsland_House1_EventScript_171365, 0, 0, 0

OneIsland_House1_MapWarps:
	warp_def 4, 7, 3, 1, 780

gMapEvents_OneIsland_House1::
	map_events OneIsland_House1_EventObjects, OneIsland_House1_MapWarps, 0x0, 0x0

OneIsland_House2_EventObjects:
	object_event 1, 22, 0, 9, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, OneIsland_House2_EventScript_17136F, 0, 0, 0

OneIsland_House2_MapWarps:
	warp_def 4, 7, 3, 2, 780

gMapEvents_OneIsland_House2::
	map_events OneIsland_House2_EventObjects, OneIsland_House2_MapWarps, 0x0, 0x0

OneIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, OneIsland_Harbor_EventScript_1713BD, 0, 0, 0

OneIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 3, 780

gMapEvents_OneIsland_Harbor::
	map_events OneIsland_Harbor_EventObjects, OneIsland_Harbor_MapWarps, 0x0, 0x0

TwoIsland_JoyfulGameCorner_EventObjects:
	object_event 1, 30, 0, 5, 0, 5, 0, 1, 10, 17, 0, 0, 0, 0, 0, TwoIsland_JoyfulGameCorner_EventScript_17155F, 0, 0, 0
	object_event 2, 53, 0, 5, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 116, 0, 0
	object_event 3, 17, 0, 6, 0, 5, 0, 1, 9, 17, 0, 0, 0, 0, 0, TwoIsland_JoyfulGameCorner_EventScript_17160C, 117, 0, 0
	object_event 4, 25, 0, 4, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_JoyfulGameCorner_EventScript_171535, 0, 0, 0

TwoIsland_JoyfulGameCorner_MapWarps:
	warp_def 5, 8, 3, 0, 781

TwoIsland_JoyfulGameCorner_MapBGEvents:
	bg_event 1, 1, 0, 0, 0, TwoIsland_JoyfulGameCorner_EventScript_1BC2E7
	bg_event 0, 1, 0, 0, 0, TwoIsland_JoyfulGameCorner_EventScript_1BC2FC

gMapEvents_TwoIsland_JoyfulGameCorner::
	map_events TwoIsland_JoyfulGameCorner_EventObjects, TwoIsland_JoyfulGameCorner_MapWarps, 0x0, TwoIsland_JoyfulGameCorner_MapBGEvents

TwoIsland_House_EventObjects:
	object_event 1, 27, 0, 7, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_House_EventScript_171619, 0, 0, 0

TwoIsland_House_MapWarps:
	warp_def 4, 7, 3, 1, 781

gMapEvents_TwoIsland_House::
	map_events TwoIsland_House_EventObjects, TwoIsland_House_MapWarps, 0x0, 0x0

TwoIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_1F_EventScript_1717C3, 0, 0, 0
	object_event 2, 51, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_1F_EventScript_1717CC, 0, 0, 0
	object_event 3, 20, 0, 4, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_1F_EventScript_1717D5, 0, 0, 0

TwoIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 2, 781
	warp_def 1, 6, 4, 0, 8451

gMapEvents_TwoIsland_PokemonCenter_1F::
	map_events TwoIsland_PokemonCenter_1F_EventObjects, TwoIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

TwoIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

TwoIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 8450
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_TwoIsland_PokemonCenter_2F::
	map_events TwoIsland_PokemonCenter_2F_EventObjects, TwoIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

TwoIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, TwoIsland_Harbor_EventScript_171806, 0, 0, 0

TwoIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 3, 781

gMapEvents_TwoIsland_Harbor::
	map_events TwoIsland_Harbor_EventObjects, TwoIsland_Harbor_MapWarps, 0x0, 0x0

ThreeIsland_House1_EventObjects:
	object_event 1, 17, 0, 3, 0, 4, 0, 0, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_House1_EventScript_17181A, 118, 0, 0

ThreeIsland_House1_MapWarps:
	warp_def 4, 7, 3, 0, 782

ThreeIsland_House1_MapBGEvents:
	bg_event 2, 1, 0, 0, 0, ThreeIsland_House1_EventScript_171829

gMapEvents_ThreeIsland_House1::
	map_events ThreeIsland_House1_EventObjects, ThreeIsland_House1_MapWarps, 0x0, ThreeIsland_House1_MapBGEvents

ThreeIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 0, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_1F_EventScript_171841, 0, 0, 0
	object_event 2, 26, 0, 12, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_1F_EventScript_17185C, 0, 0, 0
	object_event 3, 22, 0, 3, 0, 4, 0, 3, 5, 17, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_1F_EventScript_171853, 0, 0, 0
	object_event 4, 62, 0, 11, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_1F_EventScript_17184A, 0, 0, 0

ThreeIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 1, 782
	warp_def 1, 6, 4, 0, 8706

gMapEvents_ThreeIsland_PokemonCenter_1F::
	map_events ThreeIsland_PokemonCenter_1F_EventObjects, ThreeIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

ThreeIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, ThreeIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

ThreeIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 8705
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_ThreeIsland_PokemonCenter_2F::
	map_events ThreeIsland_PokemonCenter_2F_EventObjects, ThreeIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

ThreeIsland_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_Mart_EventScript_17188D, 0, 0, 0
	object_event 2, 40, 0, 2, 0, 7, 0, 3, 7, 17, 0, 0, 0, 0, 0, ThreeIsland_Mart_EventScript_1718C4, 0, 0, 0
	object_event 3, 20, 0, 7, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, ThreeIsland_Mart_EventScript_1718CD, 0, 0, 0
	object_event 4, 18, 0, 6, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, ThreeIsland_Mart_EventScript_1718D6, 0, 0, 0

ThreeIsland_Mart_MapWarps:
	warp_def 4, 7, 3, 2, 782

gMapEvents_ThreeIsland_Mart::
	map_events ThreeIsland_Mart_EventObjects, ThreeIsland_Mart_MapWarps, 0x0, 0x0

ThreeIsland_House2_EventObjects:
	object_event 1, 26, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, ThreeIsland_House2_EventScript_1718F9, 0, 0, 0
	object_event 2, 25, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_House2_EventScript_1718E0, 0, 0, 0

ThreeIsland_House2_MapWarps:
	warp_def 4, 7, 3, 3, 782

gMapEvents_ThreeIsland_House2::
	map_events ThreeIsland_House2_EventObjects, ThreeIsland_House2_MapWarps, 0x0, 0x0

ThreeIsland_House3_EventObjects:
	object_event 1, 29, 0, 8, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, ThreeIsland_House3_EventScript_171903, 0, 0, 0

ThreeIsland_House3_MapWarps:
	warp_def 4, 7, 3, 4, 782

gMapEvents_ThreeIsland_House3::
	map_events ThreeIsland_House3_EventObjects, ThreeIsland_House3_MapWarps, 0x0, 0x0

ThreeIsland_House4_EventObjects:
	object_event 1, 30, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, ThreeIsland_House4_EventScript_17190D, 0, 0, 0
	object_event 2, 16, 0, 6, 0, 3, 0, 3, 2, 18, 0, 0, 0, 0, 0, ThreeIsland_House4_EventScript_171916, 0, 0, 0

ThreeIsland_House4_MapWarps:
	warp_def 4, 7, 3, 5, 782

gMapEvents_ThreeIsland_House4::
	map_events ThreeIsland_House4_EventObjects, ThreeIsland_House4_MapWarps, 0x0, 0x0

ThreeIsland_House5_EventObjects:
	object_event 1, 17, 0, 2, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, ThreeIsland_House5_EventScript_171920, 0, 0, 0

ThreeIsland_House5_MapWarps:
	warp_def 4, 7, 3, 6, 782

gMapEvents_ThreeIsland_House5::
	map_events ThreeIsland_House5_EventObjects, ThreeIsland_House5_MapWarps, 0x0, 0x0

FourIsland_PokemonDayCare_EventObjects:
	object_event 1, 35, 0, 2, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_PokemonDayCare_EventScript_171940, 0, 0, 0

FourIsland_PokemonDayCare_MapWarps:
	warp_def 4, 7, 3, 1, 783

gMapEvents_FourIsland_PokemonDayCare::
	map_events FourIsland_PokemonDayCare_EventObjects, FourIsland_PokemonDayCare_MapWarps, 0x0, 0x0

FourIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171BF9, 0, 0, 0
	object_event 2, 25, 0, 10, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C02, 0, 0, 0
	object_event 3, 31, 0, 5, 0, 5, 0, 3, 13, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C0B, 0, 0, 0
	object_event 4, 61, 0, 2, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_1F_EventScript_171C14, 0, 0, 0

FourIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 0, 783
	warp_def 1, 6, 4, 0, 8962

FourIsland_PokemonCenter_1F_MapBGEvents:
	bg_event 3, 1, 0, 1, 0, FourIsland_PokemonCenter_1F_EventScript_1ACDD0
	bg_event 2, 1, 0, 1, 0, FourIsland_PokemonCenter_1F_EventScript_1ACDD0

gMapEvents_FourIsland_PokemonCenter_1F::
	map_events FourIsland_PokemonCenter_1F_EventObjects, FourIsland_PokemonCenter_1F_MapWarps, 0x0, FourIsland_PokemonCenter_1F_MapBGEvents

FourIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

FourIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 8961
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_FourIsland_PokemonCenter_2F::
	map_events FourIsland_PokemonCenter_2F_EventObjects, FourIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

FourIsland_House1_EventObjects:
	object_event 1, 27, 0, 8, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, FourIsland_House1_EventScript_1C4D84, 0, 0, 0
	object_event 2, 27, 0, 9, 0, 3, 0, 3, 9, 17, 0, 0, 0, 0, 0, FourIsland_House1_EventScript_171C45, 0, 0, 0

FourIsland_House1_MapWarps:
	warp_def 4, 7, 3, 2, 783

gMapEvents_FourIsland_House1::
	map_events FourIsland_House1_EventObjects, FourIsland_House1_MapWarps, 0x0, 0x0

FourIsland_LoreleisHouse_EventObjects:
	object_event 1, 77, 0, 7, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C58, 140, 0, 0
	object_event 2, 131, 0, 0, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 3, 126, 0, 10, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 4, 120, 0, 9, 0, 3, 0, 0, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 5, 128, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 6, 129, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 7, 121, 0, 6, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 0, 0, 0
	object_event 8, 125, 0, 9, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 165, 0, 0
	object_event 9, 117, 0, 10, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 166, 0, 0
	object_event 10, 115, 0, 0, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 168, 0, 0
	object_event 11, 122, 0, 0, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 167, 0, 0
	object_event 12, 123, 0, 1, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 169, 0, 0
	object_event 13, 114, 0, 9, 0, 0, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 171, 0, 0
	object_event 14, 133, 0, 10, 0, 0, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 170, 0, 0
	object_event 15, 107, 0, 9, 0, 6, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_LoreleisHouse_EventScript_171C8D, 172, 0, 0

FourIsland_LoreleisHouse_MapWarps:
	warp_def 4, 7, 3, 4, 783

gMapEvents_FourIsland_LoreleisHouse::
	map_events FourIsland_LoreleisHouse_EventObjects, FourIsland_LoreleisHouse_MapWarps, 0x0, 0x0

FourIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, FourIsland_Harbor_EventScript_171C99, 0, 0, 0

FourIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 6, 783

gMapEvents_FourIsland_Harbor::
	map_events FourIsland_Harbor_EventObjects, FourIsland_Harbor_MapWarps, 0x0, 0x0

FourIsland_House2_EventObjects:
	object_event 1, 25, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, FourIsland_House2_EventScript_1B2938, 0, 0, 0

FourIsland_House2_MapWarps:
	warp_def 4, 7, 3, 5, 783

gMapEvents_FourIsland_House2::
	map_events FourIsland_House2_EventObjects, FourIsland_House2_MapWarps, 0x0, 0x0

FourIsland_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, FourIsland_Mart_EventScript_171CAE, 0, 0, 0
	object_event 2, 32, 0, 6, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, FourIsland_Mart_EventScript_1ACF46, 0, 0, 0
	object_event 3, 39, 0, 8, 0, 3, 0, 3, 2, 18, 0, 0, 0, 0, 0, FourIsland_Mart_EventScript_171CE8, 0, 0, 0

FourIsland_Mart_MapWarps:
	warp_def 4, 7, 3, 7, 783

gMapEvents_FourIsland_Mart::
	map_events FourIsland_Mart_EventObjects, FourIsland_Mart_MapWarps, 0x0, 0x0

FiveIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_1F_EventScript_171D00, 0, 0, 0
	object_event 2, 42, 0, 9, 0, 4, 0, 3, 7, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_1F_EventScript_171D12, 0, 0, 0
	object_event 3, 59, 0, 4, 0, 8, 0, 3, 5, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_1F_EventScript_171D09, 0, 0, 0
	object_event 4, 0, 0, 2, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_1F_EventScript_1ACF5F, 157, 0, 0
	object_event 5, 0, 0, 3, 0, 1, 0, 0, 76, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_1F_EventScript_1ACF5F, 157, 0, 0

FiveIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 1, 784
	warp_def 1, 6, 4, 0, 9217

gMapEvents_FiveIsland_PokemonCenter_1F::
	map_events FiveIsland_PokemonCenter_1F_EventObjects, FiveIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

FiveIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

FiveIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 9216
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_FiveIsland_PokemonCenter_2F::
	map_events FiveIsland_PokemonCenter_2F_EventObjects, FiveIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

FiveIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, FiveIsland_Harbor_EventScript_171D43, 0, 0, 0

FiveIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 0, 784

gMapEvents_FiveIsland_Harbor::
	map_events FiveIsland_Harbor_EventObjects, FiveIsland_Harbor_MapWarps, 0x0, 0x0

FiveIsland_House1_EventObjects:
	object_event 1, 31, 0, 10, 0, 2, 0, 3, 7, 17, 0, 0, 0, 0, 0, FiveIsland_House1_EventScript_171D57, 0, 0, 0

FiveIsland_House1_MapWarps:
	warp_def 4, 7, 3, 2, 784

gMapEvents_FiveIsland_House1::
	map_events FiveIsland_House1_EventObjects, FiveIsland_House1_MapWarps, 0x0, 0x0

FiveIsland_House2_EventObjects:
	object_event 1, 32, 0, 2, 0, 3, 0, 3, 2, 33, 0, 0, 0, 0, 0, FiveIsland_House2_EventScript_171D61, 0, 0, 0

FiveIsland_House2_MapWarps:
	warp_def 4, 7, 3, 3, 784

gMapEvents_FiveIsland_House2::
	map_events FiveIsland_House2_EventObjects, FiveIsland_House2_MapWarps, 0x0, 0x0

SixIsland_PokemonCenter_1F_EventObjects:
	object_event 1, 64, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_1F_EventScript_171E05, 0, 0, 0
	object_event 2, 72, 0, 5, 0, 5, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 152, 0, 0
	object_event 3, 56, 0, 13, 0, 3, 0, 3, 7, 17, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_1F_EventScript_171E0E, 0, 0, 0
	object_event 4, 33, 0, 12, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_1F_EventScript_171E17, 0, 0, 0

SixIsland_PokemonCenter_1F_MapWarps:
	warp_def 7, 8, 3, 1, 786
	warp_def 1, 6, 4, 0, 9473

gMapEvents_SixIsland_PokemonCenter_1F::
	map_events SixIsland_PokemonCenter_1F_EventObjects, SixIsland_PokemonCenter_1F_MapWarps, 0x0, 0x0

SixIsland_PokemonCenter_2F_EventObjects:
	object_event 1, 65, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_2F_EventScript_1A8CF6, 0, 0, 0
	object_event 2, 65, 0, 2, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_2F_EventScript_1A8CFC, 0, 0, 0
	object_event 3, 65, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_2F_EventScript_1A8D02, 0, 0, 0
	object_event 4, 69, 0, 1, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_PokemonCenter_2F_EventScript_1BB1D2, 112, 0, 0

SixIsland_PokemonCenter_2F_MapWarps:
	warp_def 1, 6, 4, 1, 9472
	warp_def 5, 1, 0, 0, 4
	warp_def 9, 1, 0, 0, 1

gMapEvents_SixIsland_PokemonCenter_2F::
	map_events SixIsland_PokemonCenter_2F_EventObjects, SixIsland_PokemonCenter_2F_MapWarps, 0x0, 0x0

SixIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, SixIsland_Harbor_EventScript_171E48, 0, 0, 0

SixIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 0, 786

gMapEvents_SixIsland_Harbor::
	map_events SixIsland_Harbor_EventObjects, SixIsland_Harbor_MapWarps, 0x0, 0x0

SixIsland_House_EventObjects:
	object_event 1, 32, 0, 7, 0, 5, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_House_EventScript_171E5C, 0, 0, 0

SixIsland_House_MapWarps:
	warp_def 4, 7, 3, 2, 786

gMapEvents_SixIsland_House::
	map_events SixIsland_House_EventObjects, SixIsland_House_MapWarps, 0x0, 0x0

SixIsland_Mart_EventObjects:
	object_event 1, 68, 0, 2, 0, 3, 0, 0, 10, 17, 0, 0, 0, 0, 0, SixIsland_Mart_EventScript_171E66, 0, 0, 0
	object_event 2, 35, 0, 8, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, SixIsland_Mart_EventScript_1ACFEF, 0, 0, 0
	object_event 3, 40, 0, 7, 0, 7, 0, 3, 2, 17, 0, 0, 0, 0, 0, SixIsland_Mart_EventScript_171EA0, 0, 0, 0

SixIsland_Mart_MapWarps:
	warp_def 4, 7, 3, 3, 786

gMapEvents_SixIsland_Mart::
	map_events SixIsland_Mart_EventObjects, SixIsland_Mart_MapWarps, 0x0, 0x0

ThreeIsland_Harbor_EventObjects:
	object_event 1, 108, 0, 8, 0, 9, 0, 0, 8, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 62, 0, 8, 0, 6, 0, 3, 7, 17, 0, 0, 0, 0, 0, ThreeIsland_Harbor_EventScript_171EAA, 0, 0, 0

ThreeIsland_Harbor_MapWarps:
	warp_def 8, 2, 3, 2, 817

gMapEvents_ThreeIsland_Harbor::
	map_events ThreeIsland_Harbor_EventObjects, ThreeIsland_Harbor_MapWarps, 0x0, 0x0

FiveIsland_ResortGorgeous_House_EventObjects:
	object_event 1, 28, 0, 4, 0, 4, 0, 3, 10, 17, 0, 0, 0, 0, 0, FiveIsland_ResortGorgeous_House_EventScript_171EBE, 149, 0, 0
	object_event 2, 61, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, FiveIsland_ResortGorgeous_House_EventScript_172062, 150, 0, 0

FiveIsland_ResortGorgeous_House_MapWarps:
	warp_def 4, 7, 3, 1, 822

FiveIsland_ResortGorgeous_House_MapBGEvents:
	bg_event 9, 1, 0, 1, 0, FiveIsland_ResortGorgeous_House_EventScript_1ACF2C
	bg_event 8, 1, 0, 1, 0, FiveIsland_ResortGorgeous_House_EventScript_1ACF2C

gMapEvents_FiveIsland_ResortGorgeous_House::
	map_events FiveIsland_ResortGorgeous_House_EventObjects, FiveIsland_ResortGorgeous_House_MapWarps, 0x0, FiveIsland_ResortGorgeous_House_MapBGEvents

TwoIsland_CapeBrink_House_EventObjects:
	object_event 1, 58, 0, 4, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, TwoIsland_CapeBrink_House_EventScript_1C4DEC, 0, 0, 0

TwoIsland_CapeBrink_House_MapWarps:
	warp_def 4, 7, 3, 0, 815

gMapEvents_TwoIsland_CapeBrink_House::
	map_events TwoIsland_CapeBrink_House_EventObjects, TwoIsland_CapeBrink_House_MapWarps, 0x0, 0x0

SixIsland_WaterPath_House1_EventObjects:
	object_event 1, 29, 0, 3, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_House1_EventScript_17206D, 0, 0, 0

SixIsland_WaterPath_House1_MapWarps:
	warp_def 3, 7, 3, 0, 828

SixIsland_WaterPath_House1_MapBGEvents:
	bg_event 9, 1, 0, 0, 0, SixIsland_WaterPath_House1_EventScript_172157

gMapEvents_SixIsland_WaterPath_House1::
	map_events SixIsland_WaterPath_House1_EventObjects, SixIsland_WaterPath_House1_MapWarps, 0x0, SixIsland_WaterPath_House1_MapBGEvents

SixIsland_WaterPath_House2_EventObjects:
	object_event 1, 25, 0, 7, 0, 4, 0, 3, 15, 17, 0, 0, 0, 0, 0, SixIsland_WaterPath_House2_EventScript_172179, 0, 0, 0

SixIsland_WaterPath_House2_MapWarps:
	warp_def 4, 7, 3, 1, 828

gMapEvents_SixIsland_WaterPath_House2::
	map_events SixIsland_WaterPath_House2_EventObjects, SixIsland_WaterPath_House2_MapWarps, 0x0, 0x0

SevenIsland_SevaultCanyon_House_EventObjects:
	object_event 1, 30, 0, 2, 0, 4, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_House_EventScript_172183, 0, 0, 0
	object_event 2, 117, 0, 4, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_House_EventScript_172242, 0, 0, 0
	object_event 3, 92, 0, 6, 0, 4, 0, 0, 8, 17, 0, 0, 0, 0, 0, SevenIsland_SevaultCanyon_House_EventScript_1BEDFC, 509, 0, 0

SevenIsland_SevaultCanyon_House_MapWarps:
	warp_def 4, 7, 3, 1, 832

gMapEvents_SevenIsland_SevaultCanyon_House::
	map_events SevenIsland_SevaultCanyon_House_EventObjects, SevenIsland_SevaultCanyon_House_MapWarps, 0x0, 0x0

