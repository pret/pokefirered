#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_LAST_RESORT) == EFFECT_LAST_RESORT);
}

SINGLE_BATTLE_TEST("Last Resort always fails if it's the only known move")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_LAST_RESORT); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
    } SCENE {
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        NOT HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Last Resort works only when all of the known moves have been used - 2 moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_LAST_RESORT, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
    } SCENE {
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Scratch!");
        MESSAGE("Wobbuffet used Last Resort!");
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Last Resort works only when all of the known moves have been used - 3 moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_LAST_RESORT, MOVE_QUICK_ATTACK, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_QUICK_ATTACK); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
    } SCENE {
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Quick Attack!");
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Scratch!");
        MESSAGE("Wobbuffet used Last Resort!");
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Last Resort works only when all of the known moves have been used - 4 moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_LAST_RESORT, MOVE_QUICK_ATTACK, MOVE_SCRATCH, MOVE_GUST); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_QUICK_ATTACK); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
        TURN { MOVE(player, MOVE_GUST); }
        TURN { MOVE(player, MOVE_LAST_RESORT); }
    } SCENE {
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Quick Attack!");
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Scratch!");
        MESSAGE("Wobbuffet used Last Resort!");
        MESSAGE("But it failed!");
        MESSAGE("Wobbuffet used Gust!");
        MESSAGE("Wobbuffet used Last Resort!");
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Last Resort works with Sleep Talk")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SLEEP_TALK) == EFFECT_SLEEP_TALK);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_LAST_RESORT, MOVE_SLEEP_TALK); Status1(STATUS1_SLEEP_TURN(3)); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        // Turn 1
        MESSAGE("Wobbuffet used Sleep Talk!");
        MESSAGE("Wobbuffet used Last Resort!");
        NOT MESSAGE("But it failed!");
        HP_BAR(opponent);
        // Turn 2
        MESSAGE("Wobbuffet used Sleep Talk!");
        MESSAGE("Wobbuffet used Last Resort!");
        NOT MESSAGE("But it failed!");
        HP_BAR(opponent);
    }
}
