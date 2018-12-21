#include "global.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "malloc.h"
#include "sound.h"
#include "easy_chat.h"
#include "main.h"
#include "task.h"
#include "decompress.h"
#include "link.h"
#include "link_rfu.h"
#include "unk_815c27c.h"
#include "util.h"
#include "script.h"
#include "event_data.h"
#include "battle_tower.h"
#include "new_game.h"
#include "string_util.h"
#include "menews_jisan.h"
#include "cereader_tool.h"
#include "mystery_gift_menu.h"
#include "help_system.h"
#include "mevent.h"

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
bool32 sub_8143E64(const struct MEventBuffer_3120_Sub * src);
void sub_8143E9C(void);
void sub_8143ED0(void);
bool32 sub_8144018(const struct MEventBuffer_32E0_Sub * src);
void sub_814407C(void);
void sub_81440B4(void);
void sub_8144824(u32, u32, u32 *, s32);
void sub_8144790(void);

extern const u8 gUnknown_841DE52[];
extern const u8 gUnknown_841DE53[];
extern const u8 gUnknown_841DE54[];
extern const u8 gUnknown_841DE7C[];
extern const u8 gUnknown_841DE7D[];
extern const u8 gUnknown_841DE95[];
extern const u8 gUnknown_841DE96[];
extern const u8 gUnknown_841DE97[];
extern const u8 gUnknown_841DE98[];
extern const u8 gUnknown_841DE99[];
extern const u8 gUnknown_841DE9A[];
extern const u8 gUnknown_841DE9B[];
extern const u8 gUnknown_841DE9C[];
extern const u8 gUnknownSerialData_Start[];
extern const u8 gUnknownSerialData_End[];

const u16 gUnknown_8466F00[] = {
    0x02a7,
    0x02a8,
    0x02a9,
    0x02aa,
    0x02ab,
    0x02ac,
    0x02ad,
    0x02ae,
    0x02af,
    0x02b0,
    0x02b1,
    0x02b2,
    0x02b3,
    0x02b4,
    0x02b5,
    0x02b6,
    0x02b7,
    0x02b8,
    0x02b9,
    0x02ba
};

struct MEvent_Str_1 gUnknown_3005ED0;

static EWRAM_DATA bool32 gUnknown_203F3BC = FALSE;

void sub_81435DC(struct MEvent_Str_1 *a0, size_t a1, const void * a2)
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

void sub_8143644(struct MEvent_Str_1 *unused)
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
    gLinkType = 0x5502;
    sub_8009804();
    SetSuppressLinkErrorMessage(TRUE);
}

bool32 sub_81436EC(void)
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

bool32 sub_814374C(void)
{
    if (sub_800AA48() && GetLinkPlayerCount_2() == 2)
        return TRUE;
    return FALSE;
}

u32 sub_8143770(u8 * r4, u16 * r5)
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
            else if (JOY_NEW(B_BUTTON))
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
            else if (JOY_NEW(B_BUTTON))
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
                if (gReceivedRemoteLinkPlayers)
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
            if (!gReceivedRemoteLinkPlayers)
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

bool32 sub_81438F0(u16 * a0, u16 a1)
{
    if (++(*a0) > a1)
    {
        *a0 = 0;
        return TRUE;
    }
    return FALSE;
}

void sub_8143910(u8 taskId)
{
    struct MEventTaskData1 *data = (struct MEventTaskData1 *)gTasks[taskId].data;
    switch (data->t08)
    {
        case 0:
            if (mevent_0814257C(&data->t09, gUnknown_841DE52))
                data->t08 = 1;
            break;
        case 1:
            sub_81436BC();
            sub_81438E8(&data->t00);
            data->t08 = 2;
            break;
        case 2:
            if (sub_81438F0(&data->t00, 10))
                data->t08 = 3;
            break;
        case 3:
            if (!sub_814374C())
            {
                sub_80098B8();
                data->t08 = 4;
            }
            else
                data->t08 = 13;
            break;
        case 4:
            if (mevent_0814257C(&data->t09, gUnknown_841DE53))
            {
                sub_8142504(gUnknown_841DE54);
                sub_81438E8(&data->t00);
                data->t08 = 5;
            }
            break;
        case 5:
            if (sub_81438F0(&data->t00, 90))
            {
                sub_81436BC();
                data->t08 = 6;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                sub_81438E8(&data->t00);
                PlaySE(SE_SELECT);
                data->t08 = 23;
            }
            break;
        case 6:
            if (JOY_NEW(B_BUTTON))
            {
                PlaySE(SE_SELECT);
                sub_80098B8();
                sub_81438E8(&data->t00);
                data->t08 = 23;
            }
            else if (GetLinkPlayerCount_2() > 1)
            {
                sub_81438E8(&data->t00);
                sub_80098B8();
                data->t08 = 7;
            }
            else if (sub_81436EC())
            {
                PlaySE(SE_SELECT);
                sub_80098B8();
                sub_81438E8(&data->t00);
                data->t08 = 8;
            }
            else if (sub_81438F0(&data->t00, 10))
            {
                sub_80098B8();
                sub_81436BC();
                sub_81438E8(&data->t00);
            }
            break;
        case 7:
            if (mevent_0814257C(&data->t09, gUnknown_841DE7C))
                data->t08 = 4;
            break;
        case 8:
            sub_8142504(gUnknown_841DE95);
            sub_81435DC(&gUnknown_3005ED0, gUnknownSerialData_End - gUnknownSerialData_Start, gUnknownSerialData_Start);
            data->t08 = 9;
            break;
        case 9:
            data->t0E = sub_8143674(&gUnknown_3005ED0);
            if (data->t0E != 0)
                data->t08 = 10;
            break;
        case 10:
            sub_8143644(&gUnknown_3005ED0);
            if (data->t0E == 3)
                data->t08 = 20;
            else if (data->t0E == 1)
            {
                sub_81438E8(&data->t00);
                sub_8142504(gUnknown_841DE9B);
                data->t08 = 11;
            }
            else
                data->t08 = 0;
            break;
        case 11:
            if (sub_81438F0(&data->t00, 840))
                data->t08 = 12;
            break;
        case 12:
            sub_81436BC();
            sub_8142504(gUnknown_841DE98);
            data->t08 = 13;
            break;
        case 13:
            switch (sub_8143770(&data->t09, &data->t00))
            {
                case 0:
                    break;
                case 2:
                    sub_8142504(gUnknown_841DE95);
                    data->t08 = 14;
                    break;
                case 1:
                    PlaySE(SE_SELECT);
                    sub_80098B8();
                    data->t08 = 23;
                    break;
                case 5:
                    sub_80098B8();
                    data->t08 = 21;
                    break;
                case 3:
                case 4:
                    sub_80098B8();
                    data->t08 = 20;
                    break;
            }
            break;
        case 14:
            if (HasLinkErrorOccurred())
            {
                sub_80098B8();
                data->t08 = 20;
            }
            else if (GetBlockReceivedStatus())
            {
                ResetBlockReceivedFlags();
                data->t08 = 15;
            }
            break;
        case 15:
            data->t0E = sub_815D6B4(gDecompressionBuffer);
            sub_800AA80(data->t0E);
            data->t08 = 16;
            break;
        case 16:
            if (!gReceivedRemoteLinkPlayers)
            {
                if (data->t0E == 1)
                    data->t08 = 17;
                else
                    data->t08 = 20;
            }
            break;
        case 17:
            if (sub_815D794(gDecompressionBuffer))
            {
                sub_8142504(gUnknown_841DE99);
                sub_81438E8(&data->t00);
                data->t08 = 18;
            }
            else
                data->t08 = 22;
            break;
        case 18:
            if (sub_81438F0(&data->t00, 120))
            {
                sub_8142504(gUnknown_841DE9A);
                PlayFanfare(258);
                data->t08 = 19;
            }
            break;
        case 19:
            if (IsFanfareTaskInactive() &&JOY_NEW(A_BUTTON | B_BUTTON))
                data->t08 = 26;
            break;
        case 23:
            if (mevent_0814257C(&data->t09, gUnknown_841DE7D))
                data->t08 = 26;
            break;
        case 20:
            if (mevent_0814257C(&data->t09, gUnknown_841DE96))
                data->t08 = 0;
            break;
        case 21:
            if (mevent_0814257C(&data->t09, gUnknown_841DE97))
                data->t08 = 0;
            break;
        case 22:
            if (mevent_0814257C(&data->t09, gUnknown_841DE9C))
                data->t08 = 0;
            break;
        case 26:
            sub_812B484();
            Free(data->t10);
            DestroyTask(taskId);
            SetMainCallback2(sub_81422FC);
            break;
    }
}

void sub_8143D24(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->unk_3120, sizeof(gSaveBlock1Ptr->unk_3120));
    sub_8143ED0();
    sub_80BDE28();
}

struct MEventBuffer_3120_Sub * sub_8143D58(void)
{
    return &gSaveBlock1Ptr->unk_3120.buffer_000.data;
}

struct MEventBuffer_32E0_Sub * sav1_get_mevent_buffer_1(void)
{
    return &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
}

struct MEventBuffer_3430_Sub * sav1_get_mevent_buffer_2(void)
{
    return &gSaveBlock1Ptr->unk_3120.buffer_310.data;
}

struct MysteryEventStruct * sub_8143D94(void)
{
    return &gSaveBlock1Ptr->unk_3120.unk_340;
}

u16 * sub_8143DA8(void)
{
    return gSaveBlock1Ptr->unk_3120.unk_338;
}

void sub_8143DBC(void)
{
    sub_8143E9C();
}

bool32 sub_8143DC8(const struct MEventBuffer_3120_Sub * src)
{
    if (!sub_8143E64(src))
        return FALSE;
    sub_8143E9C();
    gSaveBlock1Ptr->unk_3120.buffer_000.data = *src;
    gSaveBlock1Ptr->unk_3120.buffer_000.crc = CalcCRC16WithTable((void *)&gSaveBlock1Ptr->unk_3120.buffer_000.data, sizeof(struct MEventBuffer_3120_Sub));
    return TRUE;
}

bool32 sub_8143E1C(void)
{
    if (CalcCRC16WithTable((void *)&gSaveBlock1Ptr->unk_3120.buffer_000.data, sizeof(struct MEventBuffer_3120_Sub)) != gSaveBlock1Ptr->unk_3120.buffer_000.crc)
        return FALSE;
    if (!sub_8143E64(&gSaveBlock1Ptr->unk_3120.buffer_000.data))
        return FALSE;
    return TRUE;
}

bool32 sub_8143E64(const struct MEventBuffer_3120_Sub * data)
{
    if (data->unk_00 == 0)
        return FALSE;
    return TRUE;
}

bool32 sub_8143E78(void)
{
    const struct MEventBuffer_3120_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_000.data;
    if (data->unk_02 == 0)
        return FALSE;
    return TRUE;
}

void sub_8143E9C(void)
{
    CpuFill32(0, sub_8143D58(), sizeof(gSaveBlock1Ptr->unk_3120.buffer_000.data));
    gSaveBlock1Ptr->unk_3120.buffer_000.crc = 0;
}

void sub_8143ED0(void)
{
    CpuFill32(0, sub_8143D94(), sizeof(struct MysteryEventStruct));
    sub_8146C88();
}

bool32 sub_8143EF4(const u8 * src)
{
    const u8 * r5 = (const u8 *)&gSaveBlock1Ptr->unk_3120.buffer_000.data;
    u32 i;
    if (!sub_8143E1C())
        return FALSE;
    for (i = 0; i < sizeof(struct MEventBuffer_3120_Sub); i++)
    {
        if (r5[i] != src[i])
            return FALSE;
    }
    return TRUE;
}

void sub_8143F38(void)
{
    sub_814407C();
    sub_81440B4();
    sub_8144790();
    ClearRamScript();
    sub_806E2D0();
    sub_806E370();
    sub_80E7524(gSaveBlock2Ptr->unk_4A0);
}

bool32 sub_8143F68(const struct MEventBuffer_32E0_Sub * data)
{
    struct MEventBuffer_3430_Sub * r2;
    struct MEventBuffer_32E0_Sub * r1;
    if (!sub_8144018(data))
        return FALSE;
    sub_8143F38();
    memcpy(&gSaveBlock1Ptr->unk_3120.buffer_1c0.data, data, sizeof(struct MEventBuffer_32E0_Sub));
    gSaveBlock1Ptr->unk_3120.buffer_1c0.crc = CalcCRC16WithTable((void *)&gSaveBlock1Ptr->unk_3120.buffer_1c0.data, sizeof(struct MEventBuffer_32E0_Sub));
    r2 = &gSaveBlock1Ptr->unk_3120.buffer_310.data;
    r1 = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
    r2->unk_06 = r1->unk_02;
    return TRUE;
}

bool32 sub_8143FC8(void)
{
    if (gSaveBlock1Ptr->unk_3120.buffer_1c0.crc != CalcCRC16WithTable((void *)&gSaveBlock1Ptr->unk_3120.buffer_1c0.data, sizeof(struct MEventBuffer_32E0_Sub)))
        return FALSE;
    if (!sub_8144018(&gSaveBlock1Ptr->unk_3120.buffer_1c0.data))
        return FALSE;
    if (!sub_8069DFC())
        return FALSE;
    return TRUE;
}

bool32 sub_8144018(const struct MEventBuffer_32E0_Sub * data)
{
    if (data->unk_00 == 0)
        return FALSE;
    if (data->unk_08_0 > 2)
        return FALSE;
    if (!(data->unk_08_6 == 0 || data->unk_08_6 == 1 || data->unk_08_6 == 2))
        return FALSE;
    if (data->unk_08_2 > 7)
        return FALSE;
    if (data->unk_09 > 7)
        return FALSE;
    return TRUE;
}

bool32 sub_8144054(void)
{
    const struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
    if (data->unk_08_6 == 0)
        return FALSE;
    return TRUE;
}

void sub_814407C(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->unk_3120.buffer_1c0.data, sizeof(struct MEventBuffer_32E0_Sub));
    gSaveBlock1Ptr->unk_3120.buffer_1c0.crc = 0;
}

void sub_81440B4(void)
{
    CpuFill32(0, sav1_get_mevent_buffer_2(), 18 * sizeof(u16));
    gSaveBlock1Ptr->unk_3120.buffer_310.crc = 0;
}

u16 sub_81440E8(void)
{
    if (sub_8143FC8())
        return gSaveBlock1Ptr->unk_3120.buffer_1c0.data.unk_00;
    return 0;
}

void sub_814410C(struct MEventBuffer_32E0_Sub * buffer)
{
    if (buffer->unk_08_6 == 1)
        buffer->unk_08_6 = 0;
}

bool32 sub_8144124(u16 a0)
{
    if (a0 >= 1000 && a0 < 1020)
        return TRUE;
    return FALSE;
}

bool32 sub_8144144(void)
{
    u16 value = sub_81440E8();
    if (!sub_8144124(value))
        return FALSE;
    if (FlagGet(gUnknown_8466F00[value - 1000]) == TRUE)
        return FALSE;
    return TRUE;
}

s32 sub_8144184(const struct MEventBuffer_3430_Sub * data, s32 size)
{
    s32 r3 = 0;
    s32 i;
    for (i = 0; i < size; i++)
    {
        if (data->unk_08[1][i] && data->unk_08[0][i])
            r3++;
    }
    return r3;
}

bool32 sub_81441AC(const struct MEventBuffer_3430_Sub * data1, const u16 * data2, s32 size)
{
    s32 i;
    for (i = 0; i < size; i++)
    {
        if (data1->unk_08[1][i] == data2[1])
            return TRUE;
        if (data1->unk_08[0][i] == data2[0])
            return TRUE;
    }
    return FALSE;
}

bool32 sub_81441F0(const u16 * data)
{
    if (data[1] == 0)
        return FALSE;
    if (data[0] == 0)
        return FALSE;
    if (data[0] >= NUM_SPECIES)
        return FALSE;
    return TRUE;
}

s32 sub_8144218(void)
{
    struct MEventBuffer_32E0_Sub * data;
    if (!sub_8143FC8())
        return 0;
    data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
    if (data->unk_08_0 != 1)
        return 0;
    return sub_8144184(&gSaveBlock1Ptr->unk_3120.buffer_310.data, data->unk_09);
}

bool32 sub_8144254(const u16 * data)
{
    struct MEventBuffer_32E0_Sub * buffer = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
    s32 size = buffer->unk_09;
    s32 i;
    if (!sub_81441F0(data))
        return FALSE;
    if (sub_81441AC(&gSaveBlock1Ptr->unk_3120.buffer_310.data, data, size))
        return FALSE;
    for (i = 0; i < size; i++)
    {
        if (gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_08[1][i] == 0 && gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_08[0][i] == 0)
        {
            gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_08[1][i] = data[1];
            gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_08[0][i] = data[0];
            return TRUE;
        }
    }
    return FALSE;
}

void sub_81442CC(struct MEventStruct_Unk1442CC * data)
{
    s32 i;
    CpuFill32(0, data, sizeof(struct MEventStruct_Unk1442CC));
    data->unk_00 = 0x101;
    data->unk_04 = 1;
    data->unk_08 = 1;
    data->unk_0C = 1;
    data->unk_10 = 1;
    if (sub_8143FC8())
    {
        data->unk_14 = sav1_get_mevent_buffer_1()->unk_00;
        data->unk_20 = *sav1_get_mevent_buffer_2();
        data->unk_44 = sav1_get_mevent_buffer_1()->unk_09;
    }
    else
        data->unk_14 = 0;
    for (i = 0; i < 4; i++)
        data->unk_16[i] = gSaveBlock1Ptr->unk_3120.unk_338[i];
    CopyUnalignedWord(data->unk_4C, gSaveBlock2Ptr->playerTrainerId);
    StringCopy(data->unk_45, gSaveBlock2Ptr->playerName);
    for (i = 0; i < 6; i++)
        data->unk_50[i] = gSaveBlock1Ptr->unk2CA0[i];
    memcpy(data->unk_5C, RomHeaderGameCode, 4);
    data->unk_60 = RomHeaderSoftwareVersion;
}

bool32 sub_81443D4(const struct MEventStruct_Unk1442CC * data)
{
    if (data->unk_00 != 0x101)
        return FALSE;
    if (!(data->unk_04 & 1))
        return FALSE;
    if (!(data->unk_08 & 1))
        return FALSE;
    if (!(data->unk_0C & 1))
        return FALSE;
    if (!(data->unk_10 & 0x0F))
        return FALSE;
    return TRUE;
}

u32 sub_8144418(const u16 * a0, const struct MEventStruct_Unk1442CC * a1, void * unused)
{
    if (a1->unk_14 == 0)
        return 0;
    if (*a0 == a1->unk_14)
        return 1;
    return 2;
}

u32 sub_8144434(const u16 * a0, const struct MEventStruct_Unk1442CC * a1, void * unused)
{
    s32 r4 = a1->unk_44 - sub_8144184(&a1->unk_20, a1->unk_44);
    if (r4 == 0)
        return 1;
    if (sub_81441AC(&a1->unk_20, a0, a1->unk_44))
        return 3;
    if (r4 == 1)
        return 4;
    return 2;
}

bool32 sub_8144474(const struct MEventStruct_Unk1442CC * a0, const u16 * a1)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        if (a0->unk_16[i] != a1[i])
            return FALSE;
    }
    return TRUE;
}

s32 sub_814449C(const struct MEventStruct_Unk1442CC * a0)
{
    return sub_8144184(&a0->unk_20, a0->unk_44);
}

u16 sub_81444B0(const struct MEventStruct_Unk1442CC * a0, u32 command)
{
    switch (command)
    {
        case 0:
            return a0->unk_20.unk_00;
        case 1:
            return a0->unk_20.unk_02;
        case 2:
            return a0->unk_20.unk_04;
        case 3:
            return sub_814449C(a0);
        case 4:
            return a0->unk_44;
        default:
             AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c", 825);
            return 0;
    }
}

void sub_814451C(u32 command)
{
    struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
    if (data->unk_08_0 == 2)
    {
        u16 * dest = NULL;
        switch (command)
        {
            case 0:
                dest = &gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_00;
                break;
            case 1:
                dest = &gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_02;
                break;
            case 2:
                dest = &gSaveBlock1Ptr->unk_3120.buffer_310.data.unk_04;
                break;
            case 3:
                break;
            case 4:
                break;
        }
        if (dest == NULL)
        {
             AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c", 868);
        }
        else if (++(*dest) > 999)
        {
            *dest = 999;
        }
    }
}

u16 sub_81445C0(u32 command)
{
    switch (command)
    {
        case 0:
        {
            struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
            if (data->unk_08_0 == 2)
            {
                struct MEventBuffer_3430_Sub * buffer = &gSaveBlock1Ptr->unk_3120.buffer_310.data;
                return buffer->unk_00;
            }
            break;
        }
        case 1:
        {
            struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
            if (data->unk_08_0 == 2)
            {
                struct MEventBuffer_3430_Sub * buffer = &gSaveBlock1Ptr->unk_3120.buffer_310.data;
                return buffer->unk_02;
            }
            break;
        }
        case 2:
        {
            struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
            if (data->unk_08_0 == 2)
            {
                struct MEventBuffer_3430_Sub * buffer = &gSaveBlock1Ptr->unk_3120.buffer_310.data;
                return buffer->unk_04;
            }
            break;
        }
        case 3:
        {
            struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
            if (data->unk_08_0 == 1)
                return sub_8144218();
            break;
        }
        case 4:
        {
            struct MEventBuffer_32E0_Sub * data = &gSaveBlock1Ptr->unk_3120.buffer_1c0.data;
            if (data->unk_08_0 == 1)
                return data->unk_09;
            break;
        }
    }
    AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c", 913);
    return 0;
}

void sub_81446C4(void)
{
    gUnknown_203F3BC = FALSE;
}

bool32 sub_81446D0(u16 a0)
{
    gUnknown_203F3BC = FALSE;
    if (a0 == 0)
        return FALSE;
    if (!sub_8143FC8())
        return FALSE;
    if (gSaveBlock1Ptr->unk_3120.buffer_1c0.data.unk_00 != a0)
        return FALSE;
    gUnknown_203F3BC = TRUE;
    return TRUE;
}

void sub_8144714(u32 a0, u32 a1)
{
    if (gUnknown_203F3BC)
    {
        switch (a0)
        {
            case 2:
                sub_8144824(2, a1, gSaveBlock1Ptr->unk_3120.unk_344[1], 5);
                break;
            case 0:
                sub_8144824(0, a1, gSaveBlock1Ptr->unk_3120.unk_344[0], 5);
                break;
            case 1:
                sub_8144824(1, a1, gSaveBlock1Ptr->unk_3120.unk_344[0], 5);
                break;
            default:
                 AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c", 988);
        }
    }
}

void sub_8144790(void)
{
    CpuFill32(0, gSaveBlock1Ptr->unk_3120.unk_344, sizeof(gSaveBlock1Ptr->unk_3120.unk_344));
}

bool32 sub_81447BC(u32 a0, u32 * a1, s32 size)
{
    s32 i;
    s32 j;

    for (i = 0; i < size; i++)
    {
        if (a1[i] == a0)
            break;
    }
    if (i == size)
    {
        for (j = size - 1; j > 0; j--)
        {
            a1[j] = a1[j - 1];
        }
        a1[0] = a0;
        return TRUE;
    }
    else
    {
        for (j = i; j > 0; j--)
        {
            a1[j] = a1[j - 1];
        }
        a1[0] = a0;
        return FALSE;
    }
}

void sub_8144824(u32 a0, u32 a1, u32 * a2, s32 a3)
{
    if (sub_81447BC(a1, a2, a3))
        sub_814451C(a0);
}
