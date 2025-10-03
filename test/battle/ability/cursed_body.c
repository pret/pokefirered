#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Cursed Body triggers 30% of the time")
{
    PASSES_RANDOMLY(3, 10, RNG_CURSED_BODY);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_FRILLISH) { Ability(ABILITY_CURSED_BODY); }
    } WHEN {
        TURN { MOVE(player, MOVE_AQUA_JET); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AQUA_JET, player);
        ABILITY_POPUP(opponent, ABILITY_CURSED_BODY);
        MESSAGE("Wobbuffet's Aqua Jet was disabled by the opposing Frillish's Cursed Body!");
    }
}

TO_DO_BATTLE_TEST("Cursed Body cannot disable Struggle")
TO_DO_BATTLE_TEST("Cursed Body can trigger if the attacker is behind a Substitute")
TO_DO_BATTLE_TEST("Cursed Body cannot trigger if the target is behind a Substitute")
TO_DO_BATTLE_TEST("Cursed Body does not stop a multistrike move mid-execution")
TO_DO_BATTLE_TEST("Cursed Body disables the move that called another move instead of the called move")
TO_DO_BATTLE_TEST("Cursed Body disables damaging Z-Moves, but not the base move") // Rotom Powers can restore Z-Moves
TO_DO_BATTLE_TEST("Cursed Body disables the base move of a status Z-Move")
