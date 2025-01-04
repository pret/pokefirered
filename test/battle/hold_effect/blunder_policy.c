#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_BLUNDER_POLICY].holdEffect == HOLD_EFFECT_BLUNDER_POLICY);
}

SINGLE_BATTLE_TEST("Blunder Policy raises the users speed by 2 stages if the user misses")
{
    PASSES_RANDOMLY(3, 10, RNG_ACCURACY);
    GIVEN {
        ASSUME(GetMoveAccuracy(MOVE_FOCUS_BLAST) == 70);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_BLUNDER_POLICY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_FOCUS_BLAST); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_BLAST, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
    } THEN {
        EXPECT(player->item == ITEM_NONE);
        EXPECT_EQ(player->statStages[STAT_SPEED], DEFAULT_STAT_STAGE + 2);
    }
}


SINGLE_BATTLE_TEST("Blunder Policy will never trigger if the move fails due to an immunity")
{
    PASSES_RANDOMLY(10, 10, RNG_ACCURACY);
    GIVEN {
        ASSUME(GetMoveAccuracy(MOVE_FOCUS_BLAST) == 70);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_BLUNDER_POLICY); }
        OPPONENT(SPECIES_GASTLY);
    } WHEN {
        TURN { MOVE(player, MOVE_FOCUS_BLAST); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_BLAST, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        }
    } THEN {
        EXPECT(player->item == ITEM_BLUNDER_POLICY);
        EXPECT_EQ(player->statStages[STAT_SPEED], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Blunder Policy will never trigger if the move fails due to Protect")
{
    PASSES_RANDOMLY(10, 10, RNG_ACCURACY);
    GIVEN {
        ASSUME(GetMoveAccuracy(MOVE_FOCUS_BLAST) == 70);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_BLUNDER_POLICY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_PROTECT); MOVE(player, MOVE_FOCUS_BLAST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PROTECT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_BLAST, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        }
    } THEN {
        EXPECT(player->item == ITEM_BLUNDER_POLICY);
        EXPECT_EQ(player->statStages[STAT_SPEED], DEFAULT_STAT_STAGE);
    }
}
