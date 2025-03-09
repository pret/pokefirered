#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_FOCUS_ENERGY) == EFFECT_FOCUS_ENERGY);
}

SINGLE_BATTLE_TEST("Focus Energy increases the user's critical hit ratio by 1 stage (Gen 1-2) or 2 stages (Gen 3+)")
{
    bool32 useFocusEnergy = 0;
    u32 genConfig = 0, chance = 0;
    for (u32 j = GEN_1; j <= GEN_9; j++) {
        PARAMETRIZE { genConfig = j; useFocusEnergy = FALSE; chance = j >= GEN_7 ? 24 : 16; } // ~4.16%/6.25% with Wobbuffet's base speed
        PARAMETRIZE { genConfig = j; useFocusEnergy = TRUE; 
            if (j >= GEN_6)
                chance = 2; // 50% / 25%
            else if (j >= GEN_3)
                chance = 4; // 25%
            else
                chance = 8; // 12.5% with Wobbuffet's base speed
        }
    }
    PASSES_RANDOMLY(1, chance, RNG_CRITICAL_HIT);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CRIT_CHANCE, genConfig);
        WITH_CONFIG(GEN_CONFIG_FOCUS_ENERGY_CRIT_RATIO, genConfig);
        ASSUME(gSpeciesInfo[SPECIES_WOBBUFFET].baseSpeed == 33);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (useFocusEnergy)
            TURN { MOVE(player, MOVE_FOCUS_ENERGY); }
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        if (useFocusEnergy)
            ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_ENERGY, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        MESSAGE("A critical hit!");
    }
}
