#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

#include "global.h"
#include "task.h"
#include "window.h"

#define MENU_L_PRESSED 1
#define MENU_R_PRESSED 2

#define SWAP_LINE_HAS_MARGIN (1 << 7)

enum {
    TAG_BAG_GFX = 100,
    TAG_SWAP_LINE,
    TAG_ITEM_ICON,
    TAG_ITEM_ICON_ALT,
};

struct YesNoFuncTable
{
    TaskFunc yesFunc;
    TaskFunc noFunc;
};

void ResetAllBgsCoordinates(void);
bool16 RunTextPrintersRetIsActive(u8 textPrinterId);
bool8 IsActiveOverworldLinkBusy(void);
bool8 MenuHelpers_IsLinkActive(void);
bool8 MenuHelpers_ShouldWaitForLinkRecv(void);
void SetCursorWithinListBounds(u16 *scrollOffset, u16 *cursorPos, u8 maxShownItems, u8 totalItems);
void SetCursorScrollWithinListBounds(u16 *scrollOffset, u16 *cursorPos, u8 shownItems, u8 totalItems, u8 maxShownItems);
void SetVBlankHBlankCallbacksToNull(void);
u8 GetDialogBoxFontId(void);
bool8 AdjustQuantityAccordingToDPadInput(s16 *quantity_p, u16 qmax);
void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 tileNum, u8 paletteNum, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc);
void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate *template, u8 fontId, u8 left, u8 top, u16 tileStart, u8 palette, const struct YesNoFuncTable *yesNo);
u8 GetLRKeysPressed(void);
u8 GetLRKeysPressedAndHeld(void);
bool8 IsHoldingItemAllowed(u16 itemId);
bool8 IsWritingMailAllowed(u16 itemId);
void ResetVramOamAndBgCntRegs(void);
void LoadListMenuSwapLineGfx(void);
void CreateSwapLineSprites(u8 *spriteIds, u8 count);
void SetSwapLineSpritesInvisibility(u8 *spriteIds, u8 count, bool8 invisible);
void UpdateSwapLineSpritesPos(u8 *spriteIds, u8 count, s16 x, u16 y);

#endif //GUARD_MENU_HELPERS_H
