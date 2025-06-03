#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "global.h"
#include "task.h"
#include "constants/item.h"

enum {
    ITEMMENULOCATION_FIELD,
    ITEMMENULOCATION_PARTY,
    ITEMMENULOCATION_SHOP,
    ITEMMENULOCATION_ITEMPC,
    ITEMMENULOCATION_PCBOX,
    ITEMMENULOCATION_BATTLE,
    ITEMMENULOCATION_OLD_MAN,
    ITEMMENULOCATION_TTVSCR_STATUS,
    ITEMMENULOCATION_TTVSCR_CATCHING,
    ITEMMENULOCATION_TTVSCR_REGISTER,
    ITEMMENULOCATION_TTVSCR_TMS,
    ITEMMENULOCATION_BERRY_TREE_MULCH,
    ITEMMENULOCATION_LAST,
};

#define ITEMMENU_SWAP_LINE_LENGTH 9
// Indexes for gItemMenuIconSpriteIds
enum {
    ITEMMENUSPRITE_BAG,
    ITEMMENUSPRITE_SWAP_LINE,
    ITEMMENUSPRITE_ITEM = ITEMMENUSPRITE_SWAP_LINE + ITEMMENU_SWAP_LINE_LENGTH,
    ITEMMENUSPRITE_ITEM_ALT,
    ITEMMENUSPRITE_COUNT
};

struct BagPosition
{
    void (*exitCallback)(void);
    u8 location;
    bool8 bagOpen;
    u16 pocket;
    u16 cursorPosition[NUM_BAG_POCKETS_NO_CASES];
    u16 scrollPosition[NUM_BAG_POCKETS_NO_CASES];
};

extern struct BagPosition gBagPosition;

struct BagMenu
{
    void (*newScreenCallback)(void);
    u8 tilemapBuffer[BG_SCREEN_SIZE];
    u8 itemOriginalLocation;
    u8 pocketSwitchMode:4;
    u8 itemMenuIcon:2;
    u8 inhibitItemDescriptionPrint:2;
    u16 contextMenuSelectedItem;
    u8 pocketScrollArrowsTask;
    u8 pocketSwitchArrowsTask;
    u8 nItems[NUM_BAG_POCKETS_NO_CASES];
    u8 maxShowed[NUM_BAG_POCKETS_NO_CASES];
    u8 data[4];
};

extern u8 gItemMenuIconSpriteIds[ITEMMENUSPRITE_COUNT];

extern u16 gSpecialVar_ItemId;

// Exported ROM declarations
void SetBagOpenFalse(void);
void ResetBagCursorPositions(void);
void InitPokedudeBag(u8);
void CB2_BagMenuFromStartMenu(void);
void MoveItemSlotInList(struct ItemSlot * itemSlots_, u32 from, u32 to_);
void Task_FadeAndCloseBagMenu(u8 taskId);
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
void CB2_ChooseBerry(void);
void CB2_ChooseMulch(void);

#endif //GUARD_ITEM_MENU_H
