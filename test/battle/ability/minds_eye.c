#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Mind's Eye allows to hit Ghost-type Pokémon with Normal- and Fighting-type moves")
{
    u32 move;
    PARAMETRIZE { move = MOVE_SCRATCH; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Ability(ABILITY_MINDS_EYE); };
        OPPONENT(SPECIES_GASTLY);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        HP_BAR(opponent);
    }
}

// No current official way to test this, effect based on Smogon's NatDex format.
SINGLE_BATTLE_TEST("Mind's Eye doesn't bypass a Ghost-type's Wonder Guard")
{
    u32 move;
    PARAMETRIZE { move = MOVE_SCRATCH; }
    PARAMETRIZE { move = MOVE_KARATE_CHOP; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Ability(ABILITY_SCRAPPY); };
        OPPONENT(SPECIES_SHEDINJA) { Ability(ABILITY_WONDER_GUARD); };
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, move, player);
            HP_BAR(opponent);
        }
        ABILITY_POPUP(opponent, ABILITY_WONDER_GUARD);
        MESSAGE("The opposing Shedinja avoided damage with Wonder Guard!");
    }
}

//// AI TESTS ////

AI_SINGLE_BATTLE_TEST("AI doesn't use accuracy-lowering moves if it knows that the foe has Mind's Eye")
{
    u32 abilityAI = ABILITY_NONE;

    PARAMETRIZE { abilityAI = ABILITY_SWIFT_SWIM; }
    PARAMETRIZE { abilityAI = ABILITY_MOLD_BREAKER; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SAND_ATTACK) == EFFECT_ACCURACY_DOWN);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_URSALUNA_BLOODMOON) { Ability(ABILITY_MINDS_EYE); }
        OPPONENT(SPECIES_BASCULEGION) { Moves(MOVE_CELEBRATE, MOVE_SAND_ATTACK); Ability(abilityAI); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_SCRATCH);
               if (abilityAI == ABILITY_MOLD_BREAKER) {
                   SCORE_GT(opponent, MOVE_SAND_ATTACK, MOVE_CELEBRATE);
               } else {
                   SCORE_EQ(opponent, MOVE_SAND_ATTACK, MOVE_CELEBRATE);
               }
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        if (abilityAI == ABILITY_MOLD_BREAKER) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SAND_ATTACK, opponent);
        }
    }
}
