#include "global.h"
#include "bg.h"
#include "box_party_pokemon_dropdown.h"
#include "malloc.h"

struct UnkStruct_203ABE4_Sub
{
    s16 destX;
    s16 destY;
    u16 width;
    u16 height;
    s16 destX2;
    s16 destY2;
};

struct UnkStruct_203ABE4
{
    struct UnkStruct_203ABE4_Sub map1Rect;
    struct UnkStruct_203ABE4_Sub map2Rect;
    const void * src1;
    const void * src2;
    u16 src1Height;
    u16 src1Width;
    u16 src2Height;
    u16 unk_26;
    u16 unk_28;
    u8 mapSize;
    u8 bgId;
    bool8 bgUpdateScheduled;
};

static EWRAM_DATA struct UnkStruct_203ABE4 * sBoxPartyPokemonDropdownPtr = NULL;
static EWRAM_DATA u16 sBoxPartyPokemonDropdownCount = 0;

static void PushMap1(u8 a0);
static void PushMap2(u8 a0);

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

void sub_80F7AD8(u8 num)
{
    u16 i;
    sBoxPartyPokemonDropdownPtr = Alloc(num * sizeof(struct UnkStruct_203ABE4));
    sBoxPartyPokemonDropdownCount = sBoxPartyPokemonDropdownPtr == NULL ? 0 : num;
    for (i = 0; i < sBoxPartyPokemonDropdownCount; i++)
    {
        sBoxPartyPokemonDropdownPtr[i].src1 = NULL;
        sBoxPartyPokemonDropdownPtr[i].bgUpdateScheduled = FALSE;
    }
}

void sub_80F7B2C(void)
{
    Free(sBoxPartyPokemonDropdownPtr);
}

void sub_80F7B40(void)
{
    int i;

    for (i = 0; i < sBoxPartyPokemonDropdownCount; i++)
    {
        if (sBoxPartyPokemonDropdownPtr[i].bgUpdateScheduled == TRUE)
            sub_80F7E54(i);
    }
}

void sub_80F7B80(u8 a0, u8 a1, const void * a2, u16 a3, u16 a4)
{
    u16 screenSize;
    u16 bgType;

    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[a0].src1 = NULL;
        sBoxPartyPokemonDropdownPtr[a0].src2 = a2;
        sBoxPartyPokemonDropdownPtr[a0].bgId = a1;
        sBoxPartyPokemonDropdownPtr[a0].src2Height = a3;
        sBoxPartyPokemonDropdownPtr[a0].unk_26 = a4;
        screenSize = GetBgAttribute(a1, BG_ATTR_SCREENSIZE);
        bgType = GetBgAttribute(a1, BG_ATTR_BGTYPE);
        sBoxPartyPokemonDropdownPtr[a0].src1Height = sBGdims[bgType][screenSize].height;
        sBoxPartyPokemonDropdownPtr[a0].src1Width = sBGdims[bgType][screenSize].width;
        if (bgType != 0)
            sBoxPartyPokemonDropdownPtr[a0].mapSize = 1;
        else
            sBoxPartyPokemonDropdownPtr[a0].mapSize = 2;
        sBoxPartyPokemonDropdownPtr[a0].unk_28 = a3 * sBoxPartyPokemonDropdownPtr[a0].mapSize;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.width = a3;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.height = a4;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX = 0;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY = 0;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX2 = 0;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY2 = 0;
        sBoxPartyPokemonDropdownPtr[a0].map1Rect = sBoxPartyPokemonDropdownPtr[a0].map2Rect;
        sBoxPartyPokemonDropdownPtr[a0].bgUpdateScheduled = TRUE;
    }
}

void sub_80F7C7C(u8 a0, const void * a1)
{
    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[a0].src1 = a1;
        sBoxPartyPokemonDropdownPtr[a0].bgUpdateScheduled = TRUE;
    }
}

void sub_80F7CAC(u8 a0, u16 a1, u16 a2)
{
    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX2 = a1;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY2 = a2;
        sBoxPartyPokemonDropdownPtr[a0].bgUpdateScheduled = TRUE;
    }
}

void sub_80F7CE8(u8 a0, u16 a1, u16 a2, u16 a3, u16 a4)
{
    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX = a1;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY = a2;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.width = a3;
        sBoxPartyPokemonDropdownPtr[a0].map2Rect.height = a4;
        sBoxPartyPokemonDropdownPtr[a0].bgUpdateScheduled = TRUE;
    }
}

void sub_80F7D30(u8 a0, u8 a1, s8 a2)
{
    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        switch (a1)
        {
        case 0:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX2 += a2;
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.width -= a2;
            break;
        case 1:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX += a2;
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.width += a2;
            break;
        case 2:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY2 += a2;
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.height -= a2;
            break;
        case 3:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY -= a2;
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.height += a2;
            break;
        case 4:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX2 += a2;
            break;
        case 5:
            sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY2 += a2;
            break;
        }
        sBoxPartyPokemonDropdownPtr[a0].bgUpdateScheduled = TRUE;
    }
}

void sub_80F7E54(u8 a0)
{
    if (a0 < sBoxPartyPokemonDropdownCount)
    {
        if (sBoxPartyPokemonDropdownPtr[a0].src1 != NULL)
            PushMap1(a0);
        PushMap2(a0);
        sBoxPartyPokemonDropdownPtr[a0].map1Rect = sBoxPartyPokemonDropdownPtr[a0].map2Rect;
    }
}

static void PushMap1(u8 a0)
{
    int i;
    int r9 = sBoxPartyPokemonDropdownPtr[a0].mapSize * sBoxPartyPokemonDropdownPtr[a0].src1Height;
    const void * addr = sBoxPartyPokemonDropdownPtr[a0].src1 + r9 * sBoxPartyPokemonDropdownPtr[a0].map1Rect.destY2 + sBoxPartyPokemonDropdownPtr[a0].map1Rect.destX2 * sBoxPartyPokemonDropdownPtr[a0].mapSize;
    for (i = 0; i < sBoxPartyPokemonDropdownPtr[a0].map1Rect.height; i++)
    {
        CopyToBgTilemapBufferRect(sBoxPartyPokemonDropdownPtr[a0].bgId, addr, sBoxPartyPokemonDropdownPtr[a0].map1Rect.destX2, sBoxPartyPokemonDropdownPtr[a0].map1Rect.destY2 + i, sBoxPartyPokemonDropdownPtr[a0].map1Rect.width, 1);
        addr += r9;
    }
}

static void PushMap2(u8 a0)
{
    int i;
    int r9 = sBoxPartyPokemonDropdownPtr[a0].mapSize * sBoxPartyPokemonDropdownPtr[a0].src2Height;
    const void * addr = sBoxPartyPokemonDropdownPtr[a0].src2 + r9 * sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY + sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX * sBoxPartyPokemonDropdownPtr[a0].mapSize;
    for (i = 0; i < sBoxPartyPokemonDropdownPtr[a0].map2Rect.height; i++)
    {
        CopyToBgTilemapBufferRect(sBoxPartyPokemonDropdownPtr[a0].bgId, addr, sBoxPartyPokemonDropdownPtr[a0].map2Rect.destX2, sBoxPartyPokemonDropdownPtr[a0].map2Rect.destY2 + i, sBoxPartyPokemonDropdownPtr[a0].map2Rect.width, 1);
        addr += r9;
    }
}
