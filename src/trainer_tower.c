#include "global.h"
#include "malloc.h"
#include "save.h"
#include "cereader_tool.h"

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
