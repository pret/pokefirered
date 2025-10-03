#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_ABSORB) == EFFECT_ABSORB);
}

SINGLE_BATTLE_TEST("Absorb recovers 50% of the damage dealt")
{
    s16 damage;
    s16 healed;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_ABSORB); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ABSORB, player);
        HP_BAR(opponent, captureDamage: &damage);
        HP_BAR(player, captureDamage: &healed);
    } THEN {
        EXPECT_MUL_EQ(damage, Q_4_12(-0.5), healed);
    }
}

SINGLE_BATTLE_TEST("Absorb fails if Heal Block applies")
{
    GIVEN {
        ASSUME(B_HEAL_BLOCKING >= GEN_6);
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_HEAL_BLOCK); MOVE(player, MOVE_ABSORB); }
    } SCENE {
        MESSAGE("Wobbuffet was prevented from healing!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_ABSORB, player);
            HP_BAR(opponent);
            HP_BAR(player);
        }
    }
}

DOUBLE_BATTLE_TEST("Matcha Gatcha recovers 50% of the damage dealt from both targets")
{
    s16 damageLeft;
    s16 damageRight;
    s16 healedLeft;
    s16 healedRight;

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_MATCHA_GOTCHA) == EFFECT_ABSORB);
        PLAYER(SPECIES_PIKACHU) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_STARYU);
        OPPONENT(SPECIES_STARYU);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_MATCHA_GOTCHA); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MATCHA_GOTCHA, playerLeft);
        HP_BAR(opponentLeft, captureDamage: &damageLeft);
        HP_BAR(opponentRight, captureDamage: &damageRight);
        HP_BAR(playerLeft, captureDamage: &healedLeft);
        HP_BAR(playerLeft, captureDamage: &healedRight);
    } THEN {
        EXPECT_MUL_EQ(damageLeft, Q_4_12(-0.5), healedLeft);
        EXPECT_MUL_EQ(damageRight, Q_4_12(-0.5), healedRight);
    }
}

SINGLE_BATTLE_TEST("Draining Kiss recovers 75% of the damage dealt")
{
    s16 damage;
    s16 healed;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DRAINING_KISS); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAINING_KISS, player);
        HP_BAR(opponent, captureDamage: &damage);
        HP_BAR(player, captureDamage: &healed);
    } THEN {
        EXPECT_MUL_EQ(damage, Q_4_12(-0.75), healed);
    }
}

SINGLE_BATTLE_TEST("Absorb does not drain any HP if user flinched")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FAKE_OUT); MOVE(player, MOVE_ABSORB); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FAKE_OUT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_ABSORB, player);
            MESSAGE("The opposing Wobbuffet had its energy drained!");
        }
    }
}

TO_DO_BATTLE_TEST("Absorb recovers 50% of the damage dealt to a Substitute");

SINGLE_BATTLE_TEST("Absorb does not drain any HP if user does 0 damage")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_ENDURE); MOVE(player, MOVE_ABSORB); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ENDURE, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ABSORB, player);
        NOT MESSAGE("The opposing Wobbuffet had its energy drained!");
    }
}
