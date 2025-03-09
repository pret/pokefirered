#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Rapid Spin activates after Toxic Debris")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_RAPID_SPIN) == EFFECT_RAPID_SPIN);
    #if B_SPEED_BUFFING_RAPID_SPIN >= GEN_8
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_RAPID_SPIN, MOVE_EFFECT_SPD_PLUS_1) == TRUE);
    #endif
        PLAYER(SPECIES_GLIMMORA) { Ability(ABILITY_TOXIC_DEBRIS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_RAPID_SPIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAPID_SPIN, opponent);
        ABILITY_POPUP(player, ABILITY_TOXIC_DEBRIS);
        MESSAGE("Poison spikes were scattered on the ground all around the opposing team!");
        MESSAGE("The opposing Wobbuffet blew away Toxic Spikes!");
    }
}

SINGLE_BATTLE_TEST("Rapid Spin blows away Wrap, hazards and raises Speed (Gen 8+)")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_RAPID_SPIN) == EFFECT_RAPID_SPIN);
    #if B_SPEED_BUFFING_RAPID_SPIN >= GEN_8
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_RAPID_SPIN, MOVE_EFFECT_SPD_PLUS_1) == TRUE);
    #endif
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_WRAP); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); MOVE(player, MOVE_RAPID_SPIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STEALTH_ROCK, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAPID_SPIN, player);
    #if B_SPEED_BUFFING_RAPID_SPIN >= GEN_8
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Wobbuffet's Speed rose!");
    #endif
        MESSAGE("Wobbuffet got free of the opposing Wobbuffet's Wrap!");
        MESSAGE("Wobbuffet blew away Stealth Rock!");
    }
}

SINGLE_BATTLE_TEST("Rapid Spin: Mortal Spin blows away Wrap, hazards and poisons foe")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_MORTAL_SPIN) == EFFECT_RAPID_SPIN);
        ASSUME(MoveHasAdditionalEffect(MOVE_MORTAL_SPIN, MOVE_EFFECT_POISON) == TRUE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_WRAP); }
        TURN { MOVE(opponent, MOVE_STEALTH_ROCK); MOVE(player, MOVE_MORTAL_SPIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STEALTH_ROCK, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MORTAL_SPIN, player);
        MESSAGE("The opposing Wobbuffet was poisoned!");
        STATUS_ICON(opponent, poison: TRUE);
        MESSAGE("Wobbuffet got free of the opposing Wobbuffet's Wrap!");
        MESSAGE("Wobbuffet blew away Stealth Rock!");
    }
}
