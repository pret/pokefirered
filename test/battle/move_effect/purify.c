#include "global.h"
#include "test/battle.h"

AI_DOUBLE_BATTLE_TEST("AI uses Purify")
{
    u32 status1;

    PARAMETRIZE { status1 = STATUS1_NONE; }
    PARAMETRIZE { status1 = STATUS1_FREEZE; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_TRY_TO_FAINT | AI_FLAG_CHECK_VIABILITY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_HEADBUTT, MOVE_PURIFY); }
        OPPONENT(SPECIES_WOBBUFFET) { Status1(status1); Moves(MOVE_HEADBUTT); }
    } WHEN {
        if (status1 == STATUS1_NONE)
            TURN { NOT_EXPECT_MOVE(opponentLeft, MOVE_PURIFY); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_PURIFY, target: opponentRight); }
    }
}

TO_DO_BATTLE_TEST("TODO: Write Purify (Move Effect) test titles")
TO_DO_BATTLE_TEST("Purify doesn't heal HP if the target has Comatose")
