#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Poison Point inflicts poison on contact")
{
    u32 move;
    PARAMETRIZE { move = MOVE_TACKLE; }
    PARAMETRIZE { move = MOVE_SWIFT; }
    GIVEN {
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        ASSUME(!MoveMakesContact(MOVE_SWIFT));
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDORAN_M) { Ability(ABILITY_POISON_POINT); }
    } WHEN {
        TURN { MOVE(player, move); }
        TURN {}
    } SCENE {
        if (MoveMakesContact(move)) {
            ABILITY_POPUP(opponent, ABILITY_POISON_POINT);
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_PSN, player);
            MESSAGE("Wobbuffet was poisoned by the opposing Nidoran♂'s Poison Point!");
            STATUS_ICON(player, poison: TRUE);
        } else {
            NONE_OF {
                ABILITY_POPUP(opponent, ABILITY_POISON_POINT);
                ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_PSN, player);
                MESSAGE("Wobbuffet was poisoned by the opposing Nidoran♂'s Poison Point!");
                STATUS_ICON(player, poison: TRUE);
            }
        }
    }
}

SINGLE_BATTLE_TEST("Poison Point triggers 30% of the time")
{
    PASSES_RANDOMLY(3, 10, RNG_POISON_POINT);
    GIVEN {
        ASSUME(B_ABILITY_TRIGGER_CHANCE >= GEN_4);
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_NIDORAN_M) { Ability(ABILITY_POISON_POINT); }
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); }
        TURN {}
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_POISON_POINT);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_PSN, player);
        MESSAGE("Wobbuffet was poisoned by the opposing Nidoran♂'s Poison Point!");
        STATUS_ICON(player, poison: TRUE);
    }
}
