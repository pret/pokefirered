#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

struct BagStruct
{
    void (*bagCallback)(void);
    u8 location;
    u8 pocket;
    u16 unk6;
    u8 cursorPosition[6];
    u8 scrollPosition[6];
};

extern struct BagStruct gUnknown_203ACFC;

extern u16 gSpecialVar_ItemId;

// Exported ROM declarations
void sub_81AAC50(void);
void sub_81AAC70(void);
void sub_8108CF0(void);
void sub_810B108(u8);
void UseFameCheckerFromMenu(void);
void sub_8108D60(struct ItemSlot * slots, int pos1, int pos2);

#endif //GUARD_ITEM_MENU_H
