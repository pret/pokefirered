#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gMovesInfo[MOVE_FOLLOW_ME].effect == EFFECT_FOLLOW_ME);
    ASSUME(gMovesInfo[MOVE_SPOTLIGHT].effect == EFFECT_FOLLOW_ME);
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
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: moveUser);
               MOVE(playerRight, MOVE_TACKLE, target: partner);
               MOVE(moveUser, MOVE_FOLLOW_ME);
               MOVE(partner, MOVE_TACKLE, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOLLOW_ME, moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        HP_BAR(moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        HP_BAR(moveUser);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, partner);
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
               MOVE(playerRight, MOVE_TACKLE, target: opponentRight);
               MOVE(opponentLeft, MOVE_TACKLE, target: playerLeft);
               MOVE(opponentRight, MOVE_TACKLE, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPOTLIGHT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        if (moveTarget != playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponentLeft);
        if (moveTarget == playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponentRight);
        if (moveTarget == playerRight)
            HP_BAR(moveTarget);
        else
            HP_BAR(playerLeft);
    }
}
