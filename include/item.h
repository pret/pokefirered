#ifndef GUARD_ITEM_H
#define GUARD_ITEM_H

#include "constants/item.h"
#include "constants/items.h"
#include "constants/tms_hms.h"

typedef void (*ItemUseFunc)(u8);

struct Item
{
    u32 price;
    u16 secondaryId;
    ItemUseFunc fieldUseFunc;
    const u8 *description;
    const u8 *effect;
    u8 name[ITEM_NAME_LENGTH];
    u8 pluralName[ITEM_NAME_PLURAL_LENGTH];
    u8 holdEffect;
    u8 holdEffectParam;
    u8 importance:2;
    u8 notConsumed:1;
    u8 padding:5;
    u8 pocket;
    u8 type;
    u8 battleUsage;
    u8 flingPower;
    const u32 *iconPic;
    const u16 *iconPalette;
};

struct BagPocket
{
    struct ItemSlot *itemSlots;
    u8 capacity;
};

extern const struct Item gItemsInfo[];
extern struct BagPocket gBagPockets[];

void GetBerryCountString(u8 *dst, const u8 *berryName, u32 quantity);
u8 *CopyItemName(u16 itemId, u8 *string);
u8 *CopyItemNameHandlePlural(u16 itemId, u8 *string, u32 quantity);
bool8 IsBagPocketNonEmpty(u8 pocket);
bool8 CheckBagHasItem(u16 itemId, u16 count);
bool8 CheckBagHasSpace(u16 itemId, u16 count);
u32 GetFreeSpaceForItemInBag(u16 itemId);
bool8 RemoveBagItem(u16 itemId, u16 count);
u8 GetPocketByItemId(u16 itemId);
void ClearItemSlots(struct ItemSlot *itemSlots, u8 b);
u8 CountUsedPCItemSlots(void);
bool8 CheckPCHasItem(u16 itemId, u16 count);
bool8 AddPCItem(u16 itemId, u16 count);
void SwapRegisteredBike(void);
const u8 *GetItemName(u16 itemId);
u32 GetItemPrice(u16 itemId);
u8 GetItemHoldEffect(u16 itemId);
u8 GetItemHoldEffectParam(u16 itemId);
const u8 *GetItemDescription(u16 itemId);
u8 GetItemImportance(u16 itemId);
u8 GetItemConsumability(u16 itemId);
u8 GetItemPocket(u16 itemId);
u8 GetItemType(u16 itemId);
ItemUseFunc GetItemFieldFunc(u16 itemId);
u8 GetItemBattleUsage(u16 itemId);
u16 GetItemSecondaryId(u16 itemId);
u32 GetItemFlingPower(u32 itemId);
void ClearBag(void);
void ClearPCItemSlots(void);
void TrySetObtainedItemQuestLogEvent(u16 itemId);
bool8 AddBagItem(u16 itemId, u16 amount);

void SortPocketAndPlaceHMsFirst(struct BagPocket * pocket);
u16 BagGetItemIdByPocketPosition(u8 pocketId, u16 itemId);
u16 BagGetQuantityByPocketPosition(u8 pocketId, u16 itemId);
u16 BagGetQuantityByItemId(u16 item);
u8 GetItemImportance(u16 itemId);
void BagPocketCompaction(struct ItemSlot * slots, u8 capacity);
u16 GetPcItemQuantity(u16 *);
void SetBagPocketsPointers(void);

void ItemPcCompaction(void);
void RemovePCItem(u16 itemId, u16 quantity);
void CompactItemsInBagPocket(struct BagPocket * pocket);
u8 CountItemsInPC(void);
bool8 HasAtLeastOneBerry(void);
bool8 HasAtLeastOnePokeBall(void);

bool8 IsItemTM(u16 itemId);
bool8 IsItemHM(u16 itemId);
bool8 IsItemTMHM(u16 itemId);

bool8 IsItemBall(u16 itemId);

const u8 *GetItemEffect(u32 itemId);
u32 GetItemStatus1Mask(u16 itemId);
u32 GetItemStatus2Mask(u16 itemId);

/* Expands to:
 * enum
 * {
 *   ITEM_TM_FOCUS_PUNCH,
 *   ...
 *   ITEM_HM_CUT,
 *   ...
 * }; */
#define ENUM_TM(id) CAT(ITEM_TM_, id),
#define ENUM_HM(id) CAT(ITEM_HM_, id),
enum
{
    ENUM_TM_START_ = ITEM_TM01 - 1,
    FOREACH_TM(ENUM_TM)

    ENUM_HM_START_ = ITEM_HM01 - 1,
    FOREACH_HM(ENUM_HM)
};
#undef ENUM_TM
#undef ENUM_HM

#endif // GUARD_ITEM_H
