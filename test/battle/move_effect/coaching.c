#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_COACHING) == EFFECT_COACHING);
}

DOUBLE_BATTLE_TEST("Coaching raises Attack and Defense of ally by 1 stage each")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_COACHING, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, playerLeft);
        MESSAGE("Wynaut's Attack rose!");
        MESSAGE("Wynaut's Defense rose!");
    }
}

DOUBLE_BATTLE_TEST("Coaching bypasses Protect")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_PROTECT) == EFFECT_PROTECT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_PROTECT); MOVE(playerLeft, MOVE_COACHING, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, playerLeft);
        MESSAGE("Wynaut's Attack rose!");
        MESSAGE("Wynaut's Defense rose!");
    }
}

DOUBLE_BATTLE_TEST("Coaching bypasses Crafty Shield")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CRAFTY_SHIELD) == EFFECT_PROTECT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_CRAFTY_SHIELD); MOVE(playerLeft, MOVE_COACHING, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, playerLeft);
        MESSAGE("Wynaut's Attack rose!");
        MESSAGE("Wynaut's Defense rose!");
    }
}

DOUBLE_BATTLE_TEST("Coaching fails if all allies are is semi-invulnerable")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FLY) == EFFECT_SEMI_INVULNERABLE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_HAWLUCHA);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_FLY, target: opponentLeft); MOVE(playerLeft, MOVE_COACHING, target: playerRight); }
    } SCENE {
        MESSAGE("Hawlucha used Fly!");
        MESSAGE("Wobbuffet used Coaching!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, playerLeft);
            MESSAGE("Hawlucha's Attack rose!");
            MESSAGE("Hawlucha's Defense rose!");
        }
        MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Coaching fails in single battles")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_COACHING); }
    } SCENE {
        MESSAGE("But it failed!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, player);
            MESSAGE("Wynaut's Attack rose!");
            MESSAGE("Wynaut's Defense rose!");
        }
    }
}

DOUBLE_BATTLE_TEST("Coaching fails if there's no ally")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT) { HP(1); };
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: playerRight); }
        TURN { MOVE(playerLeft, MOVE_COACHING, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        MESSAGE("Wynaut fainted!");
        MESSAGE("Wobbuffet used Coaching!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_COACHING, playerLeft);
            MESSAGE("Wynaut's Attack rose!");
            MESSAGE("Wynaut's Defense rose!");
        }
        MESSAGE("But it failed!");
    }
}
