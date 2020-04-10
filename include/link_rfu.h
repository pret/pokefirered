#ifndef GUARD_LINK_RFU_H
#define GUARD_LINK_RFU_H

#include "global.h"
#include "librfu.h"
#include "AgbRfu_LinkManager.h"

#define RFU_COMMAND_0x8800 0x8800
#define RFU_COMMAND_0x8900 0x8900
#define RFU_COMMAND_0xa100 0xa100
#define RFU_COMMAND_0x7700 0x7700
#define RFU_COMMAND_0x7800 0x7800
#define RFU_COMMAND_0x6600 0x6600
#define RFU_COMMAND_0x5f00 0x5f00
#define RFU_COMMAND_0x2f00 0x2f00
#define RFU_COMMAND_0xbe00 0xbe00
#define RFU_COMMAND_0xee00 0xee00
#define RFU_COMMAND_0xed00 0xed00

// RfuTgtData.gname is read as these structs.
struct GFtgtGnameSub
{
    u16 language:4;
    u16 hasNews:1;
    u16 hasCard:1;
    u16 unk_00_6:1;
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

struct UnkLinkRfuStruct_02022B44
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

struct UnkRfuStruct_2_Sub_124
{
    /* 0x000 */ u8 slots[20][70];
    /* 0x578 */ vu8 recv_slot;
    /* 0x579 */ vu8 send_slot;
    /* 0x57a */ vu8 count;
    /* 0x57b */ vu8 full;
};

struct RfuSendQueue
{
    /* 0x000 */ u8 slots[40][14];
    /* 0x230 */ vu8 recv_slot;
    /* 0x231 */ vu8 send_slot;
    /* 0x232 */ vu8 count;
    /* 0x233 */ vu8 full;
};

struct UnkRfuStruct_2_Sub_c1c
{
    /* 0x00 */ u8 slots[2][14];
    /* 0x1c */ vu8 recv_slot;
    /* 0x1d */ vu8 send_slot;
    /* 0x1e */ vu8 count;
};

struct UnkRfuStruct_Sub_Unused
{
    /* 0x000 */ u8 slots[2][256];
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
    /* 0x014 */ u8 unk_14[RFU_CHILD_MAX][14];
    /* 0x04c */ u8 unk_4c[14];
    /* 0x05a */ u8 cmdA100_blockRequestType;
    /* 0x05b */ u8 unk_5b;
    /* 0x05c */ u8 unk_5c[5];
    /* 0x061 */ u8 unk_61[5];
    /* 0x066 */ u8 unk_66;
    /* 0x067 */ u8 unk_67;
    /* 0x068 */ u8 filler_68[4];
    /* 0x06c */ struct RfuBlockSend cmd_8800_sendbuf;
    /* 0x080 */ struct RfuBlockSend cmd_8800_recvbuf[5];
    /* 0x0e4 */ u8 cmd5f00Ack[5];
    /* 0x0e9 */ u8 cmd_6600_recvd[5];
    /* 0x0ee */ vu8 errorState;
    /* 0x0ef */ bool8 isShuttingDown;
    /* 0x0f0 */ u8 linkLossRecoveryState;
    /* 0x0f1 */ u8 unk_f1;
    /* 0x0f2 */ u16 unk_f2[6];
    /* 0x0fe */ u16 cmd_6600_timer;
    /* 0x100 */ u16 cmd_6600_count;
    /* 0x102 */ u8 unk_102;
    /* 0x104 */ struct RfuTgtData unk_104;
    /* 0x124 */ struct UnkRfuStruct_2_Sub_124 unk_124;
    /* 0x6a0 */ struct RfuSendQueue sendQueue;
    /* 0x8d4 */ struct UnkRfuStruct_2_Sub_c1c unk_c1c;
    /* 0x8f4 */ vu8 unk_c3c;
    /* 0x8f5 */ u8 reconnectedParentIdx;
    /* 0x8f6 */ vu8 child_slot;
    /* 0x8f7 */ u8 unk_c3f[70];
    /* 0x93d */ u8 unk_c85;
    /* 0x93e */ u8 unk_c86;
    /* 0x93f */ u8 recvCmds[5][7][2];
    /* 0x985 */ u8 parentId;
    /* 0x986 */ u8 unk_cce; // childId
    /* 0x987 */ u8 unk_ccf;
    /* 0x988 */ vu8 unk_cd0;
    /* 0x989 */ u8 unk_cd1[RFU_CHILD_MAX];
    /* 0x98d */ u8 unk_cd5[RFU_CHILD_MAX];
    /* 0x991 */ u8 unk_cd9;
    /* 0x992 */ u8 unk_cda;
    /* 0x993 */ vu8 unk_cdb;
    /* 0x994 */ vu8 unk_cdc;
    /* 0x995 */ u8 unk_cdd;
    /* 0x996 */ u8 linkPlayerIdx[RFU_CHILD_MAX];
    /* 0x99a */ u8 bm_PartnerFlags;
    /* 0x99b */ u8 bm_DisconnectSlot;
    /* 0x99c */ u8 unk_ce4;
    /* 0x99d */ u8 unk_ce5;
    /* 0x99e */ u8 unionRoomChatters;
    /* 0x99f */ u8 acceptSlot_flag;
    /* 0x9a0 */ bool8 unk_ce8;
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
void Rfu_BeginBuildAndSendCommand5F(void);
bool8 IsLinkRfuTaskFinished(void);
void DestroyWirelessStatusIndicatorSprite(void);
void MEvent_CreateTask_CardOrNewsWithFriend(u32 arg0);
void MEvent_CreateTask_CardOrNewsOverWireless(u32 arg0);
void MEvent_CreateTask_Leader(u32 arg0);
void RfuPrepareSend0x2f00(void * data);
u8 CreateTask_ListenToWireless(void);
void LinkRfu_DestroyIdleTask(void);
void sub_80F86F4(void);
void sub_80FB128(bool32 a0);
bool32 IsSendingKeysToRfu(void);
void Rfu_set_zero(void);
u8 GetRfuPlayerCount(void);
void StartSendingKeysToRfu(void);
u8 LinkRfu_GetMultiplayerId(void);
bool32 Rfu_InitBlockSend(const u8 * src, size_t size);
bool8 LinkRfu_PrepareCmd0xA100(u8 blockRequestType);
u8 Rfu_GetBlockReceivedStatus(void);
void Rfu_SetBlockReceivedFlag(u8 who);
void Rfu_ResetBlockReceivedFlag(u8 who);
bool8 Rfu_IsMaster(void);
void ResetLinkRfuGFLayer(void);
bool32 LinkRfuMain1(void);
bool32 LinkRfuMain2(void);
bool32 IsRfuRecvQueueEmpty(void);
u32 GetRfuRecvQueueLength(void);
void LinkRfu_Shutdown(void);
void LinkRfu_CreateIdleTask(void);
bool8 ToggleLMANlinkRecovery(bool32 a0);
void var_800D_set_xB(void);
struct GFtgtGname *GetHostRFUtgtGname(void);
void UpdateWirelessStatusIndicatorSprite(void);
void InitRFU(void);
bool32 RfuIsErrorStatus1or2(void);

void RFU_queue_20_70_reset(struct UnkRfuStruct_2_Sub_124 *ptr);
void RFU_queue_40_14_reset(struct RfuSendQueue *ptr);

void RfuSetErrorStatus(u8 a0, u16 msg);
u8 RfuGetErrorStatus(void);
void RFU_queue_20_70_recv(struct UnkRfuStruct_2_Sub_124 *q1, u8 *q2);
bool8 RFU_queue_40_14_send(struct RfuSendQueue *q1, u8 *q2);
bool8 RFU_queue_2_14_send(struct UnkRfuStruct_2_Sub_c1c *q1, u8 *q2);
void RFU_queue_2_14_recv(struct UnkRfuStruct_2_Sub_c1c *q1, const u8 *q2);
bool8 RFU_queue_20_70_send(struct UnkRfuStruct_2_Sub_124 * a0, u8 *a1);
void RFU_queue_40_14_recv(struct RfuSendQueue * a0, u8 *a1);
void InitHostRFUtgtGname(struct GFtgtGname *data, u8 activity, bool32 started, s32 child_sprite_genders);
void UpdateGameData_GroupLockedIn(bool8 started);
bool32 RfuSerialNumberIsValid(u32 a0);
bool8 sub_80FC1B0(void);
bool8 LmanAcceptSlotFlagIsNotZero(void);
void LinkRfu_StopManagerAndFinalizeSlots(void);
bool32 sub_80FA5D4(void);
bool32 sub_80FC1CC(void);
bool32 WaitRfuState(bool32 a0);
bool32 TrainerIdAndNameStillInPartnersList(u16 trainerId, const u8 *trainerName);
void SendByteToPartnerByIdAndName(u8 a0, u16 a1, const u8 *a2);
u32 WaitSendByteToPartnerByIdAndName(u16 a0, const u8 *a1);
void SetHostRFUtgtGname(u8 activity, u32 child_sprite_genders, u32 a2);
void InitializeRfuLinkManager_LinkLeader(u32 availSlots);
void RequestDisconnectSlotByTrainerNameAndId(const u8 *trainerName, u16 trainerId);
void LinkRfu3_SetGnameUnameFromStaticBuffers(struct GFtgtGname *gname, u8 *uname);
void InitializeRfuLinkManager_JoinGroup(void);
void LinkRfuNIsend8(void);
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
bool32 GetRfuUnkCE8(void);
void sub_80FA4A8(void);
void sub_80FB9D0(void);
void sub_80FB030(u32 a0);
void sub_80FBA44(void);

#include "mevent_server.h"
extern const struct mevent_server_cmd gMEventSrvScript_OtherTrainerCanceled[];

#endif //GUARD_LINK_RFU_H
