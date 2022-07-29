#include "global.h"
#include "gflib.h"
#include "librfu.h"
#include "battle.h"
#include "link.h"
#include "link_rfu.h"
#include "mystery_gift_menu.h"
#include "overworld.h"
#include "quest_log.h"
#include "random.h"
#include "task.h"
#include "constants/union_room.h"

struct SioInfo
{
    char magic[15]; // PokemonSioInfo
    u8 playerCount;
    u8 linkPlayerIdx[RFU_CHILD_MAX];
    struct LinkPlayer linkPlayers[MAX_RFU_PLAYERS];
    u8 fill_a0[0x5c];
};

struct RfuDebug
{
    u8 fill_00[6];
    u16 unk_06;
    u8 fill_08[6];
    vu8 unk_0e;
    u8 unk_0f;
    u8 fill_10[0x54];
    u16 unk_64;
    u8 fill_66[0x1d];
    u8 unk_83;
    u8 fill_84[0x58];
};

static EWRAM_DATA INIT_PARAM sRfuReqConfig = {};
static EWRAM_DATA struct RfuDebug sRfuDebug = {};

static u32 gf_rfu_REQ_api[RFU_API_BUFF_SIZE_RAM / 4];
static u8 sResendBlock8[14];
static u16 sResendBlock16[7];

struct GFtgtGname gHostRFUtgtGnameBuffer;
GF_RFU_MANAGER Rfu;
u8 gHostRFUtgtUnameBuffer[PLAYER_NAME_LENGTH + 1];

static void sub_80F8AA4(void);
static void sub_80F8AEC(void);
static void MscCallback_Child(u16 a0);
static void MSCCallback_SetUnkCDB(u16 a0);
static void UpdateBackupQueue(void);
static void RfuHandleReceiveCommand(u8 unused);
static void ResetSendDataManager(struct RfuBlockSend *data);
static void RfuPrepareSendBuffer(u16 command);
static void HandleBlockSend(void);
static void SendNextBlock(void);
static void SendLastBlock(void);
static void CallRfuFunc(void);
static void UpdateChildStatuses(void);
static s32 GetRfuRecvStatus(void);
static void sub_80FA834(u8 taskId);
static void ClearSelectedLinkPlayerIds(u16 disconnectMask);
static void ValidateAndReceivePokemonSioInfo(void * a0);
static void Task_ExchangeLinkPlayers(u8 taskId);
static void sub_80FACF0(u8 taskId);
static void GetLinkmanErrorParams(u32 msg);
static void sub_80FB564(s32 bmConnectedFlag);
static void sub_80FBB74(void);
static u8 GetPartnerIndexByNameAndTrainerID(const u8 *trainerName, u16 trainerId);
static void RfuReqDisconnectSlot(u32 bmDisconnectSlot);
static void sub_80FBE20(u32 a0, u32 a1);
static void sub_80FC028(u8 taskId);
static void Debug_PrintEmpty(void);
static void Task_idle(u8 taskId);

static const INIT_PARAM sRfuReqConfigTemplate = {
    .maxMFrame = 4,
    .MC_TimerCount = 32,
    .availSlot_flag = 0,
    .mboot_flag = 0,
    .serialNo = 0x0002,
    .gameName = (void *)&gHostRFUtgtGnameBuffer,
    .userName = gHostRFUtgtUnameBuffer,
    .fastSearchParent_flag = TRUE,
    .linkRecovery_enable = FALSE,
    .linkRecovery_period = 600,
    .NI_failCounter_limit = 300
};

static const u8 sAvailSlots[] = {
    [1] = AVAIL_SLOT1,
    [2] = AVAIL_SLOT2,
    [3] = AVAIL_SLOT3,
    [4] = AVAIL_SLOT4
};

static const u32 sAllBlocksReceived[] = {
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

static const u8 sNumSetBits[] = {
    [0x0] = 0,
    [0x1] = 1,
    [0x2] = 1,
    [0x3] = 2,
    [0x4] = 1,
    [0x5] = 2,
    [0x6] = 2,
    [0x7] = 3,
    [0x8] = 1,
    [0x9] = 2,
    [0xA] = 2,
    [0xB] = 3,
    [0xC] = 2,
    [0xD] = 3,
    [0xE] = 3,
    [0xF] = 4
};

static const u8 sNumTrailingZeroes[] = {
    [0x0] = 0,
    [0x1] = 0,
    [0x2] = 1,
    [0x3] = 0,
    [0x4] = 2,
    [0x5] = 0,
    [0x6] = 1,
    [0x7] = 0,
    [0x8] = 3,
    [0x9] = 0,
    [0xA] = 1,
    [0xB] = 0,
    [0xC] = 2,
    [0xD] = 0,
    [0xE] = 1,
    [0xF] = 0
};

static const struct BlockRequest sBlockRequests[] = {
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 200 },
    { gBlockSendBuffer, 100 },
    { gBlockSendBuffer, 220 },
    { gBlockSendBuffer,  40 }
};

static const u16 sAcceptedSerialNos[] = {
    0x0002, // Pokemon FR/LG/EM
    RFU_SERIAL_7F7D,
    0xFFFF
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
    Task_ExchangeLinkPlayers,
    sub_80FACF0
};

static void Debug_PrintString(const void *string, u8 x, u8 y)
{
    // debug?
}

static void Debug_PrintNum(u16 num, u8 x, u8 y, u8 ndigits)
{

}

void ResetLinkRfuGFLayer(void)
{
    s32 i;
    u8 errorState_bak = Rfu.errorState;
    CpuFill16(0, &Rfu, sizeof Rfu);
    Rfu.parent_child = MODE_NEUTRAL;
    Rfu.errorState = errorState_bak;
    if (Rfu.errorState != 4)
    {
        Rfu.errorState = 0;
    }
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        ResetSendDataManager(&Rfu.recvBlock[i]);
    }
    ResetSendDataManager(&Rfu.sendBlock);
    RfuRecvQueue_Reset(&Rfu.recvQueue);
    RfuSendQueue_Reset(&Rfu.sendQueue);
    CpuFill16(0, gSendCmd, sizeof gSendCmd);
    CpuFill16(0, gRecvCmds, sizeof gRecvCmds);
    CpuFill16(0, gLinkPlayers, sizeof gLinkPlayers);
}

void InitRFU(void)
{
    IntrFunc serialIntr = gIntrTable[1];
    IntrFunc timerIntr = gIntrTable[2];
    InitRFUAPI();
    rfu_REQ_stopMode();
    rfu_waitREQComplete();
    REG_IME = 0;
    gIntrTable[1] = serialIntr;
    gIntrTable[2] = timerIntr;
    REG_IME = INTR_FLAG_VBLANK;
}

void InitRFUAPI(void)
{
    if (!rfu_initializeAPI(gf_rfu_REQ_api, RFU_API_BUFF_SIZE_RAM, gIntrTable + 1, TRUE))
    {
        gLinkType = 0;
        // ClearSavedLinkPlayers(); // Em fix
        sub_80FB128(FALSE);
        ResetLinkRfuGFLayer();
        rfu_setTimerInterrupt(3, gIntrTable + 2);
    }
}

static void Task_LinkLeaderSearchForChildren(u8 taskId)
{
    UpdateChildStatuses();
    switch (Rfu.state)
    {
    case 0:
        rfu_LMAN_initializeRFU(&sRfuReqConfig);
        Rfu.state = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 2:
        rfu_LMAN_establishConnection(Rfu.parent_child, 0, 240, (u16*)sAcceptedSerialNos);
        Rfu.state = 3;
        gTasks[taskId].data[1] = 6;
        break;
    case 3:
        break;
    case 4:
        rfu_LMAN_stopManager(FALSE);
        Rfu.state = 5;
        break;
    case 5:
        break;
    case 18:
        Rfu.unk_cdb = FALSE;
        rfu_LMAN_setMSCCallback(MSCCallback_SetUnkCDB);
        sub_80F8AA4();
        sub_80F8AEC();
        Rfu.state = 20;
        gTasks[taskId].data[1] = 8;
        CreateTask(sub_80FA834, 5);
        DestroyTask(taskId);
        break;
    }
}

static u8 CountTrailingZeroes(u8 acceptSlot)
{
    return sNumTrailingZeroes[acceptSlot];
}

static void ReassignPartnerIds(s32 before, s32 after)
{
    u8 i;
    u8 r4 = 1;
    s32 beforeBak = before;
    s32 r6 = 0;
    if (after == -1)
    {
        // First Time Init
        // UB: linkPlayerIdx may be uninitialized
        for (i = 0; i < RFU_CHILD_MAX; before >>= 1, i++)
        {
            if (before & 1)
            {
                Rfu.linkPlayerIdx[i] = r4;
                r4++;
            }
        }
    }
    else
    {
        // Delete before flags
        for (i = 0; i < RFU_CHILD_MAX; beforeBak >>= 1, i++)
        {
            if (!(beforeBak & 1))
            {
                Rfu.linkPlayerIdx[i] = 0;
            }
        }
        // Get highest retained index
        for (r4 = 4; r4 != 0; r4--)
        {
            for (i = 0; i < RFU_CHILD_MAX && Rfu.linkPlayerIdx[i] != r4; i++);
            if (i == 4)
            {
                r6 = r4;
            }
        }
        // Replace with new flags
        for (after &= ~before, i = 0; i < RFU_CHILD_MAX; after >>= 1, i++)
        {
            if (after & 1)
            {
                Rfu.linkPlayerIdx[i] = r6++;
            }
        }
    }
}

static void Task_JoinGroupSearchForParent(u8 taskId)
{
    switch (Rfu.state)
    {
    case 0:
        rfu_LMAN_initializeRFU((INIT_PARAM*)&sRfuReqConfigTemplate);
        Rfu.state = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 6:
        rfu_LMAN_establishConnection(Rfu.parent_child, 0, 240, (u16*)sAcceptedSerialNos);
        Rfu.state = 7;
        gTasks[taskId].data[1] = 7;
        break;
    case 7:
        break;
    case 9:
        gTasks[taskId].data[1] = 10;
        break;
    case 11:
        switch (GetRfuRecvStatus())
        {
        case RFU_STATUS_JOIN_GROUP_OK:
            Rfu.state = 12;
            break;
        case RFU_STATUS_JOIN_GROUP_NO:
        case RFU_STATUS_LEAVE_GROUP:
            rfu_LMAN_requestChangeAgbClockMaster();
            Rfu.unk_ce4 = 2;
            DestroyTask(taskId);
            break;
        }
        break;
    case 12:
    {
        u8 bmChildSlot = 1 << Rfu.child_slot;
        rfu_clearSlot(TYPE_NI_SEND | TYPE_NI_RECV, Rfu.child_slot);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.child_slot, Rfu.unk_c3f, sizeof(Rfu.unk_c3f));
        rfu_UNI_setSendData(bmChildSlot, Rfu.lastCmdBeforeCommInterrupt, sizeof(Rfu.lastCmdBeforeCommInterrupt));
        gTasks[taskId].data[1] = 8;
        DestroyTask(taskId);
        if (sRfuDebug.unk_0f == 0)
        {
            Debug_PrintEmpty();
            sRfuDebug.unk_0f++;
        }
        CreateTask(sub_80FA834, 5);
        break;
    }
    }
}

static void sub_80F8AA4(void)
{
    u8 i;
    u8 acceptSlot = lman.acceptSlot_flag;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (acceptSlot & 1)
        {
            rfu_setRecvBuffer(TYPE_UNI, i, Rfu.main_UNI_recvBuffer[i], sizeof(Rfu.main_UNI_recvBuffer[i]));
            rfu_clearSlot(TYPE_UNI_SEND | TYPE_UNI_RECV, i);
        }
        acceptSlot >>= 1;
    }
}

static void sub_80F8AEC(void)
{
    u8 acceptSlot = lman.acceptSlot_flag;
    rfu_UNI_setSendData(acceptSlot, Rfu.recvCmds, sizeof(Rfu.recvCmds));
    Rfu.unk_cda = CountTrailingZeroes(acceptSlot);
    Rfu.bm_PartnerFlags = acceptSlot;
    ReassignPartnerIds(acceptSlot, -1);
    Rfu.parent_child = MODE_PARENT;
}

static void Task_LinkRfu_UnionRoomListen(u8 taskId)
{
    if (GetHostRFUtgtGname()->activity == (ACTIVITY_PLYRTALK | IN_UNION_ROOM) && RfuGetStatus() == 4)
    {
        rfu_REQ_disconnect(lman.acceptSlot_flag);
        rfu_waitREQComplete();
        RfuSetStatus(RFU_STATUS_OK, 0);
    }
    switch (Rfu.state)
    {
    case 0:
        rfu_LMAN_initializeRFU(&sRfuReqConfig);
        Rfu.state = 1;
        gTasks[taskId].data[1] = 1;
        break;
    case 1:
        break;
    case 17:
        rfu_LMAN_establishConnection(MODE_P_C_SWITCH, 0, 240, (u16*)sAcceptedSerialNos);
        rfu_LMAN_setMSCCallback(MscCallback_Child);
        Rfu.state = 18;
        break;
    case 18:
        break;
    case 13:
        if (rfu_UNI_setSendData(1 << Rfu.child_slot, Rfu.lastCmdBeforeCommInterrupt, sizeof(Rfu.lastCmdBeforeCommInterrupt)) == 0)
        {
            Rfu.parent_child = MODE_CHILD;
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
        rfu_LMAN_stopManager(0);
        Rfu.state = 15;
        break;
    case 15:
        break;
    case 16:
        Rfu.unk_cdb = FALSE;
        rfu_LMAN_setMSCCallback(MSCCallback_SetUnkCDB);
        UpdateGameData_GroupLockedIn(1);
        sub_80F8AA4();
        sub_80F8AEC();
        Rfu.state = 20;
        gTasks[taskId].data[1] = 8;
        Rfu.parent_child = MODE_PARENT;
        CreateTask(sub_80FA834, 5);
        Rfu.foundNewLeaderMaybe = TRUE;
        DestroyTask(taskId);
        break;
    }
}

void LinkRfu_CreateConnectionAsParent(void)
{
    rfu_LMAN_establishConnection(MODE_PARENT, 0, 240, (u16*)sAcceptedSerialNos);
}

void LinkRfu_StopManagerBeforeEnteringChat(void)
{
    rfu_LMAN_stopManager(FALSE);
}

static void MscCallback_Child(u16 unused)
{
    s32 i;

    for (i = 0; i < BACKUP_QUEUE_SLOT_LENGTH; i++)
    {
        Rfu.lastCmdBeforeCommInterrupt[i] = 0;
    }
    rfu_REQ_recvData();
    rfu_waitREQComplete();
    if (gRfuSlotStatusUNI[Rfu.child_slot]->recv.newDataFlag)
    {
        Rfu.sem_UNI_SendRecv++;
        RfuRecvQueue_Enqueue(&Rfu.recvQueue, Rfu.unk_c3f);
        sRfuDebug.unk_06++;
        UpdateBackupQueue();
        rfu_UNI_readySendData(Rfu.child_slot);
        rfu_UNI_clearRecvNewDataFlag(Rfu.child_slot);
    }
    rfu_LMAN_REQ_sendData(TRUE);
}

static void MSCCallback_SetUnkCDB(u16 unused)
{
    Rfu.unk_cdb = TRUE;
}

void LinkRfu_Shutdown(void)
{
    u8 i;

    if (QL_IS_PLAYBACK_STATE)
        return;

    rfu_LMAN_powerDownRFU();
    if (Rfu.parent_child == MODE_PARENT)
    {
        if (FuncIsActiveTask(Task_LinkLeaderSearchForChildren) == TRUE)
        {
            DestroyTask(Rfu.searchTaskId);
            ResetLinkRfuGFLayer();
        }
    }
    else if (Rfu.parent_child == MODE_CHILD)
    {
        if (FuncIsActiveTask(Task_JoinGroupSearchForParent) == TRUE)
        {
            DestroyTask(Rfu.searchTaskId);
            ResetLinkRfuGFLayer();
        }
    }
    else if (Rfu.parent_child == 2)
    {
        if (FuncIsActiveTask(Task_LinkRfu_UnionRoomListen) == TRUE)
        {
            DestroyTask(Rfu.searchTaskId);
            ResetLinkRfuGFLayer();
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

static void CreateTask_LinkLeaderSearchForChildren(void)
{
    if (QL_IS_PLAYBACK_STATE)
        return;
    Rfu.searchTaskId = CreateTask(Task_LinkLeaderSearchForChildren, 1);
}

static bool8 ContactedByParentAttemptingToReconnect(void)
{
    if (Rfu.state == 7 && Rfu.parentId)
    {
        return TRUE;
    }
    return FALSE;
}

static bool32 IsParentSuccessfullyReconnected(void)
{
    if (Rfu.state == 7 && !rfu_LMAN_CHILD_connectParent(gRfuLinkStatus->partner[Rfu.reconnectedParentIdx].id, 240))
    {
        Rfu.state = 9;
        return TRUE;
    }
    return FALSE;
}

static void CreateTask_JoinGroupSearchForParent(void)
{
    if (QL_IS_PLAYBACK_STATE)
        return;
    Rfu.searchTaskId = CreateTask(Task_JoinGroupSearchForParent, 1);
}

bool8 LmanAcceptSlotFlagIsNotZero(void)
{
    if (lman.acceptSlot_flag)
    {
        return TRUE;
    }
    return FALSE;
}

void LinkRfu_StopManagerAndFinalizeSlots(void)
{
    Rfu.state = 4;
    Rfu.acceptSlot_flag = lman.acceptSlot_flag;
}

bool32 WaitRfuState(bool32 force)
{
    if (Rfu.state == 17 || force)
    {
        Rfu.state = 18;
        return TRUE;
    }
    return FALSE;
}

void sub_80F8FA0(void)
{
    Rfu.state = 14;
}

UNUSED
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

static void MoveRecvCmdsToRfuBuffer(void)
{
    s32 i, j;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        GF_RFU_MANAGER *ptr = &Rfu;
        for (j = 0; j < CMD_LENGTH - 1; j++)
        {
            ptr->recvCmds[i][j][1] = gRecvCmds[i][j] >> 8;
            ptr->recvCmds[i][j][0] = gRecvCmds[i][j];
        }
    }
    CpuFill16(0, gRecvCmds, sizeof gRecvCmds);
}

static void MoveSendCmdToFirstRecvCmd(void)
{
    s32 i;
    for (i = 0; i < CMD_LENGTH - 1; i++)
    {
        gRecvCmds[0][i] = gSendCmd[i];
    }
    for (i = 0; i < CMD_LENGTH - 1; i++)
    {
        gSendCmd[i] = 0;
    }
}

static void UpdateBackupQueue(void)
{
    if (Rfu.linkRecovered)
    {
        bool8 backupEmpty = RfuBackupQueue_Dequeue(&Rfu.backupQueue, Rfu.lastCmdBeforeCommInterrupt);
        if (Rfu.backupQueue.count == 0)
        {
            Rfu.linkRecovered = FALSE;
        }
        if (backupEmpty)
        {
            return;
        }
    }
    if (!Rfu.linkRecovered)
    {
        RfuSendQueue_Dequeue(&Rfu.sendQueue, Rfu.lastCmdBeforeCommInterrupt);
        RfuBackupQueue_Enqueue(&Rfu.backupQueue, Rfu.lastCmdBeforeCommInterrupt);
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
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        for (j = 0; j < CMD_LENGTH - 1; j++)
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
    if (Rfu.state < 20)
    {
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        rfu_LMAN_REQ_sendData(FALSE);
    }
    else
    {
        Rfu.unk_cdb = FALSE;
        if ((Rfu.bm_PartnerFlags & gRfuLinkStatus->connSlotFlag) == Rfu.bm_PartnerFlags && (Rfu.bm_PartnerFlags & gRfuLinkStatus->connSlotFlag))
        {
            if (!Rfu.unk_cdc)
            {
                if (Rfu.bm_DisconnectSlot)
                {
                    RfuReqDisconnectSlot(Rfu.bm_DisconnectSlot);
                    Rfu.bm_DisconnectSlot = 0;
                    if (Rfu.unk_ce4 == 1)
                    {
                        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x8000);
                        GetLinkmanErrorParams(0x8000);
                        return FALSE;
                    }
                    if (!lman.acceptSlot_flag)
                    {
                        LinkRfu_Shutdown();
                        gReceivedRemoteLinkPlayers = FALSE;
                        return FALSE;
                    }
                }
                MoveRecvCmdsToRfuBuffer();
                rfu_UNI_readySendData(Rfu.unk_cda);
                rfu_LMAN_REQ_sendData(TRUE);
            }
            else
            {
                rfu_REQ_PARENT_resumeRetransmitAndChange();
            }
            Rfu.unk_0e = TRUE;
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

    if (Rfu.state >= 20 && Rfu.unk_0e == TRUE)
    {
        rfu_waitREQComplete();
        while (!Rfu.unk_cdb)
        {
            if (Rfu.errorState != 0)
            {
                return FALSE;
            }
        }
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        if ((lman.parentAck_flag & Rfu.bm_PartnerFlags) == Rfu.bm_PartnerFlags)
        {
            Rfu.unk_cdc = 0;
            sRfuDebug.unk_06++;
            flags = lman.acceptSlot_flag;
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if (flags & 1)
                {
                    if (Rfu.main_UNI_recvBuffer[i][1])
                    {
                        if (Rfu.unk_cee[i] != 0xFF && (Rfu.main_UNI_recvBuffer[i][0] >> 5) != ((Rfu.unk_cee[i] + 1) & 7))
                        {
                            if (++Rfu.unk_cea[i] > 4)
                                GetLinkmanErrorParams(0x8100);
                        }
                        else
                        {
                            Rfu.unk_cee[i] = Rfu.main_UNI_recvBuffer[i][0] / 32;
                            Rfu.unk_cea[i] = 0;
                            Rfu.main_UNI_recvBuffer[i][0] &= 0x1f;
                            r0 = Rfu.linkPlayerIdx[i];
                            for (j = 0; j < 7; j++)
                            {
                                gRecvCmds[r0][j] = (Rfu.main_UNI_recvBuffer[i][(j << 1) + 1] << 8) | Rfu.main_UNI_recvBuffer[i][(j << 1) + 0];
                                Rfu.main_UNI_recvBuffer[i][(j << 1) + 1] = 0;
                                Rfu.main_UNI_recvBuffer[i][(j << 1) + 0] = 0;
                            }
                        }
                    }
                    rfu_UNI_clearRecvNewDataFlag(i);
                }
                flags >>= 1;
            }
            MoveSendCmdToFirstRecvCmd();
            RfuHandleReceiveCommand(0);
            CallRfuFunc();
            if (Rfu.bmChatLeaderMaybe && !Rfu.linkClosing)
            {
                sRfuDebug.unk_0e = FALSE;
                rfu_clearSlot(TYPE_UNI_SEND | TYPE_UNI_RECV, Rfu.unk_cda);
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((Rfu.bmChatLeaderMaybe >> i) & 1)
                    {
                        rfu_setRecvBuffer(TYPE_UNI, i, Rfu.main_UNI_recvBuffer[i], sizeof(Rfu.main_UNI_recvBuffer[i]));
                    }
                }
                ReassignPartnerIds(Rfu.bm_PartnerFlags, Rfu.bm_PartnerFlags | Rfu.bmChatLeaderMaybe);
                Rfu.unk_ce9 = Rfu.bmChatLeaderMaybe;
                Rfu.bm_PartnerFlags |= Rfu.bmChatLeaderMaybe;
                Rfu.bmChatLeaderMaybe = 0;
                rfu_UNI_setSendData(Rfu.bm_PartnerFlags, Rfu.recvCmds, sizeof(Rfu.recvCmds));
                Rfu.unk_cda = CountTrailingZeroes(Rfu.bm_PartnerFlags);
                CreateTask(Task_ExchangeLinkPlayers, 0);
            }
        }
        else
        {
            Rfu.unk_cdc = 1;
            Rfu.unk_0e = FALSE;
        }
        Rfu.unk_0e = FALSE;
    }
    retval = Rfu.unk_cdc;
    return gRfuLinkStatus->sendSlotUNIFlag ? retval & 1 : FALSE;
}

static void RfuBufferSendCmd(u16 *sendCmd, u8 *rfuSendBuf)
{
    s32 i;

    if (sendCmd[0])
    {
        sendCmd[0] |= (Rfu.unk_102 << 5);
        Rfu.unk_102 = (Rfu.unk_102 + 1) & 7;
        for (i = 0; i < 7; i++)
        {
            rfuSendBuf[2 * i + 1] = sendCmd[i] >> 8;
            rfuSendBuf[2 * i + 0] = sendCmd[i];
        }
    }
    else
    {
        for (i = 0; i < 14; i++)
            rfuSendBuf[i] = 0;
    }
}

static bool32 RfuProcessEnqueuedRecvBlock(void)
{
    u8 i;
    u8 j;
    u8 recvBuf[MAX_RFU_PLAYERS * (2 * (CMD_LENGTH - 1))];
    u8 sendBuf[2 * (CMD_LENGTH - 1)];
    u8 status;

    RfuRecvQueue_Dequeue(&Rfu.recvQueue, recvBuf);
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        for (j = 0; j < CMD_LENGTH - 1; j++)
        {
            gRecvCmds[i][j] = (recvBuf[i * 14 + (j << 1) + 1] << 8) | recvBuf[i * 14 + (j << 1) + 0];
        }
    }
    RfuHandleReceiveCommand(0);
    if (lman.childClockSlave_flag == 0 && Rfu.unk_ce4)
    {
        rfu_REQ_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
        rfu_waitREQComplete();
        status = RfuGetStatus();
        if (status != RFU_STATUS_FATAL_ERROR
         && status != RFU_STATUS_JOIN_GROUP_NO
         && status != RFU_STATUS_LEAVE_GROUP)
            RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x9000);
        rfu_clearAllSlot();
        gReceivedRemoteLinkPlayers = FALSE;
        Rfu.RfuFunc = NULL;
        if (Rfu.unk_ce4 == 1)
        {
            RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x9000);
            GetLinkmanErrorParams(0x9000);
        }
        lman.state = lman.next_state = 0;
        Rfu.unk_ce4 = 0;
    }
    if (Rfu.sem_UNI_SendRecv)
    {
        Rfu.sem_UNI_SendRecv--;
        CallRfuFunc();
        RfuBufferSendCmd(gSendCmd, sendBuf);
        RfuSendQueue_Enqueue(&Rfu.sendQueue, sendBuf);
        for (i = 0; i < CMD_LENGTH - 1; i++)
            gSendCmd[i] = 0;
    }
    return IsRfuRecvQueueEmpty();
}

static void HandleSendFailure(u8 unused, u32 flags)
{
    s32 i, j, temp;

    const u8 *payload = Rfu.sendBlock.payload;
    for (i = 0; i < Rfu.sendBlock.count; i++)
    {
        if (!(flags & 1))
        {
            sResendBlock16[0] = RFUCMD_SEND_BLOCK_STEP | i;
            for (j = 0; j < 7; j++)
            {
                temp = j << 1;
                sResendBlock16[j + 1] = (payload[12 * i + temp + 1] << 8) | payload[12 * i + temp + 0];
            }
            for (j = 0; j < 7; j++)
            {
                temp = j << 1;
                sResendBlock8[temp + 1] = sResendBlock16[j] >> 8;
                sResendBlock8[temp + 0] = sResendBlock16[j];
            }
            RfuSendQueue_Enqueue(&Rfu.sendQueue, sResendBlock8);
            Rfu.sendBlock.failedFlags |= (1 << i);
        }
        flags >>= 1;
    }
}

void Rfu_SetBlockReceivedFlag(u8 linkPlayerId)
{
    if (Rfu.parent_child == MODE_PARENT && linkPlayerId != 0)
        Rfu.numBlocksReceived[linkPlayerId] = 1;
    else
        Rfu.blockReceived[linkPlayerId] = TRUE;
}

void Rfu_ResetBlockReceivedFlag(u8 linkPlayerId)
{
    Rfu.blockReceived[linkPlayerId] = FALSE;
    Rfu.recvBlock[linkPlayerId].receiving = RFU_RECV_IDLE;
}

static u8 RfuChildSetReceivedPlayerOrder(const u8 *template)
{
    u8 i;

    if (Rfu.parent_child == MODE_PARENT)
        return FALSE;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        Rfu.linkPlayerIdx[i] = template[i];
    }
    return template[Rfu.child_slot];
}

static void RfuFunc_SendKeysToRfu(void)
{
    static u8 heldKeyCount;
    if (gReceivedRemoteLinkPlayers
        && gHeldKeyCodeToSend != LINK_KEY_CODE_NULL
        && gLinkTransferringData != TRUE)
    {
        heldKeyCount++;
        gHeldKeyCodeToSend |= (heldKeyCount << 8);
        RfuPrepareSendBuffer(RFUCMD_SEND_HELD_KEYS);
    }
}

struct GFtgtGname *GetHostRFUtgtGname(void)
{
    return &gHostRFUtgtGnameBuffer;
}

bool32 IsSendingKeysToRfu(void)
{
    return Rfu.RfuFunc == RfuFunc_SendKeysToRfu;
}

void StartSendingKeysToRfu(void)
{
    AGB_ASSERT_EX(Rfu.RfuFunc == NULL, ABSPATH("rfu.c"), 1473);
    Rfu.RfuFunc = RfuFunc_SendKeysToRfu;
}

void ClearLinkRfuCallback(void)
{
    Rfu.RfuFunc = NULL;
}

static void RfuHandleReceiveCommand(u8 unused)
{
    u16 i;
    u16 j;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        switch (gRecvCmds[i][0] & 0xff00)
        {
        case RFUCMD_PLAYERS_LIST_2:
            if (Rfu.parent_child == MODE_CHILD && gReceivedRemoteLinkPlayers)
                return;
            // fallthrough
        case RFUCMD_PLAYERS_LIST:
            if (gRfuLinkStatus->parentChild == MODE_CHILD)
            {
                Rfu.playerCount = gRecvCmds[i][1];
                Rfu.multiplayerId = RfuChildSetReceivedPlayerOrder((u8 *)(gRecvCmds[i] + 2));
            }
            break;
        case RFUCMD_SEND_BLOCK_INIT:
            if (Rfu.recvBlock[i].receiving == RFU_RECV_IDLE)
            {
                Rfu.recvBlock[i].next = 0;
                Rfu.recvBlock[i].count = gRecvCmds[i][1];
                Rfu.recvBlock[i].owner = gRecvCmds[i][2];
                Rfu.recvBlock[i].receivedFlags = 0;
                Rfu.recvBlock[i].receiving = RFU_RECV_RECEIVING;
                Rfu.blockReceived[i] = FALSE;
            }
            break;
        case RFUCMD_SEND_BLOCK_STEP:
            if (Rfu.recvBlock[i].receiving == RFU_RECV_RECEIVING)
            {
                Rfu.recvBlock[i].next = gRecvCmds[i][0] & 0xff;
                Rfu.recvBlock[i].receivedFlags |= (1 << Rfu.recvBlock[i].next);
                for (j = 0; j < 6; j++)
                    gBlockRecvBuffer[i][Rfu.recvBlock[i].next * 6 + j] = gRecvCmds[i][j + 1];
                if (Rfu.recvBlock[i].receivedFlags == sAllBlocksReceived[Rfu.recvBlock[i].count])
                {
                    Rfu.recvBlock[i].receiving = RFU_RECV_FINISHED;
                    Rfu_SetBlockReceivedFlag(i);
                    if (GetHostRFUtgtGname()->activity == (ACTIVITY_CHAT | IN_UNION_ROOM) && gReceivedRemoteLinkPlayers && Rfu.parent_child == MODE_CHILD)
                        ValidateAndReceivePokemonSioInfo(gBlockRecvBuffer);
                }
            }
            break;
        case RFUCMD_SEND_BLOCK_REQ:
            Rfu_InitBlockSend(sBlockRequests[gRecvCmds[i][1]].address, (u16)sBlockRequests[gRecvCmds[i][1]].size);
            break;
        case RFUCMD_READY_CLOSE_LINK:
            Rfu.readyCloseLink[i] = TRUE;
            break;
        case RFUCMD_READY_EXIT_STANDBY:
            if (Rfu.resendExitStandbyCount == gRecvCmds[i][1])
                Rfu.readyExitStandby[i] = TRUE;
            break;
        case RFUCMD_PARENT_DISCONNECT:
            if (Rfu.parent_child == MODE_CHILD)
            {
                if (gReceivedRemoteLinkPlayers)
                {
                    if (gRecvCmds[i][1] & gRfuLinkStatus->connSlotFlag)
                    {
                        gReceivedRemoteLinkPlayers = FALSE;
                        rfu_LMAN_requestChangeAgbClockMaster();
                        Rfu.unk_ce4 = gRecvCmds[i][2];
                    }
                    Rfu.playerCount = gRecvCmds[i][3];
                    ClearSelectedLinkPlayerIds(gRecvCmds[i][1]);
                }
            }
            else
            {
                RfuPrepareSendBuffer(RFUCMD_CHILD_DISCONNECT);
                gSendCmd[1] = gRecvCmds[i][1];
                gSendCmd[2] = gRecvCmds[i][2];
                gSendCmd[3] = gRecvCmds[i][3];
            }
            break;
        case RFUCMD_CHILD_DISCONNECT:
            if (Rfu.parent_child == MODE_PARENT)
            {
                Rfu.bm_DisconnectSlot |= gRecvCmds[i][1];
                Rfu.unk_ce4 = gRecvCmds[i][2];
                ClearSelectedLinkPlayerIds(gRecvCmds[i][1]);
            }
            break;
        case RFUCMD_SEND_HELD_KEYS:
            gLinkPartnersHeldKeys[i] = gRecvCmds[i][1];
            break;
        }
        if (Rfu.parent_child == MODE_PARENT && Rfu.numBlocksReceived[i])
        {
            if (Rfu.numBlocksReceived[i] == 4)
            {
                Rfu.blockReceived[i] = TRUE;
                Rfu.numBlocksReceived[i] = 0;
            }
            else
                Rfu.numBlocksReceived[i]++;
        }
    }
}

static bool8 AreNoPlayersReceiving(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        if (Rfu.recvBlock[i].receiving != RFU_RECV_IDLE)
            return FALSE;
    }
    return TRUE;
}

static bool8 AreAllPlayersFinishedReceiving(void)
{
    s32 i;

    for (i = 0; i < Rfu.playerCount; i++)
    {
        if (Rfu.recvBlock[i].receiving != RFU_RECV_FINISHED || Rfu.blockReceived[i] != TRUE)
            return FALSE;
    }
    return TRUE;
}

static void ResetSendDataManager(struct RfuBlockSend *data)
{
    data->next = 0;
    data->count = 0;
    data->payload = NULL;
    data->receivedFlags = 0;
    data->sending = 0;
    data->owner = 0;
    data->receiving = RFU_RECV_IDLE;
}

u8 Rfu_GetBlockReceivedStatus(void)
{
    u8 flags = 0;
    s32 i;

    for (i = 0; i < 5; i++)
    {
        if (Rfu.recvBlock[i].receiving == RFU_RECV_FINISHED && Rfu.blockReceived[i] == TRUE)
        {
            flags |= (1 << i);
        }
    }
    return flags;
}

static void RfuPrepareSendBuffer(u16 command)
{
    u8 i;
    u8 *buff;
    u8 tmp;

    gSendCmd[0] = command;
    switch (command)
    {
    case RFUCMD_SEND_BLOCK_INIT:
        gSendCmd[1] = Rfu.sendBlock.count;
        gSendCmd[2] = Rfu.sendBlock.owner + 0x80;
        break;
    case RFUCMD_SEND_BLOCK_REQ:
        if (AreNoPlayersReceiving())
            gSendCmd[1] = Rfu.cmdA100_blockRequestType;
        break;
    case RFUCMD_PLAYERS_LIST:
    case RFUCMD_PLAYERS_LIST_2:
        tmp = Rfu.bm_PartnerFlags ^ Rfu.bm_DisconnectSlot;
        Rfu.playerCount = sNumSetBits[tmp] + 1;
        gSendCmd[1] = Rfu.playerCount;
        buff = (u8 *)(gSendCmd + 2);
        for (i = 0; i < RFU_CHILD_MAX; i++)
            buff[i] = Rfu.linkPlayerIdx[i];
        break;
    case RFUCMD_READY_EXIT_STANDBY:
    case RFUCMD_READY_CLOSE_LINK:
        gSendCmd[1] = Rfu.resendExitStandbyCount;
        break;
    case RFUCMD_SEND_PACKET:
        for (i = 0; i < 6; i++)
            gSendCmd[1 + i] = Rfu.packet[i];
        break;
    case RFUCMD_SEND_HELD_KEYS:
        gSendCmd[1] = gHeldKeyCodeToSend;
        break;
    case RFUCMD_CHILD_DISCONNECT:
        break;
    case RFUCMD_PARENT_DISCONNECT:
        break;
    }
}

void Rfu_SendPacket(void * data)
{
    if (IsSendCmdComplete() && !RfuHasErrored())
    {
        memcpy(Rfu.packet, data, sizeof(Rfu.packet));
        RfuPrepareSendBuffer(RFUCMD_SEND_PACKET);
    }
}

bool32 Rfu_InitBlockSend(const u8 *src, size_t size)
{
    bool8 sizeHasModulo;
    AGB_ASSERT_EX(size<=252, ABSPATH("rfu.c"), 1793);
    if (Rfu.RfuFunc != NULL)
        return FALSE;
    if (gSendCmd[0] != 0)
        return FALSE;
    if (Rfu.sendBlock.sending != 0)
    {
        sRfuDebug.unk_83++;
        return FALSE;
    }
    sizeHasModulo = (size % 12) != 0;
    Rfu.sendBlock.owner = GetMultiplayerId();
    Rfu.sendBlock.sending = 1;
    Rfu.sendBlock.count = (size / 12) + sizeHasModulo;
    Rfu.sendBlock.next = 0;
    if (size > 0x100) // should never be reached
        Rfu.sendBlock.payload = src;
    else
    {
        if (src != gBlockSendBuffer)
            memcpy(gBlockSendBuffer, src, size);
        Rfu.sendBlock.payload = gBlockSendBuffer;
    }
    RfuPrepareSendBuffer(RFUCMD_SEND_BLOCK_INIT);
    Rfu.RfuFunc = HandleBlockSend;
    Rfu.sendBlockInitDelay = 0;
    return TRUE;
}

static void HandleBlockSend(void)
{
    if (IsSendCmdComplete())
    {
        RfuPrepareSendBuffer(RFUCMD_SEND_BLOCK_INIT);
        if (Rfu.parent_child == MODE_PARENT)
        {
            if (++Rfu.sendBlockInitDelay > 2)
                Rfu.RfuFunc = SendNextBlock;
        }
        else
        {
            if ((gRecvCmds[GetMultiplayerId()][0] & 0xff00) == RFUCMD_SEND_BLOCK_INIT)
                Rfu.RfuFunc = SendNextBlock;
        }
    }
}
static void SendNextBlock(void)
{
    s32 i;
    const u8 *src = Rfu.sendBlock.payload;
    gSendCmd[0] = RFUCMD_SEND_BLOCK_STEP | Rfu.sendBlock.next;
    for (i = 0; i < 7; i++)
        gSendCmd[i + 1] = (src[(i << 1) + Rfu.sendBlock.next * 12 + 1] << 8) | src[(i << 1) + Rfu.sendBlock.next * 12 + 0];
    Rfu.sendBlock.next++;
    if (Rfu.sendBlock.count <= Rfu.sendBlock.next)
    {
        Rfu.sendBlock.sending = 0;
        Rfu.RfuFunc = SendLastBlock;
    }
}

static void SendLastBlock(void)
{
    const u8 *src = Rfu.sendBlock.payload;
    u8 mpId = GetMultiplayerId();
    s32 i;
    if (Rfu.parent_child == MODE_CHILD)
    {
        gSendCmd[0] = RFUCMD_SEND_BLOCK_STEP | (Rfu.sendBlock.count - 1);
        for (i = 0; i < 7; i++)
            gSendCmd[i + 1] = (src[(i << 1) + (Rfu.sendBlock.count - 1) * 12 + 1] << 8) | src[(i << 1) + (Rfu.sendBlock.count - 1) * 12 + 0];
        if ((u8)gRecvCmds[mpId][0] == Rfu.sendBlock.count - 1)
        {
            if (Rfu.recvBlock[mpId].receivedFlags != sAllBlocksReceived[Rfu.recvBlock[mpId].count])
            {
                HandleSendFailure(mpId, Rfu.recvBlock[mpId].receivedFlags);
                sRfuDebug.unk_64++;
            }
            else
                Rfu.RfuFunc = NULL;
        }
    }
    else
        Rfu.RfuFunc = NULL;
}

bool8 Rfu_SendBlockRequest(u8 blockRequestType)
{
    Rfu.cmdA100_blockRequestType = blockRequestType;
    RfuPrepareSendBuffer(RFUCMD_SEND_BLOCK_REQ);
    return TRUE;
}

static void OnDisconnect_PowerDownRfu(void)
{
    rfu_clearAllSlot();
    rfu_LMAN_powerDownRFU();
    gReceivedRemoteLinkPlayers = FALSE;
    Rfu.isShuttingDown = TRUE;
    Rfu.RfuFunc = NULL;
}

static void DisconnectRfu(void)
{
    rfu_REQ_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
    rfu_waitREQComplete();
    OnDisconnect_PowerDownRfu();
}

static void TryDisconnectRfu(void)
{
    if (Rfu.parent_child == MODE_CHILD)
    {
        rfu_LMAN_requestChangeAgbClockMaster();
        Rfu.unk_ce4 = 2;
    }
    else
        Rfu.RfuFunc = DisconnectRfu;
}

void LinkRfu_FatalError(void)
{
    rfu_LMAN_requestChangeAgbClockMaster();
    Rfu.unk_ce4 = 1;
    Rfu.bm_DisconnectSlot = gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag;
}

// RFU equivalent of LinkCB_WaitCloseLink
static void WaitAllReadyToCloseLink(void)
{
    s32 i;
    u8 playerCount = Rfu.playerCount;
    s32 count = 0;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        if (Rfu.readyCloseLink[i])
            count++;
    }
    if (count == playerCount)
    {
        gBattleTypeFlags &= ~(BATTLE_TYPE_LINK_IN_BATTLE | 0xFFFF0000);
        if (Rfu.parent_child == MODE_CHILD)
        {
            Rfu.errorState = 3;
            TryDisconnectRfu();
        }
        else
            Rfu.RfuFunc = TryDisconnectRfu;
    }
}

static void SendReadyCloseLink(void)
{
    if (IsSendCmdComplete() && !Rfu.foundNewLeaderMaybe)
    {
        RfuPrepareSendBuffer(RFUCMD_READY_CLOSE_LINK);
        Rfu.RfuFunc = WaitAllReadyToCloseLink;
    }
}

static void Task_TryReadyCloseLink(u8 taskId)
{
    if (Rfu.RfuFunc == NULL)
    {
        Rfu.linkClosing = TRUE;
        Rfu.RfuFunc = SendReadyCloseLink;
        DestroyTask(taskId);
    }
}

void Rfu_SetCloseLinkCallback(void)
{
    if (!FuncIsActiveTask(Task_TryReadyCloseLink))
        CreateTask(Task_TryReadyCloseLink, 5);
}

static void SendReadyExitStandbyUntilAllReady(void)
{
    u8 playerCount;
    u8 i;

    if (GetMultiplayerId() != 0) // child
    {
        if (Rfu.recvQueue.count == 0 && Rfu.resendExitStandbyTimer > 60)
        {
            RfuPrepareSendBuffer(RFUCMD_READY_EXIT_STANDBY);
            Rfu.resendExitStandbyTimer = 0;
        }
    }
    playerCount = GetLinkPlayerCount();
    for (i = 0; i < playerCount; i++)
    {
        if (Rfu.readyExitStandby[i] == 0)
            break;
    }
    if (i == playerCount)
    {
        for (i = 0; i < MAX_RFU_PLAYERS; i++)
            Rfu.readyExitStandby[i] = 0;
        Rfu.resendExitStandbyCount++;
        Rfu.RfuFunc = NULL;
    }
    Rfu.resendExitStandbyTimer++;
}

static void LinkLeaderReadyToExitStandby(void)
{
    if (Rfu.recvQueue.count == 0 && IsSendCmdComplete())
    {
        RfuPrepareSendBuffer(RFUCMD_READY_EXIT_STANDBY);
        Rfu.RfuFunc = SendReadyExitStandbyUntilAllReady;
    }
}

// RFU equivalent of LinkCB_Standby and LinkCB_StandbyForAll
static void Rfu_LinkStandby(void)
{
    u8 i;
    u8 playerCount;

    if (GetMultiplayerId() != 0) // child
    {
        if (Rfu.recvQueue.count == 0 && IsSendCmdComplete())
        {
            RfuPrepareSendBuffer(RFUCMD_READY_EXIT_STANDBY);
            Rfu.RfuFunc = SendReadyExitStandbyUntilAllReady;
        }
    }
    else // parent
    {
        playerCount = GetLinkPlayerCount();
        for (i = 1; i < playerCount; i++)
        {
            if (Rfu.readyExitStandby[i] == 0)
                break;
        }
        if (i == playerCount)
        {
            if (Rfu.recvQueue.count == 0 && IsSendCmdComplete())
            {
                RfuPrepareSendBuffer(RFUCMD_READY_EXIT_STANDBY);
                Rfu.RfuFunc = LinkLeaderReadyToExitStandby;
            }
        }
    }
}

void Rfu_SetLinkStandbyCallback(void)
{
    if (Rfu.RfuFunc == NULL)
    {
        Rfu.RfuFunc = Rfu_LinkStandby;
        Rfu.resendExitStandbyTimer = 0;
    }
}

bool32 IsRfuSerialNumberValid(u32 serialNo)
{
    s32 i;
    for (i = 0; sAcceptedSerialNos[i] != serialNo; i++)
    {
        if (sAcceptedSerialNos[i] == 0xFFFF)
            return FALSE;
    }
    return TRUE;
}

u8 ToggleLMANlinkRecovery(bool32 enable)
{
    if (!enable)
        return rfu_LMAN_setLinkRecovery(FALSE, 0);
    rfu_LMAN_setLinkRecovery(TRUE, 600);
    return 0;
}

void Rfu_UnionRoomChat_StopLinkManager(void)
{
    Rfu.linkClosing = TRUE;
    rfu_LMAN_stopManager(FALSE);
}

u8 LinkRfu_GetMultiplayerId(void)
{
    if (Rfu.parent_child == MODE_PARENT)
        return 0;
    return Rfu.multiplayerId;
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

static bool8 CheckForLeavingGroupMembers(void)
{
    s32 i;
    bool8 retval = FALSE;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Rfu.partnerSendStatuses[i] < RFU_STATUS_JOIN_GROUP_OK
         || Rfu.partnerSendStatuses[i] > RFU_STATUS_JOIN_GROUP_NO)
        {
            if (gRfuSlotStatusNI[i]->recv.state == SLOT_STATE_RECV_SUCCESS || gRfuSlotStatusNI[i]->recv.state == SLOT_STATE_RECV_SUCCESS_AND_SENDSIDE_UNKNOWN)
            {
                if (Rfu.partnerRecvStatuses[i] == RFU_STATUS_LEAVE_GROUP_NOTICE)
                {
                    Rfu.partnerSendStatuses[i] = RFU_STATUS_LEAVE_GROUP;
                    Rfu.partnerRecvStatuses[i] = RFU_STATUS_10;
                    rfu_clearSlot(TYPE_NI_RECV, i);
                    rfu_NI_setSendData(1 << i, 8, &Rfu.partnerSendStatuses[i], 1);
                    retval = TRUE;
                }

            }
            else if (gRfuSlotStatusNI[Rfu.child_slot]->recv.state == SLOT_STATE_RECV_FAILED)
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
        if (Rfu.partnerRecvStatuses[i] == RFU_STATUS_11)
        {
            flags |= (1 << i);
            Rfu.partnerRecvStatuses[i] = RFU_STATUS_OK;
        }
    }
    if (flags)
    {
        rfu_REQ_disconnect(flags);
        rfu_waitREQComplete();
    }
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Rfu.partnerRecvStatuses[i] == RFU_STATUS_10 || Rfu.partnerRecvStatuses[i] == RFU_STATUS_11)
            return TRUE;
    }
    return FALSE;
}

bool32 CheckTrainerHasLeftByIdAndName(u16 trainerId, const u8 *trainerName)
{
    u8 r1 = GetPartnerIndexByNameAndTrainerID(trainerName, trainerId);
    if (r1 == 0xFF)
        return TRUE;
    if (Rfu.partnerSendStatuses[r1] == RFU_STATUS_LEAVE_GROUP)
        return TRUE;
    return FALSE;
}

void SendByteToPartnerByIdAndName(u8 value, u16 trainerId, const u8 *trainerName)
{
    u8 slotNo = GetPartnerIndexByNameAndTrainerID(trainerName, trainerId);
    Rfu.partnerSendStatuses[slotNo] = value;
    rfu_clearSlot(TYPE_NI_SEND, slotNo);
    rfu_NI_setSendData(1 << slotNo, 8, Rfu.partnerSendStatuses + slotNo, 1);
}

void SendLeaveGroupNotice(void)
{
    Rfu.sendStatus = RFU_STATUS_LEAVE_GROUP_NOTICE;
    rfu_clearSlot(TYPE_NI_SEND, Rfu.child_slot);
    rfu_NI_setSendData(1 << Rfu.child_slot, 8, &Rfu.sendStatus, 1);
}

u32 WaitSendByteToPartnerByIdAndName(u16 trainerId, const u8 *trainerName)
{
    u8 r0 = GetPartnerIndexByNameAndTrainerID(trainerName, trainerId);
    if (r0 == 0xFF)
        return 2;
    if (gRfuSlotStatusNI[r0]->send.state == SLOT_STATE_READY)
        return 1;
    return 0;
}

static void UpdateChildStatuses(void)
{
    s32 i;

    CheckForLeavingGroupMembers();
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (gRfuSlotStatusNI[i]->send.state == SLOT_STATE_SEND_SUCCESS || gRfuSlotStatusNI[i]->send.state == SLOT_STATE_SEND_FAILED)
        {
            if (Rfu.partnerRecvStatuses[i] == RFU_STATUS_10)
                Rfu.partnerRecvStatuses[i] = RFU_STATUS_11;
            rfu_clearSlot(TYPE_NI_SEND, i);
        }
    }
}

static s32 GetRfuRecvStatus(void)
{
    s32 retval = RFU_STATUS_OK;
    if (Rfu.sendStatus == RFU_STATUS_LEAVE_GROUP_NOTICE)
    {
        if (gRfuSlotStatusNI[Rfu.child_slot]->send.state == SLOT_STATE_SEND_SUCCESS || gRfuSlotStatusNI[Rfu.child_slot]->send.state == SLOT_STATE_SEND_FAILED)
            rfu_clearSlot(TYPE_NI_SEND, Rfu.child_slot);
    }
    if (gRfuSlotStatusNI[Rfu.child_slot]->recv.state == SLOT_STATE_RECV_SUCCESS || gRfuSlotStatusNI[Rfu.child_slot]->recv.state == SLOT_STATE_RECV_SUCCESS_AND_SENDSIDE_UNKNOWN)
    {
        rfu_clearSlot(TYPE_NI_RECV, Rfu.child_slot);
        RfuSetStatus(Rfu.recvStatus, 0);
        retval = Rfu.recvStatus;
    }
    else if (gRfuSlotStatusNI[Rfu.child_slot]->recv.state == SLOT_STATE_RECV_FAILED)
    {
        rfu_clearSlot(TYPE_NI_RECV, Rfu.child_slot);
        retval = RFU_STATUS_JOIN_GROUP_NO;
    }
    return retval;
}

static void sub_80FA834(u8 taskId)
{
    s32 i;

    if (Rfu.status == RFU_STATUS_FATAL_ERROR || Rfu.status == RFU_STATUS_CONNECTION_ERROR)
    {
        Rfu.foundNewLeaderMaybe = FALSE;
        DestroyTask(taskId);
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (AreNoPlayersReceiving())
        {
            ResetBlockReceivedFlags();
            LocalLinkPlayerToBlock();
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (Rfu.parent_child == MODE_PARENT)
        {
            if (gReceivedRemoteLinkPlayers)
                RfuPrepareSendBuffer(RFUCMD_PLAYERS_LIST_2);
            else
                RfuPrepareSendBuffer(RFUCMD_PLAYERS_LIST);
            gTasks[taskId].data[0] = 101;
        }
        else
            gTasks[taskId].data[0] = 2;
        break;
    case 101:
        if (IsSendCmdComplete())
            gTasks[taskId].data[0] = 2;
        break;
    case 2:
        if (Rfu.playerCount)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (Rfu.parent_child == MODE_PARENT)
        {
            if (AreNoPlayersReceiving())
            {
                Rfu.cmdA100_blockRequestType = 0;
                RfuPrepareSendBuffer(RFUCMD_SEND_BLOCK_REQ);
                gTasks[taskId].data[0]++;
            }
        }
        else
            gTasks[taskId].data[0]++;
        break;
    case 4:
        if (AreAllPlayersFinishedReceiving())
            gTasks[taskId].data[0]++;
        break;
    case 5:
        for (i = 0; i < Rfu.playerCount; i++)
        {
            LinkPlayerFromBlock(i);
            Rfu_ResetBlockReceivedFlag(i);
        }
        gTasks[taskId].data[0]++;
        break;
    case 6:
        DestroyTask(taskId);
        gReceivedRemoteLinkPlayers = TRUE;
        Rfu.foundNewLeaderMaybe = FALSE;
        rfu_LMAN_setLinkRecovery(1, 600);
        if (Rfu.unionRoomChatters)
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if ((Rfu.unionRoomChatters >> i) & 1)
                {
                    Rfu.bmChatLeaderMaybe = 1 << i;
                    Rfu.unionRoomChatters ^= (1 << i);
                }
            }
        }
        break;
    }
}

static void ClearSelectedLinkPlayerIds(u16 disconnectMask)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((disconnectMask >> i) & 1)
            Rfu.linkPlayerIdx[i] = 0;
    }
}

static void ReceiveRfuLinkPlayers(const struct SioInfo *chunk)
{
    s32 i;
    Rfu.playerCount = chunk->playerCount;
    for (i = 0; i < RFU_CHILD_MAX; i++)
        Rfu.linkPlayerIdx[i] = chunk->linkPlayerIdx[i];
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        gLinkPlayers[i] = chunk->linkPlayers[i];
        ConvertLinkPlayerName(gLinkPlayers + i);
    }
}

static void ValidateAndReceivePokemonSioInfo(void *recvBuffer)
{
    if (strcmp("PokemonSioInfo", recvBuffer) == 0)
    {
        ReceiveRfuLinkPlayers(recvBuffer);
        CpuFill16(0, recvBuffer, sizeof(struct SioInfo));
        ResetBlockReceivedFlag(0);
    }
}

static void Task_ExchangeLinkPlayers(u8 taskId)
{
    s32 i;
    struct LinkPlayerBlock *r2;
    struct SioInfo *r5;
    u8 r4 = Rfu.linkPlayerIdx[gUnknown_843EC38[Rfu.unk_ce9]];
    if (Rfu.status == 1 || Rfu.status == 2)
    {
        Rfu.foundNewLeaderMaybe = FALSE;
        DestroyTask(taskId);
    }
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (IsSendCmdComplete())
        {
            ResetBlockReceivedFlag(r4);
            RfuPrepareSendBuffer(RFUCMD_PLAYERS_LIST_2);
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (IsSendCmdComplete())
            gTasks[taskId].data[0]++;
        break;
    case 2:
        if ((GetBlockReceivedStatus() >> r4) & 1)
        {
            ResetBlockReceivedFlag(r4);
            r2 = (struct LinkPlayerBlock *)gBlockRecvBuffer[r4];
            gLinkPlayers[r4] = r2->linkPlayer;
            ConvertLinkPlayerName(gLinkPlayers + r4);
            gTasks[taskId].data[0]++;
        }
        break;
    case 3:
        // Prepare send block
        r5 = (struct SioInfo *)gBlockSendBuffer;
        memcpy(r5->magic, "PokemonSioInfo", sizeof("PokemonSioInfo"));
        r5->playerCount = Rfu.playerCount;
        for (i = 0; i < RFU_CHILD_MAX; i++)
            r5->linkPlayerIdx[i] = Rfu.linkPlayerIdx[i];
        memcpy(r5->linkPlayers, gLinkPlayers, sizeof gLinkPlayers);
        gTasks[taskId].data[0]++;
        // fallthrough
    case 4:
        r5 = (struct SioInfo *)gBlockSendBuffer;
        r5->playerCount = Rfu.playerCount;
        for (i = 0; i < RFU_CHILD_MAX; i++)
            r5->linkPlayerIdx[i] = Rfu.linkPlayerIdx[i];
        memcpy(r5->linkPlayers, gLinkPlayers, sizeof gLinkPlayers);
        if (SendBlock(0, gBlockSendBuffer, 0xa0))
            gTasks[taskId].data[0]++;
        break;
    case 5:
        if (IsLinkTaskFinished() && GetBlockReceivedStatus() & 1)
        {
            CpuFill16(0, gBlockRecvBuffer, sizeof(struct SioInfo));
            ResetBlockReceivedFlag(0);
            Rfu.foundNewLeaderMaybe = FALSE;
            if (Rfu.unionRoomChatters)
            {
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((Rfu.unionRoomChatters >> i) & 1)
                    {
                        Rfu.bmChatLeaderMaybe = 1 << i;
                        Rfu.unionRoomChatters ^= (1 << i);
                        Rfu.foundNewLeaderMaybe = TRUE;
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
    if (Rfu.status == RFU_STATUS_FATAL_ERROR || Rfu.status == RFU_STATUS_CONNECTION_ERROR)
        DestroyTask(taskId);
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (Rfu.playerCount != 0)
        {
            LocalLinkPlayerToBlock();
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
            ReceiveRfuLinkPlayers((const struct SioInfo *)gBlockRecvBuffer);
            ResetBlockReceivedFlag(0);
            gReceivedRemoteLinkPlayers = TRUE;
            DestroyTask(taskId);
        }
        break;
    }
}

static void RfuCheckErrorStatus(void)
{
    if (Rfu.errorState == 1 && lman.childClockSlave_flag == 0)
    {
        if (gMain.callback2 == c2_mystery_gift_e_reader_run)
            gWirelessCommType = 2;
        SetMainCallback2(CB2_LinkError);
        gMain.savedCallback = CB2_LinkError;
        SetLinkErrorFromRfu(
            (Rfu.linkman_msg << 16) | (Rfu.linkman_param[0] << 8) | Rfu.linkman_param[1],
            Rfu.recvQueue.count,
            Rfu.sendQueue.count,
            RfuGetStatus() == RFU_STATUS_CONNECTION_ERROR
        );
        Rfu.errorState = 2;
        CloseLink();
    }
    else if (Rfu.sendQueue.full == TRUE || Rfu.recvQueue.full == TRUE)
    {
        if (lman.childClockSlave_flag)
            rfu_LMAN_requestChangeAgbClockMaster();
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, 0x7000);
        GetLinkmanErrorParams(0x7000);
    }
}

static void rfu_REQ_recvData_then_sendData(void)
{
    if (lman.parent_child == MODE_PARENT)
    {
        rfu_REQ_recvData();
        rfu_waitREQComplete();
        rfu_LMAN_REQ_sendData(RFU_CHILD_CLOCK_SLAVE_OFF);
    }
}

bool32 LinkRfuMain1(void)
{
    bool32 retval = FALSE;
    Rfu.parentId = 0;
    rfu_LMAN_manager_entity(Random());
    if (!Rfu.isShuttingDown)
    {
        switch (Rfu.parent_child)
        {
        case MODE_PARENT:
            sub_80F911C();
            break;
        case MODE_CHILD:
            retval = RfuProcessEnqueuedRecvBlock();
            break;
        case MODE_P_C_SWITCH:
            rfu_REQ_recvData_then_sendData();
            break;
        }
    }
    return retval;
}

bool32 LinkRfuMain2(void)
{
    bool32 retval = FALSE;
    if (!Rfu.isShuttingDown)
    {
        if (Rfu.parent_child == MODE_PARENT)
            retval = sub_80F9204();
        RfuCheckErrorStatus();
    }
    return retval;
}

static void CopyPlayerNameToUnameBuffer(void)
{
    StringCopy(gHostRFUtgtUnameBuffer, gSaveBlock2Ptr->playerName);
}

void ClearAndInitHostRFUtgtGname(void)
{
    memset(&gHostRFUtgtGnameBuffer, 0, RFU_GAME_NAME_LENGTH);
    InitHostRFUtgtGname(&gHostRFUtgtGnameBuffer, ACTIVITY_NONE, FALSE, 0);
}

void SetHostRFUtgtGname(u8 activity, u32 child_sprite_genders, u32 started)
{
    InitHostRFUtgtGname(&gHostRFUtgtGnameBuffer, activity, started, child_sprite_genders);
}

void SetGnameBufferWonderFlags(bool32 hasNews, bool32 hasCard)
{
    gHostRFUtgtGnameBuffer.unk_00.hasNews = hasNews;
    gHostRFUtgtGnameBuffer.unk_00.hasCard = hasCard;
}

void RfuUpdatePlayerGnameStateAndSend(u32 type, u32 species, u32 level)
{
    gHostRFUtgtGnameBuffer.type = type;
    gHostRFUtgtGnameBuffer.species = species;
    gHostRFUtgtGnameBuffer.level = level;
}

void UpdateGameData_GroupLockedIn(bool8 started)
{
    gHostRFUtgtGnameBuffer.started = started;
    rfu_REQ_configGameData(0, 0x0002, (void *)&gHostRFUtgtGnameBuffer, gHostRFUtgtUnameBuffer);
}

void UpdateGameDataWithActivitySpriteGendersFlag(u8 activity, u32 child_sprite_genders, u32 started)
{
    if (activity)
        SetHostRFUtgtGname(activity, child_sprite_genders, started);
    rfu_REQ_configGameData(0, 0x0002, (void *)&gHostRFUtgtGnameBuffer, gHostRFUtgtUnameBuffer);
}

void sub_80FB030(u32 linkPlayerCount)
{
    s32 i;
    u32 numConnectedChildren;
    u32 child_sprite_genders;
    s32 bm_child_slots;

    if (GetHostRFUtgtGname()->activity == (ACTIVITY_CHAT | IN_UNION_ROOM))
    {
        numConnectedChildren = 0;
        child_sprite_genders = 0;
        bm_child_slots = Rfu.bm_PartnerFlags ^ Rfu.bm_DisconnectSlot;
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((bm_child_slots >> i) & 1)
            {
                // The 0x80 prevents this element from being incorrectly read as a 0.
                child_sprite_genders |= ((
                    0x80 | ((gLinkPlayers[Rfu.linkPlayerIdx[i]].gender & 1) << 3) | (gLinkPlayers[Rfu.linkPlayerIdx[i]].trainerId & 7)
                ) << (numConnectedChildren << 3));
                numConnectedChildren++;
                if (numConnectedChildren == linkPlayerCount - 1)
                    break;
            }
        }
        UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_CHAT | IN_UNION_ROOM, child_sprite_genders, 0);
    }
}

static void GetLinkmanErrorParams(u32 msg)
{
    if (Rfu.errorState == 0)
    {
        Rfu.linkman_param[0] = lman.param[0];
        Rfu.linkman_param[1] = lman.param[1];
        Rfu.linkman_msg = msg;
        Rfu.errorState = 1;
    }
}

static void ResetErrorState(void)
{
    Rfu.errorState = 0;
}

void sub_80FB128(bool32 a0)
{
    if (!a0)
        Rfu.errorState = 0;
    else
        Rfu.errorState = 4;
}

static void sub_80FB154(void)
{
    sub_80FBE20(lman.acceptSlot_flag, 1);
    Rfu.RfuFunc = NULL;
}

static void sub_80FB174(void)
{
    Rfu.RfuFunc = sub_80FB154;
}

static void LmanCallback_Parent2(u8 msg, u8 param_count)
{
    u8 i;
    u8 bmDisconnectFlag = 0;
    switch (msg)
    {
    case LMAN_MSG_INITIALIZE_COMPLETED:
        Rfu.state = 2;
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_DETECTED:
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_ACCEPTED:
        sub_80FB564(lman.param[0]);
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((lman.param[0] >> i) & 1)
            {
                struct GFtgtGname *structPtr = (void *)&gRfuLinkStatus->partner[i].gname;
                if (structPtr->activity == GetHostRFUtgtGname()->activity)
                {
                    Rfu.partnerSendStatuses[i] = RFU_STATUS_OK;
                    Rfu.partnerRecvStatuses[i] = RFU_STATUS_OK;
                    rfu_setRecvBuffer(TYPE_NI, i, Rfu.partnerRecvStatuses + i, 1);
                }
                else
                {
                    bmDisconnectFlag |= (1 << i);
                }
            }
        }
        if (bmDisconnectFlag)
        {
            rfu_REQ_disconnect(bmDisconnectFlag);
            rfu_waitREQComplete();
        }
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_REJECTED:
        break;
    case LMAN_MSG_SEARCH_CHILD_PERIOD_EXPIRED:
        break;
    case LMAN_MSG_END_WAIT_CHILD_NAME:
        if (Rfu.acceptSlot_flag != lman.acceptSlot_flag)
        {
            rfu_REQ_disconnect(Rfu.acceptSlot_flag ^ lman.acceptSlot_flag);
            rfu_waitREQComplete();
        }
        Rfu.state = 17;
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_START_RECOVERY:
        Rfu.linkLossRecoveryState = 1;
        break;
    case LMAN_MSG_LINK_RECOVERY_SUCCESSED:
        Rfu.linkLossRecoveryState = 3;
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_DISCONNECTED:
    case LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED:
        Rfu.linkLossRecoveryState = 4;
        Rfu.bm_PartnerFlags &= ~lman.param[0];
        if (gReceivedRemoteLinkPlayers == 1)
        {
            if (Rfu.bm_PartnerFlags == 0)
                GetLinkmanErrorParams(msg);
            else
                sub_80FB174();
        }
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        break;
    case 0x34:
        break;
    case LMAN_MSG_RFU_POWER_DOWN:
    case LMAN_MSG_MANAGER_STOPPED:
    case LMAN_MSG_MANAGER_FORCED_STOPPED_AND_RFU_RESET:
        break;
    case LMAN_MSG_LMAN_API_ERROR_RETURN:
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        GetLinkmanErrorParams(msg);
        Rfu.isShuttingDown = TRUE;
        break;
    case LMAN_MSG_REQ_API_ERROR:
    case LMAN_MSG_WATCH_DOG_TIMER_ERROR:
    case LMAN_MSG_CLOCK_SLAVE_MS_CHANGE_ERROR_BY_DMA:
    case LMAN_MSG_RFU_FATAL_ERROR:
        GetLinkmanErrorParams(msg);
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        Rfu.unk_cdb = TRUE;
        break;
    }
}

static const u8 unref_843EDF3[] = _("　あきと");

static void LmanCallback_Child(u8 msg, u8 param_count)
{
    switch (msg)
    {
    case LMAN_MSG_INITIALIZE_COMPLETED:
        Rfu.state = 6;
        break;
    case LMAN_MSG_PARENT_FOUND:
        Rfu.parentId = lman.param[0];
        break;
    case LMAN_MSG_SEARCH_PARENT_PERIOD_EXPIRED:
        break;
    case LMAN_MSG_CONNECT_PARENT_SUCCESSED:
        Rfu.child_slot = lman.param[0];
        break;
    case LMAN_MSG_CONNECT_PARENT_FAILED:
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        break;
    case LMAN_MSG_CHILD_NAME_SEND_COMPLETED:
        Rfu.state = 11;
        Rfu.sendStatus = RFU_STATUS_OK;
        Rfu.recvStatus = RFU_STATUS_OK;
        rfu_setRecvBuffer(TYPE_NI, Rfu.child_slot, &Rfu.recvStatus, 1);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.child_slot, Rfu.unk_c3f, sizeof(Rfu.unk_c3f));
        break;
    case LMAN_MSG_CHILD_NAME_SEND_FAILED_AND_DISCONNECTED:
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_DISCONNECTED:
        Rfu.linkLossRecoveryState = 2;
        if (Rfu.recvStatus == RFU_STATUS_JOIN_GROUP_NO)
            break;
    case LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED:
        if (Rfu.linkLossRecoveryState != 2)
            Rfu.linkLossRecoveryState = 4;
        if (Rfu.recvStatus != RFU_STATUS_LEAVE_GROUP)
            RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        Debug_PrintString("LINK LOSS DISCONNECT!", 5, 5);
        if (gReceivedRemoteLinkPlayers == 1)
            GetLinkmanErrorParams(msg);
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_START_RECOVERY:
        Rfu.linkLossRecoveryState = 1;
        Debug_PrintString("LINK LOSS RECOVERY NOW", 5, 5);
        break;
    case LMAN_MSG_LINK_RECOVERY_SUCCESSED:
        Rfu.linkLossRecoveryState = 3;
        Rfu.linkRecovered = 1;
        break;
    case 0x34:
        break;
    case LMAN_MSG_RFU_POWER_DOWN:
    case LMAN_MSG_MANAGER_STOPPED:
    case LMAN_MSG_MANAGER_FORCED_STOPPED_AND_RFU_RESET:
        break;
    case LMAN_MSG_LMAN_API_ERROR_RETURN:
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        GetLinkmanErrorParams(msg);
        Rfu.isShuttingDown = TRUE;
        break;
    case LMAN_MSG_REQ_API_ERROR:
    case LMAN_MSG_WATCH_DOG_TIMER_ERROR:
    case LMAN_MSG_CLOCK_SLAVE_MS_CHANGE_ERROR_BY_DMA:
    case LMAN_MSG_RFU_FATAL_ERROR:
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        GetLinkmanErrorParams(msg);
        Rfu.unk_cdb = TRUE;
        break;
    }
}

static void sub_80FB564(s32 bmConnectedFlag)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((bmConnectedFlag >> i) & 1)
        {
            Rfu.unk_cea[i] = 0;
            Rfu.unk_cee[i] = 0xFF;
        }
    }
}

static u8 GetNewChildrenInUnionRoomChat(s32 bmNewChildSlot)
{
    u8 ret = 0;
    u8 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((bmNewChildSlot >> i) & 1)
        {
            struct GFtgtGname *structPtr = (void *)&gRfuLinkStatus->partner[i].gname;
            if (structPtr->activity == (ACTIVITY_CHAT | IN_UNION_ROOM))
                ret |= (1 << i);
        }
    }

    return ret;
}

static void LmanCallback_Parent(u8 msg, u8 param_count)
{
    u8 r1;

    switch (msg)
    {
    case LMAN_MSG_INITIALIZE_COMPLETED:
        Rfu.state = 17;
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_DETECTED:
        RfuSetStatus(RFU_STATUS_NEW_CHILD_DETECTED, 0);
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_ACCEPTED:
        if (GetHostRFUtgtGname()->activity == (ACTIVITY_CHAT | IN_UNION_ROOM) && !Rfu.linkClosing)
        {
            u8 bmAcceptSlot = GetNewChildrenInUnionRoomChat(lman.param[0]);
            if (bmAcceptSlot != 0)
            {
                r1 = 1 << CountTrailingZeroes(bmAcceptSlot);
                if (Rfu.unionRoomChatters == 0 && !Rfu.foundNewLeaderMaybe)
                {
                    Rfu.bmChatLeaderMaybe = r1;
                    Rfu.unionRoomChatters |= (r1 ^ bmAcceptSlot);
                    Rfu.foundNewLeaderMaybe = TRUE;
                }
                else
                {
                    Rfu.unionRoomChatters |= bmAcceptSlot;
                }
            }
            if (bmAcceptSlot != lman.param[0])
            {
                Rfu.bm_DisconnectSlot |= (bmAcceptSlot ^ lman.param[0]);
                Rfu.unk_ce4 = 2;
            }
        }
        else if (GetHostRFUtgtGname()->activity == (ACTIVITY_PLYRTALK | IN_UNION_ROOM))
        {
            rfu_REQ_disconnect(lman.acceptSlot_flag);
            rfu_waitREQComplete();
        }
        sub_80FB564(lman.param[0]);
        break;
    case LMAN_MSG_NEW_CHILD_CONNECT_REJECTED:
        break;
    case LMAN_MSG_SEARCH_CHILD_PERIOD_EXPIRED:
        break;
    case LMAN_MSG_END_WAIT_CHILD_NAME:
        if (GetHostRFUtgtGname()->activity != (ACTIVITY_CHAT | IN_UNION_ROOM) && lman.acceptCount > 1)
        {
            r1 = 1 << CountTrailingZeroes(lman.param[0]);
            rfu_REQ_disconnect(lman.acceptSlot_flag ^ r1);
            rfu_waitREQComplete();
        }
        if (Rfu.state == 15)
            Rfu.state = 16;
        break;
    case LMAN_MSG_PARENT_FOUND:
        Rfu.parentId = lman.param[0];
        break;
    case LMAN_MSG_SEARCH_PARENT_PERIOD_EXPIRED:
        break;
    case LMAN_MSG_CONNECT_PARENT_SUCCESSED:
        Rfu.child_slot = lman.param[0];
        break;
    case LMAN_MSG_CONNECT_PARENT_FAILED:
        Rfu.state = 18;
        if (Rfu.unk_ccf < 2)
        {
            Rfu.unk_ccf++;
            CreateTask(sub_80FC028, 2);
        }
        else
        {
            RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        }
        break;
    case LMAN_MSG_CHILD_NAME_SEND_COMPLETED:
        Rfu.state = 13;
        RfuSetStatus(RFU_STATUS_CHILD_SEND_COMPLETE, 0);
        rfu_setRecvBuffer(TYPE_UNI, Rfu.child_slot, Rfu.unk_c3f, sizeof(Rfu.unk_c3f));
        break;
    case LMAN_MSG_CHILD_NAME_SEND_FAILED_AND_DISCONNECTED:
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_START_RECOVERY:
        if (lman.acceptSlot_flag & lman.param[0])
            Rfu.linkLossRecoveryState = 1;
        break;
    case LMAN_MSG_LINK_RECOVERY_SUCCESSED:
        Rfu.linkLossRecoveryState = 3;
        if (gRfuLinkStatus->parentChild == MODE_CHILD)
            Rfu.linkRecovered = 1;
        break;
    case LMAN_MSG_LINK_LOSS_DETECTED_AND_DISCONNECTED:
        Rfu.linkLossRecoveryState = 2;
        // fallthrough
    case LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED:
        if (Rfu.linkLossRecoveryState != 2)
            Rfu.linkLossRecoveryState = 4;
        if (Rfu.parent_child == MODE_PARENT)
        {
            if (gReceivedRemoteLinkPlayers == 1)
            {
                Rfu.bm_PartnerFlags &= ~(lman.param[0]);
                if (Rfu.bm_PartnerFlags == 0)
                    GetLinkmanErrorParams(msg);
                else
                    sub_80FB174();
            }
        }
        else if (Rfu.unk_ce4 != 2 && gReceivedRemoteLinkPlayers == 1)
        {
            GetLinkmanErrorParams(msg);
            rfu_LMAN_stopManager(0);
        }

        if (gRfuLinkStatus->parentChild == MODE_NEUTRAL && lman.pcswitch_flag == 0 && FuncIsActiveTask(Task_LinkRfu_UnionRoomListen) == TRUE)
            Rfu.state = 17;

        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, msg);
        break;
    case LMAN_MSG_LINK_DISCONNECTED_BY_USER:
        Rfu.bm_DisconnectSlot = 0;
        break;
    case LMAN_MSG_RFU_POWER_DOWN:
    case LMAN_MSG_MANAGER_STOPPED:
    case LMAN_MSG_MANAGER_FORCED_STOPPED_AND_RFU_RESET:
        break;
    case LMAN_MSG_LMAN_API_ERROR_RETURN:
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        GetLinkmanErrorParams(msg);
        Rfu.isShuttingDown = TRUE;
        break;
    case LMAN_MSG_REQ_API_ERROR:
    case LMAN_MSG_WATCH_DOG_TIMER_ERROR:
    case LMAN_MSG_CLOCK_SLAVE_MS_CHANGE_ERROR_BY_DMA:
    case LMAN_MSG_RFU_FATAL_ERROR:
        GetLinkmanErrorParams(msg);
        RfuSetStatus(RFU_STATUS_FATAL_ERROR, msg);
        Rfu.unk_cdb = FALSE;
        break;
    }
}

void sub_80FB9D0(void)
{
    Rfu.unk_ce4 = 2;
}

void RfuSetStatus(u8 status, u16 msg)
{
    Rfu.status = status;
    Rfu.linkman_msg = msg;
}

u8 RfuGetStatus(void)
{
    return Rfu.status;
}

bool32 RfuHasErrored(void)
{
    u32 status = RfuGetStatus();
    if (status == RFU_STATUS_FATAL_ERROR || status == RFU_STATUS_CONNECTION_ERROR)
        return TRUE;
    else
        return FALSE;
}

bool32 RfuHasFoundNewLeader(void)
{
    return Rfu.foundNewLeaderMaybe;
}

bool8 Rfu_IsMaster(void)
{
    return Rfu.parent_child;
}

void RFUVSync(void)
{
    rfu_LMAN_syncVBlank();
}

void ClearRecvCommands(void)
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
        gLinkType = LINKTYPE_TRADE;
        SetWirelessCommType1();
        OpenLink();
        SeedRng(gMain.vblankCounter2);
        for (i = 0; i < RFU_CHILD_MAX; i++)
            gSaveBlock2Ptr->playerTrainerId[i] = Random() % 256;

        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP);
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        LinkRfu_CreateIdleTask();
        SetMainCallback2(sub_80FBB74);
    }
}

bool32 IsUnionRoomListenTaskActive(void)
{
    return FuncIsActiveTask(Task_LinkRfu_UnionRoomListen);
}

void LinkRfu_CreateIdleTask(void)
{
    if (!FuncIsActiveTask(Task_idle))
        Rfu.idleTaskId = CreateTask(Task_idle, 0);
}

void LinkRfu_DestroyIdleTask(void)
{
    if (FuncIsActiveTask(Task_idle) == TRUE)
        DestroyTask(Rfu.idleTaskId);
}

static void sub_80FBB74(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void InitializeRfuLinkManager_LinkLeader(u32 availSlots)
{
    Rfu.parent_child = MODE_PARENT;
    CopyPlayerNameToUnameBuffer();
    rfu_LMAN_initializeManager(LmanCallback_Parent2, NULL);
    sRfuReqConfig = sRfuReqConfigTemplate;
    sRfuReqConfig.availSlot_flag = sAvailSlots[availSlots - 1];
    CreateTask_LinkLeaderSearchForChildren();
}

void InitializeRfuLinkManager_JoinGroup(void)
{
    Rfu.parent_child = MODE_CHILD;
    CopyPlayerNameToUnameBuffer();
    rfu_LMAN_initializeManager(LmanCallback_Child, MscCallback_Child);
    CreateTask_JoinGroupSearchForParent();
}

void InitializeRfuLinkManager_EnterUnionRoom(void)
{
    if (QL_IS_PLAYBACK_STATE)
        return;
    Rfu.parent_child = 2;
    CopyPlayerNameToUnameBuffer();
    rfu_LMAN_initializeManager(LmanCallback_Parent, NULL);
    sRfuReqConfig = sRfuReqConfigTemplate;
    sRfuReqConfig.linkRecovery_enable = 0;
    sRfuReqConfig.linkRecovery_period = 600;
    Rfu.searchTaskId = CreateTask(Task_LinkRfu_UnionRoomListen, 1);
}

static u16 ReadU16(const void *ptr)
{
    const u8 *ptr_ = ptr;
    return (ptr_[1] << 8) | (ptr_[0]);
}

/*
 * ================================================================
 * Looks up the player by uname and pid. Returns the index in
 * gRfuLinkStatus->partner of the first match with a valid slot ID.
 * Returns 0xFF if not found.
 * ================================================================
 */
static u8 GetPartnerIndexByNameAndTrainerID(const u8 *trainerName, u16 trainerId)
{
    u8 i;
    u8 ret = 0xFF;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        u16 partnerTrainerId = ReadU16(((struct GFtgtGname *)gRfuLinkStatus->partner[i].gname)->unk_00.playerTrainerId);
        if (IsRfuSerialNumberValid(gRfuLinkStatus->partner[i].serialNo)
            && !StringCompare(trainerName, gRfuLinkStatus->partner[i].uname)
            && trainerId == partnerTrainerId)
        {
            ret = i;
            if (gRfuLinkStatus->partner[i].slot != 0xFF)
                break;
        }
    }

    return ret;
}

static void RfuReqDisconnectSlot(u32 bmDisconnectSlot)
{
    rfu_REQ_disconnect(bmDisconnectSlot);
    rfu_waitREQComplete();
    Rfu.bm_PartnerFlags &= ~(bmDisconnectSlot);
    rfu_clearSlot(TYPE_UNI_SEND, Rfu.unk_cda);
    rfu_UNI_setSendData(Rfu.bm_PartnerFlags, Rfu.recvCmds, 70);
    Rfu.unk_cda = CountTrailingZeroes(Rfu.bm_PartnerFlags);
}

void RequestDisconnectSlotByTrainerNameAndId(const u8 *trainerName, u16 trainerId)
{
    u8 var = GetPartnerIndexByNameAndTrainerID(trainerName, trainerId);
    if (var != 0xFF)
        RfuReqDisconnectSlot(1 << var);
}

void sub_80FBD6C(u32 a0)
{
    if (a0 != 0)
    {
        s32 i;
        u8 var = 0;

        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (Rfu.linkPlayerIdx[i] == a0 && (Rfu.bm_PartnerFlags >> i) & 1)
                var |= 1 << i;
        }
        if (var)
            sub_80FBE20(var, 2);
    }
}

static void sub_80FBDB8(u8 taskId)
{
    if (IsSendCmdComplete() && !Rfu.foundNewLeaderMaybe)
    {
        RfuPrepareSendBuffer(RFUCMD_PARENT_DISCONNECT);
        gSendCmd[1] = gTasks[taskId].data[0];
        gSendCmd[2] = gTasks[taskId].data[1];
        Rfu.playerCount -= sNumSetBits[gTasks[taskId].data[0]];
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

static void Task_RfuReconnectWithParent(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (ContactedByParentAttemptingToReconnect())
    {
        u8 id = GetPartnerIndexByNameAndTrainerID((u8*)data, ReadU16(&data[8]));
        if (id != 0xFF)
        {
            if (gRfuLinkStatus->partner[id].slot != 0xFF)
            {
                Rfu.reconnectedParentIdx = id;
                if (IsParentSuccessfullyReconnected())
                    DestroyTask(taskId);
            }
            else if (GetHostRFUtgtGname()->activity == ACTIVITY_WCARD2 || GetHostRFUtgtGname()->activity == ACTIVITY_WNEWS2)
            {
                data[15]++;
            }
            else
            {
                RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x7000);
                DestroyTask(taskId);
            }
        }
        else
        {
            data[15]++;
            Rfu.reconnectedParentIdx = id;
        }
    }
    else
    {
        data[15]++;
    }

    if (data[15] > 240)
    {
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x7000);
        DestroyTask(taskId);
    }
}

void CreateTask_RfuReconnectWithParent(const u8 *trainerName, u16 trainerId)
{
    u8 taskId;
    s16 *data;

    Rfu.status = RFU_STATUS_OK;
    taskId = CreateTask(Task_RfuReconnectWithParent, 3);
    data = gTasks[taskId].data;
    StringCopy((u8*)(data), trainerName);
    data[8] = trainerId;
}

static bool32 ShouldRejectPartnerConnectionBasedOnActivity(s16 activity, struct GFtgtGname *partnerGname)
{
    if (GetHostRFUtgtGname()->activity == (ACTIVITY_CHAT | IN_UNION_ROOM))
    {
        if (partnerGname->activity != (ACTIVITY_CHAT | IN_UNION_ROOM))
            return TRUE;
    }
    else if (partnerGname->activity != IN_UNION_ROOM)
    {
        return TRUE;
    }
    else if (activity == (ACTIVITY_TRADE | IN_UNION_ROOM))
    {
        struct GFtgtGname *myTradeGname = (struct GFtgtGname *)&Rfu.tgtData.gname;
        if (myTradeGname->species == SPECIES_EGG)
        {
            if (partnerGname->species == myTradeGname->species)
                return FALSE;
            else
                return TRUE;
        }
        else if (partnerGname->species != myTradeGname->species
                 || partnerGname->level != myTradeGname->level
                 || partnerGname->type != myTradeGname->type)
        {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_80FC028(u8 taskId)
{
    if (Rfu.status == RFU_STATUS_NEW_CHILD_DETECTED)
        DestroyTask(taskId);

    if (++gTasks[taskId].data[0] > 300)
    {
        RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x7000);
        DestroyTask(taskId);
    }

    if (Rfu.parentId != 0 && lman.parent_child == MODE_CHILD)
    {
        u16 trainerId = ReadU16(((struct GFtgtGname *)&Rfu.tgtData.gname)->unk_00.playerTrainerId);
        u8 id = GetPartnerIndexByNameAndTrainerID(Rfu.tgtData.uname, trainerId);
        if (id != 0xFF)
        {
            if (!ShouldRejectPartnerConnectionBasedOnActivity(gTasks[taskId].data[1], (struct GFtgtGname *)&gRfuLinkStatus->partner[id].gname))
            {
                if (gRfuLinkStatus->partner[id].slot != 0xFF && !rfu_LMAN_CHILD_connectParent(gRfuLinkStatus->partner[id].id, 90))
                {
                    Rfu.state = 10;
                    DestroyTask(taskId);
                }
            }
            else
            {
                RfuSetStatus(RFU_STATUS_CONNECTION_ERROR, 0x7000);
                DestroyTask(taskId);
            }
        }
    }
}

void sub_80FC114(const u8 *name, struct GFtgtGname *structPtr, u8 activity)
{
    u8 taskId, taskId2;

    Rfu.unk_ccf = 0;
    Rfu.status = RFU_STATUS_OK;
    StringCopy(Rfu.tgtData.uname, name);
    memcpy(Rfu.tgtData.gname, structPtr, RFU_GAME_NAME_LENGTH);
    rfu_LMAN_forceChangeSP();
    taskId = CreateTask(sub_80FC028, 2);
    gTasks[taskId].data[1] = activity;
    taskId2 = FindTaskIdByFunc(Task_LinkRfu_UnionRoomListen);
    if (activity == (ACTIVITY_CHAT | IN_UNION_ROOM))
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

bool8 IsRfuRecoveringFromLinkLoss(void)
{
    if (Rfu.linkLossRecoveryState == 1)
        return TRUE;
    else
        return FALSE;
}

bool32 sub_80FC1CC(void)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((lman.acceptSlot_flag >> i) & 1 && Rfu.partnerSendStatuses[i] == 0)
            return FALSE;
    }

    return TRUE;
}

static void Debug_PrintEmpty(void)
{
    s32 i;

    for (i = 0; i < 20; i++)
        Debug_PrintString("                              ", 0, i);
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

static void Debug_PrintStatus(void)
{
    s32 i, j;

    Debug_PrintNum(GetBlockReceivedStatus(), 0x1C, 0x13, 2);
    Debug_PrintNum(gRfuLinkStatus->connSlotFlag, 0x14, 1, 1);
    Debug_PrintNum(gRfuLinkStatus->linkLossSlotFlag, 0x17, 1, 1);
    if (Rfu.parent_child == MODE_PARENT)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if ((gRfuLinkStatus->getNameFlag >> i) & 1)
            {
                Debug_PrintNum(gRfuLinkStatus->partner[i].serialNo, 1, i + 3, 4);
                Debug_PrintString((void *) &gRfuLinkStatus->partner[i].gname, 6, i + 3);
                Debug_PrintString(gRfuLinkStatus->partner[i].uname, 0x16, i + 3);
            }
        }
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            for (j = 0; j < 14; j++)
            {
                Debug_PrintNum(Rfu.main_UNI_recvBuffer[i][j], j * 2, i + 11, 2);
            }
        }
        Debug_PrintString("NOWSLOT", 1, 0xF);
    }
    else if (gRfuLinkStatus->connSlotFlag != 0 && gRfuLinkStatus->getNameFlag != 0)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            Debug_PrintNum(0, 1, i + 3, 4);
            Debug_PrintString(gUnknown_843EE47, 6, i + 3);
            Debug_PrintString(gUnknown_843EE57, 0x16, i + 3);
        }
        Debug_PrintNum(gRfuLinkStatus->partner[Rfu.child_slot].serialNo, 1, 3, 4);
        Debug_PrintString(gRfuLinkStatus->partner[Rfu.child_slot].gname, 6, 3);
        Debug_PrintString(gRfuLinkStatus->partner[Rfu.child_slot].uname, 0x16, 3);
    }
    else
    {
        for (i = 0; i < gRfuLinkStatus->findParentCount; i++)
        {
            if (gRfuLinkStatus->partner[i].slot != 0xFF)
            {
                Debug_PrintNum(gRfuLinkStatus->partner[i].serialNo, 1, i + 3, 4);
                Debug_PrintNum(gRfuLinkStatus->partner[i].id, 6, i + 3, 4);
                Debug_PrintString(gRfuLinkStatus->partner[i].uname, 0x16, i + 3);
            }
        }
        for (; i < RFU_CHILD_MAX; i++)
        {
            Debug_PrintNum(0, 1, i + 3, 4);
            Debug_PrintString(gUnknown_843EE47, 6, i + 3);
            Debug_PrintString(gUnknown_843EE57, 0x16, i + 3);
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

static u32 GetRfuSendQueueLength(void)
{
    return Rfu.sendQueue.count;
}

u32 GetRfuRecvQueueLength(void)
{
    return Rfu.recvQueue.count;
}

static void Task_idle(u8 taskId)
{

}
