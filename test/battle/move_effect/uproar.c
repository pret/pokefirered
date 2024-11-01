#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gMovesInfo[MOVE_UPROAR].effect == EFFECT_UPROAR);
}

DOUBLE_BATTLE_TEST("Uproar status causes sleeping pokemon to wake up during an attack")
{
    PASSES_RANDOMLY(1, 2, RNG_RANDOM_TARGET); // test fails if we target soundproof mon
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); }
        OPPONENT(SPECIES_VOLTORB) { Ability(ABILITY_SOUNDPROOF); Status1(STATUS1_SLEEP); }
        OPPONENT(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_UPROAR); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_UPROAR, playerLeft);
        HP_BAR(opponentRight);
        MESSAGE("The uproar woke Wobbuffet!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerRight);
        MESSAGE("The uproar woke the opposing Voltorb!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentLeft);
        MESSAGE("The uproar woke the opposing Wobbuffet!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentRight);
    }
}
