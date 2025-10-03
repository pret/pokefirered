#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_LEPPA_BERRY].holdEffect == HOLD_EFFECT_RESTORE_PP);
}

SINGLE_BATTLE_TEST("Restore PP berry activates immediately on switch in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LEPPA_BERRY); MovesWithPP({MOVE_SCRATCH, 0}, {MOVE_CELEBRATE, 20}); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_POUND); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    } THEN {
        EXPECT(player->item == ITEM_NONE);
    }
}
