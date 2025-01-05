#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveType(MOVE_TACKLE) == TYPE_NORMAL);
    ASSUME(GetMovePower(MOVE_TACKLE) > 0);
}

SINGLE_BATTLE_TEST("Galvanize turns a normal type move into Electric")
{
    GIVEN {
        PLAYER(SPECIES_KRABBY);
        OPPONENT(SPECIES_GEODUDE_ALOLA) { Ability(ABILITY_GALVANIZE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponent);
        MESSAGE("It's super effective!");
    }
}

SINGLE_BATTLE_TEST("Galvanize can not turn certain moves into Electric type moves")
{
    u32 move;

    PARAMETRIZE { move = MOVE_HIDDEN_POWER; }
    PARAMETRIZE { move = MOVE_WEATHER_BALL; }
    PARAMETRIZE { move = MOVE_MULTI_ATTACK; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_HIDDEN_POWER) == EFFECT_HIDDEN_POWER);
        ASSUME(GetMoveEffect(MOVE_WEATHER_BALL) == EFFECT_WEATHER_BALL);
        ASSUME(GetMoveEffect(MOVE_MULTI_ATTACK) == EFFECT_CHANGE_TYPE_ON_ITEM);
        PLAYER(SPECIES_KRABBY);
        OPPONENT(SPECIES_GEODUDE_ALOLA) { Ability(ABILITY_GALVANIZE); }
    } WHEN {
        TURN { MOVE(opponent, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NOT MESSAGE("It's super effective!");
    }
}

TO_DO_BATTLE_TEST("Galvanize boosts power of affected moves by 20% (Gen7+)");
TO_DO_BATTLE_TEST("Galvanize boosts power of affected moves by 30% (Gen6)");
TO_DO_BATTLE_TEST("(DYNAMAX) Galvanize turns Max Strike into Max Lightning when not used by Gigantamax Pikachu/Toxtricity");
//TO_DO_BATTLE_TEST("(DYNAMAX) Galvanize doesn't turn Max Strike into Max Lightning when used by Gigantamax Pikachu/Toxtricity, instead becoming G-Max Volt Crash/Stun Shock"); // Marked in Bulbapedia as "needs research", so this assumes that it behaves like Pixilate.
