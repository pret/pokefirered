#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Aqua Ring recovers 1/16th HP at end of turn")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(50); MaxHP(128); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_AQUA_RING); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_RING, player);
    } THEN {
        EXPECT(player->hp == 58);
    }
}

SINGLE_BATTLE_TEST("Aqua Ring can be used under Heal Block but will not heal the user")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(50); MaxHP(128); Speed(50); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(100); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_HEAL_BLOCK); MOVE(player, MOVE_AQUA_RING); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_RING, player);
    } THEN {
        EXPECT(player->hp == 50);
    }
}

TO_DO_BATTLE_TEST("Baton Pass passes Aqua Ring's effect");
