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

SINGLE_BATTLE_TEST("Wish heals the user at the end of the next turn")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WISH); MOVE(opponent, MOVE_POUND); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WISH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponent);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
        MESSAGE("Wobbuffet's wish came true!");
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Wish is blocked by Heal Block")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_WISH); MOVE(opponent, MOVE_POUND); }
        TURN { MOVE(opponent, MOVE_HEAL_BLOCK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WISH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponent);
        HP_BAR(player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BLOCK, opponent);
        MESSAGE("Wobbuffet was prevented from healing!");
        NOT HP_BAR(player);
    }
}

TO_DO_BATTLE_TEST("TODO: Write Wish (Move Effect) test titles")
