#ifndef GUARD_REGION_MAP_H
#define GUARD_REGION_MAP_H

#include "global.h"
#include "bg.h"

enum {
    REGIONMAP_TYPE_NORMAL,
    REGIONMAP_TYPE_WALL,
    REGIONMAP_TYPE_FLY,
    REGIONMAP_TYPE_COUNT
};

enum RegionMapType
{
    REGION_MAP_HOENN,
    REGION_MAP_KANTO,
    REGION_MAP_SEVII123,
    REGION_MAP_SEVII45,
    REGION_MAP_SEVII67
};

struct RegionMapInfo
{
    const u32 *dexMapTilemap;
    const u32 *dexMapGfx;
    const u16 *dexMapPalette;
    const u32 *regionMapTilemap;
    const u32 *regionMapGfx;
    const u16 *regionMapPalette;
    u16 dexMapPaletteSize;
};

struct RegionMapLocation
{
    u8 x;
    u8 y;
    u8 width;
    u8 height;
    const u8 *name;
};

u8 *GetMapName(u8 *dest, u16 mapsec, u16 fill);
u8 *GetMapNameGeneric(u8 *dest, u16 mapsec);
u8 *GetMapNameGeneric_(u8 *dest, u16 mapsec);
void InitRegionMapWithExitCB(u8 type, void (*callback)(void));
void CB2_OpenFlyMap(void);

extern const struct RegionMapLocation gRegionMapEntries[];
extern const struct RegionMapInfo gRegionMapInfos[];

#endif // GUARD_REGION_MAP_H
