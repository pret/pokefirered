#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_MAGIC_COAT) == EFFECT_MAGIC_COAT);
}

SINGLE_BATTLE_TEST("Magic Coat prints the correct message when bouncing back a move")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SPORE) == EFFECT_SLEEP);
        PLAYER(SPECIES_ZIGZAGOON);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_MAGIC_COAT); MOVE(opponent, MOVE_SPORE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MAGIC_COAT, player);
        MESSAGE("Zigzagoon bounced the Spore back!");;
        MESSAGE("The opposing Wynaut fell asleep!");
        STATUS_ICON(opponent, sleep: TRUE);
    }
}
