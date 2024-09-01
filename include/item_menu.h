#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "global.h"
#include "task.h"
#include "constants/item_menu.h"

// Exported type declarations

// Exported RAM declarations

struct BagStruct
{
    MainCallback bagCallback;
    u8 location;
    bool8 bagOpen;
    u16 pocket;
    u16 itemsAbove[NUM_BAG_POCKETS_NO_CASES];
    u16 cursorPos[NUM_BAG_POCKETS_NO_CASES];
};

extern struct BagStruct gBagMenuState;

extern u16 gSpecialVar_ItemId;

// Exported ROM declarations
void CB2_SetUpReshowBattleScreenAfterMenu(void);
void ResetBagCursorPositions(void);
void InitPokedudeBag(u8);
void CB2_BagMenuFromStartMenu(void);
void MoveItemSlotInList(struct ItemSlot * itemSlots_, u32 from, u32 to_);
void ItemMenu_StartFadeToExitCallback(u8 taskId);
void Bag_BeginCloseWin0Animation(void);
void ItemMenu_SetExitCallback(void (*)(void));
void DisplayItemMessageInBag(u8 taskId, u8 fontId, const u8 * string, TaskFunc followUpFunc);
void Task_ReturnToBagFromContextMenu(u8 taskId);
void CB2_BagMenuFromBattle(void);
void InitOldManBag(void);
void Pocket_CalculateNItemsAndMaxShowed(u8 pocketId);
void PocketCalculateInitialCursorPosAndItemsAbove(u8 pocketId);
void GoToBagMenu(u8 menuType, u8 pocket, MainCallback callback);
bool8 UseRegisteredKeyItemOnField(void);

#endif //GUARD_ITEM_MENU_H
