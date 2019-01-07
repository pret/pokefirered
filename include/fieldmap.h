#ifndef GUARD_FIELDMAP_H
#define GUARD_FIELDMAP_H

#include "global.h"

#define NUM_TILES_IN_PRIMARY 512
#define NUM_TILES_TOTAL 1024
#define NUM_METATILES_IN_PRIMARY 512
#define NUM_METATILES_TOTAL 1024
#define NUM_PALS_IN_PRIMARY 6
#define NUM_PALS_TOTAL 13
#define VIRTUAL_MAP_SIZE 0x2800

extern struct MapCoords {
    int width;
    int height;
} gUnknown_03005DC0;

u32 MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int, int);
void MapGridSetMetatileIdAt(int, int, u16);
void MapGridSetMetatileEntryAt(int, int, u16);
void GetCameraCoords(u16*, u16*);
bool8 MapGridIsImpassableAt(s32, s32);
s32 GetMapBorderIdAt(s32, s32);
bool32 CanCameraMoveInDirection(u8);
u32 GetBehaviorByMetatileIdAndMapData(struct MapData *mapData, u16 metatile, u8 attr);

#endif //GUARD_FIELDMAP_H
