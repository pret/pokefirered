#include "global.h"
#include "main.h"
#include "decompress.h"
#include "link.h"
#include "unk_815c27c.h"

struct MEvent_Str_1
{
    u16 unk_000;
    u32 unk_004;
    u32 unk_008;
};

void sub_81435DC(struct MEvent_Str_1 *a0, u32 a1, u32 a2)
{
    vu16 imeBak = REG_IME;
    REG_IME = 0;
    gIntrTable[1] = sub_815C6D4;
    gIntrTable[2] = sub_815C6C4;
    sub_815C8C8();
    sub_815C960();
    REG_IE |= INTR_FLAG_VCOUNT;
    REG_IME = imeBak;
    a0->unk_000 = 0;
    a0->unk_004 = a1;
    a0->unk_008 = a2;
}

void sub_8143644(void)
{
    vu16 imeBak = REG_IME;
    REG_IME = 0;
    sub_815C960();
    sub_815C91C();
    RestoreSerialTimer3IntrHandlers();
    REG_IME = imeBak;
}

u8 sub_8143674(struct MEvent_Str_1 *a0)
{
    u8 resp = 0;
    a0->unk_000 = sub_815C498(1, a0->unk_004, a0->unk_008, 0);
    if ((a0->unk_000 & 0x13) == 0x10)
        resp = 1;
    if (a0->unk_000 & 8)
        resp = 2;
    if (a0->unk_000 & 4)
        resp = 3;
    gUnknown_3003F84 = 0;
    return resp;
}

void sub_81436BC(void)
{
    memset(gDecompressionBuffer, 0, 0x2000);
    gUnknown_202271A = 0x5502;
    sub_8009804();
    SetSuppressLinkErrorMessage(TRUE);
}

bool8 sub_81436EC(void)
{
    vu16 imeBak = REG_IME;
    u16 data[4];
    REG_IME = 0;
    *(u64 *)data = gUnknown_3003FB4;
    REG_IME = imeBak;
    if (   data[0] == 0xB9A0
        && data[1] == 0xCCD0
        && data[2] == 0xFFFF
        && data[3] == 0xFFFF
    )
        return TRUE;
    return FALSE;
}
