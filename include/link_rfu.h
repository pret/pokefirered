#ifndef GUARD_LINK_RFU_H
#define GUARD_LINK_RFU_H

#include "global.h"
#include "librfu.h"

// RfuTgtData.gname is read as these structs.
struct GFtgtGnameSub
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

struct __attribute__((packed, aligned(2))) GFtgtGname
{
    struct GFtgtGnameSub unk_00;
    u8 unk_04[4];
    u16 species:10;
    u16 type:6;
    u8 unk_0a_0:7;
    u8 unk_0a_7:1;
    u8 playerGender:1;
    u8 level:7;
    u8 unk_0c;
};

struct Padded_U8
{
    u8 value;
};

struct UnkLinkRfuStruct_02022B2C
{
    u8 maxMFrame;
    u8 mcTimer;
    u16 availSlotFlag;
    u8 mbootFlag;
    u16 serialNo;
    struct GFtgtGname *gname;
    u8 *uname;
    u8 unk_10;
    u8 unk_11;
    u16 unk_12;
    u16 unk_14;
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
    /* 0x028 */ u16 unk_28[RFU_CHILD_MAX];
    /* 0x030 */ u8 unk_30;
    // aligned
    /* 0x032 */ u16 unk_32;
    /* 0x034 */ u16 unk_34[RFU_CHILD_MAX];
    /* 0x03c */ const struct UnkLinkRfuStruct_02022B2C *unk_3c;
    /* 0x040 */ void (*unk_40)(u8, u8);
    /* 0x044 */ void (*unk_44)(u16);
};

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

struct UnkRfuStruct_2_Sub_124
{
    /* 0x000 */ u8 unk_00[20][70];
    /* 0x578 */ vu8 unk_8c0;
    /* 0x579 */ vu8 unk_8c1;
    /* 0x57a */ vu8 unk_8c2;
    /* 0x57b */ vu8 unk_8c3;
};

struct UnkRfuStruct_2_Sub_9e8
{
    /* 0x000 */ u8 unk_00[40][14];
    /* 0x230 */ vu8 unk_230;
    /* 0x231 */ vu8 unk_231;
    /* 0x232 */ vu8 unk_232;
    /* 0x233 */ vu8 unk_233;
};

struct UnkRfuStruct_2_Sub_c1c
{
    /* 0x00 */ u8 unk_00[2][14];
    /* 0x1c */ vu8 unk_1c;
    /* 0x1d */ vu8 unk_1d;
    /* 0x1e */ vu8 unk_1e;
};

struct UnkRfuStruct_Sub_Unused
{
    /* 0x000 */ u8 unk_00[2][256];
    /* 0x200 */ vu8 unk_200;
    /* 0x201 */ vu8 unk_201;
    /* 0x202 */ vu8 unk_202;
    /* 0x203 */ vu8 unk_203;
};

struct UnkRfuStruct_2
{
    /* 0x000 */ void (*RfuFunc)(void);
    /* 0x004 */ u16 unk_04;
    /* 0x006 */ u8 filler_06[4];
    /* 0x00a */ u16 unk_0a;
    /* 0x00c */ u8 unk_0c; // parentChildMode?
    /* 0x00d */ u8 playerCount;
    /* 0x00e */ u8 unk_0e;
    /* 0x00f */ u8 unk_0f;
    /* 0x010 */ u16 unk_10;
    /* 0x012 */ u16 unk_12;
    /* 0x014 */ u8 unk_14[RFU_CHILD_MAX][14];
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
    /* 0x104 */ struct RfuTgtData unk_104;
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
    /* 0x996 */ u8 unk_cde[RFU_CHILD_MAX];
    /* 0x99a */ u8 unk_ce2;
    /* 0x99b */ u8 unk_ce3;
    /* 0x99c */ u8 unk_ce4;
    /* 0x99d */ u8 unk_ce5;
    /* 0x99e */ u8 unk_ce6;
    /* 0x99f */ u8 unk_ce7;
    /* 0x9a0 */ bool8 unk_ce8;
    /* 0x9a1 */ u8 unk_ce9;
    /* 0x9a2 */ u8 unk_cea[RFU_CHILD_MAX];
    /* 0x9a6 */ u8 unk_cee[RFU_CHILD_MAX];
}; // size: 0x9AC

extern struct UnkRfuStruct_1 gUnknown_3005E10;
extern struct GFtgtGname gHostRFUtgtGnameBuffer;
extern u8 gHostRFUtgtUnameBuffer[];

void AddTextPrinterToWindow1(const u8 *str);
bool32 MG_PrintTextOnWindow1AndWaitButton(u8 * cmdPtr, const u8 * src);
void LinkRfu_FatalError(void);
void MG_DrawCheckerboardPattern(void);
void task_add_05_task_del_08FA224_when_no_RfuFunc(void);
bool8 IsLinkRfuTaskFinished(void);
void DestroyWirelessStatusIndicatorSprite(void);
void MEvent_CreateTask_CardOrNewsWithFriend(u32 arg0);
void MEvent_CreateTask_CardOrNewsOverWireless(u32 arg0);
void MEvent_CreateTask_Leader(u32 arg0);
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
u8 LinkRfu_GetMultiplayerId(void);
bool32 Rfu_InitBlockSend(const u8 * src, size_t size);
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
struct GFtgtGname *sub_80F9800(void);
void UpdateWirelessStatusIndicatorSprite(void);
void InitRFU(void);
void sub_80FEB14(void);
bool32 sub_80FBA00(void);

void sub_80FC478(struct UnkRfuStruct_2_Sub_124 *ptr);
void sub_80FC4D4(struct UnkRfuStruct_2_Sub_9e8 *ptr);

void sub_80FD4B0(const struct UnkLinkRfuStruct_02022B2C *unk0);
u8 sub_80FD538(u8 r5, u16 r7, u16 r8, const u16 *r6);
void sub_80FD760(bool8 a0);
void sub_80FEA10(void (*func)(u16));
void sub_80FB9E4(u8 a0, u16 a1);
u8 sub_80FB9F4(void);
void LinkRfu_REQ_SendData_HandleParentRelationship(bool8 clockChangeFlag);
void sub_80FC588(struct UnkRfuStruct_2_Sub_124 *q1, u8 *q2);
void sub_80FD52C(void);
u8 sub_80FD610(u16 parentId, u16 unk_1a);
bool8 sub_80FC79C(struct UnkRfuStruct_2_Sub_9e8 *q1, u8 *q2);
bool8 sub_80FC888(struct UnkRfuStruct_2_Sub_c1c *q1, u8 *q2);
void sub_80FC828(struct UnkRfuStruct_2_Sub_c1c *q1, const u8 *q2);
bool8 sub_80FC6E8(struct UnkRfuStruct_2_Sub_124 * a0, u8 *a1);
void sub_80FC63C(struct UnkRfuStruct_2_Sub_9e8 * a0, u8 *a1);
u8 sub_80FEA34(u8 a0, u16 a1);
void sub_80FDA30(u32 a0);
void InitHostRFUtgtGname(struct GFtgtGname *data, u8 activity, bool32 r2, s32 r3);
void LinkRfu_syncVBlank_(void);
s32 sub_80FD430(void (*func1)(u8, u8), void (*func2)(u16));
void sub_80FEB3C(void);
void sub_80FAFE0(u8 a0);
bool32 sub_80FA44C(u32 a0);
bool8 sub_80FC1B0(void);
bool8 sub_80F8F40(void);
void sub_80F8F5C(void);
bool32 sub_80FA5D4(void);
bool32 sub_80FC1CC(void);
bool32 sub_80F8F7C(bool32 a0);
bool32 sub_80FA634(u16 a0, const u8 *a1);
void sub_80FA670(u8 a0, u16 a1, const u8 *a2);
u32 sub_80FA6FC(u16 a0, const u8 *a1);
void SetHostRFUtgtGname(u8 a0, u32 a1, u32 a2);
void sub_80FBB8C(u32 a0);
void sub_80FBD4C(const u8 *ptr, u16 a1);
void LinkRfu3_SetGnameUnameFromStaticBuffers(struct GFtgtGname *gname, u8 *uname);
void sub_80FBBD8(void);
void sub_80FA6BC(void);
void sub_80FBF54(const u8 *src, u16 trainerId);
void sub_80FB008(u8 a0, u32 a1, u32 a2);
void RecordMixTrainerNames(void);
void sub_80F8CFC();
void sub_80F8D14();
void sub_80FAF74(bool32 a0, bool32 a1);
void ClearAndInitHostRFUtgtGname(void);
void sub_80F8FA0(void);
void sub_80FAFA0(u32 type, u32 species, u32 level);
bool32 sub_80FBB0C(void);
void sub_80FBC00(void);
void sub_80FBD6C(u32 a0);
void sub_80FC114(const u8 *name, struct GFtgtGname *structPtr, u8 a2);
bool32 PlayerHasMetTrainerBefore(u16 id, u8 *name);
bool8 sub_80FCC3C(struct GFtgtGname *gname, u8 *uname, u8 idx);
bool8 sub_80FCCF4(struct GFtgtGname *gname, u8 *uname, u8 idx);
bool32 GetRfuUnkCE8(void);
void sub_80FA4A8(void);
void sub_80FB9D0(void);
void sub_80FB030(u32 a0);

#include "mevent_server.h"
extern const struct mevent_server_cmd gMEventSrvScript_OtherTrainerCanceled[];

#endif //GUARD_LINK_RFU_H
