#include "global.h"
#include "gflib.h"
#include "pokemon_storage_system_internal.h"

static EWRAM_DATA struct UnkUtil *sCopyAndFillManager = NULL;

static void sub_8096CDC(struct UnkUtilData *unkStruct);
static void sub_8096D70(struct UnkUtilData *unkStruct);

void PSS_InitCopyAndFillManager(struct UnkUtil *manager, struct UnkUtilData *specs, u32 count)
{
    sCopyAndFillManager = manager;
    manager->data = specs;
    manager->max = count;
    manager->numActive = 0;
}

void sub_8096BF8(void)
{
    u16 i;

    if (sCopyAndFillManager->numActive)
    {
        for (i = 0; i < sCopyAndFillManager->numActive; i++)
        {
            struct UnkUtilData *unkStruct = &sCopyAndFillManager->data[i];
            unkStruct->func(unkStruct);
        }

        sCopyAndFillManager->numActive = 0;
    }
}

static bool8 sub_8096C40(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height, u16 unkArg)
{
    struct UnkUtilData *unkStruct;

    if (sCopyAndFillManager->numActive >= sCopyAndFillManager->max)
        return FALSE;

    unkStruct = &sCopyAndFillManager->data[sCopyAndFillManager->numActive++];
    unkStruct->copySize = width * 2;
    unkStruct->dest = dest + 2 * (dTop * 32 + dLeft);
    unkStruct->src = src + 2 * (sTop * unkArg + sLeft);
    unkStruct->height = height;
    unkStruct->width = unkArg;
    unkStruct->func = sub_8096CDC;
    return TRUE;
}

static void sub_8096CDC(struct UnkUtilData *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->height; i++)
    {
        CpuCopy16(unkStruct->src, unkStruct->dest, unkStruct->copySize);
        unkStruct->dest += 64;
        unkStruct->src += (unkStruct->width * 2);
    }
}

static bool8 sub_8096D14(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkUtilData *unkStruct;

    if (sCopyAndFillManager->numActive >= sCopyAndFillManager->max)
        return FALSE;

    unkStruct = &sCopyAndFillManager->data[sCopyAndFillManager->numActive++];
    unkStruct->copySize = width * 2;
    unkStruct->dest = dest + ((dTop * 32) + dLeft) * 2;
    unkStruct->height = height;
    unkStruct->func = sub_8096D70;
    return TRUE;
}

static void sub_8096D70(struct UnkUtilData *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->height; i++)
    {
        Dma3FillLarge16_(0, unkStruct->dest, unkStruct->copySize);
        unkStruct->dest += 64;
    }
}
