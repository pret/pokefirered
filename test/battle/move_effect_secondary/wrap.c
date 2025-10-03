#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(MoveHasAdditionalEffect(MOVE_WRAP, MOVE_EFFECT_WRAP));
}

SINGLE_BATTLE_TEST("Wrap can damage the wrapped mon for 5 turns 50% of the time")
{
    PASSES_RANDOMLY(50, 100, RNG_WRAP);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WRAP); }
        TURN {}
        TURN {}
        TURN {}
        TURN {}
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WRAP, player);
        HP_BAR(opponent); // Direct damage

        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        NOT HP_BAR(opponent); // Residual Damage
    }
}

SINGLE_BATTLE_TEST("Wrap can damage the wrapped mon for 4 turns 50% of the time")
{
    PASSES_RANDOMLY(50, 100, RNG_WRAP);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WRAP); }
        TURN {}
        TURN {}
        TURN {}
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WRAP, player);
        HP_BAR(opponent); // Direct damage

        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        NOT HP_BAR(opponent); // Residual Damage
    }
}

SINGLE_BATTLE_TEST("Wrap can damage the wrapped mon 7 turns while holding a Grip Claw")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_GRIP_CLAW); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WRAP); }
        TURN {}
        TURN {}
        TURN {}
        TURN {}
        TURN {}
        TURN {}
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WRAP, player);
        HP_BAR(opponent); // Direct damage

        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        HP_BAR(opponent); // Residual Damage
        NOT HP_BAR(opponent); // Residual Damage
    }
}
