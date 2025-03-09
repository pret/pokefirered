#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_BRICK_BREAK) == EFFECT_BRICK_BREAK);
    ASSUME(GetMoveEffect(MOVE_PSYCHIC_FANGS) == EFFECT_BRICK_BREAK);
    ASSUME(GetMoveEffect(MOVE_SNOWSCAPE) == EFFECT_SNOWSCAPE);
    ASSUME(GetMoveEffect(MOVE_LIGHT_SCREEN) == EFFECT_LIGHT_SCREEN);
    ASSUME(GetMoveEffect(MOVE_REFLECT) == EFFECT_REFLECT);
    ASSUME(GetMoveEffect(MOVE_AURORA_VEIL) == EFFECT_AURORA_VEIL);
}

SINGLE_BATTLE_TEST("Brick Break and Psychic Fangs remove Light Screen, Reflect and Aurora Veil from the target's side of the field")
{
    u32 move;
    u32 breakingMove;

    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_PSYCHIC_FANGS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SNOWSCAPE); }
        TURN { MOVE(opponent, move); MOVE(player, breakingMove); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNOWSCAPE, player);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        ANIMATION(ANIM_TYPE_MOVE, breakingMove, player);
        MESSAGE("The wall shattered!");
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Brick Break and Psychic Fangs don't remove Light Screen, Reflect and Aurora Veil if the target is immune")
{
    u32 move;
    u32 breakingMove;

    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_PSYCHIC_FANGS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_SABLEYE);
    } WHEN {
        TURN { MOVE(player, MOVE_SNOWSCAPE); }
        TURN { MOVE(opponent, move); MOVE(player, breakingMove); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNOWSCAPE, player);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, breakingMove, player);
            MESSAGE("The wall shattered!");
            HP_BAR(opponent);
        }
    }
}

SINGLE_BATTLE_TEST("Brick Break and Psychic Fangs don't remove Light Screen, Reflect and Aurora Veil if the target Protected")
{
    u32 move;
    u32 breakingMove;

    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_PSYCHIC_FANGS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SNOWSCAPE); MOVE(opponent, move); }
        TURN { MOVE(player, breakingMove); MOVE(opponent, MOVE_PROTECT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNOWSCAPE, player);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PROTECT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, breakingMove, player);
            MESSAGE("The wall shattered!");
            HP_BAR(opponent);
        }
    }
}

SINGLE_BATTLE_TEST("Brick Break and Psychic Fangs don't remove Light Screen, Reflect and Aurora Veil if it misses")
{
    u32 move;
    u32 breakingMove;

    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_PSYCHIC_FANGS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_BRIGHT_POWDER); }
    } WHEN {
        TURN { MOVE(player, MOVE_SNOWSCAPE); MOVE(opponent, move); }
        TURN { MOVE(player, breakingMove, hit: FALSE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNOWSCAPE, player);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, breakingMove, player);
            MESSAGE("The wall shattered!");
            HP_BAR(opponent);
        }
    }
}

DOUBLE_BATTLE_TEST("Brick Break and Psychic Fangs can remove Light Screen, Reflect and Aurora Veil on users side")
{
    u32 move;
    u32 breakingMove;

    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_BRICK_BREAK; }
    PARAMETRIZE { move = MOVE_LIGHT_SCREEN; breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_REFLECT;      breakingMove = MOVE_PSYCHIC_FANGS; }
    PARAMETRIZE { move = MOVE_AURORA_VEIL;  breakingMove = MOVE_PSYCHIC_FANGS; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(opponentLeft, MOVE_SNOWSCAPE);
            MOVE(playerLeft, move);
            MOVE(playerRight, breakingMove, target: playerLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNOWSCAPE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, breakingMove, playerRight);
        MESSAGE("The wall shattered!");
        HP_BAR(playerLeft);
    }
}
