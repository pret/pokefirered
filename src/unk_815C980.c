#include "global.h"
#include "malloc.h"
#include "decompress.h"
#include "unk_815C980.h"
#include "main.h"
#include "battle.h"

struct UnkStruct2
{
    bool8 isActive;
    u8 firstOamId;
    u8 field_2;
    u8 oamCount;
    u8 palTagIndex;
    u8 size;
    u8 shape;
    u8 priority;
    u8 xDelta;
    u8 field_9;
    u16 tileStart;
    s16 x;
    s16 y;
    u16 tileTag;
    u16 palTag;
    u32 field_14;
    s32 field_18;
};

struct UnkStruct1
{
    u32 count;
    struct UnkStruct2 *array;
};

// this file's functions
static u8 sub_815D244(u8 arg0);;
static void sub_815CC28(struct UnkStruct2 *arg0);
static void sub_815CDDC(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2);
static void sub_815CE90(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2);
static void sub_815CFEC(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2);
static bool32 SharesTileWithAnyActive(u32 id);
static bool32 SharesPalWithAnyActive(u32 id);
static void sub_8035648(void);
static u8 sub_815D324(u32 shape, u32 size);

// ewram
static EWRAM_DATA struct UnkStruct1 *gUnknown_203F454 = {0};

// const rom data
static const u8 gUnknown_8479658[][4] =
{
    {0x01, 0x04, 0x10, 0x40},
    {0x02, 0x04, 0x08, 0x20},
    {0x02, 0x04, 0x08, 0x20},
    {0x00, 0x00, 0x00, 0x00}
};

// code
bool32 sub_815C980(u32 count)
{
    u32 i;

    if (gUnknown_203F454 != NULL)
        sub_815C9F4();

    gUnknown_203F454 = Alloc(sizeof(*gUnknown_203F454));
    if (gUnknown_203F454 == NULL)
        return FALSE;

    gUnknown_203F454->array = Alloc(sizeof(struct UnkStruct2) * count);
    if (gUnknown_203F454->array == NULL)
    {
        Free(gUnknown_203F454);
        return FALSE;
    }

    gUnknown_203F454->count = count;
    for (i = 0; i < count; i++)
    {
        gUnknown_203F454->array[i].isActive = FALSE;
        gUnknown_203F454->array[i].firstOamId = 0xFF;
    }

    return TRUE;
}

void sub_815C9F4(void)
{
    if (gUnknown_203F454 != NULL)
    {
        if (gUnknown_203F454->array != NULL)
        {
            u32 i;

            for (i = 0; i < gUnknown_203F454->count; i++)
                sub_815D108(i);

            Free(gUnknown_203F454->array);
        }

        FREE_AND_SET_NULL(gUnknown_203F454);
    }
}

bool32 sub_815CA40(u32 id, s32 arg1, const struct UnkStruct3 *arg2)
{
    u32 i;

    if (gUnknown_203F454 == NULL)
        return FALSE;
    if (gUnknown_203F454->array[id].isActive)
        return FALSE;

    gUnknown_203F454->array[id].firstOamId = sub_815D244(arg2->field_1);
    if (gUnknown_203F454->array[id].firstOamId == 0xFF)
        return FALSE;

    gUnknown_203F454->array[id].tileStart = GetSpriteTileStartByTag(arg2->spriteSheet->tag);
    if (gUnknown_203F454->array[id].tileStart == 0xFFFF)
    {
        if (arg2->spriteSheet->size != 0)
        {
            gUnknown_203F454->array[id].tileStart = LoadSpriteSheet(arg2->spriteSheet);
        }
        else
        {
            struct CompressedSpriteSheet compObjectPic;

            compObjectPic = *(struct CompressedSpriteSheet*)(arg2->spriteSheet);
            compObjectPic.size = GetDecompressedDataSize(arg2->spriteSheet->data);
            gUnknown_203F454->array[id].tileStart = LoadCompressedObjectPic(&compObjectPic);
        }

        if (gUnknown_203F454->array[id].tileStart == 0xFFFF)
            return FALSE;
    }

    gUnknown_203F454->array[id].palTagIndex = IndexOfSpritePaletteTag(arg2->spritePal->tag);
    if (gUnknown_203F454->array[id].palTagIndex == 0xFF)
        gUnknown_203F454->array[id].palTagIndex = LoadSpritePalette(arg2->spritePal);

    gUnknown_203F454->array[id].field_2 = arg2->field_0_0;
    gUnknown_203F454->array[id].oamCount = arg2->field_1;
    gUnknown_203F454->array[id].x = arg2->x;
    gUnknown_203F454->array[id].y = arg2->y;
    gUnknown_203F454->array[id].shape = arg2->shape;
    gUnknown_203F454->array[id].size = arg2->size;
    gUnknown_203F454->array[id].priority = arg2->priority;
    gUnknown_203F454->array[id].xDelta = arg2->xDelta;
    gUnknown_203F454->array[id].field_9 = sub_815D324(arg2->shape, arg2->size);
    gUnknown_203F454->array[id].tileTag = arg2->spriteSheet->tag;
    gUnknown_203F454->array[id].palTag = arg2->spritePal->tag;
    gUnknown_203F454->array[id].isActive = TRUE;
    gUnknown_203F454->array[id].field_14 = 1;

    for (i = 1; i < arg2->field_1; i++)
        gUnknown_203F454->array[id].field_14 *= 10;

    sub_815CC28(&gUnknown_203F454->array[id]);
    sub_815CD70(id, arg1);

    return TRUE;
}

static void sub_815CC28(struct UnkStruct2 *arg0)
{
    u32 i;
    u32 oamId = arg0->firstOamId;
    u32 x = arg0->x;
    u32 oamCount = arg0->oamCount + 1;

    CpuFill16(0, &gMain.oamBuffer[oamId], sizeof(struct OamData) * oamCount);
    for (i = 0, oamId = arg0->firstOamId; i < oamCount; i++, oamId++)
    {
        gMain.oamBuffer[oamId].y = arg0->y;
        gMain.oamBuffer[oamId].x = x;
        gMain.oamBuffer[oamId].shape = arg0->shape;
        gMain.oamBuffer[oamId].size = arg0->size;
        gMain.oamBuffer[oamId].tileNum = arg0->tileStart;
        gMain.oamBuffer[oamId].priority = arg0->priority;
        gMain.oamBuffer[oamId].paletteNum = arg0->palTagIndex;

        x += arg0->xDelta;
    }

    oamId--;
    gMain.oamBuffer[oamId].x = arg0->x - arg0->xDelta;
    gMain.oamBuffer[oamId].affineMode = 2;
    gMain.oamBuffer[oamId].tileNum = arg0->tileStart + (arg0->field_9 * 10);
}

void sub_815CD70(u32 id, s32 arg1)
{
    bool32 r2;

    if (gUnknown_203F454 == NULL)
        return;
    if (!gUnknown_203F454->array[id].isActive)
        return;

    gUnknown_203F454->array[id].field_18 = arg1;
    if (arg1 < 0)
    {
        r2 = TRUE;
        arg1 *= -1;
    }
    else
    {
        r2 = FALSE;
    }

    switch (gUnknown_203F454->array[id].field_2)
    {
    case 0:
    default:
        sub_815CDDC(&gUnknown_203F454->array[id], arg1, r2);
        break;
    case 1:
        sub_815CE90(&gUnknown_203F454->array[id], arg1, r2);
        break;
    case 2:
        sub_815CFEC(&gUnknown_203F454->array[id], arg1, r2);
        break;
    }
}

static void sub_815CDDC(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2)
{
    u32 r5 = arg0->field_14;
    u32 oamId = arg0->firstOamId;

    while (r5 != 0)
    {
        u32 r4 = arg1 / r5;
        arg1 -= (r4 * r5);
        r5 /= 10;

        gMain.oamBuffer[oamId].tileNum = (r4 * arg0->field_9) + arg0->tileStart;
        oamId++;
    }

    if (arg2)
        gMain.oamBuffer[oamId].affineMode = 0;
    else
        gMain.oamBuffer[oamId].affineMode = 2;
}

static void sub_815CE90(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2)
{
    u32 r5 = arg0->field_14;
    static int gUnknown_3002078;
    static int gUnknown_300207C;
    static int gUnknown_3002080;

    gUnknown_3002078 = arg0->firstOamId;
    gUnknown_300207C = 0;
    gUnknown_3002080 = -1;

    while (r5 != 0)
    {
        u32 r4 = arg1 / r5;
        arg1 -= (r4 * r5);
        r5 /= 10;

        if (r4 != 0 || gUnknown_3002080 != -1 || r5 == 0)
        {
            gMain.oamBuffer[gUnknown_3002078].tileNum = (r4 * arg0->field_9) + arg0->tileStart;
            gMain.oamBuffer[gUnknown_3002078].affineMode = 0;

            if (gUnknown_3002080 == -1)
                gUnknown_3002080 = gUnknown_300207C;
        }
        else
        {
            gMain.oamBuffer[gUnknown_3002078].affineMode = 2;
        }

        gUnknown_3002078++;
        gUnknown_300207C++;
    }

    if (arg2)
    {
        gMain.oamBuffer[gUnknown_3002078].affineMode = 0;
        gMain.oamBuffer[gUnknown_3002078].x = arg0->x + ((gUnknown_3002080 - 1) * arg0->xDelta);
    }
    else
    {
        gMain.oamBuffer[gUnknown_3002078].affineMode = 2;
    }
}

static void sub_815CFEC(struct UnkStruct2 *arg0, s32 arg1, bool32 arg2)
{
    u32 r5 = arg0->field_14;
    u32 oamId = arg0->firstOamId;
    u32 var_28 = 0;
    s32 r9 = 0;

    while (r5 != 0)
    {
        u32 r4 = arg1 / r5;
        arg1 -= (r4 * r5);
        r5 /= 10;

        if (r4 != 0 || var_28 != 0 || r5 == 0)
        {
            var_28 = 1;
            gMain.oamBuffer[oamId].tileNum = (r4 * arg0->field_9) + arg0->tileStart;
            gMain.oamBuffer[oamId].affineMode = 0;

            oamId++;
            r9++;
        }
    }

    while (r9 < arg0->oamCount)
    {
        gMain.oamBuffer[oamId].affineMode = 2;
        oamId++;
        r9++;
    }

    if (arg2)
        gMain.oamBuffer[oamId].affineMode = 0;
    else
        gMain.oamBuffer[oamId].affineMode = 2;
}

void sub_815D108(u32 id)
{
    s32 oamId, oamCount, i;

    if (gUnknown_203F454 == NULL)
        return;
    if (!gUnknown_203F454->array[id].isActive)
        return;

    oamCount = gUnknown_203F454->array[id].oamCount + 1;
    oamId = gUnknown_203F454->array[id].firstOamId;

    for (i = 0; i < oamCount; i++, oamId++)
        gMain.oamBuffer[oamId].affineMode = 2;

    if (!SharesTileWithAnyActive(id))
        FreeSpriteTilesByTag(gUnknown_203F454->array[id].tileTag);
    if (!SharesPalWithAnyActive(id))
        FreeSpritePaletteByTag(gUnknown_203F454->array[id].palTag);

    gUnknown_203F454->array[id].isActive = FALSE;
}

void sub_815D1A8(u32 id, bool32 arg1)
{
    s32 oamId, oamCount, i;

    if (gUnknown_203F454 == NULL)
        return;
    if (!gUnknown_203F454->array[id].isActive)
        return;

    oamCount = gUnknown_203F454->array[id].oamCount + 1;
    oamId = gUnknown_203F454->array[id].firstOamId;
    if (arg1)
    {
        for (i = 0; i < oamCount; i++, oamId++)
            gMain.oamBuffer[oamId].affineMode = 2;
    }
    else
    {
        for (i = 0; i < oamCount; i++, oamId++)
            gMain.oamBuffer[oamId].affineMode = 0;

        sub_815CD70(id, gUnknown_203F454->array[id].field_18);
    }
}

static u8 sub_815D244(u8 arg0)
{
    u32 i;
    u16 oamCount = 64;

    for (i = 0; i < gUnknown_203F454->count; i++)
    {
        if (!gUnknown_203F454->array[i].isActive)
        {
            if (gUnknown_203F454->array[i].firstOamId != 0xFF && gUnknown_203F454->array[i].oamCount <= arg0)
                return gUnknown_203F454->array[i].firstOamId;
        }
        else
        {
            oamCount += 1 + gUnknown_203F454->array[i].oamCount;
        }
    }

    if (oamCount + arg0 + 1 > 128)
        return 0xFF;
    else
        return oamCount;
}

static bool32 SharesTileWithAnyActive(u32 id)
{
    u32 i;

    for (i = 0; i < gUnknown_203F454->count; i++)
    {
        if (gUnknown_203F454->array[i].isActive && i != id
            && gUnknown_203F454->array[i].tileTag == gUnknown_203F454->array[id].tileTag)
        {
            return TRUE;
        }
    }

    return FALSE;
}

static bool32 SharesPalWithAnyActive(u32 id)
{
    u32 i;

    for (i = 0; i < gUnknown_203F454->count; i++)
    {
        if (gUnknown_203F454->array[i].isActive && i != id
            && gUnknown_203F454->array[i].palTag == gUnknown_203F454->array[id].palTag)
        {
            return TRUE;
        }
    }

    return FALSE;
}

static u8 sub_815D324(u32 shape, u32 size)
{
    return gUnknown_8479658[shape][size];
}
