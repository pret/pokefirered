#ifndef GUARD_LIBRFU_H
#define GUARD_LIBRFU_H

#include "main.h"

enum
{
    RFU_RESET = 0x10,
    RFU_LINK_STATUS,
    RFU_VERSION_STATUS,
    RFU_SYSTEM_STATUS,
    RFU_SLOT_STATUS,
    RFU_CONFIG_STATUS,
    RFU_GAME_CONFIG,
    RFU_SYSTEM_CONFIG,
    RFU_UNK18,
    RFU_SC_START,
    RFU_SC_POLLING,
    RFU_SC_END,
    RFU_SP_START,
    RFU_SP_POLLING,
    RFU_SP_END,
    RFU_CP_START,
    RFU_CP_POLLING,
    RFU_CP_END,
    RFU_UNK22,
    RFU_UNK23,
    RFU_DATA_TX,
    RFU_DATA_TX_AND_CHANGE,
    RFU_DATA_RX,
    RFU_MS_CHANGE,
    RFU_DATA_READY_AND_CHANGE,
    RFU_DISCONNECTED_AND_CHANGE,
    RFU_UNK2A,
    RFU_UNK2B,
    RFU_UNK2C,
    RFU_UNK2D,
    RFU_UNK2E,
    RFU_UNK2F,
    RFU_DISCONNECT,
    RFU_TEST_MODE,
    RFU_CPR_START,
    RFU_CPR_POLLING,
    RFU_CPR_END,
    RFU_UNK35,
    RFU_UNK36,
    RFU_RESUME_RETRANSMIT_AND_CHANGE,
    RFU_UNK38,
    RFU_UNK39,
    RFU_UNK3A,
    RFU_UNK3B,
    RFU_UNK3C,
    RFU_STOP_MODE, //3D
};

struct RfuPacket8
{
    u8 data[0x74];
};

struct RfuPacket32
{
    u32 command;
    u32 data[0x1C];
};

union RfuPacket
{
    struct RfuPacket32 rfuPacket32;
    struct RfuPacket8 rfuPacket8;
};

struct UnkLinkRfuStruct_02022B14Substruct
{
    u16 unk_00_0:4;
    u16 unk_00_4:1;
    u16 unk_00_5:1;
    u16 unk_00_6:1;
    u16 isChampion:1;
    u16 hasNationalDex:1;
    u16 gameClear:1;
    u16 unk_01_2:4;
    u16 unk_01_6:2;
    u8 playerTrainerId[2];
};

struct __attribute__((packed, aligned(2))) UnkLinkRfuStruct_02022B14
{
    struct UnkLinkRfuStruct_02022B14Substruct unk_00;
    u8 unk_04[4];
    u16 species:10;
    u16 type:6;
    u8 unk_0a_0:7;
    u8 unk_0a_7:1;
    u8 playerGender:1;
    u8 level:7;
    u8 unk_0c;
};

struct RfuStruct
{
    vs32 state;
    u8 reqLength;
    u8 reqNext;
    u8 reqActiveCommand;
    u8 ackLength;
    u8 ackNext;
    u8 ackActiveCommand;
    u8 timerSelect;
    u8 unk_b;
    u32 timerState; // this field is s32 in emerald
    vu8 timerActive;
    u8 unk_11;
    vu16 error;
    vu8 msMode;
    u8 recoveryCount;
    u8 unk_16;
    u8 unk_17;
    void (*callbackM)();
    void (*callbackS)(u16);
    u32 callbackId;
    union RfuPacket *txPacket;
    union RfuPacket *rxPacket;
    vu8 unk_2c;
};

struct RfuIntrStruct
{
    union RfuPacket rxPacketAlloc;
    union RfuPacket txPacketAlloc;
    u8 block1[0x960]; // size of librfu_intr.s binary
    struct RfuStruct block2;
};

struct RfuSlotStatusUNI
{
    u16 sendState;
    u8 dataReadyFlag;
    u8 bmSlot;
    u16 payloadSize;
    void *src; // TODO: is it correct? 
    u16 recvState;
    u16 errorCode;
    u16 dataSize;
    u8 newDataFlag;
    u8 dataBlockFlag;
    void *recvBuffer;
    u32 recvBufferSize;
};

struct NIComm
{
    u16 state;
    u16 failCounter;
    u32 nowP[4]; // ???
    u32 remainSize;
    u16 errorCode;
    u8 bmSlot;
    u8 unk_1b;
    u8 recvAckFlag[4];
    u8 ack;
    u8 phase;
    u8 n[4]; // ???
    void *src;
    u8 bmSlotOrg;
    u8 dataType;
    u16 payloadSize;
    u32 dataSize;
};

struct RfuSlotStatusNI
{
    struct NIComm send;
    struct NIComm recv;
    void *recvBuffer;
    void *recvBufferSize;
};

struct RfuFixed
{
    void (*reqCallback)(u16, u16);
    void *fastCopyPtr;
    u16 fastCopyBuffer[24];
    u32 fastCopyBuffer2[12];
    u32 LLFBuffer[29];
    struct RfuIntrStruct *STWIBuffer;
};

struct RfuStatic
{
    u8 flags;
    u8 NIEndRecvFlag;
    u8 RecvRenewalFlag;
    u8 commExistFlag;
    u8 recvErrorFlag;
    u8 recoveryBmSlot;
    u8 nowWatchInterval;
    u8 nullFrameCount;
    u8 emberCount;
    u8 SCStartFlag;
    u8 linkEmergencyFlag[4];
    u8 lsFixedCount[4];
    u16 cidBak[4];
    u16 unk_1a;
    u16 reqResult;
    u16 tryPid;
    u16 watchdogTimer;
    u32 totalPacketSize;
};

struct RfuTgtData
{
    u16 id;
    u8 slot;
    u8 multibootFlag;
    u16 serialNum;
    u8 gname[15];
    u8 uname[9];
};

struct RfuLinkStatus
{
    u8 connMode;
    u8 connCount;
    u8 connSlotFlag;
    u8 linkLossSlotFlag;
    u8 sendSlotNIFlag;
    u8 recvSlotNIFlag;
    u8 sendSlotUNIFlag;
    u8 getNameFlag;
    u8 findParentCount;
    u8 watchInterval;
    u8 strength[4];
    u8 LLFReadyFlag;
    u8 remainLLFrameSizeParent;
    u8 remainLLFrameSizeChild[4];
    struct RfuTgtData partner[4];
    struct RfuTgtData my;
};

struct Unk_3007470
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u8 fill6[4];
    u16 unkA;
};

struct Unk_3001190
{
    struct RfuLinkStatus linkStatus;
    struct RfuStatic static_;
    struct RfuFixed fixed;
    struct RfuSlotStatusNI NI[4];
    struct RfuSlotStatusUNI UNI[4];
    struct RfuIntrStruct intr;
};

extern struct RfuStruct *gRfuState;
extern struct RfuLinkStatus *gRfuLinkStatus;
extern struct RfuStatic *gRfuStatic;
extern struct RfuFixed *gRfuFixed;
extern struct RfuSlotStatusNI *gRfuSlotStatusNI[4];
extern struct RfuSlotStatusUNI *gRfuSlotStatusUNI[4];
extern struct Unk_3007470 gUnknown_3007470;

// librfu_rfu
void rfu_STC_clearAPIVariables(void);
void rfu_REQ_stopMode(void);
u16 rfu_waitREQComplete(void);
s32 rfu_REQBN_softReset_and_checkID(void);
void rfu_REQ_sendData(u8);
void rfu_setMSCCallback(void (*func)(u16));
void rfu_setREQCallback(void (*func)(u16, u16));
bool8 rfu_getMasterSlave(void);
void rfu_REQBN_watchLink(u16 a0, u8 *a1, u8 *a2, u8 *a3);
u16 rfu_syncVBlank(void);
void rfu_REQ_reset(void);
void rfu_REQ_configSystem(u16, u8, u8);
void rfu_REQ_configGameData(u8 r6, u16 r2, const u8 *r4, const u8 *r7);
void rfu_REQ_startSearchChild(void);
void rfu_REQ_pollSearchChild(void);
void rfu_REQ_endSearchChild(void);
void rfu_REQ_startSearchParent(void);
void rfu_REQ_pollSearchParent(void);
void rfu_REQ_endSearchParent(void);
void rfu_REQ_startConnectParent(u16);
void rfu_REQ_pollConnectParent(void);
void rfu_REQ_endConnectParent(void);
void rfu_REQ_CHILD_startConnectRecovery(u8);
void rfu_REQ_CHILD_pollConnectRecovery(void);
void rfu_REQ_CHILD_endConnectRecovery(void);
void rfu_REQ_changeMasterSlave(void);
void rfu_REQ_RFUStatus(void);
u32 rfu_getRFUStatus(u8 *status);
struct RfuIntrStruct *rfu_getSTWIRecvBuffer(void);
u8 rfu_NI_CHILD_setSendGameName(u8 a0, u8 a1);
void rfu_clearSlot(u8 a0, u8 a1);
void rfu_clearAllSlot(void);
bool16 rfu_CHILD_getConnectRecoveryStatus(u8 *status);
u16 rfu_getConnectParentStatus(u8 *status, u8 *a1);
bool16 rfu_UNI_PARENT_getDRAC_ACK(u8 *a0);
void rfu_REQ_disconnect(u8 who);
void rfu_changeSendTarget(u8 a0, u8 who, u8 a2);
void rfu_NI_stopReceivingData(u8 who);
u16 rfu_initializeAPI(struct Unk_3001190 *unk0, u16 unk1, IntrFunc *interrupt, bool8 copyInterruptToRam);
void rfu_setTimerInterrupt(u8 which, IntrFunc *intr);
void rfu_setRecvBuffer(u8 a0, u8 a1, void *a2, size_t a3);
bool16 rfu_UNI_setSendData(u8 flag, void *ptr, u8 size);
void rfu_REQ_recvData(void);
void rfu_UNI_readySendData(u8 a0);
void rfu_UNI_clearRecvNewDataFlag(u8 a0);
void rfu_REQ_PARENT_resumeRetransmitAndChange(void);
void rfu_NI_setSendData(u8, u8, const void *, u32);

// librfu_intr
void IntrSIO32(void);

// librfu_stwi
void STWI_init_all(struct RfuIntrStruct *interruptStruct, IntrFunc *interrupt, bool8 copyInterruptToRam);
void STWI_set_MS_mode(u8 mode);
void STWI_init_Callback_M(void);
void STWI_init_Callback_S(void);
void STWI_set_Callback_M(void *callbackM);
void STWI_set_Callback_S(void (*callbackS)(u16));
void STWI_init_timer(IntrFunc *interrupt, s32 timerSelect);
void AgbRFU_SoftReset(void);
void STWI_set_Callback_ID(u32 id);
u16 STWI_read_status(u8 index);
u16 STWI_poll_CommandEnd(void);
void STWI_send_DataRxREQ(void);
void STWI_send_MS_ChangeREQ(void);
void STWI_send_StopModeREQ(void);
void STWI_send_SystemStatusREQ(void);
void STWI_send_GameConfigREQ(const u8 *unk1, const u8 *data);
void STWI_send_ResetREQ(void);
void STWI_send_LinkStatusREQ(void);
void STWI_send_VersionStatusREQ(void);
void STWI_send_SlotStatusREQ(void);
void STWI_send_ConfigStatusREQ(void);
void STWI_send_ResumeRetransmitAndChangeREQ(void);
void STWI_send_SystemConfigREQ(u16 unk1, u8 unk2, u8 unk3);
void STWI_send_SC_StartREQ(void);
void STWI_send_SC_PollingREQ(void);
void STWI_send_SC_EndREQ(void);
void STWI_send_SP_StartREQ(void);
void STWI_send_SP_PollingREQ(void);
void STWI_send_SP_EndREQ(void);
void STWI_send_CP_StartREQ(u16 unk1);
void STWI_send_CP_PollingREQ(void);
void STWI_send_CP_EndREQ(void);
void STWI_send_DataTxREQ(const void *in, u8 size);
void STWI_send_DataTxAndChangeREQ(const void *in, u8 size);
void STWI_send_DataReadyAndChangeREQ(u8 unk);
void STWI_send_DisconnectedAndChangeREQ(u8 unk0, u8 unk1);
void STWI_send_DisconnectREQ(u8 unk);
void STWI_send_TestModeREQ(u8 unk0, u8 unk1);
void STWI_send_CPR_StartREQ(u16 unk0, u16 unk1, u8 unk2);
void STWI_send_CPR_PollingREQ(void);
void STWI_send_CPR_EndREQ(void);

#endif // GUARD_LIBRFU_H
