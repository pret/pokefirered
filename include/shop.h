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

#endif // GUARD_SHOP_H
