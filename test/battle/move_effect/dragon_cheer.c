#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Dragon Cheer fails in a single battle")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DRAGON_CHEER) == EFFECT_DRAGON_CHEER);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DRAGON_CHEER); }
    } SCENE {
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer increases critical hit ratio by one on non-Dragon types")
{
    PASSES_RANDOMLY(1, 8, RNG_CRITICAL_HIT);
    GIVEN {
        ASSUME(B_CRIT_CHANCE >= GEN_7);
        ASSUME(GetMoveCriticalHitStage(MOVE_TACKLE) == 0);
        ASSUME(GetMoveEffect(MOVE_DRAGON_CHEER) == EFFECT_DRAGON_CHEER);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_CHEER, target: playerRight); MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_CHEER, playerLeft);
        MESSAGE("Wynaut is getting pumped!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        MESSAGE("A critical hit!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer increases critical hit ratio by two on Dragon types")
{
    PASSES_RANDOMLY(1, 2, RNG_CRITICAL_HIT);
    GIVEN {
        ASSUME(B_CRIT_CHANCE >= GEN_7);
        ASSUME(GetMoveCriticalHitStage(MOVE_TACKLE) == 0);
        ASSUME(GetMoveEffect(MOVE_DRAGON_CHEER) == EFFECT_DRAGON_CHEER);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DRATINI);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_CHEER, target: playerRight); MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_CHEER, playerLeft);
        MESSAGE("Dratini is getting pumped!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        MESSAGE("A critical hit!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer fails if critical hit stage was already increased by Focus Energy")
{
    GIVEN {
        ASSUME(GetMoveCriticalHitStage(MOVE_SLASH) == 1);
        ASSUME(GetMoveEffect(MOVE_FOCUS_ENERGY) == EFFECT_FOCUS_ENERGY);
        ASSUME(GetMoveEffect(MOVE_DRAGON_CHEER) == EFFECT_DRAGON_CHEER);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_FOCUS_ENERGY); MOVE(playerRight, MOVE_DRAGON_CHEER, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_ENERGY, playerLeft);
        MESSAGE("But it failed!");
    }
}

TO_DO_BATTLE_TEST("Baton Pass passes Dragon Cheer's effect");
