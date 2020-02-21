#include "global.h"
#include "bg.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "fieldmap.h"

struct ConnectionFlags
{
    u8 south:1;
    u8 north:1;
    u8 west:1;
    u8 east:1;
};

static void InitMapLayoutData(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void mapheader_copy_mapdata_of_adjacent_maps(struct MapHeader *mapHeader);
void fillSouthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillNorthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillWestConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void fillEastConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
void LoadSavedMapView(void);
struct MapConnection *sub_8059600(u8 direction, s32 x, s32 y);
bool8 sub_8059658(u8 direction, s32 x, s32 y, struct MapConnection *connection);
bool8 sub_80596BC(s32 x, s32 src_width, s32 dest_width, s32 offset);

struct BackupMapLayout VMap;
EWRAM_DATA u16 gBackupMapLayout[VIRTUAL_MAP_SIZE] = {};
EWRAM_DATA struct MapHeader gMapHeader = {};
EWRAM_DATA struct Camera gCamera = {};
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
    return Overworld_GetMapHeaderByGroupAndId(connection->mapGroup, connection->mapNum);
}

void InitMap(void)
{
    InitMapLayoutData(&gMapHeader);
    RunOnLoadMapScript();
}

void InitMapFromSavedGame(void)
{
    InitMapLayoutData(&gMapHeader);
    LoadSavedMapView();
    RunOnLoadMapScript();
}

static void InitMapLayoutData(struct MapHeader * mapHeader)
{
    const struct MapLayout * mapLayout = mapHeader->mapLayout;
    CpuFastFill(0x03FF03FF, gBackupMapLayout, sizeof(gBackupMapLayout));
    VMap.map = gBackupMapLayout;
    VMap.Xsize = mapLayout->width + 15;
    VMap.Ysize = mapLayout->height + 14;
    AGB_ASSERT_EX(VMap.Xsize * VMap.Ysize <= VIRTUAL_MAP_SIZE, ABSPATH("fieldmap.c"), 158);
    map_copy_with_padding(mapLayout->map, mapLayout->width, mapLayout->height);
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

    mapWidth = connectedMapHeader->mapLayout->width;
    src = &connectedMapHeader->mapLayout->map[mapWidth * y2 + x2];
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
        cWidth = connectedMapHeader->mapLayout->width;
        x = offset + 7;
        y = mapHeader->mapLayout->height + 7;
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
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
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
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
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
        cHeight = connectedMapHeader->mapLayout->height;
        x = mapHeader->mapLayout->width + 7;
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
    struct MapLayout *mapLayout = gMapHeader.mapLayout;              \
                                                               \
    xprime = x - 7;                                            \
    xprime += 8 * mapLayout->unk18;                              \
    xprime %= mapLayout->unk18;                                  \
                                                               \
    yprime = y - 7;                                            \
    yprime += 8 * mapLayout->unk19;                              \
    yprime %= mapLayout->unk19;                                  \
                                                               \
    block = mapLayout->border[xprime + yprime * mapLayout->unk18]; \
    block |= 0xC00;                                            \
    block;                                                     \
})

#define MapGridGetBorderTileAt2(x, y) ({                               \
    u16 block;                                                         \
    s32 xprime;                                                        \
    s32 yprime;                                                        \
                                                                       \
    struct MapLayout *mapLayout = gMapHeader.mapLayout;                      \
                                                                       \
    xprime = x - 7;                                                    \
    xprime += 8 * mapLayout->unk18;                                      \
    xprime %= mapLayout->unk18;                                          \
                                                                       \
    yprime = y - 7;                                                    \
    yprime += 8 * mapLayout->unk19;                                      \
    yprime %= mapLayout->unk19;                                          \
                                                                       \
    block = mapLayout->border[xprime + yprime * mapLayout->unk18] | 0xC00; \
    block;                                                             \
})

#define AreCoordsWithinMapGridBounds(x, y) (x >= 0 && x < VMap.Xsize && y >= 0 && y < VMap.Ysize)

#define MapGridGetTileAt(x, y) (AreCoordsWithinMapGridBounds(x, y) ? VMap.map[x + VMap.Xsize * y] : MapGridGetBorderTileAt2(x, y))

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
    return GetBehaviorByMetatileIdAndMapLayout(gMapHeader.mapLayout, metatileId, z);
}

u32 MapGridGetMetatileBehaviorAt(s32 x, s32 y)
{
    return sub_8058F48(x, y, 0);
}

u8 MapGridGetMetatileLayerTypeAt(s16 x, s16 y)
{
    return sub_8058F48(x, y, 6);
}

void MapGridSetMetatileIdAt(s32 x, s32 y, u16 metatile)
{
    s32 i;
    if (x >= 0 && x < VMap.Xsize
        && y >= 0 && y < VMap.Ysize)
    {
        i = x + y * VMap.Xsize;
        VMap.map[i] = (VMap.map[i] & 0xf000) | (metatile & 0xfff);
    }
}

void MapGridSetMetatileEntryAt(s32 x, s32 y, u16 metatile)
{
    s32 i;
    if (x >= 0 && x < VMap.Xsize
        && y >= 0 && y < VMap.Ysize)
    {
        i = x + VMap.Xsize * y;
        VMap.map[i] = metatile;
    }
}

void MapGridSetMetatileImpassabilityAt(s32 x, s32 y, bool32 arg2)
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

u32 GetBehaviorByMetatileIdAndMapLayout(struct MapLayout *mapLayout, u16 metatile, u8 attr)
{
    u32 * attributes;

    if (metatile < NUM_METATILES_IN_PRIMARY)
    {
        attributes = mapLayout->primaryTileset->metatileAttributes;
        return sub_8058F1C(attributes[metatile], attr);
    }
    else if (metatile < 0x400)
    {
        attributes = mapLayout->secondaryTileset->metatileAttributes;
        return sub_8058F1C(attributes[metatile - NUM_METATILES_IN_PRIMARY], attr);
    }
    else
    {
        return 0xFF;
    }
}

void save_serialize_map(void)
{
    s32 i, j;
    s32 x, y;
    u16 *mapView;
    s32 width;
    mapView = gSaveBlock2Ptr->mapView;
    width = VMap.Xsize;
    x = gSaveBlock1Ptr->pos.x;
    y = gSaveBlock1Ptr->pos.y;
    for (i = y; i < y + 14; i++)
    {
        for (j = x; j < x + 15; j++)
        {
            *mapView++ = gBackupMapLayout[width * i + j];
        }
    }
}

bool32 SavedMapViewIsEmpty(void)
{
    u16 i;
    u32 marker = 0;

    // BUG: This loop extends past the bounds of the mapView array. Its size is only 0x100.
    for (i = 0; i < 0x200; i++)
        marker |= gSaveBlock2Ptr->mapView[i];

    if (marker == 0)
        return TRUE;
    else
        return FALSE;
}

void ClearSavedMapView(void)
{
    CpuFill16(0, gSaveBlock2Ptr->mapView, sizeof(gSaveBlock2Ptr->mapView));
}

void LoadSavedMapView(void)
{
    s32 i, j;
    s32 x, y;
    u16 *mapView;
    s32 width;
    mapView = gSaveBlock2Ptr->mapView;
    if (!SavedMapViewIsEmpty())
    {
        width = VMap.Xsize;
        x = gSaveBlock1Ptr->pos.x;
        y = gSaveBlock1Ptr->pos.y;
        for (i = y; i < y + 14; i++)
        {
            for (j = x; j < x + 15; j++)
            {
                gBackupMapLayout[j + width * i] = *mapView;
                mapView++;
            }
        }
        ClearSavedMapView();
    }
}

void sub_8059250(u8 a1)
{
    s32 width;
    u16 *mapView;
    s32 x0, y0;
    s32 x2, y2;
    u16 *src, *dest;
    s32 srci, desti;
    s32 r9, r8;
    s32 x, y;
    s32 i, j;
    mapView = gSaveBlock2Ptr->mapView;
    width = VMap.Xsize;
    r9 = 0;
    r8 = 0;
    x0 = gSaveBlock1Ptr->pos.x;
    y0 = gSaveBlock1Ptr->pos.y;
    x2 = 15;
    y2 = 14;
    switch (a1)
    {
        case CONNECTION_NORTH:
            y0 += 1;
            y2 = 13;
            break;
        case CONNECTION_SOUTH:
            r8 = 1;
            y2 = 13;
            break;
        case CONNECTION_WEST:
            x0 += 1;
            x2 = 14;
            break;
        case CONNECTION_EAST:
            r9 = 1;
            x2 = 14;
            break;
    }
    for (y = 0; y < y2; y++)
    {
        i = 0;
        j = 0;
        for (x = 0; x < x2; x++)
        {
            desti = width * (y + y0);
            srci = (y + r8) * 15 + r9;
            src = &mapView[srci + i];
            dest = &gBackupMapLayout[x0 + desti + j];
            *dest = *src;
            i++;
            j++;
        }
    }
    ClearSavedMapView();
}

s32 GetMapBorderIdAt(s32 x, s32 y)
{
    if (MapGridGetTileAt(x, y) == 0x3FF)
    {
        return -1;
    }

    if (x >= VMap.Xsize - 8)
    {
        if (!gMapConnectionFlags.east)
        {
            return -1;
        }
        return CONNECTION_EAST;
    }

    if (x < 7)
    {
        if (!gMapConnectionFlags.west)
        {
            return -1;
        }
        return CONNECTION_WEST;
    }

    if (y >= VMap.Ysize - 7)
    {
        if (!gMapConnectionFlags.south)
        {
            return -1;
        }
        return CONNECTION_SOUTH;
    }

    if (y < 7)
    {
        if (!gMapConnectionFlags.north)
        {
            return -1;
        }
        return CONNECTION_NORTH;
    }

    return 0;
}

s32 GetPostCameraMoveMapBorderId(s32 x, s32 y)
{
    return GetMapBorderIdAt(7 + gSaveBlock1Ptr->pos.x + x, 7 + gSaveBlock1Ptr->pos.y + y);
}

bool32 CanCameraMoveInDirection(s32 direction)
{
    s32 x, y;
    
    x = gSaveBlock1Ptr->pos.x + 7 + gDirectionToVectors[direction].x;
    y = gSaveBlock1Ptr->pos.y + 7 + gDirectionToVectors[direction].y;
    if (GetMapBorderIdAt(x, y) == -1)
    {
        return FALSE;
    }
    return TRUE;
}

void sub_80594AC(struct MapConnection *connection, int direction, s32 x, s32 y)
{
    struct MapHeader const *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (direction)
    {
        case CONNECTION_EAST:
            gSaveBlock1Ptr->pos.x = -x;
            gSaveBlock1Ptr->pos.y -= connection->offset;
            break;
        case CONNECTION_WEST:
            gSaveBlock1Ptr->pos.x = mapHeader->mapLayout->width;
            gSaveBlock1Ptr->pos.y -= connection->offset;
            break;
        case CONNECTION_SOUTH:
            gSaveBlock1Ptr->pos.x -= connection->offset;
            gSaveBlock1Ptr->pos.y = -y;
            break;
        case CONNECTION_NORTH:
            gSaveBlock1Ptr->pos.x -= connection->offset;
            gSaveBlock1Ptr->pos.y = mapHeader->mapLayout->height;
            break;
    }
}

bool8 CameraMove(s32 x, s32 y)
{
    u32 direction;
    struct MapConnection *connection;
    s32 old_x, old_y;
    gCamera.active = FALSE;
    direction = GetPostCameraMoveMapBorderId(x, y);
    if (direction + 1 <= 1)
    {
        gSaveBlock1Ptr->pos.x += x;
        gSaveBlock1Ptr->pos.y += y;
    }
    else
    {
        save_serialize_map();
        old_x = gSaveBlock1Ptr->pos.x;
        old_y = gSaveBlock1Ptr->pos.y;
        connection = sub_8059600(direction, gSaveBlock1Ptr->pos.x, gSaveBlock1Ptr->pos.y);
        sub_80594AC(connection, direction, x, y);
        sub_8055864(connection->mapGroup, connection->mapNum);
        gCamera.active = TRUE;
        gCamera.x = old_x - gSaveBlock1Ptr->pos.x;
        gCamera.y = old_y - gSaveBlock1Ptr->pos.y;
        gSaveBlock1Ptr->pos.x += x;
        gSaveBlock1Ptr->pos.y += y;
        sub_8059250(direction);
    }
    return gCamera.active;
}

struct MapConnection *sub_8059600(u8 direction, s32 x, s32 y)
{
    s32 count;
    struct MapConnection *connection;
    s32 i;
    count = gMapHeader.connections->count;
    connection = gMapHeader.connections->connections;
    for (i = 0; i < count; i++, connection++)
    {
        if (connection->direction == direction && sub_8059658(direction, x, y, connection) == TRUE)
            return connection;
    }
    return NULL;

}

bool8 sub_8059658(u8 direction, s32 x, s32 y, struct MapConnection *connection)
{
    struct MapHeader const *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (direction)
    {
        case CONNECTION_SOUTH:
        case CONNECTION_NORTH:
            return sub_80596BC(x, gMapHeader.mapLayout->width, mapHeader->mapLayout->width, connection->offset);
        case CONNECTION_WEST:
        case CONNECTION_EAST:
            return sub_80596BC(y, gMapHeader.mapLayout->height, mapHeader->mapLayout->height, connection->offset);
    }
    return FALSE;
}

bool8 sub_80596BC(s32 x, s32 src_width, s32 dest_width, s32 offset)
{
    s32 offset2 = max(offset, 0);

    if (dest_width + offset < src_width)
        src_width = dest_width + offset;

    if (offset2 <= x && x <= src_width)
        return TRUE;

    return FALSE;
}

bool32 sub_80596E8(s32 x, s32 width)
{
    if (x >= 0 && x < width)
        return TRUE;

    return FALSE;
}

s32 sub_80596FC(struct MapConnection *connection, s32 x, s32 y)
{
    struct MapHeader const *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (connection->direction)
    {
        case CONNECTION_SOUTH:
        case CONNECTION_NORTH:
            return sub_80596E8(x - connection->offset, mapHeader->mapLayout->width);
        case CONNECTION_WEST:
        case CONNECTION_EAST:
            return sub_80596E8(y - connection->offset, mapHeader->mapLayout->height);
    }
    return FALSE;
}

struct MapConnection *GetMapConnectionAtPos(s16 x, s16 y)
{
    s32 count;
    struct MapConnection *connection;
    s32 i;
    u8 direction;
    if (!gMapHeader.connections)
    {
        return NULL;
    }
    else
    {
        count = gMapHeader.connections->count;
        connection = gMapHeader.connections->connections;
        for (i = 0; i < count; i++, connection++)
        {
            direction = connection->direction;
            if ((direction == CONNECTION_DIVE || direction == CONNECTION_EMERGE)
                || (direction == CONNECTION_NORTH && y > 6)
                || (direction == CONNECTION_SOUTH && y < gMapHeader.mapLayout->height + 7)
                || (direction == CONNECTION_WEST && x > 6)
                || (direction == CONNECTION_EAST && x < gMapHeader.mapLayout->width + 7))
            {
                continue;
            }
            if (sub_80596FC(connection, x - 7, y - 7) == TRUE)
            {
                return connection;
            }
        }
    }
    return NULL;
}

void SetCameraFocusCoords(u16 x, u16 y)
{
    gSaveBlock1Ptr->pos.x = x - 7;
    gSaveBlock1Ptr->pos.y = y - 7;
}

void GetCameraFocusCoords(u16 *x, u16 *y)
{
    *x = gSaveBlock1Ptr->pos.x + 7;
    *y = gSaveBlock1Ptr->pos.y + 7;
}

void SetCameraCoords(u16 x, u16 y)
{
    gSaveBlock1Ptr->pos.x = x;
    gSaveBlock1Ptr->pos.y = y;
}

void GetCameraCoords(u16 *x, u16 *y)
{
    *x = gSaveBlock1Ptr->pos.x;
    *y = gSaveBlock1Ptr->pos.y;
}
void copy_tileset_patterns_to_vram(struct Tileset const *tileset, u16 numTiles, u16 offset)
{
    if (tileset)
    {
        if (!tileset->isCompressed)
            LoadBgTiles(2, tileset->tiles, numTiles * 32, offset);
        else
            DecompressAndCopyTileDataToVram2(2, tileset->tiles, numTiles * 32, offset, 0);
    }
}

void copy_tileset_patterns_to_vram2(struct Tileset const *tileset, u16 numTiles, u16 offset)
{
    if (tileset)
    {
        if (!tileset->isCompressed)
            LoadBgTiles(2, tileset->tiles, numTiles * 32, offset);
        else
            DecompressAndLoadBgGfxUsingHeap2(2, tileset->tiles, numTiles * 32, offset, 0);
    }
}

void sub_80598CC(u16 a0, u16 a1)
{
    switch (gUnknown_2036E28)
    {
        case 0:
            return;
        case 1:
            TintPalette_GrayScale(gPlttBufferUnfaded + a0, a1);
            break;
        case 2:
            TintPalette_SepiaTone(gPlttBufferUnfaded + a0, a1);
            break;
        case 3:
            sub_8111F38(a0, a1);
            TintPalette_GrayScale(gPlttBufferUnfaded + a0, a1);
            break;
        default:
            return;
    }
    CpuCopy16(gPlttBufferUnfaded + a0, gPlttBufferFaded + a0, a1 * sizeof(u16));
}

void sub_8059948(u8 a0, u8 a1)
{
    switch (gUnknown_2036E28)
    {
        case 0:
            return;
        case 1:
            TintPalette_GrayScale(gPlttBufferUnfaded + a0 * 16, a1 * 16);
            break;
        case 2:
            TintPalette_SepiaTone(gPlttBufferUnfaded + a0 * 16, a1 * 16);
            break;
        case 3:
            sub_8111F38(a0 * 16, a1 * 16);
            TintPalette_GrayScale(gPlttBufferUnfaded + a0 * 16, a1 * 16);
            break;
        default:
            return;
    }
    CpuFastCopy(gPlttBufferUnfaded + a0 * 16, gPlttBufferFaded + a0 * 16, a1 * 16 * sizeof(u16));
}

void apply_map_tileset_palette(struct Tileset const *tileset, u16 destOffset, u16 size)
{
    u16 black = RGB_BLACK;

    if (tileset)
    {
        if (tileset->isSecondary == FALSE)
        {
            LoadPalette(&black, destOffset, 2);
            LoadPalette(((u16*)tileset->palettes) + 1, destOffset + 1, size - 2);
            sub_80598CC(destOffset + 1, (size - 2) >> 1);
        }
        else if (tileset->isSecondary == TRUE)
        {
            LoadPalette(((u16*)tileset->palettes) + (NUM_PALS_IN_PRIMARY * 16), destOffset, size);
            sub_80598CC(destOffset, size >> 1);
        }
        else
        {
            LoadCompressedPalette((u32*)tileset->palettes, destOffset, size);
            sub_80598CC(destOffset, size >> 1);
        }
    }
}

void copy_map_tileset1_to_vram(const struct MapLayout *mapLayout)
{
    copy_tileset_patterns_to_vram(mapLayout->primaryTileset, NUM_TILES_IN_PRIMARY, 0);
}

void copy_map_tileset2_to_vram(const struct MapLayout *mapLayout)
{
    copy_tileset_patterns_to_vram(mapLayout->secondaryTileset, NUM_TILES_TOTAL - NUM_TILES_IN_PRIMARY, NUM_TILES_IN_PRIMARY);
}

void copy_map_tileset2_to_vram_2(const struct MapLayout *mapLayout)
{
    copy_tileset_patterns_to_vram2(mapLayout->secondaryTileset, NUM_TILES_TOTAL - NUM_TILES_IN_PRIMARY, NUM_TILES_IN_PRIMARY);
}

void apply_map_tileset1_palette(const struct MapLayout *mapLayout)
{
    apply_map_tileset_palette(mapLayout->primaryTileset, 0, NUM_PALS_IN_PRIMARY * 16 * 2);
}

void apply_map_tileset2_palette(const struct MapLayout *mapLayout)
{
    apply_map_tileset_palette(mapLayout->secondaryTileset, NUM_PALS_IN_PRIMARY * 16, (NUM_PALS_TOTAL - NUM_PALS_IN_PRIMARY) * 16 * 2);
}

void copy_map_tileset1_tileset2_to_vram(struct MapLayout const *mapLayout)
{
    if (mapLayout)
    {
        copy_tileset_patterns_to_vram2(mapLayout->primaryTileset, NUM_TILES_IN_PRIMARY, 0);
        copy_tileset_patterns_to_vram2(mapLayout->secondaryTileset, NUM_TILES_TOTAL - NUM_TILES_IN_PRIMARY, NUM_TILES_IN_PRIMARY);
    }
}

void apply_map_tileset1_tileset2_palette(struct MapLayout const *mapLayout)
{
    if (mapLayout)
    {
        apply_map_tileset1_palette(mapLayout);
        apply_map_tileset2_palette(mapLayout);
    }
}
