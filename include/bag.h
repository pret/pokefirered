#ifndef GUARD_BAG_H
#define GUARD_BAG_H

#include "menu_helpers.h"

void LoadBagMenuTextWindows(void);
void BagPrintTextOnWindow(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
void BagPrintTextOnWin1CenteredColor0(const u8 * str, u8 unused);
void BagDrawDepositItemTextBox(void);
u32 ShowBagWindow(u32 whichWindow);
void BagMenu_RemoveWindow(u8 whichWindow);
u8 OpenBagWindow(u8 whichWindow);
void CloseBagWindow(u8 whichWindow);
u8 GetBagWindow(u8 whichWindow);
void BagMenu_YesNo(u8 taskId, u8 windowType, const struct YesNoFuncTable *funcTable);
void BagPrintMoneyAmount(void);
void BagDrawTextBoxOnWindow(u8 windowId);

#endif //GUARD_BAG_H
