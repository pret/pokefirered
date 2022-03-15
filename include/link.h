#ifndef GUARD_LINK_H
#define GUARD_LINK_H

#include "global.h"

#define MAX_LINK_PLAYERS 4
#define MAX_RFU_PLAYERS 5
#define CMD_LENGTH 8
#define QUEUE_CAPACITY 50
#define BLOCK_BUFFER_SIZE 0x100

#define LINK_SLAVE 0
#define LINK_MASTER 8

#define LINK_STAT_LOCAL_ID               0x00000003
#define LINK_STAT_PLAYER_COUNT           0x0000001C
#define LINK_STAT_PLAYER_COUNT_SHIFT     2
#define LINK_STAT_MASTER                 0x00000020
#define LINK_STAT_MASTER_SHIFT           5
#define LINK_STAT_CONN_ESTABLISHED       0x00000040
#define LINK_STAT_CONN_ESTABLISHED_SHIFT 6
#define LINK_STAT_RECEIVED_NOTHING       0x00000100
#define LINK_STAT_RECEIVED_NOTHING_SHIFT 8
#define LINK_STAT_UNK_FLAG_9             0x00000200
#define LINK_STAT_UNK_FLAG_9_SHIFT       9
#define LINK_STAT_ERRORS                 0x0007F000
#define LINK_STAT_ERRORS_SHIFT           12

#define LINK_STAT_ERROR_HARDWARE         0x00001000
#define LINK_STAT_ERROR_HARDWARE_SHIFT   12
#define LINK_STAT_ERROR_CHECKSUM         0x00002000
#define LINK_STAT_ERROR_CHECKSUM_SHIFT   13
#define LINK_STAT_ERROR_QUEUE_FULL       0x00004000
#define LINK_STAT_ERROR_QUEUE_FULL_SHIFT 14
#define LINK_STAT_ERROR_LAG_MASTER       0x00010000
#define LINK_STAT_ERROR_LAG_MASTER_SHIFT 16
#define LINK_STAT_ERROR_INVALID_ID       0x00020000
#define LINK_STAT_ERROR_INVALID_ID_SHIFT 17
#define LINK_STAT_ERROR_LAG_SLAVE        0x00040000
#define LINK_STAT_ERROR_LAG_SLAVE_SHIFT  18

#define EXTRACT_PLAYER_COUNT(status) \
(((status) & LINK_STAT_PLAYER_COUNT) >> LINK_STAT_PLAYER_COUNT_SHIFT)
#define EXTRACT_MASTER(status) \
(((status) >> LINK_STAT_MASTER_SHIFT) & 1)
#define EXTRACT_CONN_ESTABLISHED(status) \
(((status) >> LINK_STAT_CONN_ESTABLISHED_SHIFT) & 1)
#define EXTRACT_RECEIVED_NOTHING(status) \
(((status) >> LINK_STAT_RECEIVED_NOTHING_SHIFT) & 1)
#define EXTRACT_LINK_ERRORS(status) \
(((status) & LINK_STAT_ERRORS) >> LINK_STAT_ERRORS_SHIFT)

#define LINKCMD_SEND_LINK_TYPE 0x2222
#define LINKCMD_0x2FFE             0x2FFE
#define LINKCMD_SEND_HELD_KEYS     0x4444
#define LINKCMD_0x5555             0x5555
#define LINKCMD_0x5566             0x5566
#define LINKCMD_0x5FFF             0x5FFF
#define LINKCMD_0x6666             0x6666
#define LINKCMD_0x7777             0x7777
#define LINKCMD_COUNTDOWN          0x7FFF
#define LINKCMD_CONT_BLOCK         0x8888
#define LINKCMD_0xAAAA             0xAAAA
#define LINKCMD_0xAAAB             0xAAAB
#define LINKCMD_INIT_BLOCK         0xBBBB
#define LINKCMD_SEND_HELD_KEYS_2   0xCAFE
#define LINKCMD_0xCCCC             0xCCCC

#define LINKTYPE_TRADE              0x1111  // trade
#define LINKTYPE_0x1122              0x1122  // trade
#define LINKTYPE_0x1133              0x1133  // trade
#define LINKTYPE_0x1144              0x1144  // trade
#define LINKTYPE_BATTLE              0x2211
#define LINKTYPE_0x2222              0x2222  // unused battle?
#define LINKTYPE_SINGLE_BATTLE       0x2233
#define LINKTYPE_DOUBLE_BATTLE       0x2244
#define LINKTYPE_MULTI_BATTLE        0x2255
#define LINKTYPE_BATTLE_TOWER_50     0x2266
#define LINKTYPE_BATTLE_TOWER_OPEN   0x2277
#define LINKTYPE_BATTLE_TOWER        0x2288
#define LINKTYPE_0x3311              0x3311
#define LINKTYPE_0x3322              0x3322
#define LINKTYPE_BERRY_BLENDER_SETUP              0x4411
#define LINKTYPE_CONTEST_GMODE              0x6601

#define MASTER_HANDSHAKE 0x8FFF
#define SLAVE_HANDSHAKE  0xB9A0

#define IsSendCmdComplete()    (gSendCmd[0] == 0)

enum
{
    LINK_STATE_START0,
    LINK_STATE_START1,
    LINK_STATE_HANDSHAKE,
    LINK_STATE_INIT_TIMER,
    LINK_STATE_CONN_ESTABLISHED,
};

enum
{
    EXCHANGE_NOT_STARTED,
    EXCHANGE_COMPLETE,
    EXCHANGE_TIMED_OUT,
    EXCHANGE_IN_PROGRESS,
    EXCHANGE_STAT_4,
    EXCHANGE_STAT_5,
    EXCHANGE_STAT_6,
    EXCHANGE_STAT_7
};

enum
{
    QUEUE_FULL_NONE,
    QUEUE_FULL_SEND,
    QUEUE_FULL_RECV,
};

enum
{
    LAG_NONE,
    LAG_MASTER,
    LAG_SLAVE,
};

struct LinkPlayer
{
    /* 0x00 */ u16 version;
    /* 0x02 */ u16 lp_field_2;
    /* 0x04 */ u32 trainerId;
    /* 0x08 */ u8 name[PLAYER_NAME_LENGTH + 1];
    /* 0x10 */ u8 progressFlags; // (& 0x0F) is hasNationalDex, (& 0xF0) is hasClearedGame
    /* 0x11 */ u8 neverRead;
    /* 0x12 */ u8 progressFlagsCopy;
    /* 0x13 */ u8 gender;
    /* 0x14 */ u32 linkType;
    /* 0x18 */ u16 id; // battle bank in battles
    /* 0x1A */ u16 language;
};

struct LinkPlayerBlock
{
    u8 magic1[16];
    struct LinkPlayer linkPlayer;
    u8 magic2[16];
};

// circular queues

struct SendQueue
{
    u16 data[CMD_LENGTH][QUEUE_CAPACITY];
    u8 pos;
    u8 count;
};

struct RecvQueue
{
    u16 data[MAX_LINK_PLAYERS][CMD_LENGTH][QUEUE_CAPACITY];
    u8 pos;
    u8 count;
};

struct Link
{
    u8 isMaster; // 0: slave, 8: master
    u8 state;
    u8 localId; // local multi-player ID
    u8 playerCount;
    u16 tempRecvBuffer[4];
    bool8 receivedNothing;
    s8 serialIntrCounter;
    bool8 handshakeAsMaster;
    u8 link_field_F;

    // error conditions
    bool8 hardwareError; // hardware reported an error
    bool8 badChecksum; // checksum didn't match between devices
    u8 queueFull; // send or recv queue out of space
    u8 lag; // connection is lagging

    u16 checksum;

    u8 sendCmdIndex;
    u8 recvCmdIndex;

    struct SendQueue sendQueue;
    struct RecvQueue recvQueue;
};

struct BlockRequest
{
    void * address;
    u32 size;
};

extern const struct BlockRequest sBlockRequestLookupTable[5];

extern struct Link gLink;
extern u16 gRecvCmds[MAX_RFU_PLAYERS][CMD_LENGTH];
extern u8 gBlockSendBuffer[BLOCK_BUFFER_SIZE];
extern u16 gLinkType;
extern u32 gLinkStatus;
extern u16 gBlockRecvBuffer[MAX_RFU_PLAYERS][BLOCK_BUFFER_SIZE / 2];
extern u16 gSendCmd[CMD_LENGTH];
extern u8 gShouldAdvanceLinkState;
extern struct LinkPlayer gLinkPlayers[MAX_RFU_PLAYERS];
extern u16 word_3002910[];
extern bool8 gReceivedRemoteLinkPlayers;
extern bool8 gLinkVSyncDisabled;
extern u8 gWirelessCommType;
extern struct LinkPlayer gLocalLinkPlayer;

extern u8 gShouldAdvanceLinkState;
extern u16 gLinkPartnersHeldKeys[6];

void Task_DestroySelf(u8);
void OpenLink(void);
void CloseLink(void);
u16 LinkMain2(const u16 *);
void ClearLinkCallback(void);
void ClearLinkCallback_2(void);
u8 GetLinkPlayerCount(void);
void OpenLinkTimed(void);
u8 GetLinkPlayerDataExchangeStatusTimed(int lower, int higher);
bool8 IsLinkPlayerDataExchangeComplete(void);
u32 GetLinkPlayerTrainerId(u8);
void ResetLinkPlayers(void);
u8 GetMultiplayerId(void);
u8 bitmask_all_link_players_but_self(void);
bool8 SendBlock(u8, const void *, u16);
u8 GetBlockReceivedStatus(void);
void ResetBlockReceivedFlags(void);
void ResetBlockReceivedFlag(u8);
void SetLinkDebugValues(u32, u32);
u8 GetSavedPlayerCount(void);
u8 GetLinkPlayerCount_2(void);
bool8 IsLinkMaster(void);
void CB2_LinkError(void);
u8 GetSioMultiSI(void);
bool8 IsLinkConnectionEstablished(void);
void SetSuppressLinkErrorMessage(bool8);
bool8 HasLinkErrorOccurred(void);
void ResetSerial(void);
u32 LinkMain1(u8 *, u16 *, u16[MAX_RFU_PLAYERS][CMD_LENGTH]);
void RFUVSync(void);
void Timer3Intr(void);
void SerialCB(void);
u8 GetLinkPlayerCount(void);
bool32 InUnionRoom(void);

void SetLinkStandbyCallback(void);
void SetWirelessCommType1(void);
void LinkRfu_DestroyIdleTask(void);
void SetCloseLinkCallback(void);
void OpenLink(void);
bool8 IsLinkMaster(void);
void CheckShouldAdvanceLinkState(void);
void Link_StartSend5FFFwithParam(u16 a0);
void CloseLink(void);
bool8 IsLinkTaskFinished(void);
bool32 LinkRecvQueueLengthMoreThan2(void);
void ResetSerial(void);
void SetWirelessCommType1(void);
void LoadWirelessStatusIndicatorSpriteGfx(void);
void CreateWirelessStatusIndicatorSprite(u8, u8);
void StartSendingKeysToLink(void);
void ClearLinkCallback_2(void);
void Rfu_SetLinkStandbyCallback(void);
void ConvertLinkPlayerName(struct LinkPlayer * linkPlayer);
bool8 IsWirelessAdapterConnected(void);
bool8 Link_PrepareCmd0xCCCC_Rfu0xA100(u8 blockRequestType);
void LinkVSync(void);
bool8 HandleLinkConnection(void);
void LocalLinkPlayerToBlock(void);
void LinkPlayerFromBlock(u32 who);
void SetLinkErrorFromRfu(u32 status, u8 lastSendQueueCount, u8 lastRecvQueueCount, u8 isConnectionError);
u8 sub_800A8D4(void);
void sub_800AA24(void);
void sub_800A900(u8 a0);
u8 sub_800A8A4(void);
void sub_800A9A4(void);
void SetLocalLinkPlayerId(u8 playerId);
bool32 IsSendingKeysToLink(void);
u32 GetLinkRecvQueueLength(void);

#endif // GUARD_LINK_H
