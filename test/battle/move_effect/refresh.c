#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_REFRESH) == EFFECT_REFRESH);
}

SINGLE_BATTLE_TEST("Refresh cures the user of burn, frostbite, poison, and paralysis")
{
    u32 status1;
    PARAMETRIZE { status1 = STATUS1_POISON; }
    PARAMETRIZE { status1 = STATUS1_BURN; }
    PARAMETRIZE { status1 = STATUS1_PARALYSIS; }
    PARAMETRIZE { status1 = STATUS1_TOXIC_POISON; }
    PARAMETRIZE { status1 = STATUS1_FROSTBITE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(status1); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_REFRESH); }
    } SCENE {
        MESSAGE("Wobbuffet's status returned to normal!");
        STATUS_ICON(player, none: TRUE);
    }
}

SINGLE_BATTLE_TEST("Refresh does not cure the user of Freeze")
{
    PASSES_RANDOMLY(20, 100, RNG_FROZEN);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_REFRESH); }
    } SCENE {
        MESSAGE("Wobbuffet used Refresh!");
        NONE_OF { 
            ANIMATION(ANIM_TYPE_MOVE, MOVE_REFRESH, player);
            STATUS_ICON(player, none: TRUE); }
        MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Refresh does not cure sleep when used by Sleep Talk")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SPORE) == EFFECT_SLEEP);
        ASSUME(GetMoveEffect(MOVE_SLEEP_TALK) == EFFECT_SLEEP_TALK);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SLEEP_TALK, MOVE_REFRESH); }
    } WHEN {
        TURN { MOVE(player, MOVE_SPORE); MOVE(opponent, MOVE_SLEEP_TALK); }
        TURN { MOVE(player, MOVE_SPORE); MOVE(opponent, MOVE_REFRESH); }
    } SCENE {
        MESSAGE("Wobbuffet used Spore!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, player);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_SLP, opponent);
        MESSAGE("The opposing Wobbuffet fell asleep!");
        MESSAGE("The opposing Wobbuffet used Sleep Talk!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, opponent);
        MESSAGE("The opposing Wobbuffet used Refresh!");
        NONE_OF { 
            ANIMATION(ANIM_TYPE_MOVE, MOVE_REFRESH, player);
            STATUS_ICON(player, none: TRUE); }
        MESSAGE("But it failed!");
    }
}
