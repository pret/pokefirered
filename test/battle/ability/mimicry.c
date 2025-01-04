#include "global.h"
#include "test/battle.h"

static const u16 terrainData[][2] =
{
    { MOVE_ELECTRIC_TERRAIN, TYPE_ELECTRIC, },
    { MOVE_PSYCHIC_TERRAIN,  TYPE_PSYCHIC, },
    { MOVE_GRASSY_TERRAIN,   TYPE_GRASS, },
    { MOVE_MISTY_TERRAIN,    TYPE_FAIRY, },
};

SINGLE_BATTLE_TEST("Mimicry changes the battler's type based on Terrain")
{
    u32 j;
    u32 terrainMove = MOVE_NONE;
    u32 terrainType = TYPE_NONE;

    for (j = 0; j < ARRAY_COUNT(terrainData); j++)
        PARAMETRIZE { terrainMove = terrainData[j][0]; terrainType = terrainData[j][1]; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_STUNFISK_GALAR) { Ability(ABILITY_MIMICRY); }
    } WHEN {
        TURN { MOVE(player, terrainMove); }
    } SCENE {
        ABILITY_POPUP(opponent);
        switch (terrainMove)
        {
        case MOVE_ELECTRIC_TERRAIN: MESSAGE("The opposing Stunfisk's type changed to Electric!"); break;
        case MOVE_PSYCHIC_TERRAIN:  MESSAGE("The opposing Stunfisk's type changed to Psychic!"); break;
        case MOVE_GRASSY_TERRAIN:   MESSAGE("The opposing Stunfisk's type changed to Grass!"); break;
        case MOVE_MISTY_TERRAIN:    MESSAGE("The opposing Stunfisk's type changed to Fairy!"); break;
        }
    } THEN {
        EXPECT_EQ(gBattleMons[B_POSITION_OPPONENT_LEFT].types[0], terrainType);
        EXPECT_EQ(gBattleMons[B_POSITION_OPPONENT_LEFT].types[1], terrainType);
    }
}

SINGLE_BATTLE_TEST("Mimicry restores the battler's types when terrain is removed by Steel Roller and Ice Spinner")
{
    u32 j;
    u32 terrainMove = MOVE_NONE;
    u32 removeTerrainMove = MOVE_NONE;

    for (j = 0; j < ARRAY_COUNT(terrainData); j++)
    {
        PARAMETRIZE { removeTerrainMove = MOVE_STEEL_ROLLER; terrainMove = terrainData[j][0]; }
        PARAMETRIZE { removeTerrainMove = MOVE_ICE_SPINNER; terrainMove =  terrainData[j][0]; }
    }

    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_STUNFISK_GALAR].types[0] == TYPE_GROUND);
        ASSUME(gSpeciesInfo[SPECIES_STUNFISK_GALAR].types[1] == TYPE_STEEL);
        PLAYER(SPECIES_WOBBUFFET); 
        OPPONENT(SPECIES_STUNFISK_GALAR) { Ability(ABILITY_MIMICRY); }
    } WHEN {
        TURN { MOVE(opponent, terrainMove); MOVE(player, removeTerrainMove); }
    } SCENE {
        switch (terrainMove)
        {
        case MOVE_ELECTRIC_TERRAIN: MESSAGE("The electricity disappeared from the battlefield."); break;
        case MOVE_PSYCHIC_TERRAIN:  MESSAGE("The weirdness disappeared from the battlefield!"); break;
        case MOVE_GRASSY_TERRAIN:   MESSAGE("The grass disappeared from the battlefield."); break;
        case MOVE_MISTY_TERRAIN:    MESSAGE("The mist disappeared from the battlefield."); break;
        }
    } THEN {
        EXPECT_EQ(gBattleMons[B_POSITION_OPPONENT_LEFT].types[0], TYPE_GROUND);
        EXPECT_EQ(gBattleMons[B_POSITION_OPPONENT_LEFT].types[1], TYPE_STEEL);
    }
}
