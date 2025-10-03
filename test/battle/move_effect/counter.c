#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_COUNTER) == EFFECT_COUNTER);
    ASSUME(GetMoveCategory(MOVE_POUND) == DAMAGE_CATEGORY_PHYSICAL);
}

SINGLE_BATTLE_TEST("Counter is not affected by Protect effects")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SPIKY_SHIELD; }
    PARAMETRIZE { move = MOVE_BANEFUL_BUNKER; }
    PARAMETRIZE { move = MOVE_BURNING_BULWARK; }
    PARAMETRIZE { move = MOVE_KINGS_SHIELD; }
    PARAMETRIZE { move = MOVE_SILK_TRAP; }
    PARAMETRIZE { move = MOVE_OBSTRUCT; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); MOVE(player, MOVE_COUNTER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, player);
            if (move == MOVE_SPIKY_SHIELD) {
                HP_BAR(player);
            } else if (move == MOVE_BANEFUL_BUNKER) {
                STATUS_ICON(player, STATUS1_POISON);
            } else if (move == MOVE_BURNING_BULWARK) {
                STATUS_ICON(player, STATUS1_BURN);
            } else if (move == MOVE_KINGS_SHIELD) {
                MESSAGE("Wobbuffet's Attack fell!");
            } else if (move == MOVE_SILK_TRAP) {
                MESSAGE("Wobbuffet's Speed fell!");
            } else if (move == MOVE_OBSTRUCT) {
                MESSAGE("Wobbuffet's Defense harshly fell!");
            }
        }
    }
}

SINGLE_BATTLE_TEST("Counter will do twice as much damage received from the opponent")
{
    s16 normalDmg;
    s16 counterDmg;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_POUND); MOVE(player, MOVE_COUNTER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponent);
        HP_BAR(player, captureDamage: &normalDmg);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, player);
        HP_BAR(opponent, captureDamage: &counterDmg);
    } THEN {
        EXPECT_MUL_EQ(normalDmg, Q_4_12(2.0), counterDmg);
    }
}

DOUBLE_BATTLE_TEST("Counter cannot affect ally Pokémon")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_POUND, target: playerRight);
            MOVE(playerRight, MOVE_COUNTER, target: playerLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Counter hits the last opponent that hit the user")
{
    s16 normalDmg;
    s16 counterDmg;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(opponentLeft, MOVE_POUND, target: playerLeft);
            MOVE(opponentRight, MOVE_SLAM, target: playerLeft);
            MOVE(playerLeft, MOVE_COUNTER);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLAM, opponentRight);
        HP_BAR(playerLeft, captureDamage: &normalDmg);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, playerLeft);
        HP_BAR(opponentRight, captureDamage: &counterDmg);
    } THEN {
        EXPECT_MUL_EQ(normalDmg, Q_4_12(2.0), counterDmg);
    }
}

DOUBLE_BATTLE_TEST("Counter respects Follow me")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(opponentRight, MOVE_FOLLOW_ME);
            MOVE(opponentLeft, MOVE_POUND, target: playerLeft);
            MOVE(playerLeft, MOVE_COUNTER, target: opponentLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOLLOW_ME, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, playerLeft);
        HP_BAR(opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Counter fails if mon that damaged counter user is no longer on the field")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); };
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(opponentLeft, MOVE_POUND, target: playerLeft);
            MOVE(playerRight, MOVE_POUND, target: opponentLeft);
            MOVE(playerLeft, MOVE_COUNTER, target: opponentLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, playerRight);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_COUNTER, playerLeft);
    }
}

// Gen 1
TO_DO_BATTLE_TEST("Counter can only counter Normal and Fighting-type moves (Gen 1)");
TO_DO_BATTLE_TEST("Counter can hit ghost-type Pokémon (Gen 1)");
TO_DO_BATTLE_TEST("Counter can return damage dealt to a substitute (Gen 1)");

// Gen 2-3
TO_DO_BATTLE_TEST("Counter can counter Hidden Power regardless of type (Gen 2-3)");

// Gen 2+
TO_DO_BATTLE_TEST("Counter can only counter physical moves (Gen 2+)");
TO_DO_BATTLE_TEST("Counter cannot hit ghost-type Pokémon (Gen 2+)");
TO_DO_BATTLE_TEST("Counter cannot return damage dealt to a substitute (Gen 2+)");

// Triple Battles required to test
//TO_DO_BATTLE_TEST("Counter can hit non-adjacent opponents if they were the last Pokémon to hit the user");
