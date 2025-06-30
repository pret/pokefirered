#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Expanding Force's power increases by 50% if the user is affected by Psychic Terrain", s16 damage)
{
    bool32 terrain;
    PARAMETRIZE { terrain = FALSE; }
    PARAMETRIZE { terrain = TRUE; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_EXPANDING_FORCE) == EFFECT_EXPANDING_FORCE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (terrain)
            TURN { MOVE(player, MOVE_PSYCHIC_TERRAIN); }
        TURN { MOVE(player, MOVE_EXPANDING_FORCE); }
    } SCENE {
        MESSAGE("Wobbuffet used Expanding Force!");
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (B_TERRAIN_TYPE_BOOST >= GEN_8)
            // 1.3 Terrain boost x 1.5 effect boost = 1.95 boost
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.95), results[1].damage);
        else
            // 1.5 Terrain boost x 1.5 effect boost = 2.25 boost
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(2.25), results[1].damage);
    }
}
