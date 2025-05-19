#ifndef GUARD_BAG_H
#define GUARD_BAG_H

#include "menu_helpers.h"

// windowIds
#define BAG_WIN_ITEMS_ID            0   // central main list window
#define BAG_WIN_MAIN_MSG_ID         1   // bottom MSG box
#define BAG_WIN_TITLE_ID            2   // top left pocket title

// whichWindow
#define BAG_WIN_CHOOSE_QUANTITY     0   // bottom right corner
#define BAG_WIN_MONEY               2   // top left corner
#define BAG_WIN_MSG_FULL            5   // full MSG box
#define BAG_WIN_MSG                 6   // MSG box width 14 (spares icon bottom left corner)
#define BAG_WIN_CONTEXT             10  // conctext menu with 1 element

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
