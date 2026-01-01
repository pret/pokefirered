#ifndef GUARD_ITEM_H
#define GUARD_ITEM_H

#include "constants/item.h"
#include "constants/item_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/tms_hms.h"
#include "constants/item_effects.h"
#include "constants/hold_effects.h"

/* Expands to:
 * enum
 * {
 *   ITEM_TM_FOCUS_PUNCH = ITEM_TM01,
 *   ...
 *   ITEM_HM_CUT = ITM_HM01,
 *   ...
 * }; */
#define ENUM_TM(n, id) CAT(ITEM_TM_, id) = CAT(ITEM_TM, n),
#define ENUM_HM(n, id) CAT(ITEM_HM_, id) = CAT(ITEM_HM, n),
#define TO_TMHM_NUMS(a, ...) (__VA_ARGS__)
enum TMHMItemId
{
    RECURSIVELY(R_ZIP(ENUM_TM, TO_TMHM_NUMS NUMBERS_256, (FOREACH_TM(APPEND_COMMA))))
    RECURSIVELY(R_ZIP(ENUM_HM, TO_TMHM_NUMS NUMBERS_256, (FOREACH_HM(APPEND_COMMA))))
};

#undef ENUM_TM
#undef ENUM_HM
#undef TO_TMHM_NUMS

/* Each of these TM_HM enums corresponds an index in the list of TMs + HMs item ids in
 * gTMHMItemMoveIds. The index for an item can be retrieved with GetItemTMHMIndex below.
 */
#define UNPACK_TM_HM_ENUM(_tmHm) CAT(ENUM_TM_HM_, _tmHm),
enum TMHMIndex
{
    FOREACH_TMHM(UNPACK_TM_HM_ENUM)
    NUM_ALL_MACHINES,
    NUM_TECHNICAL_MACHINES = (0 FOREACH_TM(PLUS_ONE)),
    NUM_HIDDEN_MACHINES = (0 FOREACH_HM(PLUS_ONE)),
};

#undef UNPACK_TM_HM_ENUM

enum PACKED ItemSortType
{
    ITEM_TYPE_UNCATEGORIZED,
    ITEM_TYPE_FIELD_USE,
    ITEM_TYPE_LEVEL_UP_ITEM,
    ITEM_TYPE_HEALTH_RECOVERY,
    ITEM_TYPE_STATUS_RECOVERY,
    ITEM_TYPE_PP_RECOVERY,
    ITEM_TYPE_NATURE_MINT,
    ITEM_TYPE_STAT_BOOST_DRINK,
    ITEM_TYPE_STAT_BOOST_FEATHER,
    ITEM_TYPE_STAT_BOOST_MOCHI,
    ITEM_TYPE_BATTLE_ITEM,
    ITEM_TYPE_FLUTE,
    ITEM_TYPE_X_ITEM,
    ITEM_TYPE_AUX_ITEM,
    ITEM_TYPE_EVOLUTION_STONE,
    ITEM_TYPE_EVOLUTION_ITEM,
    ITEM_TYPE_SPECIAL_HELD_ITEM,
    ITEM_TYPE_MEGA_STONE,
    ITEM_TYPE_Z_CRYSTAL,
    ITEM_TYPE_TERA_SHARD,
    ITEM_TYPE_HELD_ITEM,
    ITEM_TYPE_TYPE_BOOST_HELD_ITEM,
    ITEM_TYPE_CONTEST_HELD_ITEM,
    ITEM_TYPE_EV_BOOST_HELD_ITEM,
    ITEM_TYPE_GEM,
    ITEM_TYPE_PLATE,
    ITEM_TYPE_MEMORY,
    ITEM_TYPE_DRIVE,
    ITEM_TYPE_INCENSE,
    ITEM_TYPE_NECTAR,
    ITEM_TYPE_GROWTH,
    ITEM_TYPE_SHARD,
    ITEM_TYPE_SELLABLE,
    ITEM_TYPE_RELIC,
    ITEM_TYPE_FOSSIL,
    ITEM_TYPE_MAIL,
};

typedef void (*ItemUseFunc)(u8);

struct Item
{
    u32 price;
    u16 secondaryId;
    ItemUseFunc fieldUseFunc;
    const u8 *description;
    const u8 *effect;
    const u8 *name;
    const u8 *pluralName;
    u8 holdEffect;
    u8 holdEffectParam;
    u8 importance:2;
    u8 notConsumed:1;
    enum Pocket pocket:5;
    enum ItemSortType sortType;
    u8 type;
    u8 battleUsage;
    u8 flingPower;
    const u32 *iconPic;
    const u16 *iconPalette;
};

struct __attribute__((aligned(2))) BagPocket
{
    struct ItemSlot *itemSlots;
    u16 capacity:10;
    enum Pocket id:6;
};

struct TmHmIndexKey
{
    enum TMHMItemId itemId:16;
    u16 moveId;
};

extern const struct Item gItemsInfo[];
extern struct BagPocket gBagPockets[];
extern const struct TmHmIndexKey gTMHMItemMoveIds[];

#define UNPACK_ITEM_TO_TM_INDEX(_tm) case CAT(ITEM_TM_, _tm): return CAT(ENUM_TM_HM_, _tm) + 1;
#define UNPACK_ITEM_TO_HM_INDEX(_hm) case CAT(ITEM_HM_, _hm): return CAT(ENUM_TM_HM_, _hm) + 1;
#define UNPACK_ITEM_TO_TM_MOVE_ID(_tm) case CAT(ITEM_TM_, _tm): return CAT(MOVE_, _tm);
#define UNPACK_ITEM_TO_HM_MOVE_ID(_hm) case CAT(ITEM_HM_, _hm): return CAT(MOVE_, _hm);

static inline enum TMHMIndex GetItemTMHMIndex(u16 item)
{
    switch (item)
    {
        /* Expands to:
         * case ITEM_TM_FOCUS_PUNCH:
         *     return 1;
         * case ITEM_TM_DRAGON_CLAW:
         *      return 2;
         * etc */
        FOREACH_TM(UNPACK_ITEM_TO_TM_INDEX)
        FOREACH_HM(UNPACK_ITEM_TO_HM_INDEX)
        default:
            return 0;
    }
}

static inline u16 GetItemTMHMMoveId(u16 item)
{
    switch (item)
    {
        /* Expands to:
         * case ITEM_TM_FOCUS_PUNCH:
         *     return MOVE_FOCUS_PUNCH;
         * case ITEM_TM_DRAGON_CLAW:
         *      return MOVE_DRAGON_CLAW;
         * etc */
        FOREACH_TM(UNPACK_ITEM_TO_TM_MOVE_ID)
        FOREACH_HM(UNPACK_ITEM_TO_HM_MOVE_ID)
        default:
            return MOVE_NONE;
    }
}

#undef UNPACK_ITEM_TO_TM_INDEX
#undef UNPACK_ITEM_TO_HM_INDEX
#undef UNPACK_ITEM_TO_TM_MOVE_ID
#undef UNPACK_ITEM_TO_HM_MOVE_ID

static inline enum TMHMItemId GetTMHMItemId(enum TMHMIndex index)
{
    return gTMHMItemMoveIds[index].itemId;
}

static inline u16 GetTMHMMoveId(enum TMHMIndex index)
{
    return gTMHMItemMoveIds[index].moveId;
}

void BagPocket_SetSlotData(struct BagPocket *pocket, u32 pocketPos, struct ItemSlot newSlot);
struct ItemSlot BagPocket_GetSlotData(struct BagPocket *pocket, u32 pocketPos);

static inline void BagPocket_SetSlotItemIdAndCount(struct BagPocket *pocket, u32 pocketPos, u16 itemId, u16 quantity)
{
    BagPocket_SetSlotData(pocket, pocketPos, (struct ItemSlot) {itemId, quantity});
}

static inline u16 GetBagItemId(enum Pocket pocketId, u32 pocketPos)
{
    return BagPocket_GetSlotData(&gBagPockets[pocketId], pocketPos).itemId;
}

static inline u16 GetBagItemQuantity(enum Pocket pocketId, u32 pocketPos)
{
    return BagPocket_GetSlotData(&gBagPockets[pocketId], pocketPos).quantity;
}

static inline struct ItemSlot GetBagItemIdAndQuantity(enum Pocket pocketId, u32 pocketPos)
{
    return BagPocket_GetSlotData(&gBagPockets[pocketId], pocketPos);
}

void GetBerryCountString(u8 *dst, const u8 *berryName, u32 quantity);
u8 *CopyItemName(u16 itemId, u8 *string);
u8 *CopyItemNameHandlePlural(u16 itemId, u8 *string, u32 quantity);
bool8 IsBagPocketNonEmpty(u8 pocket);
bool8 CheckBagHasItem(u16 itemId, u16 count);
bool8 CheckBagHasSpace(u16 itemId, u16 count);
u32 GetFreeSpaceForItemInBag(u16 itemId);
bool8 RemoveBagItem(u16 itemId, u16 count);
void RemoveBagItemFromSlot(struct BagPocket *pocket, u16 slotId, u16 count);
u8 GetPocketByItemId(u16 itemId);
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
enum Pocket GetItemPocket(u16 itemId);
u8 GetItemType(u16 itemId);
ItemUseFunc GetItemFieldFunc(u16 itemId);
u8 GetItemBattleUsage(u16 itemId);
u16 GetItemSecondaryId(u16 itemId);
u32 GetItemFlingPower(u32 itemId);
void MoveItemSlotInPocket(enum Pocket pocketId, u32 from, u32 to);
void MoveItemSlotInPC(struct ItemSlot *itemSlots_, u32 from, u32 to_);
void ClearBag(void);
void ClearPCItemSlots(void);
void TrySetObtainedItemQuestLogEvent(u16 itemId);
bool8 AddBagItem(u16 itemId, u16 amount);

u16 CountTotalItemQuantityInBag(u16 item);
u8 GetItemImportance(u16 itemId);
u16 GetPCItemQuantity(u16 *);
void SetBagItemsPointers(void);

void ItemPcCompaction(void);
void RemovePCItem(u8 index, u16 count);
void CompactItemsInBagPocket(enum Pocket pocketId);
u8 CountItemsInPC(void);
bool32 HasAtLeastOneBerry(void);
bool32 HasAtLeastOnePokeBall(void);

bool32 IsItemTM(u16 itemId);
bool32 IsItemHM(u16 itemId);
bool32 IsItemTMHM(u16 itemId);

bool32 IsItemBall(u16 itemId);

const u8 *GetItemEffect(u32 itemId);
u32 GetItemStatus1Mask(u16 itemId);
bool32 ItemHasVolatileFlag(u16 itemId, enum Volatile volatile);
u32 GetItemSellPrice(u32 itemId);
bool32 IsHoldEffectChoice(enum HoldEffect holdEffect);


#endif // GUARD_ITEM_H
