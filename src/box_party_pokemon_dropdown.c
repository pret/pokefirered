#include "global.h"
#include "bg.h"
#include "box_party_pokemon_dropdown.h"
#include "malloc.h"

//------------------------------------------------------------------------------
//  SECTION: TilemapUtil
//
//  Handles 3 particular tilemaps in a somewhat unusual way.
//  For example, while the cursor is on the Close Box button it flashes between
//  two states alternately. Both these states are their own part of the same
//  tilemap that's always present. The utility shifts the tilemap up and down
//  to show/hide the states, and limits the view with a rectangle that only
//  reveals one at a time.
//  Each tilemap is tracked with a TILEMAPID that can be used to reference it.
//------------------------------------------------------------------------------

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
    const void * savedTilemap; // Only written in unused function
    const void * tilemap;
    u16 altWidth;
    u16 altHeight; // Never read

    u16 width;
    u16 height; // Never read

    u16 rowSize; // Never read

    u8 tileSize;
    u8 bg;
    bool8 active;
};

static EWRAM_DATA struct TilemapUtil * sTilemapUtil = NULL;
static EWRAM_DATA u16 sTilemapUtilCount = 0;

static void TilemapUtil_DrawPrev(u8 idx);
static void TilemapUtil_Draw(u8 idx);

static const struct {
    u16 width;
    u16 height;
} sBGdims[2][4] = {
    {    // TEXT
        { 256,  256},
        { 512,  256},
        { 256,  512},
        { 512,  512},
    }, { // AFFINE
        { 128,  128},
        { 256,  256},
        { 512,  512},
        {1024, 1024},
    }
};

void TilemapUtil_Init(u8 num)
{
    u16 i;
    sTilemapUtil = Alloc(num * sizeof(struct TilemapUtil));
    sTilemapUtilCount = sTilemapUtil == NULL ? 0 : num;
    for (i = 0; i < sTilemapUtilCount; i++)
    {
        sTilemapUtil[i].savedTilemap = NULL;
        sTilemapUtil[i].active = FALSE;
    }
}

void TilemapUtil_Free(void)
{
    Free(sTilemapUtil);
}

void TilemapUtil_UpdateAll(void)
{
    int i;

    for (i = 0; i < sTilemapUtilCount; i++)
    {
        if (sTilemapUtil[i].active == TRUE)
            TilemapUtil_Update(i);
    }
}

void TilemapUtil_SetMap(u8 idx, u8 bgId, const void * src, u16 width, u16 height)
{
    u16 screenSize;
    u16 bgType;

    if (idx < sTilemapUtilCount)
    {
        sTilemapUtil[idx].savedTilemap = NULL;
        sTilemapUtil[idx].tilemap = src;
        sTilemapUtil[idx].bg = bgId;
        sTilemapUtil[idx].width = width;
        sTilemapUtil[idx].height = height;
        screenSize = GetBgAttribute(bgId, BG_ATTR_SCREENSIZE);
        bgType = GetBgAttribute(bgId, BG_ATTR_BGTYPE);
        sTilemapUtil[idx].altWidth = sBGdims[bgType][screenSize].width;
        sTilemapUtil[idx].altHeight = sBGdims[bgType][screenSize].height;
        if (bgType != 0)
            sTilemapUtil[idx].tileSize = 1; // AFFINE
        else
            sTilemapUtil[idx].tileSize = 2; // TEXT
        sTilemapUtil[idx].rowSize = width * sTilemapUtil[idx].tileSize;
        sTilemapUtil[idx].cur.width = width;
        sTilemapUtil[idx].cur.height = height;
        sTilemapUtil[idx].cur.x = 0;
        sTilemapUtil[idx].cur.y = 0;
        sTilemapUtil[idx].cur.destX = 0;
        sTilemapUtil[idx].cur.destY = 0;
        sTilemapUtil[idx].prev = sTilemapUtil[idx].cur;
        sTilemapUtil[idx].active = TRUE;
    }
}

void TilemapUtil_SetSavedMap(u8 idx, const void * src)
{
    if (idx < sTilemapUtilCount)
    {
        sTilemapUtil[idx].savedTilemap = src;
        sTilemapUtil[idx].active = TRUE;
    }
}

void TilemapUtil_SetPos(u8 idx, u16 x, u16 y)
{
    if (idx < sTilemapUtilCount)
    {
        sTilemapUtil[idx].cur.destX = x;
        sTilemapUtil[idx].cur.destY = y;
        sTilemapUtil[idx].active = TRUE;
    }
}

void TilemapUtil_SetRect(u8 idx, u16 x, u16 y, u16 width, u16 height)
{
    if (idx < sTilemapUtilCount)
    {
        sTilemapUtil[idx].cur.x = x;
        sTilemapUtil[idx].cur.y = y;
        sTilemapUtil[idx].cur.width = width;
        sTilemapUtil[idx].cur.height = height;
        sTilemapUtil[idx].active = TRUE;
    }
}

void TilemapUtil_Move(u8 idx, u8 op, s8 param)
{
    if (idx < sTilemapUtilCount)
    {
        switch (op)
        {
        case BPPD_MOVE_INNER_LEFT:
            sTilemapUtil[idx].cur.destX += param;
            sTilemapUtil[idx].cur.width -= param;
            break;
        case BPPD_MOVE_OUTER_LEFT:
            sTilemapUtil[idx].cur.x += param;
            sTilemapUtil[idx].cur.width += param;
            break;
        case BPPD_MOVE_INNER_TOP:
            sTilemapUtil[idx].cur.destY += param;
            sTilemapUtil[idx].cur.height -= param;
            break;
        case BPPD_MOVE_OUTER_TOP:
            sTilemapUtil[idx].cur.y -= param;
            sTilemapUtil[idx].cur.height += param;
            break;
        case BPPD_MOVE_INNER_X:
            sTilemapUtil[idx].cur.destX += param;
            break;
        case BPPD_MOVE_INNER_Y:
            sTilemapUtil[idx].cur.destY += param;
            break;
        }
        sTilemapUtil[idx].active = TRUE;
    }
}

void TilemapUtil_Update(u8 idx)
{
    if (idx < sTilemapUtilCount)
    {
        if (sTilemapUtil[idx].savedTilemap != NULL)
            TilemapUtil_DrawPrev(idx);
        TilemapUtil_Draw(idx);
        sTilemapUtil[idx].prev = sTilemapUtil[idx].cur;
    }
}

static void TilemapUtil_DrawPrev(u8 idx)
{
    int i;
    int adder = sTilemapUtil[idx].tileSize * sTilemapUtil[idx].altWidth;
    const void * tiles = sTilemapUtil[idx].savedTilemap + adder * sTilemapUtil[idx].prev.destY + sTilemapUtil[idx].prev.destX * sTilemapUtil[idx].tileSize;
    for (i = 0; i < sTilemapUtil[idx].prev.height; i++)
    {
        CopyToBgTilemapBufferRect(
            sTilemapUtil[idx].bg,
            tiles,
            sTilemapUtil[idx].prev.destX,
            sTilemapUtil[idx].prev.destY + i,
            sTilemapUtil[idx].prev.width,
            1
        );
        tiles += adder;
    }
}

static void TilemapUtil_Draw(u8 idx)
{
    int i;
    int adder = sTilemapUtil[idx].tileSize * sTilemapUtil[idx].width;
    const void * tiles = sTilemapUtil[idx].tilemap + adder * sTilemapUtil[idx].cur.y + sTilemapUtil[idx].cur.x * sTilemapUtil[idx].tileSize;
    for (i = 0; i < sTilemapUtil[idx].cur.height; i++)
    {
        CopyToBgTilemapBufferRect(
            sTilemapUtil[idx].bg,
            tiles,
            sTilemapUtil[idx].cur.destX,
            sTilemapUtil[idx].cur.destY + i,
            sTilemapUtil[idx].cur.width,
            1
        );
        tiles += adder;
    }
}
