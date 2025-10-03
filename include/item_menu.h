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

//bag sort
enum BagSortOptions
{
    SORT_ALPHABETICALLY,
    SORT_BY_TYPE,
    SORT_BY_AMOUNT, //greatest->least
    SORT_BY_INDEX,
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
    u16 cursorPosition[POCKETS_COUNT_NO_CASES];
    u16 scrollPosition[POCKETS_COUNT_NO_CASES];
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
    u8 numItemStacks[POCKETS_COUNT_NO_CASES];
    u8 numShownItems[POCKETS_COUNT_NO_CASES];
    s16 graphicsLoadState;
};

extern struct BagMenu *gBagMenu;
extern u16 gSpecialVar_ItemId;

void CB2_BagMenuFromBattle(void);
void UpdatePocketListPosition(enum Pocket pocketId);
void CB2_BagMenuFromStartMenu(void);
bool8 UseRegisteredKeyItemOnField(void);
void GoToBagMenu(u8 menuType, u8 pocket, MainCallback callback);
void ResetBagScrollPositions(void);
void CB2_ChooseBerry(void);
void CB2_ChooseMulch(void);
void Task_FadeAndCloseBagMenu(u8 taskId);
void BagMenu_YesNo(u8 taskId, u8 windowType, const struct YesNoFuncTable *funcTable);
void UpdatePocketItemList(enum Pocket pocketId);
void DisplayItemMessage(u8 taskId, u8 fontId, const u8 *str, void (*callback)(u8 taskId));
void CloseItemMessage(u8 taskId);
void SortItemsInBag(struct BagPocket *pocket, enum BagSortOptions type);

void InitPokedudeBag(u8);
void ItemMenu_SetExitCallback(void (*)(void));
void InitOldManBag(void);

#endif //GUARD_ITEM_MENU_H
