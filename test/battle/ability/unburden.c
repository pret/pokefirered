#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Unburden doubles speed once user uses item")
{
    GIVEN {
        ASSUME(GetItemHoldEffect(ITEM_GRASSY_SEED) == HOLD_EFFECT_SEEDS);
        ASSUME(GetMoveEffect(MOVE_U_TURN) == EFFECT_HIT_ESCAPE);
        PLAYER(SPECIES_DRIFBLIM) { Ability(ABILITY_UNBURDEN); Item(ITEM_GRASSY_SEED); Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(7); }
        OPPONENT(SPECIES_RILLABOOM) { Speed(7); Ability(ABILITY_GRASSY_SURGE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_U_TURN); SEND_OUT(opponent, 1); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_U_TURN, opponent);
        ABILITY_POPUP(opponent, ABILITY_GRASSY_SURGE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 2, doubled speed
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
    }
}

SINGLE_BATTLE_TEST("Unburden doubles speed once user gets their item knocked off")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_KNOCK_OFF) == EFFECT_KNOCK_OFF);
        PLAYER(SPECIES_DRIFBLIM) { Ability(ABILITY_UNBURDEN); Item(ITEM_POTION); Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(7); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_KNOCK_OFF); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 2, doubled speed
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
    }
}

SINGLE_BATTLE_TEST("Unburden doesn't activate when item is consumed in Neutralizing Gas")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_U_TURN) == EFFECT_HIT_ESCAPE);
        ASSUME(GetMoveEffect(MOVE_KNOCK_OFF) == EFFECT_KNOCK_OFF);
        PLAYER(SPECIES_DRIFBLIM) { Ability(ABILITY_UNBURDEN); Item(ITEM_POTION); Speed(5); }
        OPPONENT(SPECIES_WEEZING) { Speed(7); Ability(ABILITY_NEUTRALIZING_GAS); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(7); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_KNOCK_OFF); }
        TURN { MOVE(opponent, MOVE_U_TURN); SEND_OUT(opponent, 1); }
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_NEUTRALIZING_GAS);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 2, no speed increase
        ANIMATION(ANIM_TYPE_MOVE, MOVE_U_TURN, opponent);
        MESSAGE("The effects of the neutralizing gas wore off!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 3, no speed increase
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    }
}

SINGLE_BATTLE_TEST("Unburden doubling speed effect is ignored by Neutralizing Gas")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_U_TURN) == EFFECT_HIT_ESCAPE);
        ASSUME(GetMoveEffect(MOVE_KNOCK_OFF) == EFFECT_KNOCK_OFF);
        PLAYER(SPECIES_DRIFBLIM) { Ability(ABILITY_UNBURDEN); Item(ITEM_POTION); Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(7); }
        OPPONENT(SPECIES_WEEZING) { Speed(7); Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_KNOCK_OFF); }
        TURN { MOVE(opponent, MOVE_U_TURN); SEND_OUT(opponent, 1); }
        TURN { MOVE(opponent, MOVE_U_TURN); SEND_OUT(opponent, 0); }
        TURN { }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_KNOCK_OFF, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_ITEM_KNOCKOFF, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 2, doubled speed
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_U_TURN, opponent);
        ABILITY_POPUP(opponent, ABILITY_NEUTRALIZING_GAS);
        // Turn 3, no speed increase
        ANIMATION(ANIM_TYPE_MOVE, MOVE_U_TURN, opponent);
        MESSAGE("The effects of the neutralizing gas wore off!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        // Turn 4, doubled speed
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
    }
}
