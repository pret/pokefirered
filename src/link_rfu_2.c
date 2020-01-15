#include "global.h"
#include "battle.h"
#include "gpu_regs.h"
#include "librfu.h"
#include "link.h"
#include "link_rfu.h"
#include "mystery_gift_menu.h"
#include "overworld.h"
#include "palette.h"
#include "quest_log.h"
#include "random.h"
#include "string_util.h"
#include "task.h"
#include "constants/species.h"

struct UnkRfuStruct_8010A14{
    char unk_00[15]; // PokemonSioInfo
    u8 unk_0f;
    u8 unk_10[4];
    struct LinkPlayer unk_14[5];
    u8 fill_a0[0x5c];
};

static EWRAM_DATA struct UnkLinkRfuStruct_02022B2C sRfuReqConfig = {};
static EWRAM_DATA struct UnkLinkRfuStruct_02022B44 gUnknown_203AC08 = {};

static struct RfuAPIBuffer gRfuAPIBuffer;
static u8 gUnknown_3001FF8[14];
static u16 gUnknown_3002008[7];

struct GFtgtGname gHostRFUtgtGnameBuffer;
struct UnkRfuStruct_2 Rfu;
u8 gHostRFUtgtUnameBuffer[PLAYER_NAME_LENGTH];

static void sub_80F8AA4(void);
static void sub_80F8AEC(void);
static void sub_80F8D20(u16 a0);
static void sub_80F8DA8(u16 a0);
static void sub_80F906C(void);
static void sub_80F9868(u8 unused);
static void sub_80F9CB4(struct UnkRfuStruct_2_Sub_6c *data);
static void sub_80F9D04(u16 command);
static void rfufunc_80F9F44(void);
static void sub_80F9FA8(void);
static void rfufunc_80FA020(void);
static void CallRfuFunc(void);
static void sub_80FA738(void);
static int sub_80FA788(void);
static void sub_80FA834(u8 taskId);
static void sub_80FA9D0(u16 a0);
static void sub_80FAA58(void * a0);
static void sub_80FAA94(u8 taskId);
static void sub_80FACF0(u8 taskId);
static void sub_80FB0E8(u32 a0);
static void sub_80FB564(s32 a0);
static void sub_80FBB74(void);
static u8 sub_80FBC70(const u8 *a0, u16 a1);
static void sub_80FBCF8(u32 a0);
static void sub_80FBE20(u32 a0, u32 a1);
static void sub_80FC028(u8 taskId);
static void sub_80FC208(void);
static void nullsub_89(u8 taskId);

static const struct UnkLinkRfuStruct_02022B2C sRfuReqConfigTemplate = {
    .maxMFrame = 4,
    .mcTimer = 32,
    .availSlotFlag = 0,
    .mbootFlag = 0,
    .serialNo = 0x0002,
    .gname = &gHostRFUtgtGnameBuffer,
    .uname = gHostRFUtgtUnameBuffer,
    .unk_10 = 0x01,
    .unk_11 = 0x00,
    .unk_12 = 0x0258,
    .unk_14 = 0x012c
};

static const u8 sAvailSlots[] = {
    [1] = AVAIL_SLOT1,
    [2] = AVAIL_SLOT2,
    [3] = AVAIL_SLOT3,
    [4] = AVAIL_SLOT4
};

static const u32 gUnknown_843EBD4[] = {
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

static const u8 gUnknown_843EC38[] = {
    0, 0, 1,
    1, 2, 2,
    2, 2, 3
};

static const u8 gUnknown_843EC41[] = {
    0, 1, 1, 2,
    1, 2, 2, 3,
    1, 2, 2, 3,
    2, 3, 3, 4
};

static const u8 gUnknown_843EC51[] = {
    0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
};

static const struct {
    u8 *buffer;
    u32 size;
} gUnknown_843EC64[] = {
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 100 },
    { gBlockSendBuffer, 220 },
    { gBlockSendBuffer,  40 }
};

static const u16 gUnknown_843EC8C[] = {
    0x0002, 0x7f7d, 0xFFFF
};

static const char sUnref_843EC92[][15] = {
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

static const char sUnref_843ED37[][16] = {
    "              ",
    "RECOVER START ",
    "DISSCONECT    ",
    "RECOVER SUUSES",
    "RECOVER FAILED"
};

static const TaskFunc gUnknown_843ED88[] = {
    sub_80FA834,
    sub_80FAA94,
    sub_80FACF0
};

static void nullsub_87(const void *unused_0, u8 unused_1, u8 unused_2)
{
    // debug?
}

static void nullsub_88(u16 unused_0, u8 unused_1, u8 unused_2, u8 unused_3)
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

static void sub_80F8738(u8 taskId)
{
    sub_80FA738();
    switch (Rfu.unk_04)
    {
    case 0:
        sub_80FD4B0(&sRfuReqConfig);
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

static u8 sub_80F886C(u8 idx)
{
    return gUnknown_843EC51[idx];
}

static void sub_80F887C(s32 r2, s32 r5)
{
    u8 i;
    u8 r4 = 1;
    s32 r1 = r2;
    s32 r6 = 0;
    if (r5 == -1)
    {
        for (i = 0; i < RFU_CHILD_MAX; r2 >>= 1, i++)
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
        for (i = 0; i < RFU_CHILD_MAX; r1 >>= 1, i++)
        {
            if (!(r1 & 1))
            {
                Rfu.unk_cde[i] = 0;
            }
        }
        for (r4 = 4; r4 != 0; r4--)
        {
            for (i = 0; i < RFU_CHILD_MAX && Rfu.unk_cde[i] != r4; i++);
            if (i == 4)
            {
                r6 = r4;
            }
        }
        for (r5 &= ~r2, i = 0; i < RFU_CHILD_MAX; r5 >>= 1, i++)
        {
            if (r5 & 1)
            {
                Rfu.unk_cde[i] = r6++;
            }
        }
    }
}

static void sub_80F893C(u8 taskId)
{
    switch (Rfu.unk_04)
    {
    case 0:
        sub_80FD4B0(&sRfuReqConfigTemplate);
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
        rfu_clearSlot(TYPE_NI_SEND | TYPE_NI_RECV, Rfu.unk_c3e);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.unk_c3e, Rfu.unk_c3f, sizeof(Rfu.unk_c3f));
        rfu_UNI_setSendData(r5, Rfu.unk_4c, sizeof(Rfu.unk_4c));
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

static void sub_80F8AA4(void)
{
    u8 i;
    u8 r5 = gUnknown_3005E10.unk_00;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (r5 & 1)
        {
            rfu_setRecvBuffer(TYPE_UNI, i, Rfu.unk_14[i], sizeof(Rfu.unk_14[i]));
            rfu_clearSlot(TYPE_UNI_SEND | TYPE_UNI_RECV, i);
        }
        r5 >>= 1;
    }
}

static void sub_80F8AEC(void)
{
    u8 r5 = gUnknown_3005E10.unk_00;
    rfu_UNI_setSendData(r5, Rfu.unk_c87, sizeof(Rfu.unk_c87));
    Rfu.unk_cda = sub_80F886C(r5);
    Rfu.unk_ce2 = r5;
    sub_80F887C(r5, -1);
    Rfu.unk_0c = 1;
}

static void sub_80F8B34(u8 taskId)
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
        sub_80FD4B0(&sRfuReqConfig);
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
        if (rfu_UNI_setSendData(1 << Rfu.unk_c3e, Rfu.unk_4c, sizeof(Rfu.unk_4c)) == 0)
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

static void sub_80F8D20(u16 unused)
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

static void sub_80F8DA8(u16 unused)
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
    for (i = 0; i < NELEMS(gUnknown_843ED88); i++)
    {
        if (FuncIsActiveTask(gUnknown_843ED88[i]) == TRUE)
        {
            DestroyTask(FindTaskIdByFunc(gUnknown_843ED88[i]));
        }
    }
}

static void sub_80F8E74(void)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return;
    Rfu.unk_67 = CreateTask(sub_80F8738, 1);
}

static bool8 sub_80F8EA4(void)
{
    if (Rfu.unk_04 == 7 && Rfu.unk_ccd)
    {
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_80F8ECC(void)
{
    if (Rfu.unk_04 == 7 && !sub_80FD610(gRfuLinkStatus->partner[Rfu.unk_c3d].id, 240))
    {
        Rfu.unk_04 = 9;
        return TRUE;
    }
    return FALSE;
}

static void sub_80F8F10(void)
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

static void sub_80F8FAC(u8 a0)
{
    u8 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (a0 & 1)
        {
            rfu_UNI_readySendData(i);
            break;
        }
        a0 >>= 1;
    }
}

static void sub_80F8FD4(void)
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

static void sub_80F9038(void)
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

static void sub_80F906C(void)
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

static bool32 sub_80F911C(void)
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

static bool32 sub_80F9204(void)
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
            for (i = 0; i < RFU_CHILD_MAX; i++)
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
            CallRfuFunc();
            if (Rfu.unk_ce5 && !Rfu.unk_cd9)
            {
                gUnknown_203AC08.unk_0e = 0;
                rfu_clearSlot(TYPE_UNI_SEND | TYPE_UNI_RECV, Rfu.unk_cda);
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((Rfu.unk_ce5 >> i) & 1)
                    {
                        rfu_setRecvBuffer(TYPE_UNI, i, Rfu.unk_14[i], sizeof(Rfu.unk_14[i]));
                    }
                }
                sub_80F887C(Rfu.unk_ce2, Rfu.unk_ce2 | Rfu.unk_ce5);
                Rfu.unk_ce9 = Rfu.unk_ce5;
                Rfu.unk_ce2 |= Rfu.unk_ce5;
                Rfu.unk_ce5 = 0;
                rfu_UNI_setSendData(Rfu.unk_ce2, Rfu.unk_c87, sizeof(Rfu.unk_c87));
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

static void sub_80F94BC(u16 *a0, u8 *a1)
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

static bool32 sub_80F9514(void)
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
        CallRfuFunc();
        sub_80F94BC(gSendCmd, sp48);
        sub_80FC63C(&Rfu.unk_9e8, sp48);
        for (i = 0; i < CMD_LENGTH - 1; i++)
            gSendCmd[i] = 0;
    }
    return IsRfuRecvQueueEmpty();
}

static void sub_80F965C(u8 unused, u32 flags)
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

static u8 sub_80F9770(const u8 *a0)
{
    u8 i;

    if (Rfu.unk_0c == 1)
        return FALSE;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        Rfu.unk_cde[i] = a0[i];
    }
    return a0[Rfu.unk_c3e];
}

static void rfu_func_080F97B8(void)
{
     static u8 gUnknown_3001188;
    if (gReceivedRemoteLinkPlayers
        && gHeldKeyCodeToSend != LINK_KEY_CODE_NULL
        && gLinkTransferringData != TRUE)
    {
        gUnknown_3001188++;
        gHeldKeyCodeToSend |= (gUnknown_3001188 << 8);
        sub_80F9D04(0xbe00);
    }
}

struct GFtgtGname *sub_80F9800(void)
{
    return &gHostRFUtgtGnameBuffer;
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

static void sub_80F9868(u8 unused)
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

static bool8 sub_80F9C50(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        if (Rfu.unk_80[i].unk_12)
            return FALSE;
    }
    return TRUE;
}

static bool8 sub_80F9C78(void)
{
    s32 i;

    for (i = 0; i < Rfu.playerCount; i++)
    {
        if (Rfu.unk_80[i].unk_12 != 2 || Rfu.unk_5c[i] != 1)
            return FALSE;
    }
    return TRUE;
}

static void sub_80F9CB4(struct UnkRfuStruct_2_Sub_6c *data)
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

static void sub_80F9D04(u16 command)
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
        for (i = 0; i < RFU_CHILD_MAX; i++)
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

static void rfufunc_80F9F44(void)
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
static void sub_80F9FA8(void)
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

static void rfufunc_80FA020(void)
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

bool8 sub_80FA0F8(u8 a0)
{
    Rfu.unk_5a = a0;
    sub_80F9D04(0xa100);
    return TRUE;
}

static void sub_80FA114(void)
{
    rfu_clearAllSlot();
    sub_80FD52C();
    gReceivedRemoteLinkPlayers = 0;
    Rfu.unk_ef = 1;
    Rfu.RfuFunc = NULL;
}

static void sub_80FA140(void)
{
    rfu_REQ_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
    rfu_waitREQComplete();
    sub_80FA114();
}

static void sub_80FA160(void)
{
    if (Rfu.unk_0c == 0)
    {
        sub_80FEB14();
        Rfu.unk_ce4 = 2;
    }
    else
        Rfu.RfuFunc = sub_80FA140;
}

void LinkRfu_FatalError(void)
{
    sub_80FEB14();
    Rfu.unk_ce4 = 1;
    Rfu.unk_ce3 = gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag;
}

static void sub_80FA1C4(void)
{
    s32 i;
    u8 playerCount = Rfu.playerCount;
    s32 count = 0;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        if (Rfu.unk_e4[i])
            count++;
    }
    if (count == playerCount)
    {
        gBattleTypeFlags &= (u16)~BATTLE_TYPE_20;
        if (Rfu.unk_0c == 0)
        {
            Rfu.unk_ee = 3;
            sub_80FA160();
        }
        else
            Rfu.RfuFunc = sub_80FA160;
    }
}

static void sub_80FA224(void)
{
    if (gSendCmd[0] == 0 && Rfu.unk_ce8 == 0)
    {
        sub_80F9D04(0x5f00);
        Rfu.RfuFunc = sub_80FA1C4;
    }
}

static void sub_80FA25C(u8 taskId)
{
    if (Rfu.RfuFunc == NULL)
    {
        Rfu.unk_cd9 = 1;
        Rfu.RfuFunc = sub_80FA224;
        DestroyTask(taskId);
    }
}

void task_add_05_task_del_08FA224_when_no_RfuFunc(void)
{
    if (!FuncIsActiveTask(sub_80FA25C))
        CreateTask(sub_80FA25C, 5);
}

static void sub_80FA2B0(void)
{
    u8 playerCount;
    u8 i;

    if (GetMultiplayerId() != 0)
    {
        if (Rfu.unk_124.unk_8c2 == 0 && Rfu.unk_fe > 0x3c)
        {
            sub_80F9D04(0x6600);
            Rfu.unk_fe = 0;
        }
    }
    playerCount = GetLinkPlayerCount();
    for (i = 0; i < playerCount; i++)
    {
        if (Rfu.unk_e9[i] == 0)
            break;
    }
    if (i == playerCount)
    {
        for (i = 0; i < MAX_RFU_PLAYERS; i++)
            Rfu.unk_e9[i] = 0;
        Rfu.unk_100++;
        Rfu.RfuFunc = NULL;
    }
    Rfu.unk_fe++;
}

static void sub_80FA350(void)
{
    if (Rfu.unk_124.unk_8c2 == 0 && gSendCmd[0] == 0)
    {
        sub_80F9D04(0x6600);
        Rfu.RfuFunc = sub_80FA2B0;
    }
}

static void sub_80FA388(void)
{
    u8 i;
    u8 playerCount;

    if (GetMultiplayerId() != 0)
    {
        if (Rfu.unk_124.unk_8c2 == 0 && gSendCmd[0] == 0)
        {
            sub_80F9D04(0x6600);
            Rfu.RfuFunc = sub_80FA2B0;
        }
    }
    else
    {
        playerCount = GetLinkPlayerCount();
        for (i = 1; i < playerCount; i++)
        {
            if (Rfu.unk_e9[i] == 0)
                break;
        }
        if (i == playerCount)
        {
            if (Rfu.unk_124.unk_8c2 == 0 && gSendCmd[0] == 0)
            {
                sub_80F9D04(0x6600);
                Rfu.RfuFunc = sub_80FA350;
            }
        }
    }
}

void sub_80FA42C(void)
{
    if (Rfu.RfuFunc == NULL)
    {
        Rfu.RfuFunc = sub_80FA388;
        Rfu.unk_fe = 0;
    }
}

bool32 sub_80FA44C(u32 a0)
{
    s32 i;
    for (i = 0; gUnknown_843EC8C[i] != a0; i++)
    {
        if (gUnknown_843EC8C[i] == 0xFFFF)
            return FALSE;
    }
    return TRUE;
}

u8 sub_80FA484(bool32 a0)
{
    if (!a0)
        return sub_80FEA34(0, 0);
    sub_80FEA34(1, 0x258);
    return 0;
}

void sub_80FA4A8(void)
{
    Rfu.unk_cd9 = 1;
    sub_80FD760(FALSE);
}

u8 LinkRfu_GetMultiplayerId(void)
{
    if (Rfu.unk_0c == 1)
        return 0;
    return Rfu.unk_cce;
}

u8 GetRfuPlayerCount(void)
{
    return Rfu.playerCount;
}

bool8 IsLinkRfuTaskFinished(void)
{
    return Rfu.RfuFunc != NULL ? FALSE : TRUE;
}

static void CallRfuFunc(void)
{
    if (Rfu.RfuFunc != NULL)
        Rfu.RfuFunc();
}

static bool8 sub_80FA528(void)
{
    s32 i;
    bool8 retval = FALSE;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Rfu.unk_cd1[i] < 5 || Rfu.unk_cd1[i] > 6)
        {
            if (gRfuSlotStatusNI[i]->recv.state == SLOT_STATE_RECV_SUCCESS || gRfuSlotStatusNI[i]->recv.state == SLOT_STATE_RECV_SUCCESS_AND_SENDSIDE_UNKNOWN)
            {
                if (Rfu.unk_cd5[i] == 8)
                {
                    Rfu.unk_cd1[i] = 9;
                    Rfu.unk_cd5[i] = 10;
                    rfu_clearSlot(TYPE_NI_RECV, i);
                    rfu_NI_setSendData(1 << i, 8, Rfu.unk_cd1 + i, 1);
                    retval = TRUE;
                }

            }
            else if (gRfuSlotStatusNI[Rfu.unk_c3e]->recv.state == SLOT_STATE_RECV_FAILED)
            {
                rfu_clearSlot(TYPE_NI_RECV, i);
            }
        }
    }
    return retval;
}

bool32 sub_80FA5D4(void)
{
    u8 flags = 0;
    s32 i;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Rfu.unk_cd5[i] == 11)
        {
            flags |= (1 << i);
            Rfu.unk_cd5[i] = 0;
        }
    }
    if (flags)
    {
        rfu_REQ_disconnect(flags);
        rfu_waitREQComplete();
    }
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Rfu.unk_cd5[i] == 10 || Rfu.unk_cd5[i] == 11)
            return TRUE;
    }
    return FALSE;
}

bool32 sub_80FA634(u16 a0, const u8 *a1)
{
    u8 r1 = sub_80FBC70(a1, a0);
    if (r1 == 0xFF)
        return TRUE;
    if (Rfu.unk_cd1[r1] == 9)
        return TRUE;
    return FALSE;
}

void sub_80FA670(u8 a0, u16 a1, const u8 *a2)
{
    u8 r4 = sub_80FBC70(a2, a1);
    Rfu.unk_cd1[r4] = a0;
    rfu_clearSlot(TYPE_NI_SEND, r4);
    rfu_NI_setSendData(1 << r4, 8, Rfu.unk_cd1 + r4, 1);
}

void sub_80FA6BC(void)
{
    Rfu.unk_c85 = 8;
    rfu_clearSlot(TYPE_NI_SEND, Rfu.unk_c3e);
    rfu_NI_setSendData(1 << Rfu.unk_c3e, 8, &Rfu.unk_c85, 1);
}

u32 sub_80FA6FC(u16 a0, const u8 *a1)
{
    u8 r0 = sub_80FBC70(a1, a0);
    if (r0 == 0xFF)
        return 2;
    if (gRfuSlotStatusNI[r0]->send.state == 0)
        return 1;
    return 0;
}

static void sub_80FA738(void)
{
    s32 i;

    sub_80FA528();
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (gRfuSlotStatusNI[i]->send.state == SLOT_STATE_SEND_SUCCESS || gRfuSlotStatusNI[i]->send.state == SLOT_STATE_SEND_FAILED)
        {
            if (Rfu.unk_cd5[i] == 10)
                Rfu.unk_cd5[i] = 11;
            rfu_clearSlot(TYPE_NI_SEND, i);
        }
    }
}

static s32 sub_80FA788(void)
{
    s32 retval = 0;
    if (Rfu.unk_c85 == 8)
    {
        if (gRfuSlotStatusNI[Rfu.unk_c3e]->send.state == SLOT_STATE_SEND_SUCCESS || gRfuSlotStatusNI[Rfu.unk_c3e]->send.state == SLOT_STATE_SEND_FAILED)
            rfu_clearSlot(TYPE_NI_SEND, Rfu.unk_c3e);
    }
    if (gRfuSlotStatusNI[Rfu.unk_c3e]->recv.state == SLOT_STATE_RECV_SUCCESS || gRfuSlotStatusNI[Rfu.unk_c3e]->recv.state == SLOT_STATE_RECV_SUCCESS_AND_SENDSIDE_UNKNOWN)
    {
        rfu_clearSlot(TYPE_NI_RECV, Rfu.unk_c3e);
        sub_80FB9E4(Rfu.unk_c86, 0);
        retval = Rfu.unk_c86;
    }
    else if (gRfuSlotStatusNI[Rfu.unk_c3e]->recv.state == SLOT_STATE_RECV_FAILED)
    {
        rfu_clearSlot(TYPE_NI_RECV, Rfu.unk_c3e);
        retval = 6;
    }
    return retval;
}

static void sub_80FA834(u8 taskId)
{
    s32 i;

    if (Rfu.unk_f1 == 1 || Rfu.unk_f1 == 2)
    {
        Rfu.unk_ce8 = 0;
        DestroyTask(taskId);
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (sub_80F9C50())
        {
            ResetBlockReceivedFlags();
            sub_800B0B4();
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (Rfu.unk_0c == 1)
        {
            if (gReceivedRemoteLinkPlayers)
                sub_80F9D04(0x7800);
            else
                sub_80F9D04(0x7700);
            gTasks[taskId].data[0] = 101;
        }
        else
            gTasks[taskId].data[0] = 2;
        break;
    case 101:
        if (gSendCmd[0] == 0)
            gTasks[taskId].data[0] = 2;
        break;
    case 2:
        if (Rfu.playerCount)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (Rfu.unk_0c == 1)
        {
            if (sub_80F9C50())
            {
                Rfu.unk_5a = 0;
                sub_80F9D04(0xa100);
                gTasks[taskId].data[0]++;
            }
        }
        else
            gTasks[taskId].data[0]++;
        break;
    case 4:
        if (sub_80F9C78())
            gTasks[taskId].data[0]++;
        break;
    case 5:
        for (i = 0; i < Rfu.playerCount; i++)
        {
            sub_800B110(i);
            Rfu_ResetBlockReceivedFlag(i);
        }
        gTasks[taskId].data[0]++;
        break;
    case 6:
        DestroyTask(taskId);
        gReceivedRemoteLinkPlayers = 1;
        Rfu.unk_ce8 = 0;
        sub_80FEA34(1, 0x258);
        if (Rfu.unk_ce6)
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if ((Rfu.unk_ce6 >> i) & 1)
                {
                    Rfu.unk_ce5 = 1 << i;
                    Rfu.unk_ce6 ^= (1 << i);
                }
            }
        }
        break;
    }
}

static void sub_80FA9D0(u16 a0)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((a0 >> i) & 1)
            Rfu.unk_cde[i] = 0;
    }
}

static void sub_80FA9FC(const struct UnkRfuStruct_8010A14 *a0)
{
    s32 i;
    Rfu.playerCount = a0->unk_0f;
    for (i = 0; i < RFU_CHILD_MAX; i++)
        Rfu.unk_cde[i] = a0->unk_10[i];
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        gLinkPlayers[i] = a0->unk_14[i];
        sub_800B284(gLinkPlayers + i);
    }
}

static void sub_80FAA58(void *a0)
{
    if (strcmp("PokemonSioInfo", ((struct UnkRfuStruct_8010A14 *)a0)->unk_00) == 0)
    {
        sub_80FA9FC(a0);
        CpuFill16(0, a0, sizeof(struct UnkRfuStruct_8010A14));
        ResetBlockReceivedFlag(0);
    }
}

static void sub_80FAA94(u8 taskId)
{
    s32 i;
    struct LinkPlayerBlock *r2;
    struct UnkRfuStruct_8010A14 *r5;
    u8 r4 = Rfu.unk_cde[gUnknown_843EC38[Rfu.unk_ce9]];
    if (Rfu.unk_f1 == 1 || Rfu.unk_f1 == 2)
    {
        Rfu.unk_ce8 = 0;
        DestroyTask(taskId);
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gSendCmd[0] == 0)
        {
            ResetBlockReceivedFlag(r4);
            sub_80F9D04(0x7800);
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (gSendCmd[0] == 0)
            gTasks[taskId].data[0]++;
        break;
    case 2:
        if ((GetBlockReceivedStatus() >> r4) & 1)
        {
            ResetBlockReceivedFlag(r4);
            r2 = (struct LinkPlayerBlock *)gBlockRecvBuffer[r4];
            gLinkPlayers[r4] = r2->linkPlayer;
            sub_800B284(gLinkPlayers + r4);
            gTasks[taskId].data[0]++;
        }
        break;
    case 3:
        r5 = (struct UnkRfuStruct_8010A14 *)gBlockSendBuffer;
        memcpy(r5->unk_00, "PokemonSioInfo", sizeof("PokemonSioInfo"));
        r5->unk_0f = Rfu.playerCount;
        for (i = 0; i < RFU_CHILD_MAX; i++)
            r5->unk_10[i] = Rfu.unk_cde[i];
        memcpy(r5->unk_14, gLinkPlayers, sizeof gLinkPlayers);
        gTasks[taskId].data[0]++;
        // fallthrough
    case 4:
        r5 = (struct UnkRfuStruct_8010A14 *)gBlockSendBuffer;
        r5->unk_0f = Rfu.playerCount;
        for (i = 0; i < RFU_CHILD_MAX; i++)
            r5->unk_10[i] = Rfu.unk_cde[i];
        memcpy(r5->unk_14, gLinkPlayers, sizeof gLinkPlayers);
        if (SendBlock(0, gBlockSendBuffer, 0xa0))
            gTasks[taskId].data[0]++;
        break;
    case 5:
        if (IsLinkTaskFinished() && GetBlockReceivedStatus() & 1)
        {
            CpuFill16(0, gBlockRecvBuffer, sizeof(struct UnkRfuStruct_8010A14));
            ResetBlockReceivedFlag(0);
            Rfu.unk_ce8 = 0;
            if (Rfu.unk_ce6)
            {
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((Rfu.unk_ce6 >> i) & 1)
                    {
                        Rfu.unk_ce5 = 1 << i;
                        Rfu.unk_ce6 ^= (1 << i);
                        Rfu.unk_ce8 = 1;
                        break;
                    }
                }
            }
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_80FACF0(u8 taskId)
{
    if (Rfu.unk_f1 == 1 || Rfu.unk_f1 == 2)
        DestroyTask(taskId);
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (Rfu.playerCount)
        {
            sub_800B0B4();
            SendBlock(0, gBlockSendBuffer, sizeof(struct LinkPlayerBlock));
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (IsLinkTaskFinished())
            gTasks[taskId].data[0]++;
        break;
    case 2:
        if (GetBlockReceivedStatus() & 1)
        {
            sub_80FA9FC((const struct UnkRfuStruct_8010A14 *)gBlockRecvBuffer);
            ResetBlockReceivedFlag(0);
            gReceivedRemoteLinkPlayers = 1;
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_80FAD98(void)
{
    if (Rfu.unk_ee == 1 && gUnknown_3005E10.unk_02 == 0)
    {
        if (gMain.callback2 == c2_mystery_gift_e_reader_run)
            gWirelessCommType = 2;
        SetMainCallback2(CB2_LinkError);
        gMain.savedCallback = CB2_LinkError;
        sub_800ACBC((Rfu.unk_0a << 16) | (Rfu.unk_10 << 8) | Rfu.unk_12, Rfu.unk_124.unk_8c2, Rfu.unk_9e8.unk_232, sub_80FB9F4() == 2);
        Rfu.unk_ee = 2;
        CloseLink();
    }
    else if (Rfu.unk_9e8.unk_233 == 1 || Rfu.unk_124.unk_8c3 == 1)
    {
        if (gUnknown_3005E10.unk_02)
            sub_80FEB14();
        sub_80FB9E4(1, 0x7000);
        sub_80FB0E8(0x7000);
    }
}

static void rfu_REQ_recvData_then_sendData(void)
{
    if (gUnknown_3005E10.unk_06 == 1)
    {
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        LinkRfu_REQ_SendData_HandleParentRelationship(0);
    }
}

bool32 sub_80FAE94(void)
{
    bool32 retval = FALSE;
    Rfu.unk_ccd = 0;
    sub_80FDA30(Random());
    if (Rfu.unk_ef == 0)
    {
        switch (Rfu.unk_0c)
        {
        case 1:
            sub_80F911C();
            break;
        case 0:
            retval = sub_80F9514();
            break;
        case 2:
            rfu_REQ_recvData_then_sendData();
            break;
        }
    }
    return retval;
}

bool32 sub_80FAEF0(void)
{
    bool32 retval = FALSE;
    if (Rfu.unk_ef == 0)
    {
        if (Rfu.unk_0c == 1)
            retval = sub_80F9204();
        sub_80FAD98();
    }
    return retval;
}

static void sub_80FAF1C(void)
{
    StringCopy(gHostRFUtgtUnameBuffer, gSaveBlock2Ptr->playerName);
}

void ClearAndInitHostRFUtgtGname(void)
{
    memset(&gHostRFUtgtGnameBuffer, 0, RFU_GAME_NAME_LENGTH);
    InitHostRFUtgtGname(&gHostRFUtgtGnameBuffer, 0, 0, 0);
}

void sub_80FAF58(u8 a0, u32 a1, u32 a2)
{
    InitHostRFUtgtGname(&gHostRFUtgtGnameBuffer, a0, a2, a1);
}

void sub_80FAF74(bool32 a0, bool32 a1)
{
    gHostRFUtgtGnameBuffer.unk_00.unk_00_4 = a0;
    gHostRFUtgtGnameBuffer.unk_00.unk_00_5 = a1;
}

void sub_80FAFA0(u32 type, u32 species, u32 level)
{
    gHostRFUtgtGnameBuffer.type = type;
    gHostRFUtgtGnameBuffer.species = species;
    gHostRFUtgtGnameBuffer.level = level;
}

void sub_80FAFE0(u8 a0)
{
    gHostRFUtgtGnameBuffer.unk_0a_7 = a0;
    rfu_REQ_configGameData(0, 2, (void *)&gHostRFUtgtGnameBuffer, gHostRFUtgtUnameBuffer);
}

void sub_80FB008(u8 a0, u32 a1, u32 a2)
{
    if (a0)
        sub_80FAF58(a0, a1, a2);
    rfu_REQ_configGameData(0, 2, (void *)&gHostRFUtgtGnameBuffer, gHostRFUtgtUnameBuffer);
}

void sub_80FB030(u32 a0)
{
    s32 i;
    u32 r5;
    u32 r7;
    s32 r8;

    if (sub_80F9800()->unk_0a_0 == 0x45)
    {
        r5 = 0;
        r7 = 0;
        r8 = Rfu.unk_ce2 ^ Rfu.unk_ce3;
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((r8 >> i) & 1)
            {
                r7 |= ((0x80 | ((gLinkPlayers[Rfu.unk_cde[i]].gender & 1) << 3) | (gLinkPlayers[Rfu.unk_cde[i]].trainerId & 7)) << (r5 << 3));
                r5++;
                if (r5 == a0 - 1)
                    break;
            }
        }
        sub_80FB008(0x45, r7, 0);
    }
}

static void sub_80FB0E8(u32 a0)
{
    if (Rfu.unk_ee == 0)
    {
        Rfu.unk_10 = gUnknown_3005E10.unk_14;
        Rfu.unk_12 = gUnknown_3005E10.unk_16;
        Rfu.unk_0a = a0;
        Rfu.unk_ee = 1;
    }
}

static void sub_80FB118(void)
{
    Rfu.unk_ee = 0;
}

void sub_80FB128(bool32 a0)
{
    if (!a0)
        Rfu.unk_ee = 0;
    else
        Rfu.unk_ee = 4;
}

static void sub_80FB154(void)
{
    sub_80FBE20(gUnknown_3005E10.unk_00, 1);
    Rfu.RfuFunc = NULL;
}

static void sub_80FB174(void)
{
    Rfu.RfuFunc = sub_80FB154;
}

static void sub_80FB184(u8 a0, u8 unused1)
{
    u8 i;
    u8 r6 = 0;
    switch (a0)
    {
    case 0x00:
        Rfu.unk_04 = 2;
        break;
    case 0x10:
        break;
    case 0x11:
        sub_80FB564(gUnknown_3005E10.unk_14);
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((gUnknown_3005E10.unk_14 >> i) & 1)
            {
                struct GFtgtGname *structPtr = (void *)&gRfuLinkStatus->partner[i].gname;
                if (structPtr->unk_0a_0 == sub_80F9800()->unk_0a_0)
                {
                    Rfu.unk_cd1[i] = 0;
                    Rfu.unk_cd5[i] = 0;
                    rfu_setRecvBuffer(TYPE_NI, i, Rfu.unk_cd5 + i, 1);
                }
                else
                {
                    r6 |= (1 << i);
                }
            }
        }
        if (r6)
        {
            rfu_REQ_disconnect(r6);
            rfu_waitREQComplete();
        }
        break;
    case 0x12:
        break;
    case 0x13:
        break;
    case 0x14:
        if (Rfu.unk_ce7 != gUnknown_3005E10.unk_00)
        {
            rfu_REQ_disconnect(Rfu.unk_ce7 ^ gUnknown_3005E10.unk_00);
            rfu_waitREQComplete();
        }
        Rfu.unk_04 = 0x11;
        break;
    case 0x31:
        Rfu.unk_f0 = 1;
        break;
    case 0x32:
        Rfu.unk_f0 = 3;
        break;
    case 0x30:
    case 0x33:
        Rfu.unk_f0 = 4;
        Rfu.unk_ce2 &= ~gUnknown_3005E10.unk_14;
        if (gReceivedRemoteLinkPlayers == 1)
        {
            if (Rfu.unk_ce2 == 0)
                sub_80FB0E8(a0);
            else
                sub_80FB174();
        }
        sub_80FB9E4(2, a0);
        break;
    case 0x34:
        break;
    case 0x42 ... 0x44:
        break;
    case 0xf3:
        sub_80FB9E4(1, a0);
        sub_80FB0E8(a0);
        Rfu.unk_ef = 1;
        break;
    case 0xf0 ... 0xf2:
    case 0xff:
        sub_80FB0E8(a0);
        sub_80FB9E4(1, a0);
        Rfu.unk_cdb = 1;
        break;
    }
}

static const u8 unref_843EDF3[] = _("　あきと");

static void sub_80FB37C(u8 a0, u8 unused1)
{
    switch (a0)
    {
    case 0x00:
        Rfu.unk_04 = 6;
        break;
    case 0x20:
        Rfu.unk_ccd = gUnknown_3005E10.unk_14;
        break;
    case 0x21:
        break;
    case 0x22:
        Rfu.unk_c3e = gUnknown_3005E10.unk_14;
        break;
    case 0x23:
        sub_80FB9E4(2, a0);
        break;
    case 0x24:
        Rfu.unk_04 = 11;
        Rfu.unk_c85 = 0;
        Rfu.unk_c86 = 0;
        rfu_setRecvBuffer(TYPE_NI, Rfu.unk_c3e, &Rfu.unk_c86, 1);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.unk_c3e, Rfu.unk_c3f, 70);
        break;
    case 0x25:
        sub_80FB9E4(2, 0x25);
        break;
    case 0x30:
        Rfu.unk_f0 = 2;
        if (Rfu.unk_c86 == 6)
            break;
    case 0x33:
        if (Rfu.unk_f0 != 2)
            Rfu.unk_f0 = 4;
        if (Rfu.unk_c86 != 9)
            sub_80FB9E4(2, a0);
        nullsub_87("LINK LOSS DISCONNECT!", 5, 5);
        if (gReceivedRemoteLinkPlayers == 1)
            sub_80FB0E8(a0);
        break;
    case 0x31:
        Rfu.unk_f0 = 1;
        nullsub_87("LINK LOSS RECOVERY NOW", 5, 5);
        break;
    case 0x32:
        Rfu.unk_f0 = 3;
        Rfu.unk_c3c = 1;
        break;
    case 0x34:
        break;
    case 0x42 ... 0x44:
        break;
    case 0xF3:
        sub_80FB9E4(1, a0);
        sub_80FB0E8(a0);
        Rfu.unk_ef = 1;
        break;
    case 0xF0 ... 0xF2:
    case 0xFF:
        sub_80FB9E4(1, a0);
        sub_80FB0E8(a0);
        Rfu.unk_cdb = 1;
        break;
    }
}

static void sub_80FB564(s32 a0)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((a0 >> i) & 1)
        {
            Rfu.unk_cea[i] = 0;
            Rfu.unk_cee[i] = 0xFF;
        }
    }
}

static u8 sub_80FB5A0(s32 a0)
{
    u8 ret = 0;
    u8 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((a0 >> i) & 1)
        {
            struct GFtgtGname *structPtr = (void *)&gRfuLinkStatus->partner[i].gname;
            if (structPtr->unk_0a_0 == 0x45)
                ret |= (1 << i);
        }
    }

    return ret;
}

static void sub_80FB5EC(u8 a0, u8 unused1)
{
    u8 r1;

    switch (a0)
    {
    case 0x00:
        Rfu.unk_04 = 0x11;
        break;
    case 0x10:
        sub_80FB9E4(4, 0);
        break;
    case 0x11:
        if (sub_80F9800()->unk_0a_0 == 0x45 && Rfu.unk_cd9 == 0)
        {
            u8 idx = sub_80FB5A0(gUnknown_3005E10.unk_14);
            if (idx != 0)
            {
                r1 = 1 << sub_80F886C(idx);
                if (Rfu.unk_ce6 == 0 && Rfu.unk_ce8 == 0)
                {
                    Rfu.unk_ce5 = r1;
                    Rfu.unk_ce6 |= (r1 ^ idx);
                    Rfu.unk_ce8 = 1;
                }
                else
                {
                    Rfu.unk_ce6 |= idx;
                }
            }
            if (idx != gUnknown_3005E10.unk_14)
            {
                Rfu.unk_ce3 |= (idx ^ gUnknown_3005E10.unk_14);
                Rfu.unk_ce4 = 2;
            }
        }
        else if (sub_80F9800()->unk_0a_0 == 0x54)
        {
            rfu_REQ_disconnect(gUnknown_3005E10.unk_00);
            rfu_waitREQComplete();
        }
        sub_80FB564(gUnknown_3005E10.unk_14);
        break;
    case 0x12:
        break;
    case 0x13:
        break;
    case 0x14:
        if (sub_80F9800()->unk_0a_0 != 0x45 && gUnknown_3005E10.unk_01 > 1)
        {
            r1 = 1 << sub_80F886C(gUnknown_3005E10.unk_14);
            rfu_REQ_disconnect(gUnknown_3005E10.unk_00 ^ r1);
            rfu_waitREQComplete();
        }
        if (Rfu.unk_04 == 0xF)
            Rfu.unk_04 = 0x10;
        break;
    case 0x20:
        Rfu.unk_ccd = gUnknown_3005E10.unk_14;
        break;
    case 0x21:
        break;
    case 0x22:
        Rfu.unk_c3e = gUnknown_3005E10.unk_14;
        break;
    case 0x23:
        Rfu.unk_04 = 0x12;
        if (Rfu.unk_ccf < 2)
        {
            Rfu.unk_ccf++;
            CreateTask(sub_80FC028, 2);
        }
        else
        {
            sub_80FB9E4(2, a0);
        }
        break;
    case 0x24:
        Rfu.unk_04 = 0xD;
        sub_80FB9E4(3, 0);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.unk_c3e, Rfu.unk_c3f, sizeof(Rfu.unk_c3f));
        break;
    case 0x25:
        sub_80FB9E4(2, a0);
        break;
    case 0x31:
        if (gUnknown_3005E10.unk_00 & gUnknown_3005E10.unk_14)
            Rfu.unk_f0 = 1;
        break;
    case 0x32:
        Rfu.unk_f0 = 3;
        if (gRfuLinkStatus->parentChild == MODE_CHILD)
            Rfu.unk_c3c = 1;
        break;
    case 0x30:
        Rfu.unk_f0 = 2;
    case 0x33:
        if (Rfu.unk_f0 != 2)
            Rfu.unk_f0 = 4;
        if (Rfu.unk_0c == 1)
        {
            if (gReceivedRemoteLinkPlayers == 1)
            {
                Rfu.unk_ce2 &= ~(gUnknown_3005E10.unk_14);
                if (Rfu.unk_ce2 == 0)
                    sub_80FB0E8(a0);
                else
                    sub_80FB174();
            }
        }
        else if (Rfu.unk_ce4 != 2 && gReceivedRemoteLinkPlayers == 1)
        {
            sub_80FB0E8(a0);
            sub_80FD760(0);
        }

        if (gRfuLinkStatus->parentChild == MODE_NEUTRAL && gUnknown_3005E10.unk_07 == 0 && FuncIsActiveTask(sub_80F8B34) == TRUE)
            Rfu.unk_04 = 0x11;

        sub_80FB9E4(2, a0);
        break;
    case 0x40:
        Rfu.unk_ce3 = 0;
        break;
    case 0x42 ... 0x44:
        break;
    case 0xF3:
        sub_80FB9E4(1, a0);
        sub_80FB0E8(a0);
        Rfu.unk_ef = 1;
        break;
    case 0xF0 ... 0xF2:
    case 0xFF:
        sub_80FB0E8(a0);
        sub_80FB9E4(1, a0);
        Rfu.unk_cdb = 0;
        break;
    }
}

void sub_80FB9D0(void)
{
    Rfu.unk_ce4 = 2;
}

void sub_80FB9E4(u8 a0, u16 a1)
{
    Rfu.unk_f1 = a0;
    Rfu.unk_0a = a1;
}

u8 sub_80FB9F4(void)
{
    return Rfu.unk_f1;
}

bool32 sub_80FBA00(void)
{
    u32 var = sub_80FB9F4() - 1;
    if (var < 2)
        return TRUE;
    else
        return FALSE;
}

bool32 sub_80FBA1C(void)
{
    return Rfu.unk_ce8;
}

bool8 Rfu_IsMaster(void)
{
    return Rfu.unk_0c;
}

void RFUVSync(void)
{
    LinkRfu_syncVBlank_();
}

void sub_80FBA44(void)
{
    CpuFill32(0, gRecvCmds, sizeof(gRecvCmds));
}

static void sub_80FBA64(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80FBA78(void)
{
    s32 i;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    ResetPaletteFade();
    SetVBlankCallback(sub_80FBA64);
    if (IsWirelessAdapterConnected())
    {
        gLinkType = LINKTYPE_0x1111;
        sub_800B1F4();
        OpenLink();
        SeedRng(gMain.vblankCounter2);
        for (i = 0; i < RFU_CHILD_MAX; i++)
            gSaveBlock2Ptr->playerTrainerId[i] = Random() % 256;

        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP);
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        sub_80FBB20();
        SetMainCallback2(sub_80FBB74);
    }
}

bool32 sub_80FBB0C(void)
{
    return FuncIsActiveTask(sub_80F8B34);
}

void sub_80FBB20(void)
{
    if (!FuncIsActiveTask(nullsub_89))
        Rfu.unk_66 = CreateTask(nullsub_89, 0);
}

void sub_80FBB4C(void)
{
    if (FuncIsActiveTask(nullsub_89) == TRUE)
        DestroyTask(Rfu.unk_66);
}

static void sub_80FBB74(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80FBB8C(u32 a0)
{
    Rfu.unk_0c = 1;
    sub_80FAF1C();
    sub_80FD430(sub_80FB184, NULL);
    sRfuReqConfig = sRfuReqConfigTemplate;
    sRfuReqConfig.availSlotFlag = sAvailSlots[a0 - 1];
    sub_80F8E74();
}

void sub_80FBBD8(void)
{
    Rfu.unk_0c = 0;
    sub_80FAF1C();
    sub_80FD430(sub_80FB37C, sub_80F8D20);
    sub_80F8F10();
}

void sub_80FBC00(void)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return;
    Rfu.unk_0c = 2;
    sub_80FAF1C();
    sub_80FD430(sub_80FB5EC, NULL);
    sRfuReqConfig = sRfuReqConfigTemplate;
    sRfuReqConfig.unk_11 = 0;
    sRfuReqConfig.unk_12 = 0x258;
    Rfu.unk_67 = CreateTask(sub_80F8B34, 1);
}

static u16 ReadU16(const void *ptr)
{
    const u8 *ptr_ = ptr;
    return (ptr_[1] << 8) | (ptr_[0]);
}

static u8 sub_80FBC70(const u8 *a0, u16 a1)
{
    u8 i;
    u8 ret = 0xFF;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        u16 trainerId = ReadU16(((struct GFtgtGname *)gRfuLinkStatus->partner[i].gname)->unk_00.playerTrainerId);
        if (sub_80FA44C(gRfuLinkStatus->partner[i].serialNo)
            && !StringCompare(a0, gRfuLinkStatus->partner[i].uname)
            && a1 == trainerId)
        {
            ret = i;
            if (gRfuLinkStatus->partner[i].slot != 0xFF)
                break;
        }
    }

    return ret;
}

static void sub_80FBCF8(u32 a0)
{
    rfu_REQ_disconnect(a0);
    rfu_waitREQComplete();
    Rfu.unk_ce2 &= ~(a0);
    rfu_clearSlot(TYPE_UNI_SEND, Rfu.unk_cda);
    rfu_UNI_setSendData(Rfu.unk_ce2, Rfu.unk_c87, 70);
    Rfu.unk_cda = sub_80F886C(Rfu.unk_ce2);
}

void sub_80FBD4C(const u8 *ptr, u16 a1)
{
    u8 var = sub_80FBC70(ptr, a1);
    if (var != 0xFF)
        sub_80FBCF8(1 << var);
}

void sub_80FBD6C(u32 a0)
{
    if (a0 != 0)
    {
        s32 i;
        u8 var = 0;

        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (Rfu.unk_cde[i] == a0 && (Rfu.unk_ce2 >> i) & 1)
                var |= 1 << i;
        }
        if (var)
            sub_80FBE20(var, 2);
    }
}

static void sub_80FBDB8(u8 taskId)
{
    if (gSendCmd[0] == 0 && Rfu.unk_ce8 == 0)
    {
        sub_80F9D04(0xED00);
        gSendCmd[1] = gTasks[taskId].data[0];
        gSendCmd[2] = gTasks[taskId].data[1];
        Rfu.playerCount -= gUnknown_843EC41[gTasks[taskId].data[0]];
        gSendCmd[3] = Rfu.playerCount;
        DestroyTask(taskId);
    }
}

static void sub_80FBE20(u32 a0, u32 a1)
{
    u8 taskId = FindTaskIdByFunc(sub_80FBDB8);
    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_80FBDB8, 5);
        gTasks[taskId].data[0] = a0;
    }
    else
    {
        gTasks[taskId].data[0] |= a0;
    }

    gTasks[taskId].data[1] = a1;
}

static void sub_80FBE80(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (sub_80F8EA4())
    {
        u8 id = sub_80FBC70((u8*)data, ReadU16(&data[8]));
        if (id != 0xFF)
        {
            if (gRfuLinkStatus->partner[id].slot != 0xFF)
            {
                Rfu.unk_c3d = id;
                if (sub_80F8ECC())
                    DestroyTask(taskId);
            }
            else if (sub_80F9800()->unk_0a_0 == 0x15 || sub_80F9800()->unk_0a_0 == 0x16)
            {
                data[15]++;
            }
            else
            {
                sub_80FB9E4(2, 0x7000);
                DestroyTask(taskId);
            }
        }
        else
        {
            data[15]++;
            Rfu.unk_c3d = id;
        }
    }
    else
    {
        data[15]++;
    }

    if (data[15] > 240)
    {
        sub_80FB9E4(2, 0x7000);
        DestroyTask(taskId);
    }
}

void sub_80FBF54(const u8 *src, u16 trainerId)
{
    u8 taskId;
    s16 *data;

    Rfu.unk_f1 = 0;
    taskId = CreateTask(sub_80FBE80, 3);
    data = gTasks[taskId].data;
    StringCopy((u8*)(data), src);
    data[8] = trainerId;
}

static bool32 sub_80FBF98(s16 a1, struct GFtgtGname *structPtr)
{
    if (sub_80F9800()->unk_0a_0 == 0x45)
    {
        if (structPtr->unk_0a_0 != 0x45)
            return TRUE;
    }
    else if (structPtr->unk_0a_0 != 0x40)
    {
        return TRUE;
    }
    else if (a1 == 0x44)
    {
        struct GFtgtGname *structPtr2 = (struct GFtgtGname *)&Rfu.unk_104.gname;
        if (structPtr2->species == SPECIES_EGG)
        {
            if (structPtr->species == structPtr2->species)
                return FALSE;
            else
                return TRUE;
        }
        else if (structPtr->species != structPtr2->species
                 || structPtr->level != structPtr2->level
                 || structPtr->type != structPtr2->type)
        {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_80FC028(u8 taskId)
{
    if (Rfu.unk_f1 == 4)
        DestroyTask(taskId);

    if (++gTasks[taskId].data[0] > 300)
    {
        sub_80FB9E4(2, 0x7000);
        DestroyTask(taskId);
    }

    if (Rfu.unk_ccd != 0 && gUnknown_3005E10.unk_06 == 0)
    {
        u16 trainerId = ReadU16(((struct GFtgtGname *)&Rfu.unk_104.gname)->unk_00.playerTrainerId);
        u8 id = sub_80FBC70(Rfu.unk_104.uname, trainerId);
        if (id != 0xFF)
        {
            if (!sub_80FBF98(gTasks[taskId].data[1], (struct GFtgtGname *)&gRfuLinkStatus->partner[id].gname))
            {
                if (gRfuLinkStatus->partner[id].slot != 0xFF && !sub_80FD610(gRfuLinkStatus->partner[id].id, 0x5A))
                {
                    Rfu.unk_04 = 0xA;
                    DestroyTask(taskId);
                }
            }
            else
            {
                sub_80FB9E4(2, 0x7000);
                DestroyTask(taskId);
            }
        }
    }
}

void sub_80FC114(const u8 *name, struct GFtgtGname *structPtr, u8 a2)
{
    u8 taskId, taskId2;

    Rfu.unk_ccf = 0;
    Rfu.unk_f1 = 0;
    StringCopy(Rfu.unk_104.uname, name);
    memcpy(Rfu.unk_104.gname, structPtr, RFU_GAME_NAME_LENGTH);
    sub_80FEB3C();
    taskId = CreateTask(sub_80FC028, 2);
    gTasks[taskId].data[1] = a2;
    taskId2 = FindTaskIdByFunc(sub_80F8B34);
    if (a2 == 0x45)
    {
        if (taskId2 != 0xFF)
            gTasks[taskId2].data[7] = 1;
    }
    else
    {
        if (taskId2 != 0xFF)
            gTasks[taskId2].data[7] = 0;
    }
}

bool8 sub_80FC1B0(void)
{
    if (Rfu.unk_f0 == 1)
        return TRUE;
    else
        return FALSE;
}

bool32 sub_80FC1CC(void)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((gUnknown_3005E10.unk_00 >> i) & 1 && Rfu.unk_cd1[i] == 0)
            return FALSE;
    }

    return TRUE;
}

static void sub_80FC208(void)
{
    s32 i;

    for (i = 0; i < 20; i++)
        nullsub_87("                              ", 0, i);
}

static const char gUnknown_843EE47[16] = {
    ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    '\0'
};

static const char gUnknown_843EE57[9] = {
    ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    '\0'
};

static const char gUnknown_843EE60[] = {' ', '\0'};
static const char gUnknown_843EE62[] = {'*', '\0'};

static void sub_80FC228(void)
{
    s32 i, j;

    nullsub_88(GetBlockReceivedStatus(), 0x1C, 0x13, 2);
    nullsub_88(gRfuLinkStatus->connSlotFlag, 0x14, 1, 1);
    nullsub_88(gRfuLinkStatus->linkLossSlotFlag, 0x17, 1, 1);
    if (Rfu.unk_0c == 1)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((gRfuLinkStatus->getNameFlag >> i) & 1)
            {
                nullsub_88(gRfuLinkStatus->partner[i].serialNo, 1, i + 3, 4);
                nullsub_87((void*) &gRfuLinkStatus->partner[i].gname, 6, i + 3);
                nullsub_87(gRfuLinkStatus->partner[i].uname, 0x16, i + 3);
            }
        }
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            for (j = 0; j < 14; j++)
            {
                nullsub_88(Rfu.unk_14[i][j], j * 2, i + 11, 2);
            }
        }
        nullsub_87("NOWSLOT", 1, 0xF);
    }
    else if (gRfuLinkStatus->connSlotFlag != 0 && gRfuLinkStatus->getNameFlag != 0)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            nullsub_88(0, 1, i + 3, 4);
            nullsub_87(gUnknown_843EE47, 6, i + 3);
            nullsub_87(gUnknown_843EE57, 0x16, i + 3);
        }
        nullsub_88(gRfuLinkStatus->partner[Rfu.unk_c3e].serialNo, 1, 3, 4);
        nullsub_87(gRfuLinkStatus->partner[Rfu.unk_c3e].gname, 6, 3);
        nullsub_87(gRfuLinkStatus->partner[Rfu.unk_c3e].uname, 0x16, 3);
    }
    else
    {
        for (i = 0; i < gRfuLinkStatus->findParentCount; i++)
        {
            if (gRfuLinkStatus->partner[i].slot != 0xFF)
            {
                nullsub_88(gRfuLinkStatus->partner[i].serialNo, 1, i + 3, 4);
                nullsub_88(gRfuLinkStatus->partner[i].id, 6, i + 3, 4);
                nullsub_87(gRfuLinkStatus->partner[i].uname, 0x16, i + 3);
            }
        }
        for (; i < RFU_CHILD_MAX; i++)
        {
            nullsub_88(0, 1, i + 3, 4);
            nullsub_87(gUnknown_843EE47, 6, i + 3);
            nullsub_87(gUnknown_843EE57, 0x16, i + 3);
        }
    }
}

static const char gUnknown_843EE6C[][12] = {
    "           ",
    "CLOCK DRIFT",
    "BUSY SEND  ",
    "CMD REJECT ",
    "CLOCK SLAVE"
};

static const char gUnknown_843EEA8[][8] = {
    "CHILD ",
    "PARENT",
    "SEARCH"
};

static u32 sub_80FC44C(void)
{
    return Rfu.unk_9e8.unk_232;
}

u32 GetRfuRecvQueueLength(void)
{
    return Rfu.unk_124.unk_8c2;
}

static void nullsub_89(u8 taskId)
{

}
