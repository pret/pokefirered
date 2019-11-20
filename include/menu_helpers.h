#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "global.h"
#include "task.h"
#include "window.h"

struct YesNoFuncTable
{
    TaskFunc yesFunc;
    TaskFunc noFunc;
};

bool16 RunTextPrinters_CheckActive(u8 textPrinterId);
bool32 sub_80BF72C(void);
bool8 sub_80BF748(void);
bool8 MenuHelpers_LinkSomething(void);
void SetVBlankHBlankCallbacksToNull(void);
void ResetAllBgsCoordinatesAndBgCntRegs(void);
u8 sub_80BF8E4(void);
bool8 AdjustQuantityAccordingToDPadInput(s16 *arg0, u16 arg1);
void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 tileNum, u8 paletteNum, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc);
void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate *template, u8 fontId, u8 left, u8 top, u16 tileStart, u8 palette, const struct YesNoFuncTable *yesNo);
u8 GetLRKeysState(void);
u8 sub_80BF66C(void);
bool8 itemid_link_can_give_berry(u16 itemId);
bool8 itemid_80BF6D8_mail_related(u16 itemId);
void ClearVramOamPltt(void);

#endif //GUARD_MENU_HELPERS_H
