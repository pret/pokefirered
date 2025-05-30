#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Neutralizing Gas activates on switch-in")
{
    GIVEN {
        PLAYER(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_NEUTRALIZING_GAS);
        MESSAGE("Neutralizing gas filled the area!");
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas prevents opponent's switch-in ability from activating")
{
    GIVEN {
        PLAYER(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
        OPPONENT(SPECIES_ZEKROM) { Ability(ABILITY_TERAVOLT); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_NEUTRALIZING_GAS);
        NONE_OF {
            ABILITY_POPUP(opponent, ABILITY_TERAVOLT);
            MESSAGE("The opposing Zekrom is radiating a bursting aura!");
        }
    }
}

DOUBLE_BATTLE_TEST("Neutralizing Gas prevents ally's switch-in ability from activating")
{
    GIVEN {
        PLAYER(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
        PLAYER(SPECIES_ZEKROM) { Ability(ABILITY_TERAVOLT); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_NEUTRALIZING_GAS);
        NONE_OF {
            ABILITY_POPUP(playerRight, ABILITY_TERAVOLT);
            MESSAGE("Zekrom is radiating a bursting aura!");
        }
    }
}

DOUBLE_BATTLE_TEST("Neutralizing Gas ignores all battlers' ability effects")
{
    GIVEN {
        ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
        PLAYER(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
        PLAYER(SPECIES_WOBBUFFET) { Ability(ABILITY_TELEPATHY); }
        OPPONENT(SPECIES_LANTURN) { Ability(ABILITY_WATER_ABSORB); }
        OPPONENT(SPECIES_BELLIBOLT) { Ability(ABILITY_ELECTROMORPHOSIS); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SURF); MOVE(playerRight, MOVE_SURF); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_NEUTRALIZING_GAS);
        MESSAGE("Neutralizing gas filled the area!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, playerLeft);
        NONE_OF {
            ABILITY_POPUP(playerRight, ABILITY_TELEPATHY);
            ABILITY_POPUP(opponentLeft, ABILITY_WATER_ABSORB);
            ABILITY_POPUP(opponentRight, ABILITY_ELECTROMORPHOSIS);
        }
        HP_BAR(opponentLeft);
        HP_BAR(playerRight);
        HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, playerRight);
        NONE_OF {
            ABILITY_POPUP(opponentLeft, ABILITY_WATER_ABSORB);
            ABILITY_POPUP(opponentRight, ABILITY_ELECTROMORPHOSIS);
        }
        HP_BAR(playerLeft);
        HP_BAR(opponentLeft);
        HP_BAR(opponentRight);
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas ignores multipliers from attacker's ability", s16 damage)
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_SCRATCH) == DAMAGE_CATEGORY_PHYSICAL);
        PLAYER(SPECIES_WEEZING) { Ability(ability); }
        OPPONENT(SPECIES_AZUMARILL) { Ability(ABILITY_HUGE_POWER); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        HP_BAR(player, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(2.0), results[1].damage);
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas ignores multipliers from target's ability", s16 damage)
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }
    GIVEN {
        ASSUME(MoveMakesContact(MOVE_SCRATCH) == TRUE);
        ASSUME(GetMoveType(MOVE_SCRATCH) == TYPE_NORMAL);
        PLAYER(SPECIES_WEEZING) { Ability(ability); }
        OPPONENT(SPECIES_BEWEAR) { Ability(ABILITY_FLUFFY); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(0.5), results[1].damage);
    }
}

DOUBLE_BATTLE_TEST("Neutralizing Gas ignores multipliers from target's ally's ability", s16 damage)
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }
    GIVEN {
        PLAYER(SPECIES_WEEZING) { Ability(ability); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Ability(ABILITY_TELEPATHY); }
        OPPONENT(SPECIES_CLEFAIRY) { Ability(ABILITY_FRIEND_GUARD); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerLeft);
        HP_BAR(opponentLeft, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(0.75), results[1].damage);
    }
}

DOUBLE_BATTLE_TEST("Neutralizing Gas ignores multipliers from ally's ability", s16 damage)
{
    u32 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_SCRATCH) == DAMAGE_CATEGORY_PHYSICAL);
        PLAYER(SPECIES_WEEZING) { Ability(ability); }
        PLAYER(SPECIES_WO_CHIEN) { Ability(ABILITY_TABLETS_OF_RUIN); }
        OPPONENT(SPECIES_WOBBUFFET) { Ability(ABILITY_TELEPATHY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerLeft);
        HP_BAR(opponentLeft, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(0.75), results[1].damage);
    }
}

DOUBLE_BATTLE_TEST("Neutralizing Gas leaving the field allows abilities to activate in turn order")
{
    u32 speedPlayerRight, speedOppLeft, speedOppRight;
    PARAMETRIZE { speedPlayerRight = 5; speedOppLeft = 3; speedOppRight = 2; }
    PARAMETRIZE { speedPlayerRight = 3; speedOppLeft = 5; speedOppRight = 2; }
    PARAMETRIZE { speedPlayerRight = 2; speedOppLeft = 3; speedOppRight = 5; }
    PARAMETRIZE { speedPlayerRight = 3; speedOppLeft = 2; speedOppRight = 5; }
    PARAMETRIZE { speedPlayerRight = 2; speedOppLeft = 5; speedOppRight = 3; }
    PARAMETRIZE { speedPlayerRight = 5; speedOppLeft = 2; speedOppRight = 3; }
    GIVEN {
        PLAYER(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); Speed(4); }
        PLAYER(SPECIES_ZACIAN) { Ability(ABILITY_INTREPID_SWORD); Speed(speedPlayerRight); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        OPPONENT(SPECIES_ARBOK) { Ability(ABILITY_INTIMIDATE); Speed(speedOppLeft); }
        OPPONENT(SPECIES_ZEKROM) { Ability(ABILITY_TERAVOLT); Speed(speedOppRight); }
    } WHEN {
        TURN { SWITCH(playerLeft, 2); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_NEUTRALIZING_GAS);
        MESSAGE("Neutralizing gas filled the area!");
        SWITCH_OUT_MESSAGE("Weezing");
        MESSAGE("The effects of the neutralizing gas wore off!");
        if (speedPlayerRight > speedOppLeft)
        {
            if (speedPlayerRight > speedOppRight) {
                ABILITY_POPUP(playerRight, ABILITY_INTREPID_SWORD);
                if (speedOppRight > speedOppLeft) {
                    ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                    ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
                } else {
                    ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
                    ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                }
            } else {
                ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                ABILITY_POPUP(playerRight, ABILITY_INTREPID_SWORD);
                ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
            }

        } else {
            if (speedOppLeft > speedOppRight) {
                ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
                if (speedOppRight > speedPlayerRight) {
                    ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                    ABILITY_POPUP(playerRight, ABILITY_INTREPID_SWORD);
                } else {
                    ABILITY_POPUP(playerRight, ABILITY_INTREPID_SWORD);
                    ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                }
            } else {
                ABILITY_POPUP(opponentRight, ABILITY_TERAVOLT);
                ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
                ABILITY_POPUP(playerRight, ABILITY_INTREPID_SWORD);
            }
        }
        SEND_IN_MESSAGE("Wobbuffet");
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas prevents Insomnia from blocking Rest")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_REST) == EFFECT_REST);
        PLAYER(SPECIES_DROWZEE) { Ability(ABILITY_INSOMNIA); HP(1); }
        OPPONENT(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { MOVE(player, MOVE_REST); }
    } SCENE {
        NOT ABILITY_POPUP(player, ABILITY_INSOMNIA);
        // ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_SLP, player);
        // STATUS_ICON(player, sleep: TRUE);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_REST, player);
        HP_BAR(player);
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas prevents Trace from copying it")
{
    GIVEN {
        PLAYER(SPECIES_RALTS) { Ability(ABILITY_TRACE); }
        OPPONENT(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_NEUTRALIZING_GAS);
        NONE_OF {
            ABILITY_POPUP(player, ABILITY_TRACE);
            ABILITY_POPUP(player, ABILITY_NEUTRALIZING_GAS);
        }
    }
}

SINGLE_BATTLE_TEST("Neutralizing Gas prevents Contrary inverting stat boosts")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_REST) == EFFECT_REST);
        PLAYER(SPECIES_INKAY) { Ability(ABILITY_CONTRARY); }
        OPPONENT(SPECIES_WEEZING) { Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { MOVE(player, MOVE_SWORDS_DANCE); MOVE(opponent, MOVE_LEER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LEER, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    } THEN {
        EXPECT_GT(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_LT(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
    }
}
