#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("Endure allows the user to survive any attack with 1 HP left");

SINGLE_BATTLE_TEST("Endure does not prevent multiple hits and stat changes occur at the end of the turn")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SCALE_SHOT) == EFFECT_MULTI_HIT);
        ASSUME(GetMoveEffect(MOVE_ENDURE) == EFFECT_ENDURE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_ENDURE); MOVE(player, MOVE_SCALE_SHOT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ENDURE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALE_SHOT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALE_SHOT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALE_SHOT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALE_SHOT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCALE_SHOT, player);
        MESSAGE("The Pokémon was hit 5 time(s)!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Wobbuffet's Defense fell!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Wobbuffet's Speed rose!");
    }
}

TO_DO_BATTLE_TEST("Endure's success rate decreases for every consecutively used turn");
TO_DO_BATTLE_TEST("Endure uses the same counter as Protect");
TO_DO_BATTLE_TEST("Endure doesn't trigger effects that require damage to be done to the Pokémon (Gen 2-4)"); // Eg. Rough Skin
TO_DO_BATTLE_TEST("Endure triggers effects that require damage to be done to the Pokémon (Gen 5+)"); // Eg. Rough Skin
TO_DO_BATTLE_TEST("Endure doesn't protect against Future Sight (Gen 2-4)");
TO_DO_BATTLE_TEST("Endure protects against Future Sight (Gen 5+)");
