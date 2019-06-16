#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "global.h"
#include "task.h"

// Exported type declarations

struct YesNoFuncTable {
    TaskFunc yesFunc;
    TaskFunc noFunc;
};

// Exported RAM declarations

// Exported ROM declarations

void sub_812225C(u16 *, u16 *, u8, u8);
void sub_8122298(u16 *, u16 *, u8, u8, u8);
void sub_8121F68(u8 taskId, const struct YesNoFuncTable *data);
bool8 sub_81221AC(void);
bool16 sub_80BF518(u8 textPrinterId);
bool8 sub_80BF72C(void);
bool8 sub_80BF708(void);
void VblankHblankHandlerSetZero(void);
void InitBgReg(void);
u8 sub_80BF8E4(void);
u8 sub_80BF848(s16 * a0, u16 a1);
void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 arg2, u8 arg3, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc);
void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate * unk1, u8 unk2, u8 unk3, u8 unk4, u8 unk5, u8 unk6, const struct YesNoFuncTable *ptrs);

#endif //GUARD_MENU_HELPERS_H
