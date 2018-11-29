#include "global.h"
#include "constants/songs.h"
#include "malloc.h"
#include "sound.h"
#include "main.h"
#include "task.h"
#include "decompress.h"
#include "link.h"
#include "unk_815c27c.h"

struct MEvent_Str_1
{
    u16 unk_000;
    u32 unk_004;
    u32 unk_008;
};

struct MEvent_Str_2
{
    u8 fill_00[0x40];
};

struct MEventTaskData1
{
    u16 t00;
    u16 t02;
    u16 t04;
    u16 t06;
    u8 t08;
    u8 t09;
    u8 t0A;
    u8 t0B;
    u8 t0C;
    u8 t0D;
    u8 t0E;
    struct MEvent_Str_2 *t10;
};

void sub_8143910(u8 taskId);

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

bool8 sub_814374C(void)
{
    if (sub_800AA48() && GetLinkPlayerCount_2() == 2)
        return TRUE;
    return FALSE;
}

u8 sub_8143770(u8 * r4, u16 * r5)
{
    if ((*r4 == 3 || *r4 == 4 || *r4 == 5) && HasLinkErrorOccurred())
    {
        *r4 = 0;
        return 3;
    }
    switch (*r4)
    {
        case 0:
            if (sub_800AA48() && GetLinkPlayerCount_2() > 1)
            {
                *r4 = 1;
                ;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                *r4 = 0;
                return 1;
            }
            break;
        case 1:
            if (++(*r5) > 5)
            {
                *r5 = 0;
                *r4 = 2;
            }
            break;
        case 2:
            if (GetLinkPlayerCount_2() == 2)
            {
                PlaySE(SE_TOY_G);
                sub_800A5BC();
                *r5 = 0;
                *r4 = 3;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                *r4 = 0;
                return 1;
            }
            break;
        case 3:
            if (++(*r5) > 30)
            {
                *r4 = 0;
                return 5;
            }
            else if (IsLinkConnectionEstablished())
            {
                if (gUnknown_3003F64)
                {
                    if (IsLinkPlayerDataExchangeComplete())
                    {
                        *r4 = 0;
                        return 2;
                    }
                    else
                        *r4 = 4;
                }
                else
                    *r4 = 3;
            }
            break;
        case 4:
            sub_800AA80(0);
            *r4 = 5;
            break;
        case 5:
            if (!gUnknown_3003F64)
            {
                *r4 = 0;
                return 4;
            }
            break;
    }
    return 0;
}

void sub_81438A0(void)
{
    u8 taskId = CreateTask(sub_8143910, 0);
    struct MEventTaskData1 *data = (struct MEventTaskData1 *)gTasks[taskId].data;
    data->t08 = 0;
    data->t09 = 0;
    data->t0A = 0;
    data->t0B = 0;
    data->t0C = 0;
    data->t0D = 0;
    data->t00 = 0;
    data->t02 = 0;
    data->t04 = 0;
    data->t06 = 0;
    data->t0E = 0;
    data->t10 = AllocZeroed(sizeof(struct MEvent_Str_2));
}

void sub_81438E8(u16 *a0)
{
    *a0 = 0;
}

bool8 sub_81438F0(u16 * a0, u16 a1)
{
    if (++(*a0) > a1)
    {
        *a0 = 0;
        return TRUE;
    }
    return FALSE;
}
