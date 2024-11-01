#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Freeze has a 20% chance of being thawed")
{
    PASSES_RANDOMLY(20, 100, RNG_FROZEN);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        STATUS_ICON(player, none: TRUE);
    }
}

SINGLE_BATTLE_TEST("Freeze is thawed by opponent's Fire-type attacks")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_EMBER].type == TYPE_FIRE);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_EMBER); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Ember!");
        MESSAGE("Wobbuffet thawed out!");
        STATUS_ICON(player, none: TRUE);
    }
}

SINGLE_BATTLE_TEST("Freeze is thawed by user's Flame Wheel")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_FLAME_WHEEL].thawsUser);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_FLAME_WHEEL); }
    } SCENE {
        MESSAGE("Wobbuffet's Flame Wheel melted the ice!");
        STATUS_ICON(player, none: TRUE);
        MESSAGE("Wobbuffet used Flame Wheel!");
    }
}
