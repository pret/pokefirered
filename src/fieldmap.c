#include "global.h"
#include "overworld.h"
#include "script.h"
#include "fieldmap.h"

struct ConnectionFlags
{
    u8 south:1;
    u8 north:1;
    u8 west:1;
    u8 east:1;
};

void sub_8058A00(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void mapheader_copy_mapdata_of_adjacent_maps(struct MapHeader *mapHeader);
void fillSouthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillNorthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillWestConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillEastConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
u32 sub_8059080(struct MapData *mapData, u16 metatileId, u8 z);
void sub_80591C4(void);

struct BackupMapData VMap;
EWRAM_DATA u16 gBackupMapData[VIRTUAL_MAP_SIZE] = {};
EWRAM_DATA struct MapHeader gMapHeader = {};
EWRAM_DATA struct ConnectionFlags gMapConnectionFlags = {};

const struct ConnectionFlags sDummyConnectionFlags = {};

const u32 gUnknown_8352EF0[] = {
    0x1ff,
    0x3e00,
    0x3c000,
    0xfc0000,
    0x7000000,
    0x18000000,
    0x60000000,
    0x80000000
};

const u8 gUnknown_8352F10[] = {
    0,
    9,
    14,
    18,
    24,
    27,
    29,
    31
};

const struct MapHeader * mapconnection_get_mapheader(struct MapConnection * connection)
{
    return get_mapheader_by_bank_and_number(connection->mapGroup, connection->mapNum);
}

void not_trainer_hill_battle_pyramid(void)
{
    sub_8058A00(&gMapHeader);
    mapheader_run_script_with_tag_x1();
}

void sub_80589E8(void)
{
    sub_8058A00(&gMapHeader);
    sub_80591C4();
    mapheader_run_script_with_tag_x1();
}

void sub_8058A00(struct MapHeader * mapHeader)
{
    const struct MapData * mapData = mapHeader->mapData;
    CpuFastFill(0x03FF03FF, gBackupMapData, sizeof(gBackupMapData));
    VMap.map = gBackupMapData;
    VMap.Xsize = mapData->width + 15;
    VMap.Ysize = mapData->height + 14;
    AGB_ASSERT_EX(VMap.Xsize * VMap.Ysize <= VIRTUAL_MAP_SIZE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/fieldmap.c", 158);
    map_copy_with_padding(mapData->map, mapData->width, mapData->height);
    mapheader_copy_mapdata_of_adjacent_maps(mapHeader);
}

void map_copy_with_padding(u16 *map, u16 width, u16 height)
{
    s32 y;
    u16 *dest = VMap.map;
    dest += VMap.Xsize * 7 + 7;

    for (y = 0; y < height; y++)
    {
        CpuCopy16(map, dest, width * sizeof(u16));
        dest += width + 15;
        map += width;
    }
}

void mapheader_copy_mapdata_of_adjacent_maps(struct MapHeader *mapHeader)
{
    s32 count;
    struct MapConnection *connection;
    s32 i;

    gMapConnectionFlags = sDummyConnectionFlags;

    /*
     * This null pointer check is new to FireRed.  It was kept in
     * Emerald, with the above struct assignment moved to after
     * this check.
     */
    if (mapHeader->connections)
    {
        count = mapHeader->connections->count;
        connection = mapHeader->connections->connections;
        // Emerald puts this line here instead:
        // gMapConnectionFlags = sDummyConnectionFlags;
        for (i = 0; i < count; i++, connection++)
        {
            struct MapHeader const *cMap = mapconnection_get_mapheader(connection);
            u32 offset = connection->offset;
            switch (connection->direction)
            {
                case CONNECTION_SOUTH:
                    fillSouthConnection(mapHeader, cMap, offset);
                    gMapConnectionFlags.south = 1;
                    break;
                case CONNECTION_NORTH:
                    fillNorthConnection(mapHeader, cMap, offset);
                    gMapConnectionFlags.north = 1;
                    break;
                case CONNECTION_WEST:
                    fillWestConnection(mapHeader, cMap, offset);
                    gMapConnectionFlags.west = 1;
                    break;
                case CONNECTION_EAST:
                    fillEastConnection(mapHeader, cMap, offset);
                    gMapConnectionFlags.east = 1;
                    break;
            }
        }
    }
}

void sub_8058B54(s32 x, s32 y, const struct MapHeader *connectedMapHeader, s32 x2, s32 y2, s32 width, s32 height)
{
    s32 i;
    u16 *src;
    u16 *dest;
    s32 mapWidth;

    mapWidth = connectedMapHeader->mapData->width;
    src = &connectedMapHeader->mapData->map[mapWidth * y2 + x2];
    dest = &VMap.map[VMap.Xsize * y + x];

    for (i = 0; i < height; i++)
    {
        CpuCopy16(src, dest, width * 2);
        dest += VMap.Xsize;
        src += mapWidth;
    }
}

void fillSouthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    s32 x, y;
    s32 x2;
    s32 width;
    s32 cWidth;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapData->width;
        x = offset + 7;
        y = mapHeader->mapData->height + 7;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < VMap.Xsize)
            {
                width = x;
            }
            else
            {
                width = VMap.Xsize;
            }
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < VMap.Xsize)
            {
                width = cWidth;
            }
            else
            {
                width = VMap.Xsize - x;
            }
        }

        sub_8058B54(
            x, y,
            connectedMapHeader,
            x2, /*y2*/ 0,
            width, /*height*/ 7);
    }
}

void fillNorthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    s32 x;
    s32 x2, y2;
    s32 width;
    s32 cWidth, cHeight;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapData->width;
        cHeight = connectedMapHeader->mapData->height;
        x = offset + 7;
        y2 = cHeight - 7;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < VMap.Xsize)
            {
                width = x;
            }
            else
            {
                width = VMap.Xsize;
            }
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < VMap.Xsize)
            {
                width = cWidth;
            }
            else
            {
                width = VMap.Xsize - x;
            }
        }

        sub_8058B54(
            x, /*y*/ 0,
            connectedMapHeader,
            x2, y2,
            width, /*height*/ 7);

    }
}

void fillWestConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    s32 y;
    s32 x2, y2;
    s32 height;
    s32 cWidth, cHeight;
    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapData->width;
        cHeight = connectedMapHeader->mapData->height;
        y = offset + 7;
        x2 = cWidth - 7;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < VMap.Ysize)
            {
                height = y + cHeight;
            }
            else
            {
                height = VMap.Ysize;
            }
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < VMap.Ysize)
            {
                height = cHeight;
            }
            else
            {
                height = VMap.Ysize - y;
            }
        }

        sub_8058B54(
            /*x*/ 0, y,
            connectedMapHeader,
            x2, y2,
            /*width*/ 7, height);
    }
}

void fillEastConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    s32 x, y;
    s32 y2;
    s32 height;
    s32 cHeight;
    if (connectedMapHeader)
    {
        cHeight = connectedMapHeader->mapData->height;
        x = mapHeader->mapData->width + 7;
        y = offset + 7;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < VMap.Ysize)
            {
                height = y + cHeight;
            }
            else
            {
                height = VMap.Ysize;
            }
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < VMap.Ysize)
            {
                height = cHeight;
            }
            else
            {
                height = VMap.Ysize - y;
            }
        }

        sub_8058B54(
            x, y,
            connectedMapHeader,
            /*x2*/ 0, y2,
            /*width*/ 8, height);
    }
}

union Block
{
    struct
    {
        u16 block:10;
        u16 collision:2;
        u16 elevation:4;
    } block;
    u16 value;
};

#define MapGridGetBorderTileAt(x, y) ({                        \
    u16 block;                                                 \
    s32 xprime;                                                \
    s32 yprime;                                                \
                                                               \
    struct MapData *mapData = gMapHeader.mapData;              \
                                                               \
    xprime = x - 7;                                            \
    xprime += 8 * mapData->unk18;                              \
    xprime %= mapData->unk18;                                  \
                                                               \
    yprime = y - 7;                                            \
    yprime += 8 * mapData->unk19;                              \
    yprime %= mapData->unk19;                                  \
                                                               \
    block = mapData->border[xprime + yprime * mapData->unk18]; \
    block |= 0xC00;                                            \
    block;                                                     \
})

#define MapGridGetBorderTileAt2(x, y) ({                               \
    u16 block;                                                         \
    s32 xprime;                                                        \
    s32 yprime;                                                        \
                                                                       \
    struct MapData *mapData = gMapHeader.mapData;                      \
                                                                       \
    xprime = x - 7;                                                    \
    xprime += 8 * mapData->unk18;                                      \
    xprime %= mapData->unk18;                                          \
                                                                       \
    yprime = y - 7;                                                    \
    yprime += 8 * mapData->unk19;                                      \
    yprime %= mapData->unk19;                                          \
                                                                       \
    block = mapData->border[xprime + yprime * mapData->unk18] | 0xC00; \
    block;                                                             \
})

#define MapGridGetTileAt(x, y) ({              \
    u16 block;                                 \
    if (x >= 0 && x < VMap.Xsize               \
        && y >= 0 && y < VMap.Ysize)           \
        block = VMap.map[x + VMap.Xsize * y];  \
    else                                       \
        block = MapGridGetBorderTileAt2(x, y); \
    block;                                     \
})

u8 MapGridGetZCoordAt(s32 x, s32 y)
{
    u16 block = MapGridGetTileAt(x, y);

    if (block == 0x3ff)
    {
        return 0;
    }

    return block >> 12;
}

u8 MapGridIsImpassableAt(s32 x, s32 y)
{

    u16 block = MapGridGetTileAt(x, y);

    if (block == 0x3ff)
    {
        return 1;
    }

    return (block & 0xc00) >> 10;
}

u32 MapGridGetMetatileIdAt(s32 x, s32 y)
{
    u16 block = MapGridGetTileAt(x, y);

    if (block == 0x3FF)
    {
        return MapGridGetBorderTileAt(x, y) & 0x3FF;
    }
    return block & 0x3FF;
}

u32 sub_8058F1C(u32 original, u8 bit)
{
    if (bit >= 8)
        return original;

    return (original & gUnknown_8352EF0[bit]) >> gUnknown_8352F10[bit];
}

u32 sub_8058F48(s16 x, s16 y, u8 z)
{
    u16 metatileId = MapGridGetMetatileIdAt(x, y);
    return sub_8059080(gMapHeader.mapData, metatileId, z);
}

u32 MapGridGetMetatileBehaviorAt(s32 x, s32 y)
{
    return sub_8058F48(x, y, 0);
}

u8 MapGridGetMetatileLayerTypeAt(s32 x, s32 y)
{
    return sub_8058F48(x, y, 6);
}

void MapGridSetMetatileIdAt(s32 x, s32 y, u16 metatile)
{
    int i;
    if (x >= 0 && x < VMap.Xsize
        && y >= 0 && y < VMap.Ysize)
    {
        i = x + y * VMap.Xsize;
        VMap.map[i] = (VMap.map[i] & 0xf000) | (metatile & 0xfff);
    }
}

void MapGridSetMetatileEntryAt(s32 x, s32 y, u16 metatile)
{
    int i;
    if (x >= 0 && x < VMap.Xsize
        && y >= 0 && y < VMap.Ysize)
    {
        i = x + VMap.Xsize * y;
        VMap.map[i] = metatile;
    }
}

void sub_8059024(s32 x, s32 y, bool32 arg2)
{
    if (x >= 0 && x < VMap.Xsize
        && y >= 0 && y < VMap.Ysize)
    {
        if (arg2)
        {
            VMap.map[x + VMap.Xsize * y] |= 0x0C00;
        }
        else
        {
            VMap.map[x + VMap.Xsize * y] &= ~0x0C00;
        }
    }
}
