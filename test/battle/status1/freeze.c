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
        ASSUME(GetMoveType(MOVE_EMBER) == TYPE_FIRE);
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
        ASSUME(MoveThawsUser(MOVE_FLAME_WHEEL));
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

SINGLE_BATTLE_TEST("Freeze isn't thawed if opponent is asleep during thawing attack")
{
    PASSES_RANDOMLY(80, 100, RNG_FROZEN);
    GIVEN {
        ASSUME(GetMoveType(MOVE_EMBER) == TYPE_FIRE);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_EMBER); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        NONE_OF {
            MESSAGE("The opposing Wobbuffet used Ember!");
            MESSAGE("Wobbuffet thawed out!");
            STATUS_ICON(player, none: TRUE);
        }
    }
}

SINGLE_BATTLE_TEST("Freeze isn't thawed if opponent is asleep during thawing attack when using Scald")
{
    PASSES_RANDOMLY(80, 100, RNG_FROZEN);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCALD); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALD, opponent);
            MESSAGE("Wobbuffet thawed out!");
            STATUS_ICON(player, none: TRUE);
        }
    }
}
