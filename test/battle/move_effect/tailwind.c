#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_TAILWIND) == EFFECT_TAILWIND);
}

SINGLE_BATTLE_TEST("Tailwind applies for 4 turns")
{
    GIVEN {
        ASSUME(B_TAILWIND_TURNS >= GEN_5);
        PLAYER(SPECIES_WOBBUFFET) { Speed(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(15); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_TAILWIND); }
        TURN {}
        TURN {}
        TURN {}
        TURN {}
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        MESSAGE("Wobbuffet used Tailwind!");

        MESSAGE("Wobbuffet used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");

        MESSAGE("Wobbuffet used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");

        MESSAGE("Wobbuffet used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");

        MESSAGE("The opposing Wobbuffet used Celebrate!");
        MESSAGE("Wobbuffet used Celebrate!");
    }
}

DOUBLE_BATTLE_TEST("Tailwind doesn't affect the partner on the same turn it's used (Gen4-7)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_RECALC_TURN_AFTER_ACTIONS, GEN_7);
        PLAYER(SPECIES_WOBBUFFET) { Speed(20); }
        PLAYER(SPECIES_WYNAUT) { Speed(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(15); }
        OPPONENT(SPECIES_WYNAUT) { Speed(14); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TAILWIND); }
    } SCENE {
        MESSAGE("Wobbuffet used Tailwind!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        MESSAGE("The opposing Wynaut used Celebrate!");
        MESSAGE("Wynaut used Celebrate!");
    }
}

DOUBLE_BATTLE_TEST("Tailwind affects the partner on the same turn it's used (Gen8+)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_RECALC_TURN_AFTER_ACTIONS, GEN_8);
        PLAYER(SPECIES_WOBBUFFET) { Speed(20); }
        PLAYER(SPECIES_WYNAUT) { Speed(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(15); }
        OPPONENT(SPECIES_WYNAUT) { Speed(14); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TAILWIND); }
    } SCENE {
        MESSAGE("Wobbuffet used Tailwind!");
        MESSAGE("Wynaut used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        MESSAGE("The opposing Wynaut used Celebrate!");
    }
}
