#ifndef GUARD_ITEM_MENU_H
#define GUARD_ITEM_MENU_H

#include "item.h"
#include "menu_helpers.h"

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
    ITEMMENULOCATION_LAST
};

enum {
    ITEMWIN_QUANTITY,
    ITEMWIN_QUANTITY_WIDE,
    ITEMWIN_MONEY,
    ITEMWIN_YESNO_LOW,
    ITEMWIN_YESNO_HIGH,
    ITEMWIN_MESSAGE,
    ITEMWIN_SELECTIONTEXT,
    ITEMWIN_ASKTOSS,
    ITEMWIN_ASKTOSS_QUANTITY,
    ITEMWIN_TOSSED,
    ITEMWIN_1x1,
    ITEMWIN_1x2,
    ITEMWIN_1x3,
    ITEMWIN_1x4,
    ITEMWIN_COUNT
};

#define ITEMMENU_SWAP_LINE_LENGTH 9
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
    u16 pocket;
    u16 cursorPosition[NUM_BAG_POCKETS_NO_CASES];
    u16 scrollPosition[NUM_BAG_POCKETS_NO_CASES];
};

extern struct BagPosition gBagPosition;

struct BagMenu
{
    void (*newScreenCallback)(void);
    u8 tilemapBuffer[BG_SCREEN_SIZE];
    u8 spriteIds[ITEMMENUSPRITE_COUNT];
    u8 windowIds[ITEMWIN_COUNT];
    u8 toSwapPos;
    u8 pocketSwitchMode:4;
    u8 itemIconSlot:2;
    u8 inhibitItemDescriptionPrint:1;
    u8 hideCloseBagText:1;
    u16 contextMenuSelectedItem;
    u8 pocketScrollArrowsTask;
    u8 pocketSwitchArrowsTask;
    const u8 *contextMenuItemsPtr;
    u8 contextMenuItemsBuffer[4];
    u8 contextMenuNumItems;
    u8 numItemStacks[NUM_BAG_POCKETS_NO_CASES];
    u8 numShownItems[NUM_BAG_POCKETS_NO_CASES];
    s16 graphicsLoadState;
};

extern struct BagMenu *gBagMenu;
extern u16 gSpecialVar_ItemId;

// Exported ROM declarations
void ResetBagScrollPositions(void);
void InitPokedudeBag(u8);
void CB2_BagMenuFromStartMenu(void);
void MoveItemSlotInList(struct ItemSlot *itemSlots_, u32 from, u32 to_);
void Task_FadeAndCloseBagMenu(u8 taskId);
void ItemMenu_SetExitCallback(void (*)(void));
void DisplayItemMessage(u8 taskId, u8 fontId, const u8 *str, void (*callback)(u8 taskId));
void CloseItemMessage(u8 taskId);
void CB2_BagMenuFromBattle(void);
void InitOldManBag(void);
void UpdatePocketItemList(u8 pocketId);
void UpdatePocketListPosition(u8 pocketId);
void GoToBagMenu(u8 menuType, u8 pocket, MainCallback callback);
bool8 UseRegisteredKeyItemOnField(void);
void CB2_ChooseBerry(void);
void CB2_ChooseMulch(void);

void BagDrawDepositItemTextBox(void);
u8 GetBagWindow(u8 whichWindow);
void BagMenu_YesNo(u8 taskId, u8 windowType, const struct YesNoFuncTable *funcTable);
void BagDrawTextBoxOnWindow(u8 windowId);

#endif //GUARD_ITEM_MENU_H
