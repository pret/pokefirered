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
bool8 IsNoOneConnected(void);
void DestroyWirelessStatusIndicatorSprite(void);
void MEvent_CreateTask_CardOrNewsWithFriend(u8);
void MEvent_CreateTask_CardOrNewsOverWireless(u8);
void MEvent_CreateTask_Leader(u8);
void sub_80F9E2C(void * data);
u8 sub_8116DE0(void);

#endif //GUARD_LINK_RFU_H
