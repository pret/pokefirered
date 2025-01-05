#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Regenerator heals 1/3 of max HP upon switching out")
{
    u32 currHP;
    PARAMETRIZE { currHP = 1; }
    PARAMETRIZE { currHP = 2; }
    PARAMETRIZE { currHP = 3; }
    GIVEN {
        PLAYER(SPECIES_SLOWBRO) { Ability(ABILITY_REGENERATOR); HP(currHP); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(player, 1); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        SWITCH_OUT_MESSAGE("Slowbro");
        SEND_IN_MESSAGE("Wobbuffet");
        SWITCH_OUT_MESSAGE("Wobbuffet");
        SEND_IN_MESSAGE("Slowbro");
    } THEN {
        EXPECT_EQ(player->hp, player->maxHP / 3 + currHP);
    }
}

SINGLE_BATTLE_TEST("Regenerator heals 1/3 of max HP upon switching out but doesn't surpass max HP")
{
    u32 currHP;
    PARAMETRIZE { currHP = 5; }
    PARAMETRIZE { currHP = 4; }
    PARAMETRIZE { currHP = 3; }
    PARAMETRIZE { currHP = 2; }
    PARAMETRIZE { currHP = 1; }
    GIVEN {
        PLAYER(SPECIES_SLOWBRO) { Ability(ABILITY_REGENERATOR); HP(currHP); MaxHP(5); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SWITCH(player, 1); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        SWITCH_OUT_MESSAGE("Slowbro");
        SEND_IN_MESSAGE("Wobbuffet");
        SWITCH_OUT_MESSAGE("Wobbuffet");
        SEND_IN_MESSAGE("Slowbro");
    } THEN {
        EXPECT_LE(player->hp, player->maxHP);
    }
}
