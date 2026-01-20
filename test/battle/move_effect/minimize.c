#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_MINIMIZE) == EFFECT_MINIMIZE);
}

SINGLE_BATTLE_TEST("Minimize increases the user's Evasion by 2 stages (Gen5+) or 1 stage (Gen1-4)")
{
    u32 config;
    PARAMETRIZE { config = GEN_4; }
    PARAMETRIZE { config = GEN_5; }

    GIVEN {
        WITH_CONFIG(CONFIG_MINIMIZE_EVASION, config);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_MINIMIZE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MINIMIZE, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    } THEN {
        EXPECT_EQ(player->statStages[STAT_EVASION], DEFAULT_STAT_STAGE + (config >= GEN_5 ? 2 : 1));
    }
}

// Minimize's flag tests are handled in tests/battle/move_flags/minimize_double_damage.c
