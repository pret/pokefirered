#include "global.h"
#include "test/battle.h"
#include "battle_environment.h"

//TO_DO_BATTLE_TEST("TODO: Write Nature Power (Move Effect) test titles")

SINGLE_BATTLE_TEST("Nature power plays a move correctly in any background")
{
    u32 environment = 0;
    u32 move = MOVE_TRI_ATTACK;
    for (u32 j = 0; j < BATTLE_ENVIRONMENT_COUNT; j++)
    {
        PARAMETRIZE {environment = i;}
    }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        Environment(environment);
        if (gBattleEnvironmentInfo[environment].naturePower)
            move = gBattleEnvironmentInfo[environment].naturePower;
    } WHEN {
        TURN { MOVE(player, MOVE_NATURE_POWER); }
    } SCENE {
        NOT MESSAGE("Nature Power turned into Nature Power!");
        ANIMATION(ANIM_TYPE_MOVE, move, player);
    }
}
