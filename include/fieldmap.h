#ifndef GUARD_FIELDMAP_H
#define GUARD_FIELDMAP_H

#include "global.h"

#define NUM_TILES_IN_PRIMARY 640
#define NUM_TILES_TOTAL 1024
#define NUM_METATILES_IN_PRIMARY 640
#define NUM_METATILES_TOTAL 1024
#define NUM_PALS_IN_PRIMARY 7
#define NUM_PALS_TOTAL 13
#define VIRTUAL_MAP_SIZE 0x2800

extern struct BackupMapLayout VMap;
extern const struct MapLayout Route1_Layout;

u32 MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int, int);
u8 MapGridGetMetatileLayerTypeAt(s16 x, s16 y);
void MapGridSetMetatileIdAt(int, int, u16);
void MapGridSetMetatileEntryAt(int, int, u16);
u8 MapGridGetZCoordAt(s32 x, s32 y);
void GetCameraCoords(u16*, u16*);
bool8 MapGridIsImpassableAt(s32, s32);
s32 GetMapBorderIdAt(s32, s32);
bool32 CanCameraMoveInDirection(s32);
u32 GetBehaviorByMetatileIdAndMapLayout(struct MapLayout *mapLayout, u16 metatile, u8 attr);
const struct MapHeader * mapconnection_get_mapheader(struct MapConnection * connection);
struct MapConnection * GetMapConnectionAtPos(s16 x, s16 y);
void sub_8059948(u8 a0, u8 a1);

void save_serialize_map(void);
u32 GetMetatileAttributeFromRawMetatileBehavior(u32 original, u8 bit);
u32 MapGridGetMetatileAttributeAt(s16 x, s16 y, u8 attr);
void MapGridSetMetatileImpassabilityAt(s32 x, s32 y, bool32 arg2);

#endif //GUARD_FIELDMAP_H
