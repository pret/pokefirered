#ifndef GUARD_SHOP_H
#define GUARD_SHOP_H

#include "global.h"
#include "menu_helpers.h"

enum {
    SHOP_TEXTCOLOR_WHITE,
    SHOP_TEXTCOLOR_DARKGRAY,
    SHOP_TEXTCOLOR_LIGHTGRAY,
};

enum {
    QL_SHOPACTION_NULL,
    QL_SHOPACTION_BUY,
    QL_SHOPACTION_SELL,
};

enum {
    BUYWINID_MONEYBOX,
    BUYWINID_BAGQUANT,
    BUYWINID_MSGBOX,
    BUYWINID_BUYPRICEANDQUANTITY,
    BUYWINID_LISTMENU,
    BUYWINID_ITEMDESCRIPTION,
    BUYWINID_TMHMMOVE,
};

void CreatePokemartMenu(const u16 *itemsForSale);
void CreateDecorationShop1Menu(const u16 *);
void CreateDecorationShop2Menu(const u16 *);
u8 MartGetContextFontId(void);

// mode: 0 = inactive, 1 = buy, 2 = sell
void RecordItemPurchase(u16 item, u16 quantity, u8 mode);

// buy_menu_helper
void BuyMenuInitWindows(bool32 isSellingTM);
void BuyMenuDrawMoneyBox(void);
void BuyMenuPrint(u8 windowId, u8 font, const u8 *text, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 color);
void BuyMenuDisplayMessage(u8 taskId, const u8 *text, TaskFunc callback);
void BuyMenuQuantityBoxNormalBorder(u8 windowId, bool8 copyToVram);
void BuyMenuQuantityBoxThinBorder(u8 windowId, bool8 copyToVram);
void BuyMenuConfirmPurchase(u8 taskId, const struct YesNoFuncTable *yesNo);

#endif // GUARD_SHOP_H
