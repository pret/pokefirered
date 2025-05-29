#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_DRAGON_CHEER) == EFFECT_DRAGON_CHEER);
}

SINGLE_BATTLE_TEST("Dragon Cheer fails in a single battle")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DRAGON_CHEER); }
    } SCENE {
        MESSAGE("But it failed!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer increases critical hit ratio by 1 on non-Dragon types")
{
    bool32 useDragonCheer = 0;
    u32 genConfig = 0, chance = 0;
    for (u32 j = GEN_1; j <= GEN_9; j++) {
        PARAMETRIZE { genConfig = j; useDragonCheer = FALSE; chance = j >= GEN_7 ? 24 : 16; } // 6.25% with Wobbuffet's base speed
        PARAMETRIZE { genConfig = j; useDragonCheer = TRUE;  chance = 8; }  // 12.5% with Wobbuffet's base speed
    }
    PASSES_RANDOMLY(1, chance, RNG_CRITICAL_HIT);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CRIT_CHANCE, genConfig);
        ASSUME(GetMoveCriticalHitStage(MOVE_SCRATCH) == 0);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            if (useDragonCheer)
                MOVE(playerLeft, MOVE_DRAGON_CHEER, target: playerRight);
            MOVE(playerRight, MOVE_SCRATCH, target: opponentLeft);
        }
    } SCENE {
        if (useDragonCheer) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_CHEER, playerLeft);
            MESSAGE("Wobbuffet is getting pumped!");
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerRight);
        MESSAGE("A critical hit!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer increases critical hit ratio by 2 on Dragon types")
{
    bool32 useDragonCheer;
    u32 genConfig, passes, trials;
    PARAMETRIZE { genConfig = GEN_1; useDragonCheer = FALSE; passes = 25; trials = 256; } //  ~9.77% with Dratini's base speed
    PARAMETRIZE { genConfig = GEN_1; useDragonCheer = TRUE;  passes = 25; trials = 64; }  // ~39.06% with Dratini's base speed
    for (u32 j = GEN_2; j <= GEN_9; j++) {
        PARAMETRIZE { genConfig = j; useDragonCheer = FALSE; passes = 1; trials = j >= GEN_7 ? 24 : 16; } // ~4.16%/6.25%
        PARAMETRIZE { genConfig = j; useDragonCheer = TRUE;  passes = 1; trials = j >= GEN_6 ? 2 : 4; }   // 50%/25%
    }
    PASSES_RANDOMLY(passes, trials, RNG_CRITICAL_HIT);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CRIT_CHANCE, genConfig);
        ASSUME(GetMoveCriticalHitStage(MOVE_SCRATCH) == 0);
        ASSUME(gSpeciesInfo[SPECIES_DRATINI].baseSpeed == 50);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_DRATINI);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            if (useDragonCheer)
                MOVE(playerLeft, MOVE_DRAGON_CHEER, target: playerRight);
            MOVE(playerRight, MOVE_SCRATCH, target: opponentLeft);
        }
    } SCENE {
        if (useDragonCheer) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_CHEER, playerLeft);
            MESSAGE("Dratini is getting pumped!");
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerRight);
        MESSAGE("A critical hit!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Cheer fails if critical hit stage was already increased by Focus Energy")
{
    GIVEN {
        ASSUME(GetMoveCriticalHitStage(MOVE_SLASH) == 1);
        ASSUME(GetMoveEffect(MOVE_FOCUS_ENERGY) == EFFECT_FOCUS_ENERGY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_FOCUS_ENERGY); MOVE(playerRight, MOVE_DRAGON_CHEER, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOCUS_ENERGY, playerLeft);
        MESSAGE("But it failed!");
    }
}

TO_DO_BATTLE_TEST("Baton Pass passes Dragon Cheer's effect");
