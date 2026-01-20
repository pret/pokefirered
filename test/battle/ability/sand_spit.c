#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Sand Spit sets up sandstorm for 5 turns when hit")
{
    GIVEN {
        PLAYER(SPECIES_SANDSLASH) { Moves(MOVE_CELEBRATE); Ability(ABILITY_SAND_SPIT); }
        OPPONENT(SPECIES_LANDORUS) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("The opposing Landorus used Tackle!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_SAND_SPIT);
        MESSAGE("A sandstorm kicked up!");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The sandstorm subsided.");
    }
}

SINGLE_BATTLE_TEST("Sand Spit sets up sandstorm for 8 turns when hit with Smooth Rock")
{
    GIVEN {
        PLAYER(SPECIES_SANDSLASH) { Moves(MOVE_CELEBRATE); Ability(ABILITY_SAND_SPIT); Item(ITEM_SMOOTH_ROCK); }
        OPPONENT(SPECIES_LANDORUS) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("The opposing Landorus used Tackle!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_SAND_SPIT);
        MESSAGE("A sandstorm kicked up!");
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

SINGLE_BATTLE_TEST("Sand Spit triggers even if the user is knocked out by the hit")
{
    GIVEN {
        PLAYER(SPECIES_SANDSLASH) { Ability(ABILITY_SAND_SPIT); HP(1); Speed(1); }
        PLAYER(SPECIES_LANDORUS) { Moves(MOVE_CELEBRATE); Speed(5); }
        OPPONENT(SPECIES_LANDORUS) { Moves(MOVE_TACKLE, MOVE_CELEBRATE); Speed(10); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE); SEND_OUT(player, 1); }
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("The opposing Landorus used Tackle!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_SAND_SPIT);
        MESSAGE("A sandstorm kicked up!");
        MESSAGE("The sandstorm is raging.");
        MESSAGE("The opposing Landorus used Celebrate!");
        MESSAGE("Landorus used Celebrate!");
        MESSAGE("The sandstorm is raging.");
    }
}
