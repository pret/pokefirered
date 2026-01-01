#include "global.h"
#include "gflib.h"
#include "berry.h"
#include "event_data.h"
#include "graphics.h"
#include "item.h"
#include "item_use.h"
#include "item_menu.h"
#include "load_save.h"
#include "party_menu.h"
#include "pokeball.h"
#include "quest_log.h"
#include "strings.h"
#include "constants/hold_effects.h"
#include "constants/item.h"
#include "constants/item_effects.h"
#include "constants/items.h"
#include "constants/maps.h"

#define DUMMY_PC_BAG_POCKET                 \
{                                           \
    .id = POCKET_DUMMY,                     \
    .capacity = PC_ITEMS_COUNT,             \
    .itemSlots = gSaveBlock1Ptr->pcItems,   \
}

EWRAM_DATA struct BagPocket gBagPockets[POCKETS_COUNT] = {};

static const u8 *ItemId_GetPluralName(u16);
static bool32 DoesItemHavePluralName(u16);
static void NONNULL BagPocket_CompactItems(struct BagPocket *pocket);

// Item descriptions and data
#include "constants/moves.h"
#include "pokemon_summary_screen.h"
#include "data/pokemon/item_effects.h"
#include "data/items.h"

#define UNPACK_TM_ITEM_ID(_tm) [CAT(ENUM_TM_HM_, _tm) + 1] = { CAT(ITEM_TM_, _tm), CAT(MOVE_, _tm) },
#define UNPACK_HM_ITEM_ID(_hm) [CAT(ENUM_TM_HM_, _hm) + 1] = { CAT(ITEM_HM_, _hm), CAT(MOVE_, _hm) },

const struct TmHmIndexKey gTMHMItemMoveIds[NUM_ALL_MACHINES + 1] =
{
    [0] = { ITEM_NONE, MOVE_NONE }, // Failsafe
    FOREACH_TM(UNPACK_TM_ITEM_ID)
    FOREACH_HM(UNPACK_HM_ITEM_ID)
    /*
     * Expands to the following:
     *
     * [1] = { ITEM_TM_FOCUS_PUNCH, MOVE_FOCUS_PUNCH },
     * [2] = { ITEM_TM_DRAGON_CLAW, MOVE_DRAGON_CLAW },
     * [3] = { ITEM_TM_WATER_PULSE, MOVE_WATER_PULSE },
     * etc etc
    */
};

#undef UNPACK_TM_ITEM_ID
#undef UNPACK_HM_ITEM_ID


static inline struct ItemSlot NONNULL BagPocket_GetSlotDataGeneric(struct BagPocket *pocket, u32 pocketPos)
{
    return (struct ItemSlot) {
        .itemId = pocket->itemSlots[pocketPos].itemId,
        .quantity = pocket->itemSlots[pocketPos].quantity,
    };
}

static inline struct ItemSlot NONNULL BagPocket_GetSlotDataPC(struct BagPocket *pocket, u32 pocketPos)
{
    return (struct ItemSlot) {
        .itemId = pocket->itemSlots[pocketPos].itemId,
        .quantity = pocket->itemSlots[pocketPos].quantity,
    };
}

static inline void NONNULL BagPocket_SetSlotDataGeneric(struct BagPocket *pocket, u32 pocketPos, struct ItemSlot newSlot)
{
    pocket->itemSlots[pocketPos].itemId = newSlot.itemId;
    pocket->itemSlots[pocketPos].quantity = newSlot.quantity;
}

static inline void NONNULL BagPocket_SetSlotDataPC(struct BagPocket *pocket, u32 pocketPos, struct ItemSlot newSlot)
{
    pocket->itemSlots[pocketPos].itemId = newSlot.itemId;
    pocket->itemSlots[pocketPos].quantity = newSlot.quantity;
}

struct ItemSlot NONNULL BagPocket_GetSlotData(struct BagPocket *pocket, u32 pocketPos)
{
    switch (pocket->id)
    {
    case POCKET_ITEMS:
    case POCKET_KEY_ITEMS:
    case POCKET_POKE_BALLS:
    case POCKET_TM_HM:
    case POCKET_BERRIES:
        return BagPocket_GetSlotDataGeneric(pocket, pocketPos);
    case POCKET_DUMMY:
        return BagPocket_GetSlotDataPC(pocket, pocketPos);
    }

    return (struct ItemSlot) {0}; // Because compiler complains
}

void NONNULL BagPocket_SetSlotData(struct BagPocket *pocket, u32 pocketPos, struct ItemSlot newSlot)
{
    if (newSlot.itemId == ITEM_NONE || newSlot.quantity == 0) // Sets to zero if quantity or itemId is zero
    {
        newSlot.itemId = ITEM_NONE;
        newSlot.quantity = 0;
    }

    switch (pocket->id)
    {
    case POCKET_ITEMS:
    case POCKET_KEY_ITEMS:
    case POCKET_POKE_BALLS:
    case POCKET_TM_HM:
    case POCKET_BERRIES:
        BagPocket_SetSlotDataGeneric(pocket, pocketPos, newSlot);
        break;
    case POCKET_DUMMY:
        BagPocket_SetSlotDataPC(pocket, pocketPos, newSlot);
        break;
    }
}

static inline u16 GetBagItemIdPocket(struct BagPocket *pocket, u32 pocketPos)
{
    return pocket->itemSlots[pocketPos].itemId;
}

static inline u16 GetBagItemQuantityPocket(struct BagPocket *pocket, u32 pocketPos)
{
    return pocket->itemSlots[pocketPos].quantity;
}

static inline void SetBagItemIdPocket(struct BagPocket *pocket, u32 pocketPos, u16 itemId)
{
    pocket->itemSlots[pocketPos].itemId = itemId;
}

static inline void SetBagItemQuantityPocket(struct BagPocket *pocket, u32 pocketPos, u16 newValue)
{
    pocket->itemSlots[pocketPos].quantity = newValue;
}

// static void SetBagItemId(enum Pocket pocketId, u32 pocketPos, u16 itemId)
// {
//     SetBagItemIdPocket(&gBagPockets[pocketId], pocketPos, itemId);
// }

void SetBagItemQuantity(enum Pocket pocketId, u32 pocketPos, u16 newValue)
{
    SetBagItemQuantityPocket(&gBagPockets[pocketId], pocketPos, newValue);
}

u16 GetPCItemQuantity(u16 *quantity)
{
    return *quantity;
}

void SetPCItemQuantity(u16 *quantity, u16 newValue)
{
    *quantity = newValue;
}

void SetBagItemsPointers(void)
{
    gBagPockets[POCKET_ITEMS].itemSlots = gSaveBlock1Ptr->bag.items;
    gBagPockets[POCKET_ITEMS].capacity = BAG_ITEMS_COUNT;
    gBagPockets[POCKET_ITEMS].id = POCKET_ITEMS;

    gBagPockets[POCKET_KEY_ITEMS].itemSlots = gSaveBlock1Ptr->bag.keyItems;
    gBagPockets[POCKET_KEY_ITEMS].capacity = BAG_KEYITEMS_COUNT;
    gBagPockets[POCKET_KEY_ITEMS].id = POCKET_KEY_ITEMS;

    gBagPockets[POCKET_POKE_BALLS].itemSlots = gSaveBlock1Ptr->bag.pokeBalls;
    gBagPockets[POCKET_POKE_BALLS].capacity = BAG_POKEBALLS_COUNT;
    gBagPockets[POCKET_POKE_BALLS].id = POCKET_POKE_BALLS;

    gBagPockets[POCKET_TM_HM].itemSlots = gSaveBlock1Ptr->bag.TMsHMs;
    gBagPockets[POCKET_TM_HM].capacity = BAG_TMHM_COUNT;
    gBagPockets[POCKET_TM_HM].id = POCKET_TM_HM;

    gBagPockets[POCKET_BERRIES].itemSlots = gSaveBlock1Ptr->bag.berries;
    gBagPockets[POCKET_BERRIES].capacity = BAG_BERRIES_COUNT;
    gBagPockets[POCKET_BERRIES].id = POCKET_BERRIES;
}

u8 *CopyItemName(u16 itemId, u8 * dest)
{
    return StringCopy(dest, GetItemName(itemId));
}

const u8 sText_s[] =_("s");

u8 *CopyItemNameHandlePlural(u16 itemId, u8 *dst, u32 quantity)
{
    if (quantity == 1)
    {
        return StringCopy(dst, GetItemName(itemId));
    }
    else if (DoesItemHavePluralName(itemId))
    {
        return StringCopy(dst, ItemId_GetPluralName(itemId));
    }
    else
    {
        u8 *end = StringCopy(dst, GetItemName(itemId));
        return StringCopy(end, sText_s);
    }
}

s8 BagPocketGetFirstEmptySlot(u8 pocketId)
{
    u16 i;

    for (i = 0; i < gBagPockets[pocketId].capacity; i++)
    {
        if (gBagPockets[pocketId].itemSlots[i].itemId == ITEM_NONE)
            return i;
    }

    return -1;
}

bool8 IsBagPocketNonEmpty(u8 pocketId)
{
    u8 i;

    for (i = 0; i < gBagPockets[pocketId].capacity; i++)
    {
        if (gBagPockets[pocketId].itemSlots[i].itemId != ITEM_NONE)
            return TRUE;
    }

    return FALSE;
}

bool8 CheckBagHasItem(u16 itemId, u16 count)
{
    u8 i;
    enum Pocket pocket = GetItemPocket(itemId);

    if (pocket >= POCKETS_COUNT)
        return FALSE;

    // Check for item slots that contain the item
    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            u16 quantity;
            // Does this item slot contain enough of the item?
            quantity = GetBagItemQuantity(pocket, i);
            if (quantity >= count)
                return TRUE;
                // RS and Emerald check whether there is enough of the
                // item across all stacks.
                // For whatever reason, FR/LG assume there's only one
                // stack of the item.
            else
                return FALSE;
        }
    }
    return FALSE;
}

bool32 HasAtLeastOneBerry(void)
{
    u16 itemId;
    bool8 exists;

    exists = CheckBagHasItem(ITEM_BERRY_POUCH, 1);
    if (!exists)
    {
        gSpecialVar_Result = FALSE;
        return FALSE;
    }
    for (itemId = FIRST_BERRY_INDEX; itemId <= LAST_BERRY_INDEX; itemId++)
    {
        exists = CheckBagHasItem(itemId, 1);
        if (exists)
        {
            gSpecialVar_Result = TRUE;
            return TRUE;
        }
    }

    gSpecialVar_Result = FALSE;
    return FALSE;
}

bool32 HasAtLeastOnePokeBall(void)
{
    for (enum PokeBall ballId = BALL_STRANGE; ballId < POKEBALL_COUNT; ballId++)
    {
        if (CheckBagHasItem(gBallItemIds[ballId], 1) == TRUE)
            return TRUE;
    }
    return FALSE;
}

bool8 CheckBagHasSpace(u16 itemId, u16 count)
{
    if (GetItemPocket(itemId) == POCKET_NONE)
        return FALSE;

    return GetFreeSpaceForItemInBag(itemId) >= count;
}

static u32 NONNULL BagPocket_GetFreeSpaceForItem(struct BagPocket *pocket, u16 itemId)
{
    u32 spaceForItem = 0;
    struct ItemSlot tempItem;

    // Check space in any existing item slots that already contain this item
    for (u32 i = 0; i < pocket->capacity; i++)
    {
        tempItem = BagPocket_GetSlotData(pocket, i);
        if (tempItem.itemId == ITEM_NONE || tempItem.itemId == itemId)
            spaceForItem += (tempItem.itemId ? (MAX_BAG_ITEM_CAPACITY - tempItem.quantity) : MAX_BAG_ITEM_CAPACITY);
    }

    return spaceForItem;
}

u32 GetFreeSpaceForItemInBag(u16 itemId)
{
    u8 pocket = GetItemPocket(itemId);

    if (pocket >= POCKETS_COUNT)
        return 0;

    return BagPocket_GetFreeSpaceForItem(&gBagPockets[GetItemPocket(itemId)], itemId);
}

static inline bool32 NONNULL CheckSlotAndUpdateCount(struct BagPocket *pocket, u16 itemId, u32 pocketPos, u32 *nextPocketPos, u16 *count, u16 *tempPocketSlotQuantities)
{
    struct ItemSlot tempItem = BagPocket_GetSlotData(pocket, pocketPos);
    if (tempItem.itemId == ITEM_NONE || tempItem.itemId == itemId)
    {
        // The quantity already at the slot - zero if an empty slot
        if (tempItem.itemId == ITEM_NONE)
            tempItem.quantity = 0;

        // Record slot quantity in tempPocketSlotQuantities, adjust count
        tempPocketSlotQuantities[pocketPos] = min(MAX_BAG_ITEM_CAPACITY, *count + tempItem.quantity);
        *count -= min(*count, MAX_BAG_ITEM_CAPACITY - tempItem.quantity);

        // Set the starting index for the next loop to set items (shifted by one)
        if (!*nextPocketPos)
            *nextPocketPos = pocketPos + 1;

        return TRUE;
    }

    return FALSE;
}

static bool32 NONNULL BagPocket_AddItem(struct BagPocket *pocket, u16 itemId, u16 count)
{
    u32 itemLookupIndex, itemAddIndex = 0;

    // First, check that there is a free slot for this item
    u16 *tempPocketSlotQuantities = AllocZeroed(sizeof(u16) * pocket->capacity);

    switch (pocket->id)
    {
        case POCKET_TM_HM:
        case POCKET_BERRIES:
            for (itemLookupIndex = 0; itemLookupIndex < pocket->capacity && count > 0; itemLookupIndex++)
            {
                // Check if we found a slot to store the item but weren't able to reduce count to 0
                // This means that we have more than one stack's worth, which isn't allowed in these pockets
                if (CheckSlotAndUpdateCount(pocket, itemId, itemLookupIndex, &itemAddIndex, &count, tempPocketSlotQuantities) && count > 0)
                {
                    Free(tempPocketSlotQuantities);
                    return FALSE;
                }
            }
            break;
        default:
            for (itemLookupIndex = 0; itemLookupIndex < pocket->capacity && count > 0; itemLookupIndex++)
                CheckSlotAndUpdateCount(pocket, itemId, itemLookupIndex, &itemAddIndex, &count, tempPocketSlotQuantities);
    }

    // If the count is still greater than zero, clearly we have not found enough slots for this...
    // Otherwise, we have found slots - update the actual pockets with the updated quantities
    if (count == 0)
    {
        for (--itemAddIndex; itemAddIndex < itemLookupIndex; itemAddIndex++)
        {
            if (tempPocketSlotQuantities[itemAddIndex] > 0)
                BagPocket_SetSlotItemIdAndCount(pocket, itemAddIndex, itemId, tempPocketSlotQuantities[itemAddIndex]);
        }
    }

    Free(tempPocketSlotQuantities);
    return count == 0;
}

bool8 AddBagItem(u16 itemId, u16 count)
{
    enum Pocket pocket = GetItemPocket(itemId);
    s8 idx;

    if (count == 0)
        return FALSE;

    if (pocket >= POCKETS_COUNT)
        return FALSE;

    if (pocket == POCKET_TM_HM && !CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        idx = BagPocketGetFirstEmptySlot(POCKET_KEY_ITEMS);
        if (idx == -1)
            return FALSE;
        gBagPockets[POCKET_KEY_ITEMS].itemSlots[idx].itemId = ITEM_TM_CASE;
        SetBagItemQuantity(POCKET_KEY_ITEMS, idx, 1);
    }

    if (pocket == POCKET_BERRIES && !CheckBagHasItem(ITEM_BERRY_POUCH, 1))
    {
        idx = BagPocketGetFirstEmptySlot(POCKET_KEY_ITEMS);
        if (idx == -1)
            return FALSE;
        gBagPockets[POCKET_KEY_ITEMS].itemSlots[idx].itemId = ITEM_BERRY_POUCH;
        SetBagItemQuantity(POCKET_KEY_ITEMS, idx, 1);
        FlagSet(FLAG_SYS_GOT_BERRY_POUCH);
    }

    if (itemId == ITEM_BERRY_POUCH)
        FlagSet(FLAG_SYS_GOT_BERRY_POUCH);

    return BagPocket_AddItem(&gBagPockets[GetItemPocket(itemId)], itemId, count);
}

static bool32 NONNULL BagPocket_RemoveItem(struct BagPocket *pocket, u16 itemId, u16 count)
{
    u32 itemLookupIndex, itemRemoveIndex = 0, totalQuantity = 0;
    struct ItemSlot tempItem;
    u16 *tempPocketSlotQuantities = AllocZeroed(sizeof(u16) * pocket->capacity);

    for (itemLookupIndex = 0; itemLookupIndex < pocket->capacity && totalQuantity < count; itemLookupIndex++)
    {
        tempItem = BagPocket_GetSlotData(pocket, itemLookupIndex);
        if (tempItem.itemId == itemId)
        {
            // Index for the next loop - where we should start removing items
            if (!itemRemoveIndex)
                itemRemoveIndex = itemLookupIndex + 1;

            // Gather quantities (+ 1 to tempPocketSlotQuantities so that even if setting to 0 we know which indices to target)
            totalQuantity += tempItem.quantity;
            tempPocketSlotQuantities[itemLookupIndex] = (tempItem.quantity <= count ? 0 : tempItem.quantity - count) + 1;
        }
    }

    if (totalQuantity >= count) // We have enough of the item
    {
        // Update the quantities correctly with the items removed
        for (--itemRemoveIndex; itemRemoveIndex < itemLookupIndex; itemRemoveIndex++)
        {
            if (tempPocketSlotQuantities[itemRemoveIndex] > 0)
                BagPocket_SetSlotItemIdAndCount(pocket, itemRemoveIndex, itemId, tempPocketSlotQuantities[itemRemoveIndex] - 1);
        }
    }

    if (totalQuantity == count)
        BagPocket_CompactItems(pocket);

    Free(tempPocketSlotQuantities);
    return totalQuantity >= count;
}

bool8 RemoveBagItem(u16 itemId, u16 count)
{
    enum Pocket pocket = GetItemPocket(itemId);

    if (pocket >= POCKETS_COUNT)
        return FALSE;

    if (itemId == ITEM_NONE)
        return FALSE;

    return BagPocket_RemoveItem(&gBagPockets[pocket], itemId, count);
}

// Unsafe function: Only use with functions that already check the slot and count are valid
void RemoveBagItemFromSlot(struct BagPocket *pocket, u16 slotId, u16 count)
{
    struct ItemSlot itemSlot = BagPocket_GetSlotData(pocket, slotId);
    BagPocket_SetSlotItemIdAndCount(pocket, slotId, itemSlot.itemId, itemSlot.quantity - count);
}

u8 GetPocketByItemId(u16 itemId)
{
    return GetItemPocket(itemId); // wow such important
}

void ClearPCItemSlots(void)
{
    u16 i;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        gSaveBlock1Ptr->pcItems[i].itemId = ITEM_NONE;
        SetPCItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity, 0);
    }
}

void CompactItemsInBagPocket(enum Pocket pocketId)
{
    BagPocket_CompactItems(&gBagPockets[pocketId]);
}

static inline void NONNULL BagPocket_MoveItemSlot(struct BagPocket *pocket, u32 from, u32 to)
{
    if (from != to)
    {
        s8 shift = (to > from) ? 1 : -1;
        if (to > from)
            to--;

        // Record the values at "from"
        struct ItemSlot fromSlot = BagPocket_GetSlotData(pocket, from);

        // Shuffle items between "to" and "from"
        for (u32 i = from; i != to; i += shift)
            BagPocket_SetSlotData(pocket, i, BagPocket_GetSlotData(pocket, i + shift));

        // Move the saved "from" to "to"
        BagPocket_SetSlotData(pocket, to, fromSlot);
    }
}

void MoveItemSlotInPocket(enum Pocket pocketId, u32 from, u32 to)
{
    BagPocket_MoveItemSlot(&gBagPockets[pocketId], from, to);
}

void MoveItemSlotInPC(struct ItemSlot *itemSlots, u32 from, u32 to)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;
    return BagPocket_MoveItemSlot(&dummyPocket, from, to);
}

void ClearBag(void)
{
    CpuFastFill(0, &gSaveBlock1Ptr->bag, sizeof(struct Bag));
}

s8 PCItemsGetFirstEmptySlot(void)
{
    s8 i;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == ITEM_NONE)
            return i;
    }

    return -1;
}

static u8 NONNULL BagPocket_CountUsedItemSlots(struct BagPocket *pocket)
{
    u8 usedSlots = 0;

    for (u32 i = 0; i < pocket->capacity; i++)
    {
        if (BagPocket_GetSlotData(pocket, i).itemId != ITEM_NONE)
            usedSlots++;
    }
    return usedSlots;
}

u8 CountItemsInPC(void)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;
    return BagPocket_CountUsedItemSlots(&dummyPocket);
}

static bool32 NONNULL BagPocket_CheckPocketForItemCount(struct BagPocket *pocket, u16 itemId, u16 count)
{
    struct ItemSlot tempItem;

    for (u32 i = 0; i < pocket->capacity; i++)
    {
        tempItem = BagPocket_GetSlotData(pocket, i);
        if (tempItem.itemId == itemId && tempItem.quantity >= count)
            return TRUE;
    }
    return FALSE;
}

bool8 CheckPCHasItem(u16 itemId, u16 count)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;
    return BagPocket_CheckPocketForItemCount(&dummyPocket, itemId, count);
}

bool8 AddPCItem(u16 itemId, u16 count)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;
    return BagPocket_AddItem(&dummyPocket, itemId, count);
}

static void NONNULL BagPocket_CompactItems(struct BagPocket *pocket)
{
    struct ItemSlot tempItem;
    u32 slotCursor = 0;
    for (u32 i = 0; i < pocket->capacity; i++)
    {
        tempItem = BagPocket_GetSlotData(pocket, i);
        if (tempItem.itemId == ITEM_NONE)
        {
            if (!slotCursor)
                slotCursor = i + 1;
        }
        else if (slotCursor > 0)
        {
            BagPocket_SetSlotData(pocket, slotCursor++ - 1, tempItem);
            BagPocket_SetSlotItemIdAndCount(pocket, i, ITEM_NONE, 0);
        }
    }
}

void RemovePCItem(u8 index, u16 count)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;

    // Get id, quantity at slot
    struct ItemSlot tempItem = BagPocket_GetSlotData(&dummyPocket, index);

    // Remove quantity
    BagPocket_SetSlotItemIdAndCount(&dummyPocket, index, tempItem.itemId, tempItem.quantity - count);

    // Compact if necessary
    if (tempItem.quantity == 0)
        BagPocket_CompactItems(&dummyPocket);
}

void ItemPcCompaction(void)
{
    struct BagPocket dummyPocket = DUMMY_PC_BAG_POCKET;
    BagPocket_CompactItems(&dummyPocket);
}

void RegisteredItemHandleBikeSwap(void)
{
    switch (gSaveBlock1Ptr->registeredItem)
    {
    case ITEM_MACH_BIKE:
        gSaveBlock1Ptr->registeredItem = ITEM_ACRO_BIKE;
        break;
    case ITEM_ACRO_BIKE:
        gSaveBlock1Ptr->registeredItem = ITEM_MACH_BIKE;
        break;
    }
}

u16 CountTotalItemQuantityInBag(u16 itemId)
{
    u16 i;
    u16 ownedCount = 0;
    enum Pocket pocketId = GetItemPocket(itemId);

    for (i = 0; i < gBagPockets[pocketId].capacity; i++)
    {
        if (GetBagItemId(pocketId, i) == itemId)
            ownedCount += GetBagItemQuantity(pocketId, i);
    }

    return ownedCount;
}

void TrySetObtainedItemQuestLogEvent(u16 itemId)
{
    // Only some key items trigger this event
    if (itemId == ITEM_OAKS_PARCEL
     || itemId == ITEM_POKE_FLUTE
     || itemId == ITEM_SECRET_KEY
     || itemId == ITEM_BIKE_VOUCHER
     || itemId == ITEM_GOLD_TEETH
     || itemId == ITEM_OLD_AMBER
     || itemId == ITEM_CARD_KEY
     || itemId == ITEM_LIFT_KEY
     || itemId == ITEM_HELIX_FOSSIL
     || itemId == ITEM_DOME_FOSSIL
     || itemId == ITEM_SILPH_SCOPE
     || itemId == ITEM_BICYCLE
     || itemId == ITEM_TOWN_MAP
     || itemId == ITEM_VS_SEEKER
     || itemId == ITEM_TEACHY_TV
     || itemId == ITEM_RAINBOW_PASS
     || itemId == ITEM_TEA
     || itemId == ITEM_POWDER_JAR
     || itemId == ITEM_RUBY
     || itemId == ITEM_SAPPHIRE)
    {
        if (itemId != ITEM_TOWN_MAP || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_PALLET_TOWN_RIVALS_HOUSE) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_PALLET_TOWN_RIVALS_HOUSE)))
        {
            struct QuestLogEvent_StoryItem * data = malloc(sizeof(*data));
            data->itemId = itemId;
            data->mapSec = gMapHeader.regionMapSectionId;
            SetQuestLogEvent(QL_EVENT_OBTAINED_STORY_ITEM, (const u16 *)data);
            free(data);
        }
    }
}

u16 SanitizeItemId(u16 itemId)
{
    assertf(itemId < ITEMS_COUNT, "invalid item: %d", itemId)
    {
        return ITEM_NONE;
    }

    return itemId;
}

const u8 * GetItemName(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].name;
}

u32 GetItemPrice(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].price;
}

static bool32 DoesItemHavePluralName(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].pluralName != NULL;
}

static const u8 *ItemId_GetPluralName(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].pluralName;
}

u8 GetItemHoldEffect(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].holdEffect;
}

u8 GetItemHoldEffectParam(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].holdEffectParam;
}

const u8 * GetItemDescription(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].description;
}

u8 GetItemImportance(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].importance;
}

u8 GetItemConsumability(u16 itemId)
{
    return !gItemsInfo[SanitizeItemId(itemId)].notConsumed;
}

enum Pocket GetItemPocket(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].pocket;
}

u8 GetItemType(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].type;
}

ItemUseFunc GetItemFieldFunc(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].fieldUseFunc;
}

// Returns an item's battle effect script ID.
u8 GetItemBattleUsage(u16 itemId)
{
    u16 item = SanitizeItemId(itemId);
    // Handle E-Reader berries.
    if (item == ITEM_ENIGMA_BERRY_E_READER)
    {
        switch (GetItemEffectType(gSpecialVar_ItemId))
        {
            case ITEM_EFFECT_X_ITEM:
                return EFFECT_ITEM_INCREASE_STAT;
            case ITEM_EFFECT_HEAL_HP:
                return EFFECT_ITEM_RESTORE_HP;
            case ITEM_EFFECT_CURE_POISON:
            case ITEM_EFFECT_CURE_SLEEP:
            case ITEM_EFFECT_CURE_BURN:
            case ITEM_EFFECT_CURE_FREEZE_FROSTBITE:
            case ITEM_EFFECT_CURE_PARALYSIS:
            case ITEM_EFFECT_CURE_ALL_STATUS:
            case ITEM_EFFECT_CURE_CONFUSION:
            case ITEM_EFFECT_CURE_INFATUATION:
                return EFFECT_ITEM_CURE_STATUS;
            case ITEM_EFFECT_HEAL_PP:
                return EFFECT_ITEM_RESTORE_PP;
            default:
                return 0;
        }
    }
    else
        return gItemsInfo[item].battleUsage;
}

u16 GetItemSecondaryId(u16 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].secondaryId;
}

u32 GetItemFlingPower(u32 itemId)
{
    return gItemsInfo[SanitizeItemId(itemId)].flingPower;
}

const u8 *GetItemEffect(u32 itemId)
{
    if (itemId == ITEM_ENIGMA_BERRY_E_READER)
    #if FREE_ENIGMA_BERRY == FALSE
        return gSaveBlock1Ptr->enigmaBerry.itemEffect;
    #else
        return 0;
    #endif //FREE_ENIGMA_BERRY
    else
        return gItemsInfo[SanitizeItemId(itemId)].effect;
}


u32 GetItemStatus1Mask(u16 itemId)
{
    const u8 *effect = GetItemEffect(itemId);
    switch (effect[3])
    {
        case ITEM3_PARALYSIS:
            return STATUS1_PARALYSIS;
        case ITEM3_FREEZE:
            return STATUS1_FREEZE | STATUS1_FROSTBITE;
        case ITEM3_BURN:
            return STATUS1_BURN;
        case ITEM3_POISON:
            return STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER;
        case ITEM3_SLEEP:
            return STATUS1_SLEEP;
        case ITEM3_STATUS_ALL:
            return STATUS1_ANY | STATUS1_TOXIC_COUNTER;
    }
    return 0;
}

bool32 ItemHasVolatileFlag(u16 itemId, enum Volatile _volatile)
{
    const u8 *effect = GetItemEffect(itemId);
    switch (_volatile)
    {
    case VOLATILE_CONFUSION:
        return (effect[3] & ITEM3_STATUS_ALL) || (effect[3] & ITEM3_CONFUSION);
    case VOLATILE_INFATUATION:
        return (effect[3] & ITEM3_STATUS_ALL) || (effect[0] & ITEM0_INFATUATION);
    default:
        return FALSE;
    }
}

u32 GetItemSellPrice(u32 itemId)
{
    return GetItemPrice(itemId) / ITEM_SELL_FACTOR;
}

bool32 IsHoldEffectChoice(enum HoldEffect holdEffect)
{
    return holdEffect == HOLD_EFFECT_CHOICE_BAND
        || holdEffect == HOLD_EFFECT_CHOICE_SCARF
        || holdEffect == HOLD_EFFECT_CHOICE_SPECS;
}

bool32 IsItemTM(u16 itemId)
{
    enum TMHMIndex index = GetItemTMHMIndex(SanitizeItemId(itemId));
    return index > 0 && index <= NUM_TECHNICAL_MACHINES;
}

bool32 IsItemHM(u16 itemId)
{
    return GetItemTMHMIndex(SanitizeItemId(itemId)) > NUM_TECHNICAL_MACHINES;
}

bool32 IsItemTMHM(u16 itemId)
{
    enum TMHMIndex index = GetItemTMHMIndex(SanitizeItemId(itemId));
    return index > 0 && index <= NUM_ALL_MACHINES;
}

bool32 IsItemBall(u16 itemId)
{
    return GetPocketByItemId(itemId) == POCKET_POKE_BALLS;
}
