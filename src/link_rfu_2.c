#include "global.h"
#include "librfu.h"
#include "link.h"
#include "link_rfu.h"
#include "overworld.h"
#include "quest_log.h"
#include "task.h"

struct UnkRfuStruct_2_Sub_6c
{
    /* 0x00 */ u16 unk_00;
    /* 0x02 */ u16 unk_02;
    /* 0x04 */ const u8 *unk_04;
    /* 0x08 */ u32 unk_08;
    /* 0x0c */ u32 unk_0c;
    /* 0x10 */ u8 unk_10;
    /* 0x11 */ u8 unk_11;
    /* 0x12 */ u8 unk_12;
};

struct UnkRfuStruct_2
{
    /* 0x000 */ void (*RfuFunc)(void);
    /* 0x004 */ u16 unk_04;
    /* 0x006 */ u8 filler_06[4];
    /* 0x00a */ u16 unk_0a;
    /* 0x00c */ u8 unk_0c;
    /* 0x00d */ u8 playerCount;
    /* 0x00e */ u8 unk_0e;
    /* 0x00f */ u8 unk_0f;
    /* 0x010 */ u16 unk_10;
    /* 0x012 */ u16 unk_12;
    /* 0x014 */ u8 unk_14[4][14];
    /* 0x04c */ u8 unk_4c[14];
    /* 0x05a */ u8 unk_5a;
    /* 0x05b */ u8 unk_5b;
    /* 0x05c */ u8 unk_5c[5];
    /* 0x061 */ u8 unk_61[5];
    /* 0x066 */ u8 unk_66;
    /* 0x067 */ u8 unk_67;
    /* 0x068 */ u8 filler_68[4];
    /* 0x06c */ struct UnkRfuStruct_2_Sub_6c unk_6c;
    /* 0x080 */ struct UnkRfuStruct_2_Sub_6c unk_80[5];
    /* 0x0e4 */ u8 unk_e4[5];
    /* 0x0e9 */ u8 unk_e9[5];
    /* 0x0ee */ vu8 unk_ee;
    /* 0x0ef */ u8 unk_ef;
    /* 0x0f0 */ u8 unk_f0;
    /* 0x0f1 */ u8 unk_f1;
    /* 0x0f2 */ u16 unk_f2[6];
    /* 0x0fe */ u16 unk_fe;
    /* 0x100 */ u16 unk_100;
    /* 0x102 */ u8 unk_102;
    /* 0x103 */ u8 filler_103[0x10A - 0x103];
    /* 0x10A */ struct UnkLinkRfuStruct_02022B14 unk_10A;
    /* 0x11B */ u8 filler_;
    /* 0x11C */ u8 playerName[PLAYER_NAME_LENGTH];
    /* 0x124 */ struct UnkRfuStruct_2_Sub_124 unk_124;
    /* 0x6a0 */ struct UnkRfuStruct_2_Sub_9e8 unk_9e8;
    /* 0x8d4 */ struct UnkRfuStruct_2_Sub_c1c unk_c1c;
    /* 0x8f4 */ vu8 unk_c3c;
    /* 0x8f5 */ u8 unk_c3d;
    /* 0x8f6 */ vu8 unk_c3e;
    /* 0x8f7 */ u8 unk_c3f[70];
    /* 0x93d */ u8 unk_c85;
    /* 0x93e */ u8 unk_c86;
    /* 0x93f */ u8 unk_c87[5][7][2];
    /* 0x985 */ u8 unk_ccd;
    /* 0x986 */ u8 unk_cce;
    /* 0x987 */ u8 unk_ccf;
    /* 0x988 */ vu8 unk_cd0;
    /* 0x989 */ u8 unk_cd1[4];
    /* 0x98d */ u8 unk_cd5[4];
    /* 0x991 */ u8 unk_cd9;
    /* 0x992 */ u8 unk_cda;
    /* 0x993 */ vu8 unk_cdb;
    /* 0x994 */ vu8 unk_cdc;
    /* 0x995 */ u8 unk_cdd;
    /* 0x996 */ u8 unk_cde[4];
    /* 0x99a */ u8 unk_ce2;
    /* 0x99b */ u8 unk_ce3;
    /* 0x99c */ u8 unk_ce4;
    /* 0x99d */ u8 unk_ce5;
    /* 0x99e */ u8 unk_ce6;
    /* 0x99f */ u8 unk_ce7;
    /* 0x9a0 */ u8 unk_ce8;
    /* 0x9a1 */ u8 unk_ce9;
    /* 0x9a2 */ u8 unk_cea[4];
    /* 0x9a6 */ u8 unk_cee[4];
} Rfu; // size: 0x9AC

EWRAM_DATA struct UnkLinkRfuStruct_02022B2C gUnknown_203ABF0 = {};
EWRAM_DATA struct UnkLinkRfuStruct_02022B44 gUnknown_203AC08 = {};

ALIGNED(8) IWRAM_DATA u8 gUnknown_3001188;
ALIGNED(8) IWRAM_DATA struct RfuAPIBuffer gRfuAPIBuffer;
ALIGNED(8) IWRAM_DATA u8 gUnknown_3001FF8[14];
ALIGNED(8) IWRAM_DATA u16 gUnknown_3002008[7];

struct UnkLinkRfuStruct_02022B14 gUnknown_3005440;
u8 gUnknown_3005E00[PLAYER_NAME_LENGTH];

void sub_80F8AA4(void);
void sub_80F8AEC(void);
void sub_80F8D20(u16 a0);
void sub_80F8DA8(u16 a0);
void sub_80F906C(void);
void sub_80F9868(u8 unused);
void sub_80F9CB4(struct UnkRfuStruct_2_Sub_6c *data);
void sub_80F9D04(u16 command);
void rfufunc_80F9F44(void);
void sub_80F9FA8(void);
void rfufunc_80FA020(void);
void sub_80FA510(void);
void sub_80FA738(void);
int sub_80FA788(void);
void sub_80FA834(u8 taskId);
void sub_80FA9D0(u16 a0);
bool32 sub_80FAA58(void * a0);
void sub_80FAA94(u8 taskId);
void sub_80FACF0(u8 taskId);
void sub_80FAFE0(u8 a0);
void sub_80FB0E8(u32 a0);
void sub_80FBCF8(u32 a0);
void sub_80FC208(void);

const struct UnkLinkRfuStruct_02022B2C gUnknown_843EBB4 = {
    .unk_00 = 0x04,
    .unk_01 = 0x20,
    .unk_02 = 0x0000,
    .unk_04 = 0x00,
    .unk_06 = 0x0002,
    .unk_08 = &gUnknown_3005440,
    .unk_0c = gUnknown_3005E00,
    .unk_10 = 0x01,
    .unk_11 = 0x00,
    .unk_12 = 0x0258,
    .unk_14 = 0x012c
};

const u8 gUnknown_843EBCC[] = {
    0, 3, 2, 1, 0
};

const u32 gUnknown_843EBD4[] = {
    0x000000,
    0x000001,
    0x000003,
    0x000007,
    0x00000f,
    0x00001f,
    0x00003f,
    0x00007f,
    0x0000ff,
    0x0001ff,
    0x0003ff,
    0x0007ff,
    0x000fff,
    0x001fff,
    0x003fff,
    0x007fff,
    0x00ffff,
    0x01ffff,
    0x03ffff,
    0x07ffff,
    0x0fffff,
    0x1fffff,
    0x3fffff,
    0x7fffff,
    0xffffff
};

const u8 gUnknown_843EC38[] = {
    0, 0, 1,
    1, 2, 2,
    2, 2, 3
};

const u8 gUnknown_843EC41[] = {
    0, 1, 1, 2,
    1, 2, 2, 3,
    1, 2, 2, 3,
    2, 3, 3, 4
};

const u8 gUnknown_843EC51[] = {
    0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
};

const struct {
    u8 *buffer;
    u32 size;
} gUnknown_843EC64[] = {
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 100 },
    { gBlockSendBuffer, 220 },
    { gBlockSendBuffer,  40 }
};

const u16 gUnknown_843EC8C[] = {
    0x0002, 0x7f7d, 0xFFFF
};

const char sUnref_843EC92[][15] = {
    "RFU WAIT",
    "RFU BOOT",
    "RFU ERROR",
    "RFU RESET",
    "RFU CONFIG",
    "RFU START",
    "RFU SC POLL",
    "RFU SP POLL",
    "RFU START",
    "RFU SEND ERR",
    "RFU CP POLL"
};

const char sUnref_843ED37[][16] = {
    "              ",
    "RECOVER START ",
    "DISSCONECT    ",
    "RECOVER SUUSES",
    "RECOVER FAILED"
};

const TaskFunc gUnknown_843ED88[] = {
    sub_80FA834,
    sub_80FAA94,
    sub_80FACF0
};

void nullsub_87(const void *unused_0, u8 unused_1, u8 unused_2)
{
    // debug?
}

void nullsub_88(u16 unused_0, u8 unused_1, u8 unused_2, u8 unused_3)
{

}

void sub_80F85F8(void)
{
    s32 i;
    u8 unk_ee_bak = Rfu.unk_ee;
    CpuFill16(0, &Rfu, sizeof Rfu);
    Rfu.unk_0c = 0xFF;
    Rfu.unk_ee = unk_ee_bak;
    if (Rfu.unk_ee != 4)
    {
        Rfu.unk_ee = 0;
    }
    for (i = 0; i < 5; i++)
    {
        sub_80F9CB4(Rfu.unk_80 + i);
    }
    sub_80F9CB4(&Rfu.unk_6c);
    sub_80FC478(&Rfu.unk_124);
    sub_80FC4D4(&Rfu.unk_9e8);
    CpuFill16(0, gSendCmd, sizeof gSendCmd);
    CpuFill16(0, gRecvCmds, sizeof gRecvCmds);
    CpuFill16(0, gLinkPlayers, sizeof gLinkPlayers);
}

void InitRFU(void)
{
    IntrFunc serialIntr = gIntrTable[1];
    IntrFunc timerIntr = gIntrTable[2];
    sub_80F86F4();
    rfu_REQ_stopMode();
    rfu_waitREQComplete();
    REG_IME = 0;
    gIntrTable[1] = serialIntr;
    gIntrTable[2] = timerIntr;
    REG_IME = INTR_FLAG_VBLANK;
}

void sub_80F86F4(void)
{
    if (!rfu_initializeAPI(&gRfuAPIBuffer, sizeof gRfuAPIBuffer, gIntrTable + 1, TRUE))
    {
        gLinkType = 0;
        sub_80FB128(0);
        sub_80F85F8();
        rfu_setTimerInterrupt(3, gIntrTable + 2);
    }
}

void sub_80F8738(u8 taskId)
{
    sub_80FA738();
    switch (Rfu.unk_04)
    {
    case 0:
        sub_80FD4B0(&gUnknown_203ABF0);
        Rfu.unk_04 = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 2:
        sub_80FD538(Rfu.unk_0c, 0, 240, gUnknown_843EC8C);
        Rfu.unk_04 = 3;
        gTasks[taskId].data[1] = 6;
        break;
    case 3:
        break;
    case 4:
        sub_80FD760(FALSE);
        Rfu.unk_04 = 5;
        break;
    case 5:
        break;
    case 18:
        Rfu.unk_cdb = 0;
        sub_80FEA10(sub_80F8DA8);
        sub_80F8AA4();
        sub_80F8AEC();
        Rfu.unk_04 = 20;
        gTasks[taskId].data[1] = 8;
        CreateTask(sub_80FA834, 5);
        DestroyTask(taskId);
        break;
    }
}

s32 sub_80F886C(u8 idx)
{
    return gUnknown_843EC51[idx];
}

void sub_80F887C(s32 r2, s32 r5)
{
    u8 i;
    u8 r4 = 1;
    s32 r1 = r2;
    s32 r6 = 0;
    if (r5 == -1)
    {
        for (i = 0; i < 4; r2 >>= 1, i++)
        {
            if (r2 & 1)
            {
                Rfu.unk_cde[i] = r4;
                r4++;
            }
        }
    }
    else
    {
        for (i = 0; i < 4; r1 >>= 1, i++)
        {
            if (!(r1 & 1))
            {
                Rfu.unk_cde[i] = 0;
            }
        }
        for (r4 = 4; r4 != 0; r4--)
        {
            for (i = 0; i < 4 && Rfu.unk_cde[i] != r4; i++);
            if (i == 4)
            {
                r6 = r4;
            }
        }
        for (r5 &= ~r2, i = 0; i < 4; r5 >>= 1, i++)
        {
            if (r5 & 1)
            {
                Rfu.unk_cde[i] = r6++;
            }
        }
    }
}

void sub_80F893C(u8 taskId)
{
    switch (Rfu.unk_04)
    {
    case 0:
        sub_80FD4B0(&gUnknown_843EBB4);
        Rfu.unk_04 = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 6:
        sub_80FD538(Rfu.unk_0c, 0, 0xf0, gUnknown_843EC8C);
        Rfu.unk_04 = 7;
        gTasks[taskId].data[1] = 7;
        break;
    case 7:
        break;
    case 9:
        gTasks[taskId].data[1] = 10;
        break;
    case 11:
        switch (sub_80FA788())
        {
        case 5:
            Rfu.unk_04 = 12;
            break;
        case 6:
        case 9:
            sub_80FEB14();
            Rfu.unk_ce4 = 2;
            DestroyTask(taskId);
            break;
        }
        break;
    case 12:
    {
        u8 r5 = 1 << Rfu.unk_c3e;
        rfu_clearSlot(12, Rfu.unk_c3e);
        rfu_setRecvBuffer(16, Rfu.unk_c3e, Rfu.unk_c3f, 70);
        rfu_UNI_setSendData(r5, Rfu.unk_4c, 14);
        gTasks[taskId].data[1] = 8;
        DestroyTask(taskId);
        if (gUnknown_203AC08.unk_0f == 0)
        {
            sub_80FC208();
            gUnknown_203AC08.unk_0f++;
        }
        CreateTask(sub_80FA834, 5);
        break;
    }
    }
}

void sub_80F8AA4(void)
{
    u8 i;
    u8 r5 = gUnknown_3005E10.unk_00;
    for (i = 0; i < 4; i++)
    {
        if (r5 & 1)
        {
            rfu_setRecvBuffer(16, i, Rfu.unk_14[i], 14);
            rfu_clearSlot(3, i);
        }
        r5 >>= 1;
    }
}

void sub_80F8AEC(void)
{
    u8 r5 = gUnknown_3005E10.unk_00;
    rfu_UNI_setSendData(r5, Rfu.unk_c87, 70);
    Rfu.unk_cda = sub_80F886C(r5);
    Rfu.unk_ce2 = r5;
    sub_80F887C(r5, -1);
    Rfu.unk_0c = 1;
}

void sub_80F8B34(u8 taskId)
{
    if (sub_80F9800()->unk_0a_0 == 0x54 && sub_80FB9F4() == 4)
    {
        rfu_REQ_disconnect(gUnknown_3005E10.unk_00);
        rfu_waitREQComplete();
        sub_80FB9E4(0, 0);
    }
    switch (Rfu.unk_04)
    {
    case 0:
        sub_80FD4B0(&gUnknown_203ABF0);
        Rfu.unk_04 = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 17:
        sub_80FD538(2, 0, 240, gUnknown_843EC8C);
        sub_80FEA10(sub_80F8D20);
        Rfu.unk_04 = 18;
        break;
    case 18:
        break;
    case 13:
        if (rfu_UNI_setSendData(1 << Rfu.unk_c3e, Rfu.unk_4c, 14) == 0)
        {
            Rfu.unk_0c = 0;
            DestroyTask(taskId);
            if (gTasks[taskId].data[7])
            {
                CreateTask(sub_80FACF0, 1);
            }
            else
            {
                CreateTask(sub_80FA834, 5);
            }
        }
        break;
    case 14:
        sub_80FD760(0);
        Rfu.unk_04 = 15;
        break;
    case 15:
        break;
    case 16:
        Rfu.unk_cdb = 0;
        sub_80FEA10(sub_80F8DA8);
        sub_80FAFE0(1);
        sub_80F8AA4();
        sub_80F8AEC();
        Rfu.unk_04 = 20;
        gTasks[taskId].data[1] = 8;
        Rfu.unk_0c = 1;
        CreateTask(sub_80FA834, 5);
        Rfu.unk_ce8 = 1;
        DestroyTask(taskId);
        break;
    }
}

void sub_80F8CFC(void)
{
    sub_80FD538(1, 0, 240, gUnknown_843EC8C);
}

void sub_80F8D14(void)
{
    sub_80FD760(FALSE);
}

void sub_80F8D20(u16 unused)
{
    s32 i;

    for (i = 0; i < 14; i++)
    {
        Rfu.unk_4c[i] = 0;
    }
    rfu_REQ_recvData();
    rfu_waitREQComplete();
    if (gRfuSlotStatusUNI[Rfu.unk_c3e]->recv.newDataFlag)
    {
        Rfu.unk_cd0++;
        sub_80FC588(&Rfu.unk_124, Rfu.unk_c3f);
        gUnknown_203AC08.unk_06++;
        sub_80F906C();
        rfu_UNI_readySendData(Rfu.unk_c3e);
        rfu_UNI_clearRecvNewDataFlag(Rfu.unk_c3e);
    }
    LinkRfu_REQ_SendData_HandleParentRelationship(TRUE);
}

void sub_80F8DA8(u16 unused)
{
    Rfu.unk_cdb = 1;
}

void sub_80F8DC0(void)
{
    u8 i;

    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return;

    sub_80FD52C();
    if (Rfu.unk_0c == 1)
    {
        if (FuncIsActiveTask(sub_80F8738) == TRUE)
        {
            DestroyTask(Rfu.unk_67);
            sub_80F85F8();
        }
    }
    else if (Rfu.unk_0c == 0)
    {
        if (FuncIsActiveTask(sub_80F893C) == TRUE)
        {
            DestroyTask(Rfu.unk_67);
            sub_80F85F8();
        }
    }
    else if (Rfu.unk_0c == 2)
    {
        if (FuncIsActiveTask(sub_80F8B34) == TRUE)
        {
            DestroyTask(Rfu.unk_67);
            sub_80F85F8();
        }
    }
    for (i = 0; i < 3; i++)
    {
        if (FuncIsActiveTask(gUnknown_843ED88[i]) == TRUE)
        {
            DestroyTask(FindTaskIdByFunc(gUnknown_843ED88[i]));
        }
    }
}

void sub_80F8E74(void)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return;
    Rfu.unk_67 = CreateTask(sub_80F8738, 1);
}

bool8 sub_80F8EA4(void)
{
    if (Rfu.unk_04 == 7 && Rfu.unk_ccd)
    {
        return TRUE;
    }
    return FALSE;
}

bool32 sub_80F8ECC(void)
{
    if (Rfu.unk_04 == 7 && !sub_80FD610(gRfuLinkStatus->partner[Rfu.unk_c3d].id, 240))
    {
        Rfu.unk_04 = 9;
        return TRUE;
    }
    return FALSE;
}

void sub_80F8F10(void)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return;
    Rfu.unk_67 = CreateTask(sub_80F893C, 1);
}

bool8 sub_80F8F40(void)
{
    if (gUnknown_3005E10.unk_00)
    {
        return TRUE;
    }
    return FALSE;
}

void sub_80F8F5C(void)
{
    Rfu.unk_04 = 4;
    Rfu.unk_ce7 = gUnknown_3005E10.unk_00;
}

bool32 sub_80F8F7C(bool32 a0)
{
    if (Rfu.unk_04 == 17 || a0)
    {
        Rfu.unk_04 = 18;
        return TRUE;
    }
    return FALSE;
}

void sub_80F8FA0(void)
{
    Rfu.unk_04 = 14;
}

void sub_80F8FAC(u8 a0)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (a0 & 1)
        {
            rfu_UNI_readySendData(i);
            break;
        }
        a0 >>= 1;
    }
}

void sub_80F8FD4(void)
{
    s32 i, j;

    for (i = 0; i < 5; i++)
    {
        struct UnkRfuStruct_2 *ptr = &Rfu;
        for (j = 0; j < 7; j++)
        {
            ptr->unk_c87[i][j][1] = gRecvCmds[i][j] >> 8;
            ptr->unk_c87[i][j][0] = gRecvCmds[i][j];
        }
    }
    CpuFill16(0, gRecvCmds, sizeof gRecvCmds);
}

void sub_80F9038(void)
{
    s32 i;
    for (i = 0; i < 7; i++)
    {
        gRecvCmds[0][i] = gSendCmd[i];
    }
    for (i = 0; i < 7; i++)
    {
        gSendCmd[i] = 0;
    }
}

void sub_80F906C(void)
{
    if (Rfu.unk_c3c)
    {
        u8 r2 = sub_80FC888(&Rfu.unk_c1c, Rfu.unk_4c);
        if (Rfu.unk_c1c.unk_1e == 0)
        {
            Rfu.unk_c3c = 0;
        }
        if (r2)
        {
            return;
        }
    }
    if (Rfu.unk_c3c == 0)
    {
        sub_80FC79C(&Rfu.unk_9e8, Rfu.unk_4c);
        sub_80FC828(&Rfu.unk_c1c, Rfu.unk_4c);
    }
}

bool32 IsRfuRecvQueueEmpty(void)
{
    s32 i;
    s32 j;

    if (gRfuLinkStatus->sendSlotUNIFlag == 0)
    {
        return FALSE;
    }
    for (i = 0; i < 5; i++)
    {
        for (j = 0; j < 7; j++)
        {
            if (gRecvCmds[i][j] != 0)
            {
                return FALSE;
            }
        }
    }
    return TRUE;
}

bool32 sub_80F911C(void)
{
    if (Rfu.unk_04 < 20)
    {
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        LinkRfu_REQ_SendData_HandleParentRelationship(FALSE);
    }
    else
    {
        Rfu.unk_cdb = 0;
        if ((Rfu.unk_ce2 & gRfuLinkStatus->connSlotFlag) == Rfu.unk_ce2 && (Rfu.unk_ce2 & gRfuLinkStatus->connSlotFlag))
        {
            if (!Rfu.unk_cdc)
            {
                if (Rfu.unk_ce3)
                {
                    sub_80FBCF8(Rfu.unk_ce3);
                    Rfu.unk_ce3 = 0;
                    if (Rfu.unk_ce4 == 1)
                    {
                        sub_80FB9E4(2, 0x8000);
                        sub_80FB0E8(0x8000);
                        return FALSE;
                    }
                    if (!gUnknown_3005E10.unk_00)
                    {
                        sub_80F8DC0();
                        gReceivedRemoteLinkPlayers = 0;
                        return FALSE;
                    }
                }
                sub_80F8FD4();
                rfu_UNI_readySendData(Rfu.unk_cda);
                LinkRfu_REQ_SendData_HandleParentRelationship(TRUE);
            }
            else
            {
                rfu_REQ_PARENT_resumeRetransmitAndChange();
            }
            Rfu.unk_0e = 1;
        }
    }
    return FALSE;
}

bool32 sub_80F9204(void)
{
    u16 i;
    u16 flags;
    u8 r0;
    u16 j;
    u8 retval;

    if (Rfu.unk_04 >= 20 && Rfu.unk_0e == 1)
    {
        rfu_waitREQComplete();
        while (Rfu.unk_cdb == 0)
        {
            if (Rfu.unk_ee != 0)
            {
                return FALSE;
            }
        }
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        if ((gUnknown_3005E10.unk_03 & Rfu.unk_ce2) == Rfu.unk_ce2)
        {
            Rfu.unk_cdc = 0;
            gUnknown_203AC08.unk_06++;
            flags = gUnknown_3005E10.unk_00;
            for (i = 0; i < 4; i++)
            {
                if (flags & 1)
                {
                    if (Rfu.unk_14[i][1])
                    {
                        if (Rfu.unk_cee[i] != 0xFF && (Rfu.unk_14[i][0] >> 5) != ((Rfu.unk_cee[i] + 1) & 7))
                        {
                            if (++Rfu.unk_cea[i] > 4)
                                sub_80FB0E8(0x8100);
                        }
                        else
                        {
                            Rfu.unk_cee[i] = Rfu.unk_14[i][0] / 32;
                            Rfu.unk_cea[i] = 0;
                            Rfu.unk_14[i][0] &= 0x1f;
                            r0 = Rfu.unk_cde[i];
                            for (j = 0; j < 7; j++)
                            {
                                gRecvCmds[r0][j] = (Rfu.unk_14[i][(j << 1) + 1] << 8) | Rfu.unk_14[i][(j << 1) + 0];
                                Rfu.unk_14[i][(j << 1) + 1] = 0;
                                Rfu.unk_14[i][(j << 1) + 0] = 0;
                            }
                        }
                    }
                    rfu_UNI_clearRecvNewDataFlag(i);
                }
                flags >>= 1;
            }
            sub_80F9038();
            sub_80F9868(0);
            sub_80FA510();
            if (Rfu.unk_ce5 && !Rfu.unk_cd9)
            {
                gUnknown_203AC08.unk_0e = 0;
                rfu_clearSlot(3, Rfu.unk_cda);
                for (i = 0; i < 4; i++)
                {
                    if ((Rfu.unk_ce5 >> i) & 1)
                    {
                        rfu_setRecvBuffer(0x10, i, Rfu.unk_14[i], 14);
                    }
                }
                sub_80F887C(Rfu.unk_ce2, Rfu.unk_ce2 | Rfu.unk_ce5);
                Rfu.unk_ce9 = Rfu.unk_ce5;
                Rfu.unk_ce2 |= Rfu.unk_ce5;
                Rfu.unk_ce5 = 0;
                rfu_UNI_setSendData(Rfu.unk_ce2, Rfu.unk_c87, 70);
                Rfu.unk_cda = sub_80F886C(Rfu.unk_ce2);
                CreateTask(sub_80FAA94, 0);
            }
        }
        else
        {
            Rfu.unk_cdc = 1;
            Rfu.unk_0e = 0;
        }
        Rfu.unk_0e = 0;
    }
    retval = Rfu.unk_cdc;
    return gRfuLinkStatus->sendSlotUNIFlag ? retval & 1 : FALSE;
}

void sub_80F94BC(u16 *a0, u8 *a1)
{
    s32 i;

    if (a0[0])
    {
        a0[0] |= (Rfu.unk_102 << 5);
        Rfu.unk_102 = (Rfu.unk_102 + 1) & 7;
        for (i = 0; i < 7; i++)
        {
            a1[2 * i + 1] = a0[i] >> 8;
            a1[2 * i + 0] = a0[i];
        }
    }
    else
    {
        for (i = 0; i < 14; i++)
            a1[i] = 0;
    }
}

bool32 sub_80F9514(void)
{
    u8 i;
    u8 j;
    u8 sp00[MAX_RFU_PLAYERS * (2 * (CMD_LENGTH - 1))];
    u8 sp48[2 * (CMD_LENGTH - 1)];
    u8 switchval;

    sub_80FC6E8(&Rfu.unk_124, sp00);
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        for (j = 0; j < CMD_LENGTH - 1; j++)
        {
            gRecvCmds[i][j] = (sp00[i * 14 + (j << 1) + 1] << 8) | sp00[i * 14 + (j << 1) + 0];
        }
    }
    sub_80F9868(0);
    if (gUnknown_3005E10.unk_02 == 0 && Rfu.unk_ce4)
    {
        rfu_REQ_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
        rfu_waitREQComplete();
        switchval = sub_80FB9F4();
        if (switchval != 1 && switchval != 6 && switchval != 9)
            sub_80FB9E4(2, 0x9000);
        rfu_clearAllSlot();
        gReceivedRemoteLinkPlayers = FALSE;
        Rfu.RfuFunc = NULL;
        if (Rfu.unk_ce4 == 1)
        {
            sub_80FB9E4(2, 0x9000);
            sub_80FB0E8(0x9000);
        }
        gUnknown_3005E10.unk_04 = gUnknown_3005E10.unk_05 = 0;
        Rfu.unk_ce4 = 0;
    }
    if (Rfu.unk_cd0)
    {
        Rfu.unk_cd0--;
        sub_80FA510();
        sub_80F94BC(gSendCmd, sp48);
        sub_80FC63C(&Rfu.unk_9e8, sp48);
        for (i = 0; i < CMD_LENGTH - 1; i++)
            gSendCmd[i] = 0;
    }
    return IsRfuRecvQueueEmpty();
}

void sub_80F965C(u8 unused, u32 flags)
{
    s32 i, j;

    const u8 *r10 = Rfu.unk_6c.unk_04;
    for (i = 0; i < Rfu.unk_6c.unk_02; i++)
    {
        if (!(flags & 1))
        {
            gUnknown_3002008[0] = (~0x76ff) | i;
            for (j = 0; j < 7; j++)
            {
                gUnknown_3002008[j + 1] = (r10[12 * i + (j << 1) + 1] << 8) | r10[12 * i + (j << 1) + 0];
            }
            for (j = 0; j < 7; j++)
            {
                gUnknown_3001FF8[2 * j + 1] = gUnknown_3002008[j] >> 8;
                gUnknown_3001FF8[2 * j + 0] = gUnknown_3002008[j];

                j++;j--; // Needed to match;
            }
            sub_80FC63C(&Rfu.unk_9e8, gUnknown_3001FF8);
            Rfu.unk_6c.unk_0c |= (1 << i);
        }
        flags >>= 1;
    }
}

void Rfu_SetBlockReceivedFlag(u8 a0)
{
    if (Rfu.unk_0c == 1 && a0)
        Rfu.unk_61[a0] = 1;
    else
        Rfu.unk_5c[a0] = 1;
}

void Rfu_ResetBlockReceivedFlag(u8 a0)
{
    Rfu.unk_5c[a0] = 0;
    Rfu.unk_80[a0].unk_12 = 0;
}

u8 sub_80F9770(const u8 *a0)
{
    u8 i;

    if (Rfu.unk_0c == 1)
        return FALSE;
    for (i = 0; i < 4; i++)
    {
        Rfu.unk_cde[i] = a0[i];
    }
    return a0[Rfu.unk_c3e];
}

void rfu_func_080F97B8(void)
{
    // static u8 gUnknown_3001188;
    if (gReceivedRemoteLinkPlayers
        && gHeldKeyCodeToSend != LINK_KEY_CODE_NULL
        && gLinkTransferringData != TRUE)
    {
        gUnknown_3001188++;
        gHeldKeyCodeToSend |= (gUnknown_3001188 << 8);
        sub_80F9D04(0xbe00);
    }
}

struct UnkLinkRfuStruct_02022B14 *sub_80F9800(void)
{
    return &gUnknown_3005440;
}

bool32 IsSendingKeysToRfu(void)
{
    return Rfu.RfuFunc == rfu_func_080F97B8;
}

void sub_80F9828(void)
{
    AGB_ASSERT_EX(Rfu.RfuFunc == NULL, ABSPATH("rfu.c"), 1473);
    Rfu.RfuFunc = rfu_func_080F97B8;
}

void Rfu_set_zero(void)
{
    Rfu.RfuFunc = NULL;
}

void sub_80F9868(u8 unused)
{
    u16 i;
    u16 j;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        switch (gRecvCmds[i][0] & 0xff00)
        {
        case 0x7800:
            if (Rfu.unk_0c == 0 && gReceivedRemoteLinkPlayers != 0)
                return;
            // fallthrough
        case 0x7700:
            if (gRfuLinkStatus->parentChild == MODE_CHILD)
            {
                Rfu.playerCount = gRecvCmds[i][1];
                Rfu.unk_cce = sub_80F9770((u8 *)(gRecvCmds[i] + 2));
            }
            break;
        case 0x8800:
            if (Rfu.unk_80[i].unk_12 == 0)
            {
                Rfu.unk_80[i].unk_00 = 0;
                Rfu.unk_80[i].unk_02 = gRecvCmds[i][1];
                Rfu.unk_80[i].unk_11 = gRecvCmds[i][2];
                Rfu.unk_80[i].unk_08 = 0;
                Rfu.unk_80[i].unk_12 = 1;
                Rfu.unk_5c[i] = 0;
            }
            break;
        case 0x8900:
            if (Rfu.unk_80[i].unk_12 == 1)
            {
                Rfu.unk_80[i].unk_00 = gRecvCmds[i][0] & 0xff;
                Rfu.unk_80[i].unk_08 |= (1 << Rfu.unk_80[i].unk_00);
                for (j = 0; j < 6; j++)
                    gBlockRecvBuffer[i][Rfu.unk_80[i].unk_00 * 6 + j] = gRecvCmds[i][j + 1];
                if (Rfu.unk_80[i].unk_08 == gUnknown_843EBD4[Rfu.unk_80[i].unk_02])
                {
                    Rfu.unk_80[i].unk_12 = 2;
                    Rfu_SetBlockReceivedFlag(i);
                    if (sub_80F9800()->unk_0a_0 == 0x45 && gReceivedRemoteLinkPlayers != 0 && Rfu.unk_0c == 0)
                        sub_80FAA58(gBlockRecvBuffer);
                }
            }
            break;
        case 0xa100:
            Rfu_InitBlockSend(gUnknown_843EC64[gRecvCmds[i][1]].buffer, (u16)gUnknown_843EC64[gRecvCmds[i][1]].size);
            break;
        case 0x5f00:
            Rfu.unk_e4[i] = 1;
            break;
        case 0x6600:
            if (Rfu.unk_100 == gRecvCmds[i][1])
                Rfu.unk_e9[i] = 1;
            break;
        case 0xed00:
            if (Rfu.unk_0c == 0)
            {
                if (gReceivedRemoteLinkPlayers != 0)
                {
                    if (gRecvCmds[i][1] & gRfuLinkStatus->connSlotFlag)
                    {
                        gReceivedRemoteLinkPlayers = 0;
                        sub_80FEB14();
                        Rfu.unk_ce4 = gRecvCmds[i][2];
                    }
                    Rfu.playerCount = gRecvCmds[i][3];
                    sub_80FA9D0(gRecvCmds[i][1]);
                }
            }
            else
            {
                sub_80F9D04(0xee00);
                gSendCmd[1] = gRecvCmds[i][1];
                gSendCmd[2] = gRecvCmds[i][2];
                gSendCmd[3] = gRecvCmds[i][3];
            }
            break;
        case 0xee00:
            if (Rfu.unk_0c == 1)
            {
                Rfu.unk_ce3 |= gRecvCmds[i][1];
                Rfu.unk_ce4 = gRecvCmds[i][2];
                sub_80FA9D0(gRecvCmds[i][1]);
            }
            break;
        case 0xbe00:
            gLinkPartnersHeldKeys[i] = gRecvCmds[i][1];
            break;
        }
        if (Rfu.unk_0c == 1 && Rfu.unk_61[i])
        {
            if (Rfu.unk_61[i] == 4)
            {
                Rfu.unk_5c[i] = 1;
                Rfu.unk_61[i] = 0;
            }
            else
                Rfu.unk_61[i]++;
        }
    }
}

bool8 sub_80F9C50(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        if (Rfu.unk_80[i].unk_12)
            return FALSE;
    }
    return TRUE;
}

bool8 sub_80F9C78(void)
{
    s32 i;

    for (i = 0; i < Rfu.playerCount; i++)
    {
        if (Rfu.unk_80[i].unk_12 != 2 || Rfu.unk_5c[i] != 1)
            return FALSE;
    }
    return TRUE;
}

void sub_80F9CB4(struct UnkRfuStruct_2_Sub_6c *data)
{
    data->unk_00 = 0;
    data->unk_02 = 0;
    data->unk_04 = NULL;
    data->unk_08 = 0;
    data->unk_10 = 0;
    data->unk_11 = 0;
    data->unk_12 = 0;
}

u8 Rfu_GetBlockReceivedStatus(void)
{
    u8 flags = 0;
    s32 i;

    for (i = 0; i < 5; i++)
    {
        if (Rfu.unk_80[i].unk_12 == 2 && Rfu.unk_5c[i] == 1)
        {
            flags |= (1 << i);
        }
    }
    return flags;
}

void sub_80F9D04(u16 command)
{
    u8 i;
    u8 *buff;
    u8 tmp;

    gSendCmd[0] = command;
    switch (command)
    {
    case 0x8800:
        gSendCmd[1] = Rfu.unk_6c.unk_02;
        gSendCmd[2] = Rfu.unk_6c.unk_11 + 0x80;
        break;
    case 0xa100:
        if (sub_80F9C50())
            gSendCmd[1] = Rfu.unk_5a;
        break;
    case 0x7700:
    case 0x7800:
        tmp = Rfu.unk_ce2 ^ Rfu.unk_ce3;
        Rfu.playerCount = gUnknown_843EC41[tmp] + 1;
        gSendCmd[1] = Rfu.playerCount;
        buff = (u8 *)(gSendCmd + 2);
        for (i = 0; i < 4; i++)
            buff[i] = Rfu.unk_cde[i];
        break;
    case 0x6600:
    case 0x5f00:
        gSendCmd[1] = Rfu.unk_100;
        break;
    case 0x2f00:
        for (i = 0; i < 6; i++)
            gSendCmd[1 + i] = Rfu.unk_f2[i];
        break;
    case 0xbe00:
        gSendCmd[1] = gHeldKeyCodeToSend;
        break;
    case 0xee00:
        break;
    case 0xed00:
        break;
    }
}

void sub_80F9E2C(void *a0)
{
    if (gSendCmd[0] == 0 && !sub_80FBA00())
    {
        memcpy(Rfu.unk_f2, a0, sizeof(Rfu.unk_f2));
        sub_80F9D04(0x2f00);
    }
}

bool32 Rfu_InitBlockSend(const u8 *src, size_t size)
{
    bool8 r4;
    AGB_ASSERT_EX(size<=252, ABSPATH("rfu.c"), 1793);
    if (Rfu.RfuFunc != NULL)
        return FALSE;
    if (gSendCmd[0] != 0)
        return FALSE;
    if (Rfu.unk_6c.unk_10 != 0)
    {
        gUnknown_203AC08.unk_83++;
        return FALSE;
    }
    r4 = (size % 12) != 0;
    Rfu.unk_6c.unk_11 = GetMultiplayerId();
    Rfu.unk_6c.unk_10 = 1;
    Rfu.unk_6c.unk_02 = (size / 12) + r4;
    Rfu.unk_6c.unk_00 = 0;
    if (size > 0x100)
        Rfu.unk_6c.unk_04 = src;
    else
    {
        if (src != gBlockSendBuffer)
            memcpy(gBlockSendBuffer, src, size);
        Rfu.unk_6c.unk_04 = gBlockSendBuffer;
    }
    sub_80F9D04(0x8800);
    Rfu.RfuFunc = rfufunc_80F9F44;
    Rfu.unk_5b = 0;
    return TRUE;
}

void rfufunc_80F9F44(void)
{
    if (gSendCmd[0] == 0)
    {
        sub_80F9D04(0x8800);
        if (Rfu.unk_0c == 1)
        {
            if (++Rfu.unk_5b > 2)
                Rfu.RfuFunc = sub_80F9FA8;
        }
        else
        {
            if ((gRecvCmds[GetMultiplayerId()][0] & 0xff00) == 0x8800)
                Rfu.RfuFunc = sub_80F9FA8;
        }
    }
}
void sub_80F9FA8(void)
{
    s32 i;
    const u8 *src = Rfu.unk_6c.unk_04;
    gSendCmd[0] = 0x8900 | Rfu.unk_6c.unk_00;
    for (i = 0; i < 7; i++)
        gSendCmd[i + 1] = (src[(i << 1) + Rfu.unk_6c.unk_00 * 12 + 1] << 8) | src[(i << 1) + Rfu.unk_6c.unk_00 * 12 + 0];
    Rfu.unk_6c.unk_00++;
    if (Rfu.unk_6c.unk_02 <= Rfu.unk_6c.unk_00)
    {
        Rfu.unk_6c.unk_10 = 0;
        Rfu.RfuFunc = rfufunc_80FA020;
    }
}

void rfufunc_80FA020(void)
{
    const u8 *src = Rfu.unk_6c.unk_04;
    u8 mpId = GetMultiplayerId();
    s32 i;
    if (Rfu.unk_0c == 0)
    {
        gSendCmd[0] = (~0x76ff) | (Rfu.unk_6c.unk_02 - 1);
        for (i = 0; i < 7; i++)
            gSendCmd[i + 1] = (src[(i << 1) + (Rfu.unk_6c.unk_02 - 1) * 12 + 1] << 8) | src[(i << 1) + (Rfu.unk_6c.unk_02 - 1) * 12 + 0];
        if ((u8)gRecvCmds[mpId][0] == Rfu.unk_6c.unk_02 - 1)
        {
            if (Rfu.unk_80[mpId].unk_08 != gUnknown_843EBD4[Rfu.unk_80[mpId].unk_02])
            {
                sub_80F965C(mpId, Rfu.unk_80[mpId].unk_08);
                gUnknown_203AC08.unk_64++;
            }
            else
                Rfu.RfuFunc = NULL;
        }
    }
    else
        Rfu.RfuFunc = NULL;
}
