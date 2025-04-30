#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_WISH) == EFFECT_WISH);
}

SINGLE_BATTLE_TEST("Wish restores 50% of max player HP")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT) { HP(50); MaxHP(100); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WISH); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WISH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        MESSAGE("Wynaut's wish came true!");
        HP_BAR(player, hp: 100);
        MESSAGE("Wynaut's HP was restored.");
    }
}

