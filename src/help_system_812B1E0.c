#include "global.h"
#include "event_data.h"
#include "constants/maps.h"

EWRAM_DATA u16 gUnknown_203B0EC = 0;
EWRAM_DATA u8 gUnknown_203B0EE = 0;

u16 gUnknown_3005EA0;

bool32 sub_812B27C(const u16 * mapIdxs);

extern const u16 gUnknown_845C594[]; // marts
extern const u16 gUnknown_845C5BC[]; // gyms

void sub_812B1E0(u8 a0)
{
    gUnknown_203B0EC = a0;
}

void HelpSystem_SetSomeVariable2(u8 a0)
{
    switch (gUnknown_203B0EC)
    {
    case 23:
    case 24:
    case 25:
    case 26:
        if (a0 == 9 || a0 == 5 || a0 == 6 || a0 == 7 || a0 == 8)
            break;
        // fallthrough
    default:
        gUnknown_203B0EC = a0;
        break;
    }
}

void sub_812B220(void)
{
    gUnknown_203B0EC = gSpecialVar_0x8004;
}

void sub_812B234(void)
{
    gUnknown_3005EA0 = gUnknown_203B0EC;
}

void sub_812B248(void)
{
    gUnknown_203B0EC = gUnknown_3005EA0;
}

bool32 sub_812B25C(void)
{
    return sub_812B27C(gUnknown_845C594);
}

bool32 sub_812B26C(void)
{
    return sub_812B27C(gUnknown_845C5BC);
}

bool32 sub_812B27C(const u16 * mapIdxs)
{
    u16 mapIdx = (gSaveBlock1Ptr->location.mapGroup << 8) + gSaveBlock1Ptr->location.mapNum;
    s32 i;

    for (i = 0; mapIdxs[i] != MAP_UNDEFINED; i++)
    {
        if (mapIdxs[i] == mapIdx)
            return TRUE;
    }

    return FALSE;
}

