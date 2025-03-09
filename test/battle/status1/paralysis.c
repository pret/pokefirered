#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Paralysis reduces Speed by 50% (Gen 7+) or 75% (Gen 1-6)")
{
    u32 playerSpeed, genConfig;
    bool32 playerFirst;
    PARAMETRIZE { playerSpeed = 196; playerFirst = FALSE; genConfig = GEN_6; }
    PARAMETRIZE { playerSpeed = 204; playerFirst = TRUE;  genConfig = GEN_6; }
    PARAMETRIZE { playerSpeed = 98;  playerFirst = FALSE; genConfig = GEN_7; }
    PARAMETRIZE { playerSpeed = 102; playerFirst = TRUE;  genConfig = GEN_7; }
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_PARALYSIS_SPEED, genConfig);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_PARALYSIS); Speed(playerSpeed); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(50); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        if (playerFirst) {
            ONE_OF {
                MESSAGE("Wobbuffet used Celebrate!");
                MESSAGE("Wobbuffet is paralyzed, so it may be unable to move!");
            }
            MESSAGE("The opposing Wobbuffet used Celebrate!");
        } else {
            MESSAGE("The opposing Wobbuffet used Celebrate!");
            ONE_OF {
                MESSAGE("Wobbuffet used Celebrate!");
                MESSAGE("Wobbuffet is paralyzed, so it may be unable to move!");
            }
        }
    }
}

SINGLE_BATTLE_TEST("Paralysis has a 25% chance of skipping the turn")
{
    PASSES_RANDOMLY(25, 100, RNG_PARALYSIS);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_PARALYSIS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("Wobbuffet couldn't move because it's paralyzed!");
    }
}

AI_SINGLE_BATTLE_TEST("AI avoids Thunder Wave when it can not paralyse target")
{
    u32 species, ability;

    PARAMETRIZE { species = SPECIES_HITMONLEE; ability = ABILITY_LIMBER; }
    PARAMETRIZE { species = SPECIES_KOMALA; ability = ABILITY_COMATOSE; }
    PARAMETRIZE { species = SPECIES_NACLI; ability = ABILITY_PURIFYING_SALT; }
    PARAMETRIZE { species = SPECIES_PIKACHU; ability = ABILITY_STATIC; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(species) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE, MOVE_THUNDER_WAVE); }
    } WHEN {
        TURN { SCORE_EQ(opponent, MOVE_CELEBRATE, MOVE_THUNDER_WAVE); } // Both get -10
    }
}

SINGLE_BATTLE_TEST("Thunder Wave doesn't affect Electric types in Gen6+")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_PIKACHU].types[0] == TYPE_ELECTRIC);
        ASSUME(B_PARALYZE_ELECTRIC >= GEN_6);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PIKACHU);
    } WHEN {
        TURN { MOVE(player, MOVE_THUNDER_WAVE); }
    } SCENE {
        MESSAGE("Wobbuffet used Thunder Wave!");
        MESSAGE("It doesn't affect the opposing Pikachu…");
    }
}
