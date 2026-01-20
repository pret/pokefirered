#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Drizzle summons rain", s16 damage)
{
    enum Ability ability;
    PARAMETRIZE { ability = ABILITY_DRIZZLE; }
    PARAMETRIZE { ability = ABILITY_DAMP; }

    GIVEN {
        PLAYER(SPECIES_POLITOED) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_BUBBLE); }
    } SCENE {
        if (ability == ABILITY_DRIZZLE) {
            ABILITY_POPUP(player, ABILITY_DRIZZLE);
            MESSAGE("Politoed's Drizzle made it rain!");
        }
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[1].damage, Q_4_12(1.5), results[0].damage);
    }
}

SINGLE_BATTLE_TEST("Drizzle sets up rain for 5 turns (Gen6+)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_6);
        PLAYER(SPECIES_POLITOED) { Moves(MOVE_CELEBRATE); Ability(ABILITY_DRIZZLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_DRIZZLE);
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("The rain stopped.");
    }
}

SINGLE_BATTLE_TEST("Drizzle sets up rain for 8 turns with Damp Rock (Gen6+)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_6);
        PLAYER(SPECIES_POLITOED) { Moves(MOVE_CELEBRATE); Ability(ABILITY_DRIZZLE); Item(ITEM_DAMP_ROCK); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
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
        ABILITY_POPUP(player, ABILITY_DRIZZLE);
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("The rain stopped.");
    }
}

SINGLE_BATTLE_TEST("Drizzle sets up permanent rain (Gen3-5)")
{
    GIVEN {
        WITH_CONFIG(CONFIG_ABILITY_WEATHER, GEN_3);
        PLAYER(SPECIES_POLITOED) { Moves(MOVE_CELEBRATE); Ability(ABILITY_DRIZZLE); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
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
        ABILITY_POPUP(player, ABILITY_DRIZZLE);
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        MESSAGE("Rain continues to fall.");
        NOT MESSAGE("The rain stopped.");
    }
}
