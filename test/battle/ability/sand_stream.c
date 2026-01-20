#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Sand Stream sets up sandstorm for 5 turns (Gen6+)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_6);
        PLAYER(SPECIES_HIPPOWDON) { Moves(MOVE_CELEBRATE); Ability(ABILITY_SAND_STREAM); }
        OPPONENT(SPECIES_SANDSLASH) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_SAND_STREAM);
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm subsided.");
    }
}

SINGLE_BATTLE_TEST("Sand Stream sets up sandstorm for 8 turns with Smooth Rock (Gen6+)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_6);
        PLAYER(SPECIES_HIPPOWDON) { Moves(MOVE_CELEBRATE); Ability(ABILITY_SAND_STREAM); Item(ITEM_SMOOTH_ROCK); }
        OPPONENT(SPECIES_SANDSLASH) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_SAND_STREAM);
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm subsided.");
    }
}

SINGLE_BATTLE_TEST("Sand Stream sets up permanent sandstorm (Gen3-5)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_3);
        PLAYER(SPECIES_HIPPOWDON) { Moves(MOVE_CELEBRATE); Ability(ABILITY_SAND_STREAM); }
        OPPONENT(SPECIES_SANDSLASH) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_SAND_STREAM);
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        NOT MESSAGE("The sandstorm subsided.");
    }
}
