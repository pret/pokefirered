#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Magic Guard prevents recoil damage to the user")
{
    GIVEN {
        ASSUME(GetMoveRecoil(MOVE_DOUBLE_EDGE) == 33);
        PLAYER(SPECIES_CLEFABLE) { Ability(ABILITY_MAGIC_GUARD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DOUBLE_EDGE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DOUBLE_EDGE, player);
        HP_BAR(opponent);
        NOT HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Magic Guard ignores immobilization that can be caused by paralysis")
{
    if (B_MAGIC_GUARD == GEN_4)
        PASSES_RANDOMLY(1, 1, RNG_PARALYSIS);
    else
        PASSES_RANDOMLY(75, 100, RNG_PARALYSIS);
    GIVEN {
        PLAYER(SPECIES_CLEFABLE) { Ability(ABILITY_MAGIC_GUARD); Status1(STATUS1_PARALYSIS);}
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    }
}

SINGLE_BATTLE_TEST("Magic Guard does not ignore speed stat changes caused by paralysis")
{
    GIVEN {
        PLAYER(SPECIES_CLEFABLE) { Speed(100); Ability(ABILITY_MAGIC_GUARD); Status1(STATUS1_PARALYSIS);}
        OPPONENT(SPECIES_WOBBUFFET) { Speed(99); }
    } WHEN {
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    }
}
