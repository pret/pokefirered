#ifndef GUARD_ITEM_CONSTANTS_H
#define GUARD_ITEM_CONSTANTS_H

// These constants are used in gItemsInfo
#define POCKET_NONE        0
#define POCKET_ITEMS       1
#define POCKET_KEY_ITEMS   2
#define POCKET_POKE_BALLS  3
#define POCKET_TM_HM       4
#define POCKET_BERRIES     5
#define NUM_BAG_POCKETS    5
#define NUM_BAG_POCKETS_NO_CASES 3 // number of pockets without considering TM case or berry pouch

#define ITEMS_POCKET       0
#define KEYITEMS_POCKET    1
#define BALLS_POCKET       2
#define TMHM_POCKET        3
#define BERRIES_POCKET     4
#define POCKETS_COUNT      5

#define REPEL_LURE_MASK         (1 << 15)
#define IS_LAST_USED_LURE(var)  (var & REPEL_LURE_MASK)
#define REPEL_LURE_STEPS(var)   (var & (REPEL_LURE_MASK - 1))
#define LURE_STEP_COUNT         (IS_LAST_USED_LURE(VarGet(VAR_REPEL_STEP_COUNT)) ? REPEL_LURE_STEPS(VarGet(VAR_REPEL_STEP_COUNT)) : 0)
#define REPEL_STEP_COUNT        (!IS_LAST_USED_LURE(VarGet(VAR_REPEL_STEP_COUNT)) ? REPEL_LURE_STEPS(VarGet(VAR_REPEL_STEP_COUNT)) : 0)

#define ITEM_SELL_FACTOR ((I_SELL_VALUE_FRACTION >= GEN_9) ? 4 : 2)

#endif // GUARD_ITEM_CONSTANTS_H
