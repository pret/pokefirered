#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetItemHoldEffect(ITEM_ROCKY_HELMET) == HOLD_EFFECT_ROCKY_HELMET);
    ASSUME(MoveMakesContact(MOVE_SCRATCH));
    ASSUME(MoveMakesContact(MOVE_SHADOW_SNEAK));
}

SINGLE_BATTLE_TEST("Rocky Helmet damages attacker even if damage is blocked by Disguise")
{
    GIVEN {
        PLAYER(SPECIES_MIMIKYU) { Item(ITEM_ROCKY_HELMET); Ability(ABILITY_DISGUISE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SHADOW_SNEAK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SHADOW_SNEAK, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        HP_BAR(opponent);
    }
}

TO_DO_BATTLE_TEST("TODO: Write Rocky Helmet (Hold Effect) test titles")
