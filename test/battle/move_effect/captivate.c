#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_CAPTIVATE) == EFFECT_CAPTIVATE);
    ASSUME(gSpeciesInfo[SPECIES_NIDOKING].genderRatio == MON_MALE);
    ASSUME(gSpeciesInfo[SPECIES_NIDOQUEEN].genderRatio == MON_FEMALE);
    ASSUME(gSpeciesInfo[SPECIES_STARMIE].genderRatio == MON_GENDERLESS);
}

SINGLE_BATTLE_TEST("Captivate decreases the target's Sp. Attack if they're opposite gender from the user")
{
    GIVEN {
        PLAYER(SPECIES_NIDOQUEEN);
        OPPONENT(SPECIES_NIDOKING);
    } WHEN {
        TURN { MOVE(player, MOVE_CAPTIVATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CAPTIVATE, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Nidoking's Sp. Atk harshly fell!");
    } THEN {
        EXPECT(opponent->statStages[STAT_SPATK] == 4);
    }
}

SINGLE_BATTLE_TEST("Captivate fails if the target and user share gender")
{
    GIVEN {
        PLAYER(SPECIES_NIDOKING);
        OPPONENT(SPECIES_NIDOKING);
    } WHEN {
        TURN { MOVE(player, MOVE_CAPTIVATE); }
    } SCENE {
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(opponent->statStages[STAT_SPATK] == 6);
    }
}

SINGLE_BATTLE_TEST("Captivate fails if the target is genderless")
{
    GIVEN {
        PLAYER(SPECIES_NIDOQUEEN);
        OPPONENT(SPECIES_STARMIE);
    } WHEN {
        TURN { MOVE(player, MOVE_CAPTIVATE); }
    } SCENE {
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(opponent->statStages[STAT_SPATK] == 6);
    }
}

SINGLE_BATTLE_TEST("Captivate fails if the user is genderless")
{
    GIVEN {
        PLAYER(SPECIES_STARMIE);
        OPPONENT(SPECIES_NIDOQUEEN);
    } WHEN {
        TURN { MOVE(player, MOVE_CAPTIVATE); }
    } SCENE {
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(opponent->statStages[STAT_SPATK] == 6);
    }
}

SINGLE_BATTLE_TEST("Captivate fails if both the user and the opponent are genderless")
{
    GIVEN {
        PLAYER(SPECIES_STARMIE);
        OPPONENT(SPECIES_STARMIE);
    } WHEN {
        TURN { MOVE(player, MOVE_CAPTIVATE); }
    } SCENE {
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(opponent->statStages[STAT_SPATK] == 6);
    }
}

SINGLE_BATTLE_TEST("Attract fails when used by a genderless Pokémon")
{
    GIVEN {
        PLAYER(SPECIES_STARMIE);
        OPPONENT(SPECIES_NIDOQUEEN);
    } WHEN {
        TURN { MOVE(player, MOVE_ATTRACT); }
    } SCENE {
        MESSAGE("Starmie used Attract!");
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(!(opponent->volatiles.infatuation));
    }
}

SINGLE_BATTLE_TEST("Attract fails if both the user and the target are genderless")
{
    GIVEN {
        PLAYER(SPECIES_STARMIE);
        OPPONENT(SPECIES_STARMIE);
    } WHEN {
        TURN { MOVE(player, MOVE_ATTRACT); }
    } SCENE {
        MESSAGE("Starmie used Attract!");
        MESSAGE("But it failed!");
    } THEN {
        EXPECT(!(opponent->volatiles.infatuation));
    }
}
