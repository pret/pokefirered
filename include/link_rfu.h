#ifndef GUARD_LINK_RFU_H
#define GUARD_LINK_RFU_H

#include "global.h"
#include "librfu.h"

struct Padded_U8
{
    u8 value;
};

struct UnkLinkRfuStruct_02022B2C
{
    u8 unk_00;
    u8 unk_01;
    u16 unk_02;
    u8 unk_04;
    u16 unk_06;
    struct UnkLinkRfuStruct_02022B14 *unk_08;
    u8 *unk_0c;
    u8 unk_10;
    u8 unk_11;
    u16 unk_12;
    u16 unk_14;
};

struct UnkRfuStruct_1
{
    /* 0x000 */ u8 unk_00;
    /* 0x001 */ u8 unk_01;
    /* 0x002 */ vu8 unk_02;
    /* 0x003 */ vu8 unk_03;
    /* 0x004 */ u8 unk_04;
    /* 0x005 */ u8 unk_05;
    /* 0x006 */ u8 unk_06;
    /* 0x007 */ u8 unk_07;
    /* 0x008 */ u8 unk_08;
    /* 0x009 */ u8 unk_09;
    /* 0x00a */ u8 unk_0a;
    /* 0x00b */ u8 unk_0b;
    /* 0x00c */ u8 unk_0c;
    /* 0x00d */ u8 unk_0d;
    /* 0x00e */ u8 unk_0e;
    /* 0x00f */ u8 unk_0f;
    /* 0x010 */ u8 unk_10;
    /* 0x011 */ u8 unk_11;
    /* 0x012 */ u8 unk_12;
    // aligned
    /* 0x014 */ u16 unk_14;
    /* 0x016 */ u16 unk_16;
    /* 0x018 */ u16 unk_18;
    /* 0x01a */ u16 unk_1a;
    /* 0x01c */ u16 unk_1c;
    /* 0x01e */ u16 unk_1e;
    /* 0x020 */ const u16 *unk_20;
    /* 0x024 */ u8 unk_24;
    /* 0x026 */ u16 unk_26;
    /* 0x028 */ u16 unk_28[4];
    /* 0x030 */ u8 unk_30;
    // aligned
    /* 0x032 */ u16 unk_32;
    /* 0x034 */ u16 unk_34[4];
    /* 0x03c */ const struct UnkLinkRfuStruct_02022B2C *unk_3c;
    /* 0x040 */ void (*unk_40)(u8, u8);
    /* 0x044 */ void (*unk_44)(u16);
    /* 0x048 */ u8 filler_48[8];
};

void AddTextPrinterToWindow1(const u8 *str);
bool32 MG_PrintTextOnWindow1AndWaitButton(u8 * cmdPtr, const u8 * src);
void sub_80FA190(void);
void MG_DrawCheckerboardPattern(void);
void task_add_05_task_del_08FA224_when_no_RfuFunc(void);
bool8 IsLinkRfuTaskFinished(void);
void DestroyWirelessStatusIndicatorSprite(void);
void MEvent_CreateTask_CardOrNewsWithFriend(u8);
void MEvent_CreateTask_CardOrNewsOverWireless(u8);
void MEvent_CreateTask_Leader(u8);
void sub_80F9E2C(void * data);
u8 sub_8116DE0(void);
void sub_80FBB4C(void);
void sub_80F86F4(void);
void sub_80FB128(bool32 a0);
u32 sub_80FD3A4(void);
bool32 IsSendingKeysToRfu(void);
void Rfu_set_zero(void);
u8 GetRfuPlayerCount(void);
void sub_80F9828(void);
u8 rfu_get_multiplayer_id(void);
bool8 Rfu_InitBlockSend(const void * src, u16 size);
bool8 sub_80FA0F8(u8 a0);
u8 Rfu_GetBlockReceivedStatus(void);
void Rfu_SetBlockReceivedFlag(u8 who);
void Rfu_ResetBlockReceivedFlag(u8 who);
bool8 Rfu_IsMaster(void);
void sub_80F85F8(void);
bool32 sub_80FAE94(void);
bool32 sub_80FAEF0(void);
bool32 IsRfuRecvQueueEmpty(void);
u32 GetRfuRecvQueueLength(void);
void sub_80F8DC0(void);
void sub_80FBB20(void);
bool8 sub_80FA484(bool32 a0);
void var_800D_set_xB(void);
struct UnkLinkRfuStruct_02022B14 *sub_80F9800(void);
void sub_80FCF34(void);
void InitRFU(void);

#include "mevent_server.h"
extern const struct mevent_server_cmd gMEventSrvScript_OtherTrainerCanceled[];

#endif //GUARD_LINK_RFU_H
