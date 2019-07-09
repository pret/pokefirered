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
bool16 RunTextPrinters_CheckActive(u8 textPrinterId);
bool8 sub_80BF72C(void);
bool8 MenuHelpers_LinkSomething(void);
void SetVBlankHBlankCallbacksToNull(void);
void ResetAllBgsCoordinatesAndBgCntRegs(void);
u8 sub_80BF8E4(void);
u8 AdjustQuantityAccordingToDPadInput(s16 * a0, u16 a1);
void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 arg2, u8 arg3, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc);
void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate *template, u8 arg2, u8 arg3, u8 arg4, u16 tileStart, u8 palette, const struct YesNoFuncTable *yesNo);
u8 GetLRKeysState(void);
u8 sub_80BF66C(void);

#endif //GUARD_MENU_HELPERS_H
