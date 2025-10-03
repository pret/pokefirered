#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Synchronoise hits all Pokemon that share a type with the attacker")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SYNCHRONOISE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SYNCHRONOISE, playerLeft);
        HP_BAR(opponentLeft);
        HP_BAR(playerRight);
        HP_BAR(opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Synchronoise will fail if there is no corresponding typing on the field")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_BULBASAUR);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SYNCHRONOISE); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SYNCHRONOISE, playerLeft);
        MESSAGE("Wobbuffet used Synchronoise!");
        MESSAGE("It doesn't affect the opposing Bulbasaur…");
        MESSAGE("It doesn't affect Bulbasaur…");
        MESSAGE("It doesn't affect the opposing Bulbasaur…");
        NOT MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Synchronoise will hit if there is at least one target")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_BULBASAUR);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SYNCHRONOISE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SYNCHRONOISE, playerLeft);
        HP_BAR(opponentLeft);
        NONE_OF {
            HP_BAR(playerRight);
            HP_BAR(opponentRight);
            MESSAGE("But it failed!");
        }
    }
}

DOUBLE_BATTLE_TEST("Synchronoise will fail if the corresponding typing mon protects")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_BULBASAUR);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_BULBASAUR);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_PROTECT); MOVE(playerLeft, MOVE_SYNCHRONOISE); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SYNCHRONOISE, playerLeft);
    }
}

TO_DO_BATTLE_TEST("TODO: Write Synchronoise (Move Effect) test titles")
