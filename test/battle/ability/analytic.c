#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Analytic increases the power of moves by 30% if it's the last one that uses its move", s16 damage)
{
    u32 speed;

    PARAMETRIZE { speed = 3; }
    PARAMETRIZE { speed = 1; }

    GIVEN {
        PLAYER(SPECIES_MAGNEMITE) { Ability(ABILITY_ANALYTIC); Speed(speed); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.3), results[1].damage);
    }
}

TO_DO_BATTLE_TEST("Analytic takes into account modifications to speeed an priority (Gen 5-8)");       //Eg. Paralysis, Power Weight, Stall
TO_DO_BATTLE_TEST("Analytic does not take into account modifications to speeed an priority (Gen 8)"); //Eg. Paralysis, Power Weight, Stall
TO_DO_BATTLE_TEST("Analytic takes into account the turn order of what fainted Pokémon would've moved");

// Triple Battles needed to test
//TO_DO_BATTLE_TEST("If the Pokémon with Analytic is targeting a Pokémon in a flank position that chooses to switch with its ally in the middle, its move's power will always be normal when it attacks the Pokémon that is shifted into the flank position");
//TO_DO_BATTLE_TEST("If the Pokémon with Analytic targets a Pokémon in the middle whose ally on a flank chooses to shift into the middle position, its move's power still depends on whether the Pokémon that was in the middle (and is now on a flank) has acted when the Pokémon with Analytic uses its move");
