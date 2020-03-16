#include "global.h"
#include "gflib.h"
#include "pokemon_storage_system_internal.h"

static EWRAM_DATA struct UnkStruct_2000020 *gUnknown_203982C = NULL;

static void sub_8096CDC(struct UnkStruct_2000028 *unkStruct);
static void sub_8096D70(struct UnkStruct_2000028 *unkStruct);

void sub_8096BE4(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u32 arg2)
{
    gUnknown_203982C = arg0;
    arg0->unk_00 = arg1;
    arg0->unk_05 = arg2;
    arg0->unk_04 = 0;
}

void sub_8096BF8(void)
{
    u16 i;

    if (gUnknown_203982C->unk_04)
    {
        for (i = 0; i < gUnknown_203982C->unk_04; i++)
        {
            struct UnkStruct_2000028 *unkStruct = &gUnknown_203982C->unk_00[i];
            unkStruct->unk_0c(unkStruct);
        }

        gUnknown_203982C->unk_04 = 0;
    }
}

static bool8 sub_8096C40(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height, u16 unkArg)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_203982C->unk_04 >= gUnknown_203982C->unk_05)
        return FALSE;

    unkStruct = &gUnknown_203982C->unk_00[gUnknown_203982C->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + 2 * (dTop * 32 + dLeft);
    unkStruct->unk_00 = src + 2 * (sTop * unkArg + sLeft);
    unkStruct->newField = height;
    unkStruct->unk_0a = unkArg;
    unkStruct->unk_0c = sub_8096CDC;
    return TRUE;
}

static void sub_8096CDC(struct UnkStruct_2000028 *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->newField; i++)
    {
        CpuCopy16(unkStruct->unk_00, unkStruct->unk_04, unkStruct->unk_08);
        unkStruct->unk_04 += 64;
        unkStruct->unk_00 += (unkStruct->unk_0a * 2);
    }
}

static bool8 sub_8096D14(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_203982C->unk_04 >= gUnknown_203982C->unk_05)
        return FALSE;

    unkStruct = &gUnknown_203982C->unk_00[gUnknown_203982C->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + ((dTop * 32) + dLeft) * 2;
    unkStruct->newField = height;
    unkStruct->unk_0c = sub_8096D70;
    return TRUE;
}

static void sub_8096D70(struct UnkStruct_2000028 *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->newField; i++)
    {
        Dma3FillLarge_(0, unkStruct->unk_04, unkStruct->unk_08, 16);
        unkStruct->unk_04 += 64;
    }
}
