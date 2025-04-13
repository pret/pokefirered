#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Counter is not affected by Protect effects")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SPIKY_SHIELD; }
    PARAMETRIZE { move = MOVE_BANEFUL_BUNKER; }
    PARAMETRIZE { move = MOVE_BURNING_BULWARK; }
    PARAMETRIZE { move = MOVE_KINGS_SHIELD; }
    PARAMETRIZE { move = MOVE_SILK_TRAP; }
    PARAMETRIZE { move = MOVE_OBSTRUCT; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); MOVE(player, MOVE_COUNTER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, player);
            if (move == MOVE_SPIKY_SHIELD) {
                HP_BAR(player);
            } else if (move == MOVE_BANEFUL_BUNKER) {
                STATUS_ICON(player, STATUS1_POISON);
            } else if (move == MOVE_BURNING_BULWARK) {
                STATUS_ICON(player, STATUS1_BURN);
            } else if (move == MOVE_KINGS_SHIELD) {
                MESSAGE("Wobbuffet's Attack fell!");
            } else if (move == MOVE_SILK_TRAP) {
                MESSAGE("Wobbuffet's Speed fell!");
            } else if (move == MOVE_OBSTRUCT) {
                MESSAGE("Wobbuffet's Defense harshly fell!");
            }
        }
    }
}

TO_DO_BATTLE_TEST("Counter will do twice as much damage received from the opponent");
TO_DO_BATTLE_TEST("Counter cannot affect ally Pokémon");
TO_DO_BATTLE_TEST("Counter hits the last opponent that hit the user"); //Doubles

// Gen 1
TO_DO_BATTLE_TEST("Counter can only counter Normal and Fighting-type moves (Gen 1)");
TO_DO_BATTLE_TEST("Counter can hit ghost-type Pokémon (Gen 1)");
TO_DO_BATTLE_TEST("Counter can return damage dealt to a substitute (Gen 1)");

// Gen 2-3
TO_DO_BATTLE_TEST("Counter can counter Hidden Power regardless of type (Gen 2-3)");

// Gen 2+
TO_DO_BATTLE_TEST("Counter can only counter physical moves (Gen 2+)");
TO_DO_BATTLE_TEST("Counter cannot hit ghost-type Pokémon (Gen 2+)");
TO_DO_BATTLE_TEST("Counter cannot return damage dealt to a substitute (Gen 2+)");

// Triple Battles required to test
//TO_DO_BATTLE_TEST("Counter can hit non-adjacent opponents if they were the last Pokémon to hit the user");
