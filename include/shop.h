#ifndef GUARD_SHOP_H
#define GUARD_SHOP_H

#include "global.h"
#include "menu_helpers.h"

#define INDEX_CANCEL -2

void CreatePokemartMenu(const u16 *itemsForSale);
void CreateDecorationShop1Menu(const u16 *);
void CreateDecorationShop2Menu(const u16 *);
u8 GetMartFontId(void);
void RecordItemTransaction(u16 itemId, u16 quantity, u8 logEventId);

// buy_menu_helper
void BuyMenuInitWindows(bool32 isSellingTM);
void BuyMenuDrawMoneyBox(void);
void BuyMenuPrint(u8 windowId, u8 font, const u8 *text, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 color);
void BuyMenuDisplayMessage(u8 taskId, const u8 *text, TaskFunc callback);
void BuyMenuQuantityBoxNormalBorder(u8 windowId, bool8 copyToVram);
void BuyMenuQuantityBoxThinBorder(u8 windowId, bool8 copyToVram);
void BuyMenuConfirmPurchase(u8 taskId, const struct YesNoFuncTable *yesNo);

#endif // GUARD_SHOP_H
