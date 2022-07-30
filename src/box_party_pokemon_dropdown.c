#include "global.h"
#include "bg.h"
#include "box_party_pokemon_dropdown.h"
#include "malloc.h"

struct BPPD_MapRect
{
    s16 destX;
    s16 destY;
    u16 width;
    u16 height;
    s16 destX2;
    s16 destY2;
};

struct BPPD_Struct
{
    struct BPPD_MapRect map1Rect;
    struct BPPD_MapRect map2Rect;
    const void *src1;
    const void *src2;
    u16 src1Height;
    u16 src1Width;
    u16 src2Width;
    u16 src2Height;
    u16 bytesPerRow;
    u8 mapSize;
    u8 bgId;
    bool8 bgUpdateScheduled;
};

static EWRAM_DATA struct BPPD_Struct * sBoxPartyPokemonDropdownPtr = NULL;
static EWRAM_DATA u16 sBoxPartyPokemonDropdownCount = 0;

static void PushMap1(u8 idx);
static void PushMap2(u8 idx);

static const struct {
    u16 height;
    u16 width;
} sBGdims[2][4] = {
    {
        {0x0100, 0x0100},
        {0x0200, 0x0100},
        {0x0100, 0x0200},
        {0x0200, 0x0200}
    }, {
        {0x0080, 0x0080},
        {0x0100, 0x0100},
        {0x0200, 0x0200},
        {0x0400, 0x0400}
    }
};

void AllocBoxPartyPokemonDropdowns(u8 num)
{
    u16 i;
    sBoxPartyPokemonDropdownPtr = Alloc(num * sizeof(struct BPPD_Struct));
    sBoxPartyPokemonDropdownCount = sBoxPartyPokemonDropdownPtr == NULL ? 0 : num;
    for (i = 0; i < sBoxPartyPokemonDropdownCount; i++)
    {
        sBoxPartyPokemonDropdownPtr[i].src1 = NULL;
        sBoxPartyPokemonDropdownPtr[i].bgUpdateScheduled = FALSE;
    }
}

void FreeBoxPartyPokemonDropdowns(void)
{
    Free(sBoxPartyPokemonDropdownPtr);
}

void CopyAllBoxPartyPokemonDropdownsToVram(void)
{
    int i;

    for (i = 0; i < sBoxPartyPokemonDropdownCount; i++)
    {
        if (sBoxPartyPokemonDropdownPtr[i].bgUpdateScheduled == TRUE)
            CopyBoxPartyPokemonDropdownToBgTilemapBuffer(i);
    }
}

void SetBoxPartyPokemonDropdownMap2(u8 idx, u8 bgId, const void *src, u16 width, u16 height)
{
    u16 screenSize;
    u16 bgType;

    if (idx < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[idx].src1 = NULL;
        sBoxPartyPokemonDropdownPtr[idx].src2 = src;
        sBoxPartyPokemonDropdownPtr[idx].bgId = bgId;
        sBoxPartyPokemonDropdownPtr[idx].src2Width = width;
        sBoxPartyPokemonDropdownPtr[idx].src2Height = height;
        screenSize = GetBgAttribute(bgId, BG_ATTR_SCREENSIZE);
        bgType = GetBgAttribute(bgId, BG_ATTR_BGTYPE);
        sBoxPartyPokemonDropdownPtr[idx].src1Height = sBGdims[bgType][screenSize].height;
        sBoxPartyPokemonDropdownPtr[idx].src1Width = sBGdims[bgType][screenSize].width;
        if (bgType != 0)
            sBoxPartyPokemonDropdownPtr[idx].mapSize = 1;
        else
            sBoxPartyPokemonDropdownPtr[idx].mapSize = 2;
        sBoxPartyPokemonDropdownPtr[idx].bytesPerRow = width * sBoxPartyPokemonDropdownPtr[idx].mapSize;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.width = width;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.height = height;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX = 0;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY = 0;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX2 = 0;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY2 = 0;
        sBoxPartyPokemonDropdownPtr[idx].map1Rect = sBoxPartyPokemonDropdownPtr[idx].map2Rect;
        sBoxPartyPokemonDropdownPtr[idx].bgUpdateScheduled = TRUE;
    }
}

void SetBoxPartyPokemonDropdownMap1Tiles(u8 idx, const void *src)
{
    if (idx < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[idx].src1 = src;
        sBoxPartyPokemonDropdownPtr[idx].bgUpdateScheduled = TRUE;
    }
}

void SetBoxPartyPokemonDropdownMap2Pos(u8 idx, u16 x, u16 y)
{
    if (idx < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX2 = x;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY2 = y;
        sBoxPartyPokemonDropdownPtr[idx].bgUpdateScheduled = TRUE;
    }
}

void SetBoxPartyPokemonDropdownMap2Rect(u8 idx, u16 x, u16 y, u16 width, u16 height)
{
    if (idx < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX = x;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY = y;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.width = width;
        sBoxPartyPokemonDropdownPtr[idx].map2Rect.height = height;
        sBoxPartyPokemonDropdownPtr[idx].bgUpdateScheduled = TRUE;
    }
}

void AdjustBoxPartyPokemonDropdownPos(u8 idx, u8 op, s8 param)
{
    if (idx < sBoxPartyPokemonDropdownCount)
    {
        switch (op)
        {
        case BPPD_MOVE_INNER_LEFT:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX2 += param;
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.width -= param;
            break;
        case BPPD_MOVE_OUTER_LEFT:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX += param;
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.width += param;
            break;
        case BPPD_MOVE_INNER_TOP:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY2 += param;
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.height -= param;
            break;
        case BPPD_MOVE_OUTER_TOP:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY -= param;
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.height += param;
            break;
        case BPPD_MOVE_INNER_X:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX2 += param;
            break;
        case BPPD_MOVE_INNER_Y:
            sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY2 += param;
            break;
        }
        sBoxPartyPokemonDropdownPtr[idx].bgUpdateScheduled = TRUE;
    }
}

void CopyBoxPartyPokemonDropdownToBgTilemapBuffer(u8 idx)
{
    if (idx < sBoxPartyPokemonDropdownCount)
    {
        if (sBoxPartyPokemonDropdownPtr[idx].src1 != NULL)
            PushMap1(idx);
        PushMap2(idx);
        sBoxPartyPokemonDropdownPtr[idx].map1Rect = sBoxPartyPokemonDropdownPtr[idx].map2Rect;
    }
}

static void PushMap1(u8 idx)
{
    int i;
    int run = sBoxPartyPokemonDropdownPtr[idx].mapSize * sBoxPartyPokemonDropdownPtr[idx].src1Height;
    const void *addr = sBoxPartyPokemonDropdownPtr[idx].src1 + run * sBoxPartyPokemonDropdownPtr[idx].map1Rect.destY2 + sBoxPartyPokemonDropdownPtr[idx].map1Rect.destX2 * sBoxPartyPokemonDropdownPtr[idx].mapSize;
    for (i = 0; i < sBoxPartyPokemonDropdownPtr[idx].map1Rect.height; i++)
    {
        CopyToBgTilemapBufferRect(sBoxPartyPokemonDropdownPtr[idx].bgId, addr, sBoxPartyPokemonDropdownPtr[idx].map1Rect.destX2, sBoxPartyPokemonDropdownPtr[idx].map1Rect.destY2 + i, sBoxPartyPokemonDropdownPtr[idx].map1Rect.width, 1);
        addr += run;
    }
}

static void PushMap2(u8 idx)
{
    int i;
    int run = sBoxPartyPokemonDropdownPtr[idx].mapSize * sBoxPartyPokemonDropdownPtr[idx].src2Width;
    const void *addr = sBoxPartyPokemonDropdownPtr[idx].src2 + run * sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY + sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX * sBoxPartyPokemonDropdownPtr[idx].mapSize;
    for (i = 0; i < sBoxPartyPokemonDropdownPtr[idx].map2Rect.height; i++)
    {
        CopyToBgTilemapBufferRect(sBoxPartyPokemonDropdownPtr[idx].bgId, addr, sBoxPartyPokemonDropdownPtr[idx].map2Rect.destX2, sBoxPartyPokemonDropdownPtr[idx].map2Rect.destY2 + i, sBoxPartyPokemonDropdownPtr[idx].map2Rect.width, 1);
        addr += run;
    }
}
