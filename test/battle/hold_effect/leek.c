#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Leek increases critical hit ratio by 2 stages for the Farfetch'd Family")
{
    u32 species, genConfig, passes, trials;

    PARAMETRIZE { genConfig = GEN_1; passes = 15; trials = 16; species = SPECIES_FARFETCHD; }       // ~93.8% with Farfetch'd's base speed
    PARAMETRIZE { genConfig = GEN_1; passes = 27; trials = 32; species = SPECIES_FARFETCHD_GALAR; } // ~84.4% with Galarian Farfetch'd's base speed
    PARAMETRIZE { genConfig = GEN_1; passes = 1;  trials = 1;  species = SPECIES_SIRFETCHD; }       // 100% with Sirfetch'd's base speed
    for (u32 j = GEN_2; j <= GEN_5; j++) {
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 4;  species = SPECIES_FARFETCHD; }       // 25%
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 4;  species = SPECIES_FARFETCHD_GALAR; } // 25%
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 4;  species = SPECIES_SIRFETCHD; }       // 25%
    }
    for (u32 j = GEN_6; j <= GEN_9; j++) {
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 2;  species = SPECIES_FARFETCHD; }       // 50%
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 2;  species = SPECIES_FARFETCHD_GALAR; } // 50%
        PARAMETRIZE { genConfig = j; passes = 1;  trials = 2;  species = SPECIES_SIRFETCHD; }       // 50%
    }
    PASSES_RANDOMLY(passes, trials, RNG_CRITICAL_HIT);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CRIT_CHANCE, genConfig);
        ASSUME(gSpeciesInfo[SPECIES_FARFETCHD].baseSpeed == 60);
        ASSUME(gSpeciesInfo[SPECIES_FARFETCHD_GALAR].baseSpeed == 55);
        ASSUME(gSpeciesInfo[SPECIES_SIRFETCHD].baseSpeed == 65);
        ASSUME(gItemsInfo[ITEM_LEEK].holdEffect == HOLD_EFFECT_LEEK);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(species) { Item(ITEM_LEEK); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        MESSAGE("A critical hit!");
    }
}
