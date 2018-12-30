#include "global.h"
#include "malloc.h"
#include "save.h"
#include "event_data.h"
#include "cereader_tool.h"

struct UnkStruct_8479D38
{
    u8 flags1[8];
    u8 flags2[8];
    u8 flags3[8];
    u8 unk_24;
    u8 unk_25;
};

extern const struct UnkStruct_8479D38 gUnknown_8479D38[15];

bool32 sub_815D7BC(void * dest, void * buffer)
{
    if (TryCopySpecialSaveSection(30, buffer) != 1)
        return FALSE;
    memcpy(dest + 0x000, buffer, 0xF88);

    if (TryCopySpecialSaveSection(31, buffer) != 1)
        return FALSE;
    memcpy(dest + 0xF88, buffer, 0xF80);

    if (!sub_815D6B4(dest))
        return FALSE;
    return TRUE;
}

bool32 sub_815D80C(void * dest)
{
    void * buffer = AllocZeroed(0x1000);
    bool32 success = sub_815D7BC(dest, buffer);
    Free(buffer);
    return success;
}

bool32 sub_815D834(void)
{
    // Stubbed out?
    return FALSE;
}

void sub_815D838(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        const u8 * flags1 = gUnknown_8479D38[i].flags1;
        const u8 * flags2 = gUnknown_8479D38[i].flags2;
        const u8 * flags3 = gUnknown_8479D38[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags1[j] != 0xFF)
                FlagSet(1000 + flags1[j]);
            if (flags2[j] != 0xFF)
                FlagSet(1000 + flags2[j]);
            if (flags3[j] != 0xFF)
                FlagSet(1000 + flags3[j]);
        }
    }
}
