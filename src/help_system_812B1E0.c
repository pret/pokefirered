#include "global.h"
#include "event_data.h"

EWRAM_DATA u16 gUnknown_203B0EC = 0;
EWRAM_DATA u8 gUnknown_203B0EE = 0;

u16 gUnknown_3005EA0;

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
