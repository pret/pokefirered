#ifndef GUARD_BAG_H
#define GUARD_BAG_H

#include "menu_helpers.h"

#define BAG_WIN_ITEMS_ID            0   // central main list window
#define BAG_WIN_MSG_ID              1   // bottom MSG box
#define BAG_WIN_TITLE_ID            2   // top left pocket title

// whichWindow indexes
#define BAG_WIN_CHOOSE_QUANTITY     0   // bottom right corner
#define BAG_WIN_BUY_QUANTITY        1   // popup when buying or selling quantities
#define BAG_WIN_MONEY               2   // top left corner
#define BAG_WIN_CHOOSE_QUANTITY2    3   // unused
#define BAG_WIN_4                   4   // unused
#define BAG_WIN_MSG_W26             5   // whole MSG box
#define BAG_WIN_MSG_W14             6   // MSG box width 14 (spares icon bottom left corner)
#define BAG_WIN_MSG_W15             7   // MSG box width 15
#define BAG_WIN_MSG_W16             8   // MSG box width 16
#define BAG_WIN_MSG_W23             9   // MSG box width 23
#define BAG_WIN_CONTEXT_H2          10  // conctext menu with 1 element
#define BAG_WIN_CONTEXT_H4          11  // conctext menu with 2 elements
#define BAG_WIN_CONTEXT_H6          12  // conctext menu with 3 elements
#define BAG_WIN_CONTEXT_H8          13  // conctext menu with 4 elements

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
