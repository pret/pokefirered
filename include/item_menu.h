#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "global.h"
#include "task.h"

// Exported type declarations

// Exported RAM declarations

struct BagStruct
{
    void (*bagCallback)(void);
    u8 location;
    u8 pocket;
    u16 unk6;
    u16 itemsAbove[3];
    u16 cursorPos[3];
};

extern struct BagStruct gUnknown_203ACFC;

extern u16 gSpecialVar_ItemId;

// Exported ROM declarations
void sub_81AAC50(void);
void sub_81AAC70(void);
void CB2_SetUpReshowBattleScreenAfterMenu(void);
void sub_81089BC(void);
void sub_810B108(u8);
void CB2_BagMenuFromStartMenu(void);
void ItemMenu_MoveItemSlotToNewPositionInArray(struct ItemSlot * slots, int pos1, int pos2);
void ItemMenu_StartFadeToExitCallback(u8 taskId);
void sub_8108CB4(void);
void ItemMenu_SetExitCallback(void (*)(void));
void DisplayItemMessageInBag(u8 taskId, u8 bgId, const u8 * string, TaskFunc followUpFunc);
void sub_810A1F8(u8 taskId);
void sub_8107ECC(void);
void sub_810AF74(void);
void sub_8108DC8(u8 pocketId);
void sub_81089F4(u8 pocketId);
void GoToBagMenu(u8 menuType, u8 pocket, MainCallback callback);

#endif //GUARD_ITEM_MENU_H
