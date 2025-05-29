#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_FOLLOW_ME) == EFFECT_FOLLOW_ME);
    ASSUME(GetMoveEffect(MOVE_SPOTLIGHT) == EFFECT_FOLLOW_ME);
}

DOUBLE_BATTLE_TEST("Follow Me redirects single target moves used by opponents to user")
{
    struct BattlePokemon *moveUser = NULL;
    struct BattlePokemon *partner = NULL;
    PARAMETRIZE { moveUser = opponentLeft; partner = opponentRight; }
    PARAMETRIZE { moveUser = opponentRight; partner = opponentLeft; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: moveUser);
               MOVE(playerRight, MOVE_SCRATCH, target: partner);
               MOVE(moveUser, MOVE_FOLLOW_ME);
               MOVE(partner, MOVE_SCRATCH, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOLLOW_ME, moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerLeft);
        HP_BAR(moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerRight);
        HP_BAR(moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, partner);
        HP_BAR(playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Spotlight redirects single target moves used by the opposing side to Spotlight's target")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = playerRight; }
    PARAMETRIZE { moveTarget = opponentLeft; }
    PARAMETRIZE { moveTarget = opponentRight; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SPOTLIGHT, target: moveTarget);
               MOVE(playerRight, MOVE_SCRATCH, target: opponentRight);
               MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft);
               MOVE(opponentRight, MOVE_SCRATCH, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPOTLIGHT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerRight);
        if (moveTarget != playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        if (moveTarget == playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        if (moveTarget == playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(playerLeft);
    }
}
