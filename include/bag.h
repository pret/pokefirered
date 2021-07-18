#ifndef GUARD_BAG_H
#define GUARD_BAG_H

#include "menu_helpers.h"

enum {
    BAG_COLOR_WHITE,
    BAG_COLOR_DK_GRAY,
    BAG_COLOR_LT_GRAY,
    BAG_COLOR_BLUE,
    BAG_COLOR_HIDE = 0xFF,
};

enum {
    BAG_WINDOW_MAIN_LIST,
    BAG_WINDOW_ITEM_DESC,
    BAG_WINDOW_HEADER,
    BAG_WINDOW_STATIC_COUNT,

    BAG_WINDOW_DEPOSIT_QUANTITY = 0,
    BAG_WINDOW_MONEY_BOX = BAG_WINDOW_DEPOSIT_QUANTITY + 2,
    BAG_WINDOW_YESNO_BOTTOM,
    BAG_WINDOW_YESNO_TOP,
    BAG_WINDOW_MSGBOX,
    BAG_WINDOW_DEPOSIT_ITEM_MSG = BAG_WINDOW_MONEY_BOX + 4,
    BAG_WINDOW_CONTEXT_MENU = BAG_WINDOW_DEPOSIT_ITEM_MSG + 4,
    BAG_WINDOW_DYNAMIC_COUNT,
};

void InitBagWindows(void);
void BagPrintTextOnWindow(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
void BagPrintTextOnWin1CenteredColor0(const u8 * str, u8 unused);
void BagDrawDepositItemTextBox(void);
u8 ShowBagWindow(u8 whichWindow, u8 nItems);
void HideBagWindow(u8 whichWindow);
u8 OpenBagWindow(u8 whichWindow);
void CloseBagWindow(u8 whichWindow);
u8 GetBagWindow(u8 whichWindow);
void BagCreateYesNoMenuBottomRight(u8 taskId, const struct YesNoFuncTable * ptrs);
void BagCreateYesNoMenuTopRight(u8 taskId, const struct YesNoFuncTable * ptrs);
void BagPrintMoneyAmount(void);
void BagDrawTextBoxOnWindow(u8 windowId);

#endif //GUARD_BAG_H
