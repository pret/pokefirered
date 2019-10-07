#ifndef GUARD_LINK_RFU_H
#define GUARD_LINK_RFU_H

struct Padded_U8
{
    u8 value;
};

void AddTextPrinterToWindow1(const u8 *str);
bool32 MG_PrintTextOnWindow1AndWaitButton(u8 * cmdPtr, const u8 * src);
void sub_80FA190(void);
void MG_DrawCheckerboardPattern(void);
void task_add_05_task_del_08FA224_when_no_RfuFunc(void);
bool8 IsRfuTaskFinished(void);
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

#endif //GUARD_LINK_RFU_H
