#ifndef GUARD_SHOP_H
#define GUARD_SHOP_H

#include "global.h"

extern EWRAM_DATA struct ItemSlot gUnknown_02039F80[3];

void CreatePokemartMenu(const u16 *);
void CreateDecorationShop1Menu(const u16 *);
void CreateDecorationShop2Menu(const u16 *);
void sub_809C09C(u16, u16, u8);

#endif // GUARD_SHOP_H
