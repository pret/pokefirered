#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Cute Charm inflicts infatuation on contact")
{
    u32 move;
    PARAMETRIZE { move = MOVE_TACKLE; }
    PARAMETRIZE { move = MOVE_SWIFT; }
    GIVEN {
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        ASSUME(!MoveMakesContact(MOVE_SWIFT));
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_MALE); }
        OPPONENT(SPECIES_CLEFAIRY) { Gender(MON_FEMALE); Ability(ABILITY_CUTE_CHARM); }
    } WHEN {
        TURN { MOVE(player, move); }
        TURN { MOVE(player, move); }
    } SCENE {
        if (MoveMakesContact(move)) {
            ABILITY_POPUP(opponent, ABILITY_CUTE_CHARM);
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_INFATUATION, player);
            MESSAGE("The opposing Clefairy's Cute Charm infatuated Wobbuffet!");
            MESSAGE("Wobbuffet is in love with the opposing Clefairy!");
        } else {
            NONE_OF {
                ABILITY_POPUP(opponent, ABILITY_CUTE_CHARM);
                ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_INFATUATION, player);
                MESSAGE("The opposing Clefairy's Cute Charm infatuated Wobbuffet!");
                MESSAGE("Wobbuffet is in love with the opposing Clefairy!");
            }
        }
    }
}

SINGLE_BATTLE_TEST("Cute Charm cannot infatuate same gender")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_MALE); }
        OPPONENT(SPECIES_CLEFAIRY) { Gender(MON_MALE); Ability(ABILITY_CUTE_CHARM); }
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); }
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        NOT ABILITY_POPUP(opponent, ABILITY_CUTE_CHARM);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
    }
}

SINGLE_BATTLE_TEST("Cute Charm triggers 30% of the time")
{
    PASSES_RANDOMLY(3, 10, RNG_CUTE_CHARM);
    GIVEN {
        ASSUME(B_ABILITY_TRIGGER_CHANCE >= GEN_4);
        ASSUME(MoveMakesContact(MOVE_TACKLE));
        PLAYER(SPECIES_WOBBUFFET) { Gender(MON_MALE); }
        OPPONENT(SPECIES_CLEFAIRY) { Gender(MON_FEMALE); Ability(ABILITY_CUTE_CHARM); }
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); }
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_CUTE_CHARM);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_INFATUATION, player);
        MESSAGE("The opposing Clefairy's Cute Charm infatuated Wobbuffet!");
        MESSAGE("Wobbuffet is in love with the opposing Clefairy!");
    }
}
