#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Revive restores a fainted battler's HP to half")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_REVIVE].battleUsage == EFFECT_ITEM_REVIVE);
        PLAYER(SPECIES_WYNAUT) { HP(1); MaxHP(200); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); }
        TURN { USE_ITEM(player, ITEM_REVIVE, partyIndex: 0); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        MESSAGE("Wynaut had its HP restored.");
    } THEN {
        EXPECT_EQ(player->hp, 100);
    }
}

SINGLE_BATTLE_TEST("Max Revive restores a fainted battler's HP fully")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_MAX_REVIVE].battleUsage == EFFECT_ITEM_REVIVE);
        PLAYER(SPECIES_WYNAUT) { HP(1); MaxHP(200); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); }
        TURN { USE_ITEM(player, ITEM_MAX_REVIVE, partyIndex: 0); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        MESSAGE("Wynaut had its HP restored.");
    } THEN {
        EXPECT_EQ(player->hp, 200);
    }
}

SINGLE_BATTLE_TEST("Revival Herb restores a fainted battler's HP fully")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_REVIVAL_HERB].battleUsage == EFFECT_ITEM_REVIVE);
        PLAYER(SPECIES_WYNAUT) { HP(1); MaxHP(200); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); }
        TURN { USE_ITEM(player, ITEM_REVIVAL_HERB, partyIndex: 0); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        MESSAGE("Wynaut had its HP restored.");
    } THEN {
        EXPECT_EQ(player->hp, 200);
    }
}

SINGLE_BATTLE_TEST("Max Honey restores a fainted battler's HP fully")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_MAX_HONEY].battleUsage == EFFECT_ITEM_REVIVE);
        PLAYER(SPECIES_WYNAUT) { HP(1); MaxHP(200); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); SEND_OUT(player, 1); }
        TURN { USE_ITEM(player, ITEM_MAX_HONEY, partyIndex: 0); }
        TURN { SWITCH(player, 0); }
    } SCENE {
        MESSAGE("Wynaut had its HP restored.");
    } THEN {
        EXPECT_EQ(player->hp, 200);
    }
}

// Note: this test is oddly specific with implicit moves/speeds, because I had errors/invalids without them.
DOUBLE_BATTLE_TEST("Revive works for a partner in a double battle")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_REVIVE].battleUsage == EFFECT_ITEM_REVIVE);
        PLAYER(SPECIES_WYNAUT) { HP(1); MaxHP(200); Moves(MOVE_IRON_DEFENSE, MOVE_CELEBRATE); Speed(5); }
        PLAYER(SPECIES_WOBBUFFET) { HP(1); Speed(4); }
        OPPONENT(SPECIES_ABRA) { Speed(3); Moves(MOVE_SCRATCH, MOVE_PSYCHIC, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_KADABRA) { Speed(2); Moves(MOVE_SCRATCH, MOVE_PSYCHIC, MOVE_CELEBRATE, MOVE_EXPLOSION); }
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_PSYCHIC, target:playerLeft); MOVE(playerLeft, MOVE_CELEBRATE); } // Wynaut faints
        TURN { USE_ITEM(playerRight, ITEM_REVIVE, partyIndex: 0); MOVE(opponentRight, MOVE_PSYCHIC, target:playerRight); } // Wynaut gets revived, Wobb faints
        // Wynaut is functionally back
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target:playerLeft); }
        TURN { MOVE(opponentRight, MOVE_SCRATCH, target:playerLeft); }
        TURN { MOVE(opponentRight, MOVE_EXPLOSION); } // Everyone dies, the test can finish.
    } SCENE {
        MESSAGE("Wynaut fainted!");
        MESSAGE("You used Revive!");
        // Switch-in animation
        MESSAGE("Wobbuffet fainted!");
        HP_BAR(playerLeft);
        HP_BAR(playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Revive can trigger switch-in abilities")
{
    GIVEN {
        PLAYER(SPECIES_ARBOK) { Ability(ABILITY_INTIMIDATE); HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); }
        TURN { USE_ITEM(playerRight, ITEM_REVIVE, partyIndex: 0); SKIP_TURN(playerLeft); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
    } THEN {
        EXPECT_EQ(opponentLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 2);
        EXPECT_EQ(opponentRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 2);
    }
}

DOUBLE_BATTLE_TEST("Revive does reset abilities")
{
    GIVEN {
        PLAYER(SPECIES_ARBOK) { Ability(ABILITY_INTIMIDATE); HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_WORRY_SEED, target: playerLeft); MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); }
        TURN { USE_ITEM(playerRight, ITEM_REVIVE, partyIndex: 0); SKIP_TURN(playerLeft); MOVE(opponentRight, MOVE_SPORE, target: playerLeft); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
    } THEN {
        EXPECT_EQ(opponentLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 2);
        EXPECT_EQ(opponentRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 2);
    }
}

DOUBLE_BATTLE_TEST("Revive does not grant a mon its pre-death status condition")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT) { Status1(STATUS1_SLEEP); HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerRight); }
        TURN { USE_ITEM(playerLeft, ITEM_REVIVE, partyIndex: 1); SKIP_TURN(playerRight); }
    } THEN {
        EXPECT_EQ(opponentRight->status1, 0);
    }
}

DOUBLE_BATTLE_TEST("Revive does not grant a mon its pre-death stat change")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_SWORDS_DANCE); MOVE(opponentLeft, MOVE_SCRATCH, target: playerRight); }
        TURN { USE_ITEM(playerLeft, ITEM_REVIVE, partyIndex: 1); SKIP_TURN(playerRight); }
    } THEN {
        EXPECT_EQ(playerRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}

DOUBLE_BATTLE_TEST("Revive does not grant a mon its pre-death types")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT) { HP(1); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_POOCHYENA);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_REFLECT_TYPE, target: opponentRight); MOVE(opponentLeft, MOVE_PSYSHOCK, target: playerRight); MOVE(opponentRight, MOVE_SCRATCH, target: playerRight); }
        TURN { USE_ITEM(playerLeft, ITEM_MAX_REVIVE, partyIndex: 1); SKIP_TURN(playerRight); MOVE(opponentLeft, MOVE_PSYCHIC, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_REFLECT_TYPE, playerRight);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_PSYSHOCK, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PSYCHIC, opponentLeft);
    } THEN {
        EXPECT_LT(playerRight->hp, playerRight->maxHP);
    }
}

DOUBLE_BATTLE_TEST("Revive force revived pokemon to replace absent battler immediately", s16 damage)
{
    u32 ability;

    PARAMETRIZE { ability = ABILITY_INTIMIDATE; }
    PARAMETRIZE { ability = ABILITY_SHED_SKIN; }

    GIVEN {
        PLAYER(SPECIES_WYNAUT) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_ARBOK) { Ability(ability); HP(0); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); }
        TURN { USE_ITEM(playerRight, ITEM_REVIVE, partyIndex: 2); SKIP_TURN(playerLeft); MOVE(opponentRight, MOVE_SCRATCH, target: playerRight); }
    } SCENE {
        if (ability == ABILITY_INTIMIDATE)
        {
            ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        HP_BAR(playerRight, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.5), results[1].damage);
    }
}

TO_DO_BATTLE_TEST("Revive won't restore a battler's HP if it hasn't fainted")
