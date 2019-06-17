#ifndef GUARD_ITEM_MENU_ICONS
#define GUARD_ITEM_MENU_ICONS

#include "global.h"

void ResetItemMenuIconState(void);
void sub_80985E4(void);
u8 sub_80D511C(u8 a0, u8 a1, u8 a2, u8 a3);
void DestroyItemMenuIcon(bool8 a0);
void CreateItemMenuIcon(u16 itemId, bool8 a0);
void sub_80986A8(s16 x, u16 y);
void sub_8098660(u8);

#endif // GUARD_ITEM_MENU_ICONS
