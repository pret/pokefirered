#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Mimic doesn't error when the last move used by the target resolves to MOVE_UNAVAILABLE")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {MOVE(opponent, MOVE_TRANSFORM); MOVE(player, MOVE_MIMIC); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRANSFORM, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_MIMIC, player);
    } THEN {
        EXPECT_EQ(gLastMoves[1], MOVE_UNAVAILABLE); // This test depends on the current implementation of Transform, if this changes, the test should be changed
    }
}

TO_DO_BATTLE_TEST("TODO: Write Mimic (Move Effect) test titles")
