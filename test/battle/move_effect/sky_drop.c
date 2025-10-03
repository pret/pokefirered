#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_SKY_DROP) == EFFECT_SKY_DROP);
}

SINGLE_BATTLE_TEST("Sky Drop does no damage to Flying type Pokémon")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_PIDGEY].weight < 2000);
        ASSUME(GetSpeciesType(SPECIES_PIDGEY, 1) == TYPE_FLYING);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_PIDGEY);
    } WHEN {
        TURN { MOVE(player, MOVE_SKY_DROP); }
        TURN { SKIP_TURN(player); }
    } SCENE {
        MESSAGE("Wobbuffet took the opposing Pidgey into the sky!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
        NOT HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Sky Drop fails if target is behind a substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_SKY_DROP); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
    }
}

SINGLE_BATTLE_TEST("Sky Drop fails if target is in a Semi-Invulnerable state")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FLY); MOVE(player, MOVE_SKY_DROP); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLY, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
    }
}

DOUBLE_BATTLE_TEST("Sky Drop is cancelled if Gravity activated")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_SKY_DROP, target: opponentLeft);
            MOVE(playerRight, MOVE_GRAVITY);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GRAVITY, playerRight);
        MESSAGE("Wobbuffet fell from the sky due to the gravity!");
    }
}

SINGLE_BATTLE_TEST("Sky Drop fails on heavy targets")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_METAGROSS].weight >= 2000);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_METAGROSS);
    } WHEN {
        TURN { MOVE(player, MOVE_SKY_DROP); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
        MESSAGE("The opposing Metagross is too heavy to be lifted!");
    }
}

SINGLE_BATTLE_TEST("Sky Drop cancels targets two turn moves")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(opponent, MOVE_SOLAR_BEAM);
            MOVE(player, MOVE_SKY_DROP);
        }
        TURN { SKIP_TURN(player); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SOLAR_BEAM, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SOLAR_BEAM, opponent);
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Sky Drop stops the confusion count until the target is dropped")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_THRASH); }
        TURN { SKIP_TURN(player); }
        TURN { SKIP_TURN(player); }
        TURN { MOVE(opponent, MOVE_SKY_DROP); }
        TURN { SKIP_TURN(opponent); }
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THRASH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THRASH, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_THRASH, player);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_CONFUSION, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, opponent);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_CONFUSION, player);
    }
}

SINGLE_BATTLE_TEST("Sky Drop fails if the targe is in a semi-invulnerable state")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FLY); MOVE(player, MOVE_SKY_DROP); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLY, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, player);
    }
}
