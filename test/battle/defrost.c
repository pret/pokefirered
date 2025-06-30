#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Defrost: A fire type spread move will thaw both targets")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
        OPPONENT(SPECIES_WOBBUFFET) { Status1(STATUS1_FREEZE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_HEAT_WAVE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAT_WAVE, playerLeft);
        STATUS_ICON(opponentLeft, freeze: FALSE);
        STATUS_ICON(opponentRight, freeze: FALSE);
    }
}
