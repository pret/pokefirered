#ifndef GUARD_LINK_RFU_H
#define GUARD_LINK_RFU_H

#include "global.h"
#include "librfu.h"
#include "link.h"
#include "AgbRfu_LinkManager.h"

#define RFUCMD_MASK               0xFF00

#define RFUCMD_SEND_PACKET        0x2F00
#define RFUCMD_READY_CLOSE_LINK   0x5f00
#define RFUCMD_READY_EXIT_STANDBY 0x6600
#define RFUCMD_PLAYERS_LIST       0x7700
#define RFUCMD_PLAYERS_LIST_2     0x7800
#define RFUCMD_SEND_BLOCK_INIT    0x8800
#define RFUCMD_SEND_BLOCK_STEP    0x8900
#define RFUCMD_SEND_BLOCK_REQ     0xa100
#define RFUCMD_SEND_HELD_KEYS     0xbe00
#define RFUCMD_PARENT_DISCONNECT  0xed00
#define RFUCMD_CHILD_DISCONNECT   0xee00

#define RFU_PACKET_SIZE                6

#define RFU_SERIAL_7F7D           0x7F7D

#define RECV_QUEUE_NUM_SLOTS 20
#define RECV_QUEUE_SLOT_LENGTH (14 * MAX_RFU_PLAYERS)

#define SEND_QUEUE_NUM_SLOTS 40
#define SEND_QUEUE_SLOT_LENGTH 14

#define BACKUP_QUEUE_NUM_SLOTS 2
#define BACKUP_QUEUE_SLOT_LENGTH 14

#define UNUSED_QUEUE_NUM_SLOTS 2
#define UNUSED_QUEUE_SLOT_LENGTH 256

#define RFU_PACKET_SIZE 6

#define RFU_STATUS_OK                   0
#define RFU_STATUS_FATAL_ERROR          1
#define RFU_STATUS_CONNECTION_ERROR     2
#define RFU_STATUS_CHILD_SEND_COMPLETE  3
#define RFU_STATUS_NEW_CHILD_DETECTED   4
#define RFU_STATUS_JOIN_GROUP_OK        5
#define RFU_STATUS_JOIN_GROUP_NO        6
#define RFU_STATUS_WAIT_ACK_JOIN_GROUP  7
#define RFU_STATUS_LEAVE_GROUP_NOTICE   8
#define RFU_STATUS_LEAVE_GROUP          9
#define RFU_STATUS_10                   10
#define RFU_STATUS_11                   11
#define RFU_STATUS_ACK_JOIN_GROUP       12

#define RFU_RECV_IDLE           0
#define RFU_RECV_RECEIVING      1
#define RFU_RECV_FINISHED       2

// RfuTgtData.gname is read as these structs.
struct GFtgtGnameSub
{
    u16 language:4;
    u16 hasNews:1;
    u16 hasCard:1;
    u16 unknown:1;
    u16 isChampion:1;
    u16 hasNationalDex:1;
    u16 gameClear:1;
    u16 version:4;
    u16 unk_01_6:2;
    u8 playerTrainerId[2];
};

struct __attribute__((packed, aligned(2))) GFtgtGname
{
    struct GFtgtGnameSub unk_00;
    u8 child_sprite_gender[RFU_CHILD_MAX]; // u8 sprite_idx:3;
    // u8 gender:1;
    // u8 unk_4:3
    // u8 active:1
    u16 species:10;
    u16 type:6;
    u8 activity:7;
    u8 started:1;
    u8 playerGender:1;
    u8 level:7;
    u8 padding;
}; // size: RFU_GNAME_SIZE

struct Padded_U8
{
    u8 value;
};

struct RfuBlockSend
{
    /* 0x00 */ u16 next;
    /* 0x02 */ u16 count; // max 21
    /* 0x04 */ const u8 *payload;
    /* 0x08 */ u32 receivedFlags;
    /* 0x0c */ u32 failedFlags;
    /* 0x10 */ u8 sending;
    /* 0x11 */ u8 owner;
    /* 0x12 */ u8 receiving;
};

struct RfuRecvQueue
{
    /* 0x000 */ u8 slots[RECV_QUEUE_NUM_SLOTS][RECV_QUEUE_SLOT_LENGTH];
    /* 0x578 */ vu8 recv_slot;
    /* 0x579 */ vu8 send_slot;
    /* 0x57a */ vu8 count;
    /* 0x57b */ vu8 full;
};

struct RfuSendQueue
{
    /* 0x000 */ u8 slots[SEND_QUEUE_NUM_SLOTS][SEND_QUEUE_SLOT_LENGTH];
    /* 0x230 */ vu8 recv_slot;
    /* 0x231 */ vu8 send_slot;
    /* 0x232 */ vu8 count;
    /* 0x233 */ vu8 full;
};

struct RfuBackupQueue
{
    /* 0x00 */ u8 slots[BACKUP_QUEUE_NUM_SLOTS][BACKUP_QUEUE_SLOT_LENGTH];
    /* 0x1c */ vu8 recv_slot;
    /* 0x1d */ vu8 send_slot;
    /* 0x1e */ vu8 count;
};

struct RfuUnusedQueue
{
    /* 0x000 */ u8 slots[UNUSED_QUEUE_NUM_SLOTS][UNUSED_QUEUE_SLOT_LENGTH];
    /* 0x200 */ vu8 recv_slot;
    /* 0x201 */ vu8 send_slot;
    /* 0x202 */ vu8 count;
    /* 0x203 */ vu8 full;
};

typedef struct UnkRfuStruct_2
{
    /* 0x000 */ void (*RfuFunc)(void);
    /* 0x004 */ u16 state;
    /* 0x006 */ u8 filler_06[4];
    /* 0x00a */ u16 linkman_msg;
    /* 0x00c */ u8 parent_child;
    /* 0x00d */ u8 playerCount;
    /* 0x00e */ u8 unk_0e;
    /* 0x00f */ u8 unk_0f;
    /* 0x010 */ u16 linkman_param[2];
    /* 0x014 */ u8 main_UNI_recvBuffer[RFU_CHILD_MAX][14];
    /* 0x04c */ u8 lastCmdBeforeCommInterrupt[14];
    /* 0x05a */ u8 cmdA100_blockRequestType;
    /* 0x05b */ u8 sendBlockInitDelay;
    /* 0x05c */ bool8 blockReceived[MAX_RFU_PLAYERS];
    /* 0x061 */ u8 numBlocksReceived[MAX_RFU_PLAYERS];
    /* 0x066 */ u8 idleTaskId;
    /* 0x067 */ u8 searchTaskId;
    /* 0x068 */ u8 filler_68[4];
    /* 0x06c */ struct RfuBlockSend sendBlock;
    /* 0x080 */ struct RfuBlockSend recvBlock[MAX_RFU_PLAYERS];
    /* 0x0e4 */ bool8 readyCloseLink[MAX_RFU_PLAYERS];
    /* 0x0e9 */ bool8 readyExitStandby[MAX_RFU_PLAYERS];
    /* 0x0ee */ vu8 errorState;
    /* 0x0ef */ bool8 isShuttingDown;
    /* 0x0f0 */ u8 linkLossRecoveryState;
    /* 0x0f1 */ u8 status;
    /* 0x0f2 */ u16 packet[RFU_PACKET_SIZE];
    /* 0x0fe */ u16 resendExitStandbyTimer;
    /* 0x100 */ u16 resendExitStandbyCount;
    /* 0x102 */ u8 unk_102;
    /* 0x104 */ struct RfuTgtData tgtData;
    /* 0x124 */ struct RfuRecvQueue recvQueue;
    /* 0x6a0 */ struct RfuSendQueue sendQueue;
    /* 0x8d4 */ struct RfuBackupQueue backupQueue;
    /* 0x8f4 */ vu8 linkRecovered;
    /* 0x8f5 */ u8 reconnectedParentIdx;
    /* 0x8f6 */ vu8 child_slot;
    /* 0x8f7 */ u8 unk_c3f[70];
    /* 0x93d */ u8 sendStatus;
    /* 0x93e */ u8 recvStatus;
    /* 0x93f */ u8 recvCmds[MAX_RFU_PLAYERS][7][2];
    /* 0x985 */ u8 parentId;
    /* 0x986 */ u8 multiplayerId; // childId
    /* 0x987 */ u8 unk_ccf;
    /* 0x988 */ vu8 sem_UNI_SendRecv;
    /* 0x989 */ u8 partnerSendStatuses[RFU_CHILD_MAX];
    /* 0x98d */ u8 partnerRecvStatuses[RFU_CHILD_MAX];
    /* 0x991 */ u8 linkClosing;
    /* 0x992 */ u8 unk_cda;
    /* 0x993 */ volatile bool8 unk_cdb;
    /* 0x994 */ volatile bool8 unk_cdc;
    /* 0x995 */ u8 unk_cdd;
    /* 0x996 */ u8 linkPlayerIdx[RFU_CHILD_MAX];
    /* 0x99a */ u8 bm_PartnerFlags;
    /* 0x99b */ u8 bm_DisconnectSlot;
    /* 0x99c */ u8 unk_ce4;
    /* 0x99d */ u8 bmChatLeaderMaybe;
    /* 0x99e */ u8 unionRoomChatters;
    /* 0x99f */ u8 acceptSlot_flag;
    /* 0x9a0 */ bool8 foundNewLeaderMaybe;
    /* 0x9a1 */ u8 unk_ce9;
    /* 0x9a2 */ u8 unk_cea[RFU_CHILD_MAX];
    /* 0x9a6 */ u8 unk_cee[RFU_CHILD_MAX];
} GF_RFU_MANAGER; // size: 0x9AC

extern struct GFtgtGname gHostRFUtgtGnameBuffer;
extern u8 gHostRFUtgtUnameBuffer[];
extern GF_RFU_MANAGER Rfu;

// GameFreak signatures
void AddTextPrinterToWindow1(const u8 *str);
bool32 MG_PrintTextOnWindow1AndWaitButton(u8 * cmdPtr, const u8 * src);
void LinkRfu_FatalError(void);
void MG_DrawCheckerboardPattern(void);
void Rfu_SetCloseLinkCallback(void);
bool8 IsLinkRfuTaskFinished(void);
void DestroyWirelessStatusIndicatorSprite(void);
void MEvent_CreateTask_CardOrNewsWithFriend(u32 arg0);
void MEvent_CreateTask_CardOrNewsOverWireless(u32 arg0);
void MEvent_CreateTask_Leader(u32 arg0);
void Rfu_SendPacket(void *data);
u8 CreateTask_ListenToWireless(void);
void LinkRfu_DestroyIdleTask(void);
void InitRFUAPI(void);
void sub_80FB128(bool32 a0);
bool32 IsSendingKeysToRfu(void);
void ClearLinkRfuCallback(void);
u8 GetRfuPlayerCount(void);
void StartSendingKeysToRfu(void);
u8 LinkRfu_GetMultiplayerId(void);
bool32 Rfu_InitBlockSend(const u8 * src, size_t size);
bool8 Rfu_SendBlockRequest(u8 blockRequestType);
u8 Rfu_GetBlockReceivedStatus(void);
void Rfu_SetBlockReceivedFlag(u8 linkPlayerId);
void Rfu_ResetBlockReceivedFlag(u8 linkPlayerId);
bool8 Rfu_IsMaster(void);
void ResetLinkRfuGFLayer(void);
bool32 LinkRfuMain1(void);
bool32 LinkRfuMain2(void);
bool32 IsRfuRecvQueueEmpty(void);
u32 GetRfuRecvQueueLength(void);
void LinkRfu_Shutdown(void);
void LinkRfu_CreateIdleTask(void);
bool8 ToggleLMANlinkRecovery(bool32 enable);
void var_800D_set_xB(void);
struct GFtgtGname *GetHostRFUtgtGname(void);
void UpdateWirelessStatusIndicatorSprite(void);
void InitRFU(void);
bool32 RfuHasErrored(void);

void RfuRecvQueue_Reset(struct RfuRecvQueue *queue);
void RfuSendQueue_Reset(struct RfuSendQueue *queue);

void RfuSetStatus(u8 status, u16 msg);
u8 RfuGetStatus(void);
void RfuRecvQueue_Enqueue(struct RfuRecvQueue *queue, u8 *src);
bool8 RfuSendQueue_Dequeue(struct RfuSendQueue *queue, u8 *dest);
bool8 RfuBackupQueue_Dequeue(struct RfuBackupQueue *queue, u8 *dest);
void RfuBackupQueue_Enqueue(struct RfuBackupQueue *queue, const u8 *dest);
bool8 RfuRecvQueue_Dequeue(struct RfuRecvQueue * queue, u8 *dest);
void RfuSendQueue_Enqueue(struct RfuSendQueue * queue, u8 *src);
void InitHostRFUtgtGname(struct GFtgtGname *data, u8 activity, bool32 started, s32 child_sprite_genders);
void UpdateGameData_GroupLockedIn(bool8 started);
bool32 IsRfuSerialNumberValid(u32 serialNo);
bool8 IsRfuRecoveringFromLinkLoss(void);
bool8 LmanAcceptSlotFlagIsNotZero(void);
void LinkRfu_StopManagerAndFinalizeSlots(void);
bool32 sub_80FA5D4(void);
bool32 sub_80FC1CC(void);
bool32 WaitRfuState(bool32 a0);
bool32 CheckTrainerHasLeftByIdAndName(u16 trainerId, const u8 *trainerName);
void SendByteToPartnerByIdAndName(u8 a0, u16 a1, const u8 *a2);
u32 WaitSendByteToPartnerByIdAndName(u16 a0, const u8 *a1);
void SetHostRFUtgtGname(u8 activity, u32 child_sprite_genders, u32 a2);
void InitializeRfuLinkManager_LinkLeader(u32 availSlots);
void RequestDisconnectSlotByTrainerNameAndId(const u8 *trainerName, u16 trainerId);
void LinkRfu3_SetGnameUnameFromStaticBuffers(struct GFtgtGname *gname, u8 *uname);
void InitializeRfuLinkManager_JoinGroup(void);
void SendLeaveGroupNotice(void);
void CreateTask_RfuReconnectWithParent(const u8 *src, u16 trainerId);
void UpdateGameDataWithActivitySpriteGendersFlag(u8 activity, u32 child_sprite_genders, u32 started);
void RecordMixTrainerNames(void);
void LinkRfu_CreateConnectionAsParent();
void LinkRfu_StopManagerBeforeEnteringChat();
void SetGnameBufferWonderFlags(bool32 hasNews, bool32 hasCard);
void ClearAndInitHostRFUtgtGname(void);
void sub_80F8FA0(void);
void RfuUpdatePlayerGnameStateAndSend(u32 type, u32 species, u32 level);
bool32 IsUnionRoomListenTaskActive(void);
void InitializeRfuLinkManager_EnterUnionRoom(void);
void sub_80FBD6C(u32 a0);
void sub_80FC114(const u8 *name, struct GFtgtGname *structPtr, u8 a2);
bool32 PlayerHasMetTrainerBefore(u16 id, u8 *name);
bool8 LinkRfu_GetNameIfCompatible(struct GFtgtGname *gname, u8 *uname, u8 idx);
bool8 LinkRfu_GetNameIfSerial7F7D(struct GFtgtGname *gname, u8 *uname, u8 idx);
bool32 RfuHasFoundNewLeader(void);
void Rfu_UnionRoomChat_StopLinkManager(void);
void sub_80FB9D0(void);
void sub_80FB030(u32 a0);
void ClearRecvCommands(void);

#include "mevent_server.h"
extern const struct mevent_server_cmd gMEventSrvScript_OtherTrainerCanceled[];

#endif //GUARD_LINK_RFU_H
