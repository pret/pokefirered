#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"

AI_SINGLE_BATTLE_TEST("TIE_BREAK_SCORE with SCORE_TIE_CHOSEN can control AI move selection when scores are tied (Singles)")
{
    u32 tiedMove;
    u16 expectedMove;
    PARAMETRIZE { tiedMove = 3; expectedMove = MOVE_ICE_BEAM;       }
    PARAMETRIZE { tiedMove = 2; expectedMove = MOVE_FLAMETHROWER;   }
    PARAMETRIZE { tiedMove = 1; expectedMove = MOVE_SLUDGE_BOMB;    }
    PARAMETRIZE { tiedMove = 0; expectedMove = MOVE_THUNDERBOLT;    }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_SINGLES, SCORE_TIE_CHOSEN, tiedMove);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_DOUBLE_BATTLE_TEST("TIE_BREAK_SCORE with SCORE_TIE_CHOSEN can control AI move selection when scores are tied (Doubles)")
{
    u32 tiedMove;
    u16 expectedMove;
    PARAMETRIZE { tiedMove = 3; expectedMove = MOVE_ICE_BEAM;       }
    PARAMETRIZE { tiedMove = 2; expectedMove = MOVE_FLAMETHROWER;   }
    PARAMETRIZE { tiedMove = 1; expectedMove = MOVE_SLUDGE_BOMB;    }
    PARAMETRIZE { tiedMove = 0; expectedMove = MOVE_THUNDERBOLT;    }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_DOUBLES_MOVE, SCORE_TIE_CHOSEN, tiedMove);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, expectedMove, target: playerRight); EXPECT_MOVE(opponentRight, expectedMove, target: playerRight); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

// SCORE_TIE_RANDOM tested separately as needs larger sample size
AI_SINGLE_BATTLE_TEST("TIE_BREAK_SCORE correctly controls AI move selection when scores are tied for all values in enum ScoreTieResolution (Singles)")
{
    u32 enumValue;
    u16 expectedMove;
    PARAMETRIZE { enumValue = SCORE_TIE_NONE;   expectedMove = MOVE_THUNDERBOLT;    }
    PARAMETRIZE { enumValue = SCORE_TIE_LO;     expectedMove = MOVE_THUNDERBOLT;    }
    PARAMETRIZE { enumValue = SCORE_TIE_HI;     expectedMove = MOVE_ICE_BEAM;       }
    PARAMETRIZE { enumValue = SCORE_TIE_CHOSEN; expectedMove = MOVE_FLAMETHROWER;   }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_SINGLES, enumValue, 2);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, expectedMove); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

// SCORE_TIE_RANDOM tested separately as needs larger sample size
AI_DOUBLE_BATTLE_TEST("TIE_BREAK_SCORE correctly controls AI move selection when scores are tied for all values in enum ScoreTieResolution (Doubles)")
{
    u32 enumValue;
    u16 expectedMove;
    PARAMETRIZE { enumValue = SCORE_TIE_NONE;   expectedMove = MOVE_THUNDERBOLT;    }
    PARAMETRIZE { enumValue = SCORE_TIE_LO;     expectedMove = MOVE_THUNDERBOLT;    }
    PARAMETRIZE { enumValue = SCORE_TIE_HI;     expectedMove = MOVE_ICE_BEAM;       }
    PARAMETRIZE { enumValue = SCORE_TIE_CHOSEN; expectedMove = MOVE_FLAMETHROWER;   }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_DOUBLES_MOVE, enumValue, 2);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, expectedMove, target: playerRight); EXPECT_MOVE(opponentRight, expectedMove, target: playerRight); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_SINGLE_BATTLE_TEST("TIE_BREAK_SCORE with SCORE_TIE_RANDOM randomizes AI move selection (Singles)")
{
    PASSES_RANDOMLY(25, 100, RNG_AI_SCORE_TIE_SINGLES);

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_SINGLES, SCORE_TIE_RANDOM, 0);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_ICE_BEAM); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_DOUBLE_BATTLE_TEST("TIE_BREAK_SCORE with SCORE_TIE_RANDOM randomizes AI move selection (Doubles)")
{
    PASSES_RANDOMLY(25, 100, RNG_AI_SCORE_TIE_DOUBLES_MOVE);

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_SCORE(RNG_AI_SCORE_TIE_DOUBLES_MOVE, SCORE_TIE_RANDOM, 0);
        TIE_BREAK_TARGET(TARGET_TIE_HI, 0);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_ICE_BEAM); Speed(3); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_ICE_BEAM, target: playerRight); 
            EXPECT_MOVE(opponentRight, MOVE_ICE_BEAM, target: playerRight); 
            SEND_OUT(playerLeft, 2); 
            SEND_OUT(playerRight, 3);
        }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_DOUBLE_BATTLE_TEST("TIE_BREAK_TARGET with TARGET_TIE_CHOSEN can correctly control AI target selection when scores are tied")
{
    u32 targetValue;
    struct BattlePokemon *expectedTarget = playerLeft;
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { targetValue = 0; expectedTarget = playerLeft;    }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_TARGET(TARGET_TIE_CHOSEN, targetValue);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_THUNDERBOLT, target: expectedTarget); EXPECT_MOVE(opponentRight, MOVE_THUNDERBOLT, target: expectedTarget); 
            SEND_OUT(playerLeft, 2); SEND_OUT(playerRight, 3); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

// TARGET_TIE_RANDOM tested separately as needs larger sample size
AI_DOUBLE_BATTLE_TEST("TIE_BREAK_TARGET correctly controls AI target selection when scores are tied for all values in enum TargetTieResolution")
{
    u32 enumValue, targetValue;
    struct BattlePokemon *expectedTarget = playerLeft;
    PARAMETRIZE { enumValue = TARGET_TIE_NONE;   targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { enumValue = TARGET_TIE_LO;     targetValue = 0; expectedTarget = playerLeft;    }
    PARAMETRIZE { enumValue = TARGET_TIE_HI;     targetValue = 1; expectedTarget = playerRight;   }
    PARAMETRIZE { enumValue = TARGET_TIE_CHOSEN; targetValue = 1; expectedTarget = playerRight;   }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_TARGET(enumValue, targetValue);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_THUNDERBOLT, target: expectedTarget); EXPECT_MOVE(opponentRight, MOVE_THUNDERBOLT, target: expectedTarget); 
            SEND_OUT(playerLeft, 2); SEND_OUT(playerRight, 3); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
    }
}

AI_DOUBLE_BATTLE_TEST("TIE_BREAK_TARGET with TARGET_TIE_RANDOM randomizes AI target")
{
    PASSES_RANDOMLY(50, 100, RNG_AI_SCORE_TIE_DOUBLES_TARGET);

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        TIE_BREAK_TARGET(TARGET_TIE_RANDOM, 0);
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { HP(5); Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_THUNDERBOLT); Speed(3); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentRight, MOVE_THUNDERBOLT, target: playerRight); SEND_OUT(playerLeft, 2); SEND_OUT(playerRight, 3); }
    } SCENE {
        MESSAGE("Wobbuffet fainted!");
        MESSAGE("Wobbuffet fainted!");
    }
}
