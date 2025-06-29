#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("TODO: Write Transform (Move Effect) test titles")

SINGLE_BATTLE_TEST("(TERA) Transform does not copy the target's Tera Type, and if the user is Terastallized it keeps its own Tera Type")
{
    u32 playerDoTera;
    PARAMETRIZE { playerDoTera = GIMMICK_TERA; }
    PARAMETRIZE { playerDoTera = GIMMICK_NONE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE, MOVE_SCRATCH, MOVE_EARTHQUAKE); TeraType(TYPE_GHOST); }
        OPPONENT(SPECIES_DITTO) { TeraType(TYPE_FLYING); }
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE, gimmick: playerDoTera); MOVE(opponent, MOVE_TRANSFORM); }
        TURN { MOVE(player, MOVE_SCRATCH); MOVE(opponent, moveSlot: 0); }
        TURN { MOVE(player, MOVE_EARTHQUAKE); MOVE(opponent, moveSlot: 0, gimmick: GIMMICK_TERA); }
    } SCENE {
        // turn 1
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRANSFORM, opponent);
        // turn 2
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
        // turn 3
        MESSAGE("Wobbuffet used Earthquake!");
        MESSAGE("It doesn't affect the opposing Ditto…");
        NOT { HP_BAR(opponent); }
    }
}
