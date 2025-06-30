#include "global.h"
#include "battle.h"
#include "event_data.h"
#include "item.h"
#include "pokemon.h"
#include "test/overworld_script.h"
#include "test/test.h"

TEST("TMs and HMs are sorted correctly in the bag")
{
    struct BagPocket *pocket = &gBagPockets[POCKET_TM_HM];

    ASSUME(GetItemPocket(ITEM_HM07) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_TM25) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_TM14) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_TM42) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_HM05) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_TM05) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_TM01) == POCKET_TM_HM);
    ASSUME(GetItemPocket(ITEM_HM02) == POCKET_TM_HM);

    RUN_OVERWORLD_SCRIPT(
        additem ITEM_HM07;
        additem ITEM_TM25;
        additem ITEM_TM14;
        additem ITEM_TM42;
        additem ITEM_HM05;
        additem ITEM_TM05;
        additem ITEM_TM01;
        additem ITEM_HM02;
    );

    SortBerriesOrTMHMs(POCKET_TM_HM);

    EXPECT_EQ(pocket->itemSlots[0].itemId, ITEM_HM02);
    EXPECT_EQ(pocket->itemSlots[1].itemId, ITEM_HM05);
    EXPECT_EQ(pocket->itemSlots[2].itemId, ITEM_HM07);
    EXPECT_EQ(pocket->itemSlots[3].itemId, ITEM_TM01);
    EXPECT_EQ(pocket->itemSlots[4].itemId, ITEM_TM05);
    EXPECT_EQ(pocket->itemSlots[5].itemId, ITEM_TM14);
    EXPECT_EQ(pocket->itemSlots[6].itemId, ITEM_TM25);
    EXPECT_EQ(pocket->itemSlots[7].itemId, ITEM_TM42);
    EXPECT_EQ(pocket->itemSlots[8].itemId, ITEM_NONE);
}

TEST("Berries are sorted correctly in the bag")
{
    struct BagPocket *pocket = &gBagPockets[POCKET_BERRIES];

    ASSUME(GetItemPocket(ITEM_POMEG_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_MAGOST_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_KELPSY_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_MICLE_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_CHARTI_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_GANLON_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_ORAN_BERRY) == POCKET_BERRIES);
    ASSUME(GetItemPocket(ITEM_CHERI_BERRY) == POCKET_BERRIES);

    RUN_OVERWORLD_SCRIPT(
        additem ITEM_POMEG_BERRY;
        additem ITEM_MAGOST_BERRY;
        additem ITEM_KELPSY_BERRY;
        additem ITEM_MICLE_BERRY;
        additem ITEM_CHARTI_BERRY;
        additem ITEM_GANLON_BERRY;
        additem ITEM_ORAN_BERRY;
        additem ITEM_CHERI_BERRY;
    );

    SortBerriesOrTMHMs(POCKET_BERRIES);

    EXPECT_EQ(pocket->itemSlots[0].itemId, ITEM_CHERI_BERRY);
    EXPECT_EQ(pocket->itemSlots[1].itemId, ITEM_ORAN_BERRY);
    EXPECT_EQ(pocket->itemSlots[2].itemId, ITEM_POMEG_BERRY);
    EXPECT_EQ(pocket->itemSlots[3].itemId, ITEM_KELPSY_BERRY);
    EXPECT_EQ(pocket->itemSlots[4].itemId, ITEM_MAGOST_BERRY);
    EXPECT_EQ(pocket->itemSlots[5].itemId, ITEM_CHARTI_BERRY);
    EXPECT_EQ(pocket->itemSlots[6].itemId, ITEM_GANLON_BERRY);
    EXPECT_EQ(pocket->itemSlots[7].itemId, ITEM_MICLE_BERRY);
    EXPECT_EQ(pocket->itemSlots[8].itemId, ITEM_NONE);
}

TEST("Items are correctly compacted in the bag")
{
    struct BagPocket *pocket = &gBagPockets[POCKET_ITEMS];
    memset(pocket->itemSlots, 0, sizeof(gSaveBlock1Ptr->bag.items));

    ASSUME(GetItemPocket(ITEM_NUGGET) == POCKET_ITEMS);
    ASSUME(GetItemPocket(ITEM_BIG_NUGGET) == POCKET_ITEMS);
    ASSUME(GetItemPocket(ITEM_TINY_MUSHROOM) == POCKET_ITEMS);
    ASSUME(GetItemPocket(ITEM_BIG_MUSHROOM) == POCKET_ITEMS);
    ASSUME(GetItemPocket(ITEM_PEARL) == POCKET_ITEMS);
    ASSUME(GetItemPocket(ITEM_BIG_PEARL) == POCKET_ITEMS);

    RUN_OVERWORLD_SCRIPT(
        additem ITEM_NUGGET;
        additem ITEM_BIG_NUGGET;
        additem ITEM_TINY_MUSHROOM;
        additem ITEM_BIG_MUSHROOM;
        additem ITEM_PEARL;
        additem ITEM_BIG_PEARL;
    );

    EXPECT_EQ(pocket->itemSlots[0].itemId, ITEM_NUGGET);
    EXPECT_EQ(pocket->itemSlots[1].itemId, ITEM_BIG_NUGGET);
    EXPECT_EQ(pocket->itemSlots[2].itemId, ITEM_TINY_MUSHROOM);
    EXPECT_EQ(pocket->itemSlots[3].itemId, ITEM_BIG_MUSHROOM);
    EXPECT_EQ(pocket->itemSlots[4].itemId, ITEM_PEARL);
    EXPECT_EQ(pocket->itemSlots[5].itemId, ITEM_BIG_PEARL);
    EXPECT_EQ(pocket->itemSlots[6].itemId, ITEM_NONE);

    // Try removing the small items, check that everything is compacted correctly

    RUN_OVERWORLD_SCRIPT(
        removeitem ITEM_NUGGET;
        removeitem ITEM_TINY_MUSHROOM;
        removeitem ITEM_PEARL;
    );

    CompactItemsInBagPocket(POCKET_ITEMS);

    EXPECT_EQ(pocket->itemSlots[0].itemId, ITEM_BIG_NUGGET);
    EXPECT_EQ(pocket->itemSlots[1].itemId, ITEM_BIG_MUSHROOM);
    EXPECT_EQ(pocket->itemSlots[2].itemId, ITEM_BIG_PEARL);
    EXPECT_EQ(pocket->itemSlots[3].itemId, ITEM_NONE);
    EXPECT_EQ(pocket->itemSlots[4].itemId, ITEM_NONE);
    EXPECT_EQ(pocket->itemSlots[5].itemId, ITEM_NONE);
    EXPECT_EQ(pocket->itemSlots[6].itemId, ITEM_NONE);

}
