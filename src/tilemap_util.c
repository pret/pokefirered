#include "global.h"
#include "bg.h"
#include "tilemap_util.h"
#include "malloc.h"

//  Handles 3 particular tilemaps ("PKMN Data" text, party menu, close box
//  button) used for Pokémon Storage System in a somewhat unusual way.
//  For example, while the cursor is on the Close Box button it flashes between
//  two states alternately. Both these states are their own part of the same
//  tilemap that's always present. The utility shifts the tilemap up and down
//  to show/hide the states, and limits the view with a rectangle that only
//  reveals one at a time.

struct TilemapUtil_RectData
{
    s16 x;
    s16 y;
    u16 width;
    u16 height;
    s16 destX;
    s16 destY;
};

struct TilemapUtil
{
    struct TilemapUtil_RectData prev; // Only read in unused function
    struct TilemapUtil_RectData cur;
    const void *savedTilemap; // Only written in unused function
    const void *tilemap;
    u16 altWidth; // Never read
    u16 altHeight; // Never read
    u16 width;
    u16 height;
    u16 rowSize; // Never read
    u8 tileSize;
    u8 bg;
    bool8 active; // Only read in unused function
};

static EWRAM_DATA struct TilemapUtil *sTilemapUtil = NULL;
static EWRAM_DATA u16 sNumTilemapUtilIds = 0;

static void TilemapUtil_DrawPrev(u8 tilemapId);
static void TilemapUtil_Draw(u8 tilemapId);

static const struct {
    u16 width;
    u16 height;
} sTilemapDimensions[2][4] = {
    {
        { 256,  256},
        { 512,  256},
        { 256,  512},
        { 512,  512}
    }, {
        { 128,  128},
        { 256,  256},
        { 512,  512},
        {1024, 1024}
    }
};

void TilemapUtil_Init(u8 numTilemapIds)
{
    u16 i;
    sTilemapUtil = Alloc(numTilemapIds * sizeof(struct TilemapUtil));
    sNumTilemapUtilIds = sTilemapUtil == NULL ? 0 : numTilemapIds;
    for (i = 0; i < sNumTilemapUtilIds; i++)
    {
        sTilemapUtil[i].savedTilemap = NULL;
        sTilemapUtil[i].active = FALSE;
    }
}

void TilemapUtil_Free(void)
{
    Free(sTilemapUtil);
}

// Unused
void TilemapUtil_UpdateAll(void)
{
    int i;

    for (i = 0; i < sNumTilemapUtilIds; i++)
    {
        if (sTilemapUtil[i].active == TRUE)
            TilemapUtil_Update(i);
    }
}

void TilemapUtil_SetTilemap(u8 tilemapId, u8 bg, const void *tilemap, u16 width, u16 height)
{
    u16 screenSize;
    u16 bgType;

    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].savedTilemap = NULL;
        sTilemapUtil[tilemapId].tilemap = tilemap;
        sTilemapUtil[tilemapId].bg = bg;
        sTilemapUtil[tilemapId].width = width;
        sTilemapUtil[tilemapId].height = height;

        screenSize = GetBgAttribute(bg, BG_ATTR_SCREENSIZE);
        bgType = GetBgAttribute(bg, BG_ATTR_BGTYPE);
        sTilemapUtil[tilemapId].altWidth = sTilemapDimensions[bgType][screenSize].width;
        sTilemapUtil[tilemapId].altHeight = sTilemapDimensions[bgType][screenSize].height;
        if (bgType != 0)
            sTilemapUtil[tilemapId].tileSize = 1;
        else
            sTilemapUtil[tilemapId].tileSize = 2;
        sTilemapUtil[tilemapId].rowSize = width * sTilemapUtil[tilemapId].tileSize;
        sTilemapUtil[tilemapId].cur.width = width;
        sTilemapUtil[tilemapId].cur.height = height;
        sTilemapUtil[tilemapId].cur.x = 0;
        sTilemapUtil[tilemapId].cur.y = 0;
        sTilemapUtil[tilemapId].cur.destX = 0;
        sTilemapUtil[tilemapId].cur.destY = 0;
        sTilemapUtil[tilemapId].prev = sTilemapUtil[tilemapId].cur;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

// Unused
void TilemapUtil_SetSavedMap(u8 tilemapId, const void *tilemap)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].savedTilemap = tilemap;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

void TilemapUtil_SetPos(u8 tilemapId, u16 destX, u16 destY)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].cur.destX = destX;
        sTilemapUtil[tilemapId].cur.destY = destY;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

void TilemapUtil_SetRect(u8 tilemapId, u16 x, u16 y, u16 width, u16 height)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].cur.x = x;
        sTilemapUtil[tilemapId].cur.y = y;
        sTilemapUtil[tilemapId].cur.width = width;
        sTilemapUtil[tilemapId].cur.height = height;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

void TilemapUtil_Move(u8 tilemapId, u8 mode, s8 param)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        switch (mode)
        {
        case 0:
            sTilemapUtil[tilemapId].cur.destX += param;
            sTilemapUtil[tilemapId].cur.width -= param;
            break;
        case 1:
            sTilemapUtil[tilemapId].cur.x += param;
            sTilemapUtil[tilemapId].cur.width += param;
            break;
        case 2:
            sTilemapUtil[tilemapId].cur.destY += param;
            sTilemapUtil[tilemapId].cur.height -= param;
            break;
        case 3: // this is the only mode ever used
            sTilemapUtil[tilemapId].cur.y -= param;
            sTilemapUtil[tilemapId].cur.height += param;
            break;
        case 4:
            sTilemapUtil[tilemapId].cur.destX += param;
            break;
        case 5:
            sTilemapUtil[tilemapId].cur.destY += param;
            break;
        }
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

void TilemapUtil_Update(u8 tilemapId)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        if (sTilemapUtil[tilemapId].savedTilemap != NULL) // Always false
            TilemapUtil_DrawPrev(tilemapId);
        TilemapUtil_Draw(tilemapId);
        sTilemapUtil[tilemapId].prev = sTilemapUtil[tilemapId].cur;
    }
}

// Never called, see TilemapUtil_Update
static void TilemapUtil_DrawPrev(u8 tilemapId)
{
    int i;
    int rowSize = sTilemapUtil[tilemapId].tileSize * sTilemapUtil[tilemapId].altWidth;
    const void *tiles = sTilemapUtil[tilemapId].savedTilemap
                        + rowSize * sTilemapUtil[tilemapId].prev.destY
                        + sTilemapUtil[tilemapId].prev.destX * sTilemapUtil[tilemapId].tileSize;
    for (i = 0; i < sTilemapUtil[tilemapId].prev.height; i++)
    {
        CopyToBgTilemapBufferRect(sTilemapUtil[tilemapId].bg,
                                  tiles,
                                  sTilemapUtil[tilemapId].prev.destX,
                                  sTilemapUtil[tilemapId].prev.destY + i,
                                  sTilemapUtil[tilemapId].prev.width,
                                  1);
        tiles += rowSize;
    }
}

static void TilemapUtil_Draw(u8 tilemapId)
{
    int i;
    int rowSize = sTilemapUtil[tilemapId].tileSize * sTilemapUtil[tilemapId].width;
    const void *tiles = sTilemapUtil[tilemapId].tilemap
                        + rowSize * sTilemapUtil[tilemapId].cur.y
                        + sTilemapUtil[tilemapId].cur.x * sTilemapUtil[tilemapId].tileSize;
    for (i = 0; i < sTilemapUtil[tilemapId].cur.height; i++)
    {
        CopyToBgTilemapBufferRect(sTilemapUtil[tilemapId].bg,
                                  tiles,
                                  sTilemapUtil[tilemapId].cur.destX,
                                  sTilemapUtil[tilemapId].cur.destY + i,
                                  sTilemapUtil[tilemapId].cur.width,
                                  1);
        tiles += rowSize;
    }
}
