#ifndef GUARD_FIELDMAP_H
#define GUARD_FIELDMAP_H

#include "global.h"

#define NUM_TILES_IN_PRIMARY 640
#define NUM_TILES_TOTAL 1024
#define NUM_METATILES_IN_PRIMARY 640
#define NUM_METATILES_TOTAL 1024
#define NUM_PALS_IN_PRIMARY 7
#define NUM_PALS_TOTAL 13
#define MAX_MAP_DATA_SIZE 0x2800
#define VIRTUAL_MAP_SIZE (MAX_MAP_DATA_SIZE)

extern struct BackupMapLayout VMap;
extern const struct MapLayout Route1_Layout;

u32 MapGridGetMetatileIdAt(s32, s32);
u32 MapGridGetMetatileBehaviorAt(s16, s16);
u8 MapGridGetMetatileLayerTypeAt(s16 x, s16 y);
void MapGridSetMetatileIdAt(s32, s32, u16);
void MapGridSetMetatileEntryAt(s32, s32, u16);
u8 MapGridGetZCoordAt(s32 x, s32 y);
void GetCameraCoords(u16*, u16*);
bool8 MapGridIsImpassableAt(s32, s32);
s32 GetMapBorderIdAt(s32, s32);
bool32 CanCameraMoveInDirection(s32);
u32 GetBehaviorByMetatileIdAndMapLayout(const struct MapLayout *mapLayout, u16 metatile, u8 attr);
const struct MapHeader * mapconnection_get_mapheader(struct MapConnection * connection);
struct MapConnection * GetMapConnectionAtPos(s16 x, s16 y);
void Fieldmap_ApplyGlobalTintToPaletteSlot(u8 slot, u8 count);

void save_serialize_map(void);
u32 GetMetatileAttributeFromRawMetatileBehavior(u32 original, u8 bit);
u32 MapGridGetMetatileAttributeAt(s16 x, s16 y, u8 attr);
void MapGridSetMetatileImpassabilityAt(s32 x, s32 y, bool32 arg2);
bool8 CameraMove(s32 x, s32 y);
void copy_map_tileset1_tileset2_to_vram(struct MapLayout const * mapLayout);
void apply_map_tileset1_tileset2_palette(struct MapLayout const * mapLayout);
void InitMap(void);
void copy_map_tileset2_to_vram_2(const struct MapLayout * mapLayout);
void apply_map_tileset2_palette(const struct MapLayout * mapLayout);
void InitMapFromSavedGame(void);
void copy_map_tileset1_to_vram(const struct MapLayout *mapLayout);
void copy_map_tileset2_to_vram(const struct MapLayout *mapLayout);
void GetCameraFocusCoords(u16 *x, u16 *y);
void SetCameraFocusCoords(u16 x, u16 y);

#endif //GUARD_FIELDMAP_H
