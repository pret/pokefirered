#include "global.h"
#include "gflib.h"
#include "berry.h"
#include "event_data.h"
#include "item.h"
#include "item_use.h"
#include "load_save.h"
#include "quest_log.h"
#include "strings.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/maps.h"

EWRAM_DATA struct BagPocket gBagPockets[NUM_BAG_POCKETS] = {};

void SortAndCompactBagPocket(struct BagPocket * pocket);

// Item descriptions and data
#include "data/items.h"

u16 GetBagItemQuantity(u16 * ptr)
{
    return gSaveBlock2Ptr->encryptionKey ^ *ptr;
}

void SetBagItemQuantity(u16 * ptr, u16 value)
{
    *ptr = value ^ gSaveBlock2Ptr->encryptionKey;
}

u16 GetPcItemQuantity(u16 * ptr)
{
    return 0 ^ *ptr;
}

void SetPcItemQuantity(u16 * ptr, u16 value)
{
    *ptr = value ^ 0;
}

void ApplyNewEncryptionKeyToBagItems(u32 key)
{
    u32 i, j;

    for (i = 0; i < NUM_BAG_POCKETS; i++)
    {
        for (j = 0; j < gBagPockets[i].capacity; j++)
        {
            ApplyNewEncryptionKeyToHword(&gBagPockets[i].itemSlots[j].quantity, key);
        }
    }
}

void ApplyNewEncryptionKeyToBagItems_(u32 key)
{
    ApplyNewEncryptionKeyToBagItems(key);
}

void SetBagPocketsPointers(void)
{
    gBagPockets[POCKET_ITEMS - 1].itemSlots = gSaveBlock1Ptr->bagPocket_Items;
    gBagPockets[POCKET_ITEMS - 1].capacity = BAG_ITEMS_COUNT;
    gBagPockets[POCKET_KEY_ITEMS - 1].itemSlots = gSaveBlock1Ptr->bagPocket_KeyItems;
    gBagPockets[POCKET_KEY_ITEMS - 1].capacity = BAG_KEYITEMS_COUNT;
    gBagPockets[POCKET_POKE_BALLS - 1].itemSlots = gSaveBlock1Ptr->bagPocket_PokeBalls;
    gBagPockets[POCKET_POKE_BALLS - 1].capacity = BAG_POKEBALLS_COUNT;
    gBagPockets[POCKET_TM_CASE - 1].itemSlots = gSaveBlock1Ptr->bagPocket_TMHM;
    gBagPockets[POCKET_TM_CASE - 1].capacity = BAG_TMHM_COUNT;
    gBagPockets[POCKET_BERRY_POUCH - 1].itemSlots = gSaveBlock1Ptr->bagPocket_Berries;
    gBagPockets[POCKET_BERRY_POUCH - 1].capacity = BAG_BERRIES_COUNT;
}

void CopyItemName(u16 itemId, u8 * dest)
{
    if (itemId == ITEM_ENIGMA_BERRY)
    {
        StringCopy(dest, GetBerryInfo(ITEM_TO_BERRY(ITEM_ENIGMA_BERRY))->name);
        StringAppend(dest, gText_Berry);
    }
    else
    {
        StringCopy(dest, ItemId_GetName(itemId));
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

bool8 IsPocketNotEmpty(u8 pocketId)
{
    u8 i;

    for (i = 0; i < gBagPockets[pocketId - 1].capacity; i++)
    {
        if (gBagPockets[pocketId - 1].itemSlots[i].itemId != ITEM_NONE)
            return TRUE;
    }

    return FALSE;
}

bool8 CheckBagHasItem(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;

    if (ItemId_GetPocket(itemId) == 0)
        return FALSE;

    pocket = ItemId_GetPocket(itemId) - 1;
    // Check for item slots that contain the item
    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            u16 quantity;
            // Does this item slot contain enough of the item?
            quantity = GetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity);
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

bool8 HasAtLeastOneBerry(void)
{
    u8 itemId;
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

bool8 CheckBagHasSpace(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;

    if (ItemId_GetPocket(itemId) == 0)
        return FALSE;

    pocket = ItemId_GetPocket(itemId) - 1;
    // Check for item slots that contain the item
    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            u16 quantity;
            // Does this stack have room for more??
            quantity = GetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity);
            if (quantity + count <= 999)
                return TRUE;
            // RS and Emerald check whether there is enough of the
            // item across all stacks.
            // For whatever reason, FR/LG assume there's only one
            // stack of the item.
            else
                return FALSE;
        }
    }

    if (BagPocketGetFirstEmptySlot(pocket) != -1)
        return TRUE;

    return FALSE;
}

bool8 AddBagItem(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;
    s8 idx;

    if (ItemId_GetPocket(itemId) == 0)
        return FALSE;

    pocket = ItemId_GetPocket(itemId) - 1;
    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            u16 quantity;
            // Does this stack have room for more??
            quantity = GetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity);
            if (quantity + count <= 999)
            {
                quantity += count;
                SetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity, quantity);
                return TRUE;
            }
            // RS and Emerald check whether there is enough of the
            // item across all stacks.
            // For whatever reason, FR/LG assume there's only one
            // stack of the item.
            else
                return FALSE;
        }
    }

    if (pocket == POCKET_TM_CASE - 1 && !CheckBagHasItem(ITEM_TM_CASE, 1))
    {
        idx = BagPocketGetFirstEmptySlot(POCKET_KEY_ITEMS - 1);
        if (idx == -1)
            return FALSE;
        gBagPockets[POCKET_KEY_ITEMS - 1].itemSlots[idx].itemId = ITEM_TM_CASE;
        SetBagItemQuantity(&gBagPockets[POCKET_KEY_ITEMS - 1].itemSlots[idx].quantity, 1);
    }

    if (pocket == POCKET_BERRY_POUCH - 1 && !CheckBagHasItem(ITEM_BERRY_POUCH, 1))
    {
        idx = BagPocketGetFirstEmptySlot(POCKET_KEY_ITEMS - 1);
        if (idx == -1)
            return FALSE;
        gBagPockets[POCKET_KEY_ITEMS - 1].itemSlots[idx].itemId = ITEM_BERRY_POUCH;
        SetBagItemQuantity(&gBagPockets[POCKET_KEY_ITEMS - 1].itemSlots[idx].quantity, 1);
        FlagSet(FLAG_SYS_GOT_BERRY_POUCH);
    }

    if (itemId == ITEM_BERRY_POUCH)
        FlagSet(FLAG_SYS_GOT_BERRY_POUCH);

    idx = BagPocketGetFirstEmptySlot(pocket);
    if (idx == -1)
        return FALSE;

    gBagPockets[pocket].itemSlots[idx].itemId = itemId;
    SetBagItemQuantity(&gBagPockets[pocket].itemSlots[idx].quantity, count);
    return TRUE;
}

bool8 RemoveBagItem(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;

    if (ItemId_GetPocket(itemId) == 0)
        return FALSE;

    if (itemId == ITEM_NONE)
        return FALSE;

    pocket = ItemId_GetPocket(itemId) - 1;
    // Check for item slots that contain the item
    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            u16 quantity;
            // Does this item slot contain enough of the item?
            quantity = GetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity);
            if (quantity >= count)
            {
                quantity -= count;
                SetBagItemQuantity(&gBagPockets[pocket].itemSlots[i].quantity, quantity);
                if (quantity == 0)
                    gBagPockets[pocket].itemSlots[i].itemId = ITEM_NONE;
                return TRUE;
            }
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

u8 GetPocketByItemId(u16 itemId)
{
    return ItemId_GetPocket(itemId); // wow such important
}

void ClearItemSlots(struct ItemSlot * slots, u8 capacity)
{
    u16 i;

    for (i = 0; i < capacity; i++)
    {
        slots[i].itemId = ITEM_NONE;
        SetBagItemQuantity(&slots[i].quantity, 0);
    }
}

void ClearPCItemSlots(void)
{
    u16 i;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        gSaveBlock1Ptr->pcItems[i].itemId = ITEM_NONE;
        SetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity, 0);
    }
}

void ClearBag(void)
{
    u16 i;

    for (i = 0; i < NUM_BAG_POCKETS; i++)
    {
        ClearItemSlots(gBagPockets[i].itemSlots, gBagPockets[i].capacity);
    }
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

u8 CountItemsInPC(void)
{
    u8 count = 0;
    u8 i;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId != ITEM_NONE)
            count++;
    }

    return count;
}

bool8 CheckPCHasItem(u16 itemId, u16 count)
{
    u8 i;
    u16 quantity;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == itemId)
        {
            quantity = GetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity);
            if (quantity >= count)
                return TRUE;
        }
    }

    return FALSE;
}

bool8 AddPCItem(u16 itemId, u16 count)
{
    u8 i;
    u16 quantity;
    s8 idx;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == itemId)
        {
            quantity = GetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity);
            if (quantity + count <= 999)
            {
                quantity += count;
                SetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity, quantity);
                return TRUE;
            }
            else
                return FALSE;
        }
    }

    idx = PCItemsGetFirstEmptySlot();
    if (idx == -1)
        return FALSE;

    gSaveBlock1Ptr->pcItems[idx].itemId = itemId;
    SetPcItemQuantity(&gSaveBlock1Ptr->pcItems[idx].quantity, count);
    return TRUE;
}

void RemovePCItem(u16 itemId, u16 count)
{
    u32 i;
    u16 quantity;

    if (itemId == ITEM_NONE)
        return;

    for (i = 0; i < PC_ITEMS_COUNT; i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == itemId)
            break;
    }

    if (i != PC_ITEMS_COUNT)
    {
        quantity = GetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity) - count;
        SetPcItemQuantity(&gSaveBlock1Ptr->pcItems[i].quantity, quantity);
        if (quantity == 0)
            gSaveBlock1Ptr->pcItems[i].itemId = ITEM_NONE;
    }
}

void ItemPcCompaction(void)
{
    u16 i, j;
    struct ItemSlot tmp;

    for (i = 0; i < PC_ITEMS_COUNT - 1; i++)
    {
        for (j = i + 1; j < PC_ITEMS_COUNT; j++)
        {
            if (gSaveBlock1Ptr->pcItems[i].itemId == ITEM_NONE)
            {
                tmp = gSaveBlock1Ptr->pcItems[i];
                gSaveBlock1Ptr->pcItems[i] = gSaveBlock1Ptr->pcItems[j];
                gSaveBlock1Ptr->pcItems[j] = tmp;
            }
        }
    }
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

void SwapItemSlots(struct ItemSlot * a, struct ItemSlot * b)
{
    struct ItemSlot c;
    c = *a;
    *a = *b;
    *b = c;
}

void BagPocketCompaction(struct ItemSlot * slots, u8 capacity)
{
    u16 i, j;

    for (i = 0; i < capacity - 1; i++)
    {
        for (j = i + 1; j < capacity; j++)
        {
            if (GetBagItemQuantity(&slots[i].quantity) == 0)
            {
                SwapItemSlots(&slots[i], &slots[j]);
            }
        }
    }
}

void SortPocketAndPlaceHMsFirst(struct BagPocket * pocket)
{
    u16 i;
    u16 j = 0;
    u16 k;
    struct ItemSlot * buff;

    SortAndCompactBagPocket(pocket);

    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE && GetBagItemQuantity(&pocket->itemSlots[i].quantity) == 0)
            return;
        if (pocket->itemSlots[i].itemId >= ITEM_HM01 && GetBagItemQuantity(&pocket->itemSlots[i].quantity) != 0)
        {
            for (j = i + 1; j < pocket->capacity; j++)
            {
                if (pocket->itemSlots[j].itemId == ITEM_NONE && GetBagItemQuantity(&pocket->itemSlots[j].quantity) == 0)
                    break;
            }
            break;
        }
    }

    for (k = 0; k < pocket->capacity; k++)
        pocket->itemSlots[k].quantity = GetBagItemQuantity(&pocket->itemSlots[k].quantity);
    buff = AllocZeroed(pocket->capacity * sizeof(struct ItemSlot));
    CpuCopy16(pocket->itemSlots + i, buff, (j - i) * sizeof(struct ItemSlot));
    CpuCopy16(pocket->itemSlots, buff + (j - i), i * sizeof(struct ItemSlot));
    CpuCopy16(buff, pocket->itemSlots, pocket->capacity * sizeof(struct ItemSlot));
    for (k = 0; k < pocket->capacity; k++)
        SetBagItemQuantity(&pocket->itemSlots[k].quantity, pocket->itemSlots[k].quantity);
    Free(buff);
}

void SortAndCompactBagPocket(struct BagPocket * pocket)
{
    u16 i, j;

    for (i = 0; i < pocket->capacity; i++)
    {
        for (j = i + 1; j < pocket->capacity; j++)
        {
            if (GetBagItemQuantity(&pocket->itemSlots[i].quantity) == 0 || (GetBagItemQuantity(&pocket->itemSlots[j].quantity) != 0 && pocket->itemSlots[i].itemId > pocket->itemSlots[j].itemId))
                SwapItemSlots(&pocket->itemSlots[i], &pocket->itemSlots[j]);
        }
    }
}

u16 BagGetItemIdByPocketPosition(u8 pocketId, u16 slotId)
{
    return gBagPockets[pocketId - 1].itemSlots[slotId].itemId;
}

u16 BagGetQuantityByPocketPosition(u8 pocketId, u16 slotId)
{
    return GetBagItemQuantity(&gBagPockets[pocketId - 1].itemSlots[slotId].quantity);
}

u16 BagGetQuantityByItemId(u16 itemId)
{
    u16 i;
    struct BagPocket * pocket = &gBagPockets[ItemId_GetPocket(itemId) - 1];

    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == itemId)
            return GetBagItemQuantity(&pocket->itemSlots[i].quantity);
    }

    return 0;
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
        if (itemId != ITEM_TOWN_MAP || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_RIVALS_HOUSE) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_RIVALS_HOUSE)))
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
    if (itemId >= ITEMS_COUNT)
        return ITEM_NONE;
    return itemId;
}

const u8 * ItemId_GetName(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].name;
}

// Unused
u16 ItemId_GetId(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].itemId;
}

u16 ItemId_GetPrice(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].price;
}

u8 ItemId_GetHoldEffect(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].holdEffect;
}

u8 ItemId_GetHoldEffectParam(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].holdEffectParam;
}

const u8 * ItemId_GetDescription(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].description;
}

u8 ItemId_GetImportance(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].importance;
}

// Unused
u8 ItemId_GetRegistrability(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].registrability;
}

u8 ItemId_GetPocket(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].pocket;
}

u8 ItemId_GetType(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].type;
}

ItemUseFunc ItemId_GetFieldFunc(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].fieldUseFunc;
}

bool8 ItemId_GetBattleUsage(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].battleUsage;
}

ItemUseFunc ItemId_GetBattleFunc(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].battleUseFunc;
}

u8 ItemId_GetSecondaryId(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].secondaryId;
}
