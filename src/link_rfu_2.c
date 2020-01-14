#include "global.h"
#include "librfu.h"
#include "link.h"
#include "link_rfu.h"
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

struct UnkRfuStruct_2_Sub_c1c
{
    /* 0x00 */ u8 unk_00[2][14];
    /* 0x1c */ vu8 unk_1c;
    /* 0x1d */ vu8 unk_1d;
    /* 0x1e */ vu8 unk_1e;
};

struct
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
void sub_80F9CB4(struct UnkRfuStruct_2_Sub_6c *data);
void sub_80FA738(void);
int sub_80FA788(void);
void sub_80FA834(u8 taskId);
void sub_80FAA94(u8 taskId);
void sub_80FACF0(u8 taskId);
void sub_80FAFE0(u8 a0);
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
