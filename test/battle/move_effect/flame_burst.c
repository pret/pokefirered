#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveAdditionalEffectById(MOVE_FLAME_BURST, 0)->moveEffect == MOVE_EFFECT_FLAME_BURST);
}

//  Flame Burst AoE is supposed to hit through Substitute
DOUBLE_BATTLE_TEST("Flame Burst Substitute")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SUBSTITUTE) == EFFECT_SUBSTITUTE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SUBSTITUTE); MOVE(playerRight, MOVE_FLAME_BURST, target: opponentRight); }
    } SCENE {
        MESSAGE("The bursting flames hit the opposing Wynaut!");
        NOT MESSAGE("The substitute took damage for the opposing Wynaut!");
    }
}
