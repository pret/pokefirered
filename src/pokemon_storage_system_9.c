#include "global.h"
#include "gflib.h"
#include "pokemon_storage_system_internal.h"

static EWRAM_DATA struct UnkUtil *sUnkUtil = NULL;

static void UnkUtil_CpuRun(struct UnkUtilData *utilData);
static void UnkUtil_DmaRun(struct UnkUtilData *utilData);

void PSS_InitCopyAndFillManager(struct UnkUtil *util, struct UnkUtilData *data, u32 max)
{
    sUnkUtil = util;
    util->data = data;
    util->max = max;
    util->numActive = 0;
}

void UnkUtil_Run(void)
{
    u16 i;

    if (sUnkUtil->numActive)
    {
        for (i = 0; i < sUnkUtil->numActive; i++)
        {
            struct UnkUtilData *data = &sUnkUtil->data[i];
            data->func(data);
        }

        sUnkUtil->numActive = 0;
    }
}

static bool8 UnkUtil_CpuAdd(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height, u16 unkArg)
{
    struct UnkUtilData *unkStruct;

    if (sUnkUtil->numActive >= sUnkUtil->max)
        return FALSE;

    unkStruct = &sUnkUtil->data[sUnkUtil->numActive++];
    unkStruct->copySize = width * 2;
    unkStruct->dest = dest + 2 * (dTop * 32 + dLeft);
    unkStruct->src = src + 2 * (sTop * unkArg + sLeft);
    unkStruct->height = height;
    unkStruct->width = unkArg;
    unkStruct->func = UnkUtil_CpuRun;
    return TRUE;
}

static void UnkUtil_CpuRun(struct UnkUtilData *utilData)
{
    u16 i;

    for (i = 0; i < utilData->height; i++)
    {
        CpuCopy16(utilData->src, utilData->dest, utilData->copySize);
        utilData->dest += 64;
        utilData->src += (utilData->width * 2);
    }
}

static bool8 UnkUtil_DmaAdd(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkUtilData *unkStruct;

    if (sUnkUtil->numActive >= sUnkUtil->max)
        return FALSE;

    unkStruct = &sUnkUtil->data[sUnkUtil->numActive++];
    unkStruct->copySize = width * 2;
    unkStruct->dest = dest + ((dTop * 32) + dLeft) * 2;
    unkStruct->height = height;
    unkStruct->func = UnkUtil_DmaRun;
    return TRUE;
}

static void UnkUtil_DmaRun(struct UnkUtilData *utilData)
{
    u16 i;

    for (i = 0; i < utilData->height; i++)
    {
        Dma3FillLarge16_(0, utilData->dest, utilData->copySize);
        utilData->dest += 64;
    }
}
