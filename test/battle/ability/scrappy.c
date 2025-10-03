#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Scrappy doesn't prevent Intimidate (Gen4-7)")
{
    s16 turnOneHit;
    s16 turnTwoHit;

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_UPDATED_INTIMIDATE, GEN_7);
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_SHED_SKIN); };
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_INTIMIDATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Ability(ABILITY_SCRAPPY); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
        TURN { SWITCH(player, 1); MOVE(opponent, MOVE_SCRATCH); }

    } SCENE {
        HP_BAR(player, captureDamage: &turnOneHit);
        ABILITY_POPUP(player, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        NONE_OF {
            ABILITY_POPUP(opponent, ABILITY_SCRAPPY);
            MESSAGE("The opposing Kangaskhan's Scrappy prevents stat loss!");
        }
        HP_BAR(player, captureDamage: &turnTwoHit);
    } THEN {
        EXPECT_GT(turnOneHit, turnTwoHit);
    }
}

SINGLE_BATTLE_TEST("Scrappy prevents Intimidate (Gen8+)")
{
    s16 turnOneHit;
    s16 turnTwoHit;

    GIVEN {
        WITH_CONFIG(GEN_CONFIG_UPDATED_INTIMIDATE, GEN_8);
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_SHED_SKIN); };
        PLAYER(SPECIES_EKANS) { Ability(ABILITY_INTIMIDATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Ability(ABILITY_SCRAPPY); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
        TURN { SWITCH(player, 1); MOVE(opponent, MOVE_SCRATCH); }

    } SCENE {
        HP_BAR(player, captureDamage: &turnOneHit);
        ABILITY_POPUP(player, ABILITY_INTIMIDATE);
        NONE_OF { ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent); }
        ABILITY_POPUP(opponent, ABILITY_SCRAPPY);
        MESSAGE("The opposing Kangaskhan's Scrappy prevents stat loss!");
        HP_BAR(player, captureDamage: &turnTwoHit);
    } THEN {
        EXPECT_EQ(turnOneHit, turnTwoHit);
    }
}

SINGLE_BATTLE_TEST("Scrappy allows to hit Ghost-type Pokémon with Normal- and Fighting-type moves")
{
    u32 move;
    PARAMETRIZE { move = MOVE_SCRATCH; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; }

    GIVEN {
        PLAYER(SPECIES_KANGASKHAN) { Ability(ABILITY_SCRAPPY); };
        OPPONENT(SPECIES_GASTLY);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Scrappy doesn't bypass a Ghost-type's Wonder Guard")
{
    u32 move;
    PARAMETRIZE { move = MOVE_SCRATCH; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; }

    GIVEN {
        PLAYER(SPECIES_KANGASKHAN) { Ability(ABILITY_SCRAPPY); };
        OPPONENT(SPECIES_SHEDINJA) { Ability(ABILITY_WONDER_GUARD); };
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, move, player);
            HP_BAR(opponent);
        }
        ABILITY_POPUP(opponent, ABILITY_WONDER_GUARD);
        MESSAGE("The opposing Shedinja avoided damage with Wonder Guard!");
    }
}
