#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Aegislash reverts to Shield Form upon fainting (start as Shield)")
{
    GIVEN {
        PLAYER(SPECIES_AEGISLASH_SHIELD) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); MOVE(opponent, MOVE_GUST); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Gust!");
        MESSAGE("Aegislash fainted!");
    } THEN {
        EXPECT_EQ(GetMonData(&gPlayerParty[0], MON_DATA_SPECIES), SPECIES_AEGISLASH_SHIELD);
    }
}

SINGLE_BATTLE_TEST("Aegislash reverts to Shield Form upon fainting (start as Blade)")
{
    GIVEN {
        PLAYER(SPECIES_AEGISLASH_BLADE) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_GUST); SEND_OUT(player, 1); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Gust!");
        MESSAGE("Aegislash fainted!");
    } THEN {
        EXPECT_EQ(GetMonData(&gPlayerParty[0], MON_DATA_SPECIES), SPECIES_AEGISLASH_SHIELD);
    }
}

DOUBLE_BATTLE_TEST("Causing a Forecast or Flower Gift Pokémon to faint should not cause a message") // issue 7795
{
    u32 species;
    PARAMETRIZE { species = SPECIES_CASTFORM; }
    PARAMETRIZE { species = SPECIES_CHERRIM; }
    GIVEN {
        PLAYER(SPECIES_WYNAUT);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_VULPIX) { Ability(ABILITY_DROUGHT); }
        OPPONENT(species) { HP(1); }
    } WHEN {
        TURN { MOVE(playerRight, MOVE_GYRO_BALL, target: opponentRight); }
    } SCENE {
        if (species == SPECIES_CASTFORM) {
            MESSAGE("The opposing Castform fainted!");
            NOT MESSAGE("The opposing Castform transformed!");
        } else {
            MESSAGE("The opposing Cherrim fainted!");
            NOT MESSAGE("The opposing Cherrim transformed!");
        }
    }
}
