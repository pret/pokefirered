#include "global.h"
#include "test/battle.h"

AI_DOUBLE_BATTLE_TEST("AI prefers Entrainment'ing good abilities onto partner with bad ability")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_SMART_TRAINER);
        PLAYER(SPECIES_QUAXWELL) { Level(18); Ability(ABILITY_TORRENT); Moves(MOVE_WATER_GUN); };
        PLAYER(SPECIES_CORPHISH) { Level(18); Moves(MOVE_WATER_GUN); };
        OPPONENT(SPECIES_SMEARGLE) { Level(17); Ability(ABILITY_TECHNICIAN); Moves(MOVE_AERIAL_ACE, MOVE_ENTRAINMENT, MOVE_FLAME_WHEEL, MOVE_MAGICAL_LEAF); }
        OPPONENT(SPECIES_ARCHEN) { Level(17); Ability(ABILITY_DEFEATIST); Moves(MOVE_DUAL_WINGBEAT, MOVE_ROCK_TOMB); }
    } WHEN {
        TURN { EXPECT_MOVE(opponentLeft, MOVE_ENTRAINMENT); EXPECT_MOVE(opponentRight, MOVE_DUAL_WINGBEAT); MOVE(playerLeft, MOVE_WATER_GUN); MOVE(playerRight, MOVE_WATER_GUN); }
    }
}

TO_DO_BATTLE_TEST("Entrainment changes the target's Ability to match the user's");
TO_DO_BATTLE_TEST("Entrainment fails if the user's ability has cantBeCopied flag");
TO_DO_BATTLE_TEST("Entrainment fails if the targets's ability has cantBeOverwritten flag");
