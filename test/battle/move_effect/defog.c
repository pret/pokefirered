#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gMovesInfo[MOVE_DEFOG].effect == EFFECT_DEFOG);
    ASSUME(gMovesInfo[MOVE_REFLECT].effect == EFFECT_REFLECT);
    ASSUME(gMovesInfo[MOVE_LIGHT_SCREEN].effect == EFFECT_LIGHT_SCREEN);
    ASSUME(gMovesInfo[MOVE_MIST].effect == EFFECT_MIST);
    ASSUME(gMovesInfo[MOVE_SAFEGUARD].effect == EFFECT_SAFEGUARD);
    ASSUME(gMovesInfo[MOVE_AURORA_VEIL].effect == EFFECT_AURORA_VEIL);
    ASSUME(gMovesInfo[MOVE_STEALTH_ROCK].effect == EFFECT_STEALTH_ROCK);
    ASSUME(gMovesInfo[MOVE_SPIKES].effect == EFFECT_SPIKES);
    ASSUME(gMovesInfo[MOVE_TOXIC_SPIKES].effect == EFFECT_TOXIC_SPIKES);
    ASSUME(gMovesInfo[MOVE_STICKY_WEB].effect == EFFECT_STICKY_WEB);
    ASSUME(gMovesInfo[MOVE_TOXIC].effect == EFFECT_TOXIC);
    ASSUME(gMovesInfo[MOVE_SCREECH].effect == EFFECT_DEFENSE_DOWN_2);
    ASSUME(gMovesInfo[MOVE_TACKLE].category == DAMAGE_CATEGORY_PHYSICAL);
    ASSUME(gMovesInfo[MOVE_GUST].category == DAMAGE_CATEGORY_SPECIAL);
}

SINGLE_BATTLE_TEST("Defog lowers evasiveness by 1")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DEFOG); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DEFOG, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Wobbuffet's evasiveness fell!");
    }
}

SINGLE_BATTLE_TEST("Defog does not lower evasiveness if target behind Substitute")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(5); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_DEFOG); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Substitute!");
        MESSAGE("But it failed!");
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DEFOG, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
            MESSAGE("The opposing Wobbuffet's evasiveness fell!");
        }
    }
}

DOUBLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Reflect and Light Screen from opponent's side", s16 damagePhysical, s16 damageSpecial)
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(1); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_REFLECT); MOVE(opponentRight, MOVE_LIGHT_SCREEN); }
        TURN { MOVE(playerLeft, move, target: opponentLeft); }
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft); MOVE(playerRight, MOVE_GUST, target: opponentRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_REFLECT, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LIGHT_SCREEN, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
            MESSAGE("The opposing Wobbuffet's evasiveness fell!");
            MESSAGE("The opposing team's Reflect wore off!");
            MESSAGE("The opposing team's Light Screen wore off!");
        }
        MESSAGE("Wobbuffet used Tackle!");
        HP_BAR(opponentLeft, captureDamage: &results[i].damagePhysical);
        MESSAGE("Wobbuffet used Gust!");
        HP_BAR(opponentRight, captureDamage: &results[i].damageSpecial);
    } FINALLY {
        EXPECT_MUL_EQ(results[1].damagePhysical, Q_4_12(1.5), results[0].damagePhysical);
        EXPECT_MUL_EQ(results[1].damageSpecial, Q_4_12(1.5), results[0].damageSpecial);
    }
}

DOUBLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Mist and Safeguard from opponent's side")
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(1); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_MIST); MOVE(opponentRight, MOVE_SAFEGUARD); }
        TURN { MOVE(playerLeft, move, target: opponentLeft); }
        TURN { MOVE(playerLeft, MOVE_SCREECH, target: opponentLeft); MOVE(playerRight, MOVE_TOXIC, target: opponentRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MIST, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SAFEGUARD, opponentRight);
        if (move == MOVE_DEFOG) {
            MESSAGE("The opposing Wobbuffet is protected by the mist!");
            ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
            MESSAGE("The opposing team's Mist wore off!");
            MESSAGE("The opposing team's Safeguard wore off!");
        }
        MESSAGE("Wobbuffet used Screech!");
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCREECH, playerLeft);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        }
        else {
            MESSAGE("The opposing Wobbuffet is protected by the mist!");
            NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        }
        MESSAGE("Wobbuffet used Toxic!");
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_TOXIC, playerRight);
            STATUS_ICON(opponentRight, badPoison: TRUE);
        }
        else {
            MESSAGE("The opposing Wobbuffet is protected by Safeguard!");
            NOT STATUS_ICON(opponentRight, badPoison: TRUE);
        }
    }
}

DOUBLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Stealth Rock and Sticky Web from player's side (Gen 6+)")
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(4); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(1); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_STEALTH_ROCK); MOVE(opponentRight, MOVE_STICKY_WEB); }
        TURN { MOVE(playerLeft, move, target: opponentLeft); }
        TURN { SWITCH(playerLeft, 2); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STEALTH_ROCK, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STICKY_WEB, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, move, playerLeft);
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
            MESSAGE("The opposing Wobbuffet's evasiveness fell!");
            if (B_DEFOG_EFFECT_CLEARING >= GEN_6) {
                MESSAGE("The pointed stones disappeared from around your team!");
                MESSAGE("The sticky web has disappeared from the ground around your team!");
            }
        }
        // Switch happens
        SWITCH_OUT_MESSAGE("Wobbuffet");
        SEND_IN_MESSAGE("Wobbuffet");
        if (move != MOVE_DEFOG || B_DEFOG_EFFECT_CLEARING <= GEN_5) {
            HP_BAR(playerLeft);
            MESSAGE("Pointed stones dug into Wobbuffet!");
            MESSAGE("Wobbuffet was caught in a sticky web!");
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
            MESSAGE("Wobbuffet's Speed fell!");
        }
        else {
            NONE_OF {
                HP_BAR(playerLeft);
                MESSAGE("Pointed stones dug into Wobbuffet!");
                MESSAGE("Wobbuffet was caught in a sticky web!");
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
                MESSAGE("Wobbuffet's Speed fell!");
            }
        }
    }
}

SINGLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Spikes from player's side")
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(2); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(5); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SPIKES); MOVE(player, move); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPIKES, opponent);
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
            MESSAGE("The opposing Wobbuffet's evasiveness fell!");
            if (B_DEFOG_EFFECT_CLEARING >= GEN_6)
                MESSAGE("The spikes disappeared from the ground around your team!");
        }
        // Switch happens
        SWITCH_OUT_MESSAGE("Wobbuffet");
        SEND_IN_MESSAGE("Wobbuffet");
        if (move != MOVE_DEFOG || B_DEFOG_EFFECT_CLEARING <= GEN_5) {
            HP_BAR(player);
            MESSAGE("Wobbuffet was hurt by the spikes!");
        }
        else {
            NONE_OF {
                HP_BAR(player);
                MESSAGE("Wobbuffet was hurt by the spikes!");
            }
        }
    }
}

SINGLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes terrain (Gen 8+)")
{
    u16 move;

    PARAMETRIZE { move = MOVE_PSYCHIC_TERRAIN; }
    PARAMETRIZE { move = MOVE_ELECTRIC_TERRAIN; }
    PARAMETRIZE { move = MOVE_MISTY_TERRAIN; }
    PARAMETRIZE { move = MOVE_GRASSY_TERRAIN; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(50); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(5); }
    } WHEN {
        TURN { MOVE(player, move); MOVE(opponent, MOVE_DEFOG); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DEFOG, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Wobbuffet's evasiveness fell!");
        if (B_DEFOG_EFFECT_CLEARING >= GEN_8) {
            if (move == MOVE_PSYCHIC_TERRAIN) {
                MESSAGE("The weirdness disappeared from the battlefield!");
            }
            else if (move == MOVE_ELECTRIC_TERRAIN) {
                MESSAGE("The electricity disappeared from the battlefield.");
            }
            else if (move == MOVE_MISTY_TERRAIN) {
                MESSAGE("The mist disappeared from the battlefield.");
            }
            else if (move == MOVE_GRASSY_TERRAIN) {
                MESSAGE("The grass disappeared from the battlefield.");
            }
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_RESTORE_BG, player);
        } else {
            NONE_OF {
                MESSAGE("The weirdness disappeared from the battlefield!");
                MESSAGE("The electricity disappeared from the battlefield.");
                MESSAGE("The mist disappeared from the battlefield.");
                MESSAGE("The grass disappeared from the battlefield.");
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_RESTORE_BG, player);
            }
        }
    }
}

SINGLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Toxic Spikes from opponent's side")
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
    } WHEN {
        TURN { MOVE(player, MOVE_TOXIC_SPIKES); MOVE(opponent, move); }
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TOXIC_SPIKES, player);
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
            MESSAGE("Wobbuffet's evasiveness fell!");
            if (B_DEFOG_EFFECT_CLEARING >= GEN_6)
                MESSAGE("The poison spikes disappeared from the ground around the opposing team!");
        }
        // Switch happens
        MESSAGE("2 sent out Wobbuffet!");
        if (move != MOVE_DEFOG || B_DEFOG_EFFECT_CLEARING <= GEN_5) {
            MESSAGE("The opposing Wobbuffet was poisoned!");
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_PSN, opponent);
            STATUS_ICON(opponent, poison: TRUE);
        }
        else {
            NONE_OF {
                MESSAGE("The opposing Wobbuffet was poisoned!");
                ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_PSN, opponent);
                STATUS_ICON(opponent, poison: TRUE);
            }
        }
    }
}

DOUBLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes Aurora Veil from player's side", s16 damagePhysical, s16 damageSpecial)
{
    u16 move;

    PARAMETRIZE { move = MOVE_DEFOG; }
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_HAIL].effect == EFFECT_HAIL);
        ASSUME(gSpeciesInfo[SPECIES_GLALIE].types[0] == TYPE_ICE);
        PLAYER(SPECIES_GLALIE) { Speed(4); }
        PLAYER(SPECIES_GLALIE) { Speed(3); }
        OPPONENT(SPECIES_GLALIE) { Speed(2); }
        OPPONENT(SPECIES_GLALIE) { Speed(1); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_HAIL); MOVE(playerRight, MOVE_AURORA_VEIL); }
        TURN { MOVE(opponentLeft, move, target: playerLeft); }
        TURN { MOVE(opponentLeft, MOVE_TACKLE, target: playerLeft); MOVE(opponentRight, MOVE_GUST, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HAIL, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AURORA_VEIL, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentLeft);
        if (move == MOVE_DEFOG) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
            MESSAGE("Glalie's evasiveness fell!");
            MESSAGE("Your team's Aurora Veil wore off!");
        }
        MESSAGE("The opposing Glalie used Tackle!");
        HP_BAR(playerLeft, captureDamage: &results[i].damagePhysical);
        MESSAGE("The opposing Glalie used Gust!");
        HP_BAR(playerRight, captureDamage: &results[i].damageSpecial);
    } FINALLY {
        EXPECT_MUL_EQ(results[1].damagePhysical, Q_4_12(1.5), results[0].damagePhysical);
        EXPECT_MUL_EQ(results[1].damageSpecial, Q_4_12(1.5), results[0].damageSpecial);
    }
}

DOUBLE_BATTLE_TEST("Defog lowers evasiveness by 1 and removes everything it can")
{
    GIVEN {
        ASSUME(gMovesInfo[MOVE_HAIL].effect == EFFECT_HAIL);
        ASSUME(gSpeciesInfo[SPECIES_GLALIE].types[0] == TYPE_ICE);
        PLAYER(SPECIES_GLALIE) { Speed(4); }
        PLAYER(SPECIES_GLALIE) { Speed(3); }
        PLAYER(SPECIES_GLALIE) { Speed(12); }
        PLAYER(SPECIES_GLALIE) { Speed(3); }
        OPPONENT(SPECIES_GLALIE) { Speed(2); }
        OPPONENT(SPECIES_GLALIE) { Speed(1); }
        OPPONENT(SPECIES_GLALIE) { Speed(1); }
        OPPONENT(SPECIES_GLALIE) { Speed(1); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_STICKY_WEB); MOVE(playerRight, MOVE_SPIKES); MOVE(opponentLeft, MOVE_STICKY_WEB); MOVE(opponentRight, MOVE_SPIKES); }
        TURN { SWITCH(playerLeft, 2); SWITCH(playerRight, 3); SWITCH(opponentLeft, 2); SWITCH(opponentRight, 3); }
        TURN { MOVE(playerLeft, MOVE_TOXIC_SPIKES); MOVE(playerRight, MOVE_STEALTH_ROCK); MOVE(opponentLeft, MOVE_TOXIC_SPIKES); MOVE(opponentRight, MOVE_STEALTH_ROCK); }
        TURN { MOVE(playerLeft, MOVE_HAIL); MOVE(playerRight, MOVE_AURORA_VEIL); MOVE(opponentLeft, MOVE_AURORA_VEIL); MOVE(opponentRight, MOVE_LIGHT_SCREEN); }
        TURN { MOVE(playerLeft, MOVE_REFLECT); MOVE(playerRight, MOVE_LIGHT_SCREEN); MOVE(opponentLeft, MOVE_REFLECT); MOVE(opponentRight, MOVE_SAFEGUARD); }
        TURN { MOVE(playerLeft, MOVE_MIST); MOVE(playerRight, MOVE_SAFEGUARD); MOVE(opponentLeft, MOVE_MIST); MOVE(opponentRight, MOVE_DEFOG, target: playerLeft); }
    } SCENE {
        MESSAGE("The opposing Glalie used Defog!");
        MESSAGE("Glalie is protected by the mist!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DEFOG, opponentRight);
        // Player side
        MESSAGE("Your team's Reflect wore off!");
        MESSAGE("Your team's Light Screen wore off!");
        MESSAGE("Your team's Mist wore off!");
        MESSAGE("Your team's Aurora Veil wore off!");
        MESSAGE("Your team's Safeguard wore off!");

        if (B_DEFOG_EFFECT_CLEARING >= GEN_6) {
            MESSAGE("The spikes disappeared from the ground around your team!");
            MESSAGE("The pointed stones disappeared from around your team!");
            MESSAGE("The poison spikes disappeared from the ground around your team!");
            MESSAGE("The sticky web has disappeared from the ground around your team!");

            // Opponent side
            MESSAGE("The spikes disappeared from the ground around the opposing team!");
            MESSAGE("The pointed stones disappeared from around the opposing team!");
            MESSAGE("The poison spikes disappeared from the ground around the opposing team!");
            MESSAGE("The sticky web has disappeared from the ground around the opposing team!");
        }
    }
}

SINGLE_BATTLE_TEST("Defog is used on the correct side if opposing mon is behind a substitute with Screen up")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_LIGHT_SCREEN); }
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); MOVE(player, MOVE_DEFOG); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LIGHT_SCREEN, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        MESSAGE("Wobbuffet used Defog!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DEFOG, player);
        MESSAGE("The opposing Wobbuffet's evasiveness fell!");
        MESSAGE("The opposing team's Light Screen wore off!");
    }
}
