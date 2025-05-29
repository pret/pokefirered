#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_TOXIC) == EFFECT_NON_VOLATILE_STATUS);
    ASSUME(GetMoveNonVolatileStatus(MOVE_TOXIC) == MOVE_EFFECT_TOXIC);
    ASSUME(GetMoveEffect(MOVE_POISON_GAS) == EFFECT_NON_VOLATILE_STATUS);
    ASSUME(GetMoveNonVolatileStatus(MOVE_POISON_GAS) == MOVE_EFFECT_POISON);
    ASSUME(GetMoveEffect(MOVE_WILL_O_WISP) == EFFECT_NON_VOLATILE_STATUS);
    ASSUME(GetMoveNonVolatileStatus(MOVE_WILL_O_WISP) == MOVE_EFFECT_BURN);
    ASSUME(GetMoveEffect(MOVE_THUNDER_WAVE) == EFFECT_NON_VOLATILE_STATUS);
    ASSUME(GetMoveNonVolatileStatus(MOVE_THUNDER_WAVE) == MOVE_EFFECT_PARALYSIS);
    ASSUME(GetMoveEffect(MOVE_HYPNOSIS) == EFFECT_NON_VOLATILE_STATUS);
    ASSUME(GetMoveNonVolatileStatus(MOVE_HYPNOSIS) == MOVE_EFFECT_SLEEP);
}

DOUBLE_BATTLE_TEST("Flower Veil prevents Toxic bad poison on partner - right target")
{
    u32 move;

    PARAMETRIZE { move = MOVE_TOXIC; }
    PARAMETRIZE { move = MOVE_POISON_GAS; }
    PARAMETRIZE { move = MOVE_WILL_O_WISP; }
    PARAMETRIZE { move = MOVE_THUNDER_WAVE; }
    PARAMETRIZE { move = MOVE_HYPNOSIS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_COMFEY) { Ability(ABILITY_FLOWER_VEIL); }
        OPPONENT(SPECIES_CHIKORITA);
    } WHEN {
        TURN { MOVE(playerLeft, move, target: opponentRight); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        ABILITY_POPUP(opponentLeft, ABILITY_FLOWER_VEIL);
        MESSAGE("The opposing Chikorita surrounded itself with a veil of petals!");
    }
}

DOUBLE_BATTLE_TEST("Flower Veil prevents Toxic bad poison on partner - left target")
{
    u32 move;

    PARAMETRIZE { move = MOVE_TOXIC; }
    PARAMETRIZE { move = MOVE_POISON_GAS; }
    PARAMETRIZE { move = MOVE_WILL_O_WISP; }
    PARAMETRIZE { move = MOVE_THUNDER_WAVE; }
    PARAMETRIZE { move = MOVE_HYPNOSIS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_CHIKORITA);
        OPPONENT(SPECIES_COMFEY) { Ability(ABILITY_FLOWER_VEIL); }
    } WHEN {
        TURN { MOVE(playerLeft, move, target: opponentLeft); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        ABILITY_POPUP(opponentRight, ABILITY_FLOWER_VEIL);
        MESSAGE("The opposing Chikorita surrounded itself with a veil of petals!");
    }
}
