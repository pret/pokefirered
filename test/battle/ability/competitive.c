#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Competitive sharply raises player's Sp. Atk after Intimidate")
{
    u32 abilityLeft, abilityRight;

    PARAMETRIZE { abilityLeft = ABILITY_FRIEND_GUARD; abilityRight = ABILITY_FRIEND_GUARD; }
    PARAMETRIZE { abilityLeft = ABILITY_FRIEND_GUARD; abilityRight = ABILITY_COMPETITIVE; }
    PARAMETRIZE { abilityLeft = ABILITY_COMPETITIVE; abilityRight = ABILITY_FRIEND_GUARD; }
    PARAMETRIZE { abilityLeft = ABILITY_COMPETITIVE; abilityRight = ABILITY_COMPETITIVE; }

    GIVEN {
        PLAYER(SPECIES_IGGLYBUFF) { Ability(abilityLeft); }
        PLAYER(SPECIES_JIGGLYPUFF) { Ability(abilityRight); }
        OPPONENT(SPECIES_GYARADOS) { Ability(ABILITY_INTIMIDATE); }
        OPPONENT(SPECIES_ARBOK) { Ability(ABILITY_INTIMIDATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target:opponentLeft); MOVE(playerRight, MOVE_SCRATCH, target:opponentRight); }
    } SCENE {
        //1st mon Intimidate
        ABILITY_POPUP(opponentLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("The opposing Gyarados's Intimidate cuts Igglybuff's Attack!");
        if (abilityLeft == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(playerLeft, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
            MESSAGE("Igglybuff's Sp. Atk sharply rose!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("The opposing Gyarados's Intimidate cuts Jigglypuff's Attack!");
        if (abilityRight == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(playerRight, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
            MESSAGE("Jigglypuff's Sp. Atk sharply rose!");
        }

        //2nd mon Intimidate
        ABILITY_POPUP(opponentRight, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("The opposing Arbok's Intimidate cuts Igglybuff's Attack!");
        if (abilityLeft == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(playerLeft, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
            MESSAGE("Igglybuff's Sp. Atk sharply rose!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("The opposing Arbok's Intimidate cuts Jigglypuff's Attack!");
        if (abilityRight == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(playerRight, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
            MESSAGE("Jigglypuff's Sp. Atk sharply rose!");
        }
    } THEN {
        EXPECT_EQ(playerLeft->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + (abilityLeft == ABILITY_COMPETITIVE ? 4 : 0));
        EXPECT_EQ(playerRight->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + (abilityRight == ABILITY_COMPETITIVE ? 4 : 0));
    }
}

// Same as above, but for opponent.
DOUBLE_BATTLE_TEST("Competitive sharply raises opponent's Sp. Atk after Intimidate")
{
    u32 abilityLeft, abilityRight;

    PARAMETRIZE { abilityLeft = ABILITY_FRIEND_GUARD; abilityRight = ABILITY_FRIEND_GUARD; }
    PARAMETRIZE { abilityLeft = ABILITY_FRIEND_GUARD; abilityRight = ABILITY_COMPETITIVE; }
    PARAMETRIZE { abilityLeft = ABILITY_COMPETITIVE; abilityRight = ABILITY_FRIEND_GUARD; }
    PARAMETRIZE { abilityLeft = ABILITY_COMPETITIVE; abilityRight = ABILITY_COMPETITIVE; }

    GIVEN {
        OPPONENT(SPECIES_IGGLYBUFF) { Ability(abilityLeft); }
        OPPONENT(SPECIES_JIGGLYPUFF) { Ability(abilityRight); }
        PLAYER(SPECIES_GYARADOS) { Ability(ABILITY_INTIMIDATE); }
        PLAYER(SPECIES_ARBOK) { Ability(ABILITY_INTIMIDATE); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target:playerLeft); MOVE(opponentRight, MOVE_SCRATCH, target:playerRight); }
    } SCENE {
        //1st mon Intimidate
        ABILITY_POPUP(playerLeft, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        MESSAGE("Gyarados's Intimidate cuts the opposing Igglybuff's Attack!");
        if (abilityLeft == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(opponentLeft, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
            MESSAGE("The opposing Igglybuff's Sp. Atk sharply rose!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        MESSAGE("Gyarados's Intimidate cuts the opposing Jigglypuff's Attack!");
        if (abilityRight == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(opponentRight, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
            MESSAGE("The opposing Jigglypuff's Sp. Atk sharply rose!");
        }

        //2nd mon Intimidate
        ABILITY_POPUP(playerRight, ABILITY_INTIMIDATE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        MESSAGE("Arbok's Intimidate cuts the opposing Igglybuff's Attack!");
        if (abilityLeft == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(opponentLeft, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
            MESSAGE("The opposing Igglybuff's Sp. Atk sharply rose!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        MESSAGE("Arbok's Intimidate cuts the opposing Jigglypuff's Attack!");
        if (abilityRight == ABILITY_COMPETITIVE) {
            ABILITY_POPUP(opponentRight, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
            MESSAGE("The opposing Jigglypuff's Sp. Atk sharply rose!");
        }
    } THEN {
        EXPECT_EQ(opponentLeft->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + (abilityLeft == ABILITY_COMPETITIVE ? 4 : 0));
        EXPECT_EQ(opponentRight->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + (abilityRight == ABILITY_COMPETITIVE ? 4 : 0));
    }
}

SINGLE_BATTLE_TEST("Competitive activates after Sticky Web lowers Speed")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_STICKY_WEB); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STICKY_WEB, opponent);
        // Switch-in - Sticky Web activates
        SEND_IN_MESSAGE("Igglybuff");
        MESSAGE("Igglybuff was caught in a sticky web!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Speed fell!");
        // Competitive activates
        ABILITY_POPUP(player, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");
    }
}

SINGLE_BATTLE_TEST("Competitive doesn't activate after Sticky Web lowers Speed if Court Changed (gen8)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_DEFIANT_STICKY_WEB, GEN_8);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_STICKY_WEB); MOVE(opponent, MOVE_COURT_CHANGE); }
        TURN { SWITCH(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STICKY_WEB, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COURT_CHANGE, opponent);
        // Switch-in - Sticky Web activates
        SEND_IN_MESSAGE("Igglybuff");
        MESSAGE("Igglybuff was caught in a sticky web!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Speed fell!");
        // Competitive doesn't activate
        NONE_OF {
            ABILITY_POPUP(player, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
            MESSAGE("Igglybuff's Sp. Atk sharply rose!");
        }
    }
}

SINGLE_BATTLE_TEST("Competitive correctly activates after Sticky Web lowers Speed if Court Changed (Gen8)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_DEFIANT_STICKY_WEB, GEN_8);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_STICKY_WEB); MOVE(opponent, MOVE_COURT_CHANGE); }
        TURN { SWITCH(player, 1); }
        TURN { MOVE(opponent, MOVE_GROWL);}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_STICKY_WEB, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_COURT_CHANGE, opponent);
        // Switch-in - Sticky Web activates
        SEND_IN_MESSAGE("Igglybuff");
        MESSAGE("Igglybuff was caught in a sticky web!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Speed fell!");
        // Competitive doesn't activate
        NONE_OF {
            ABILITY_POPUP(player, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
            MESSAGE("Igglybuff's Sp. Atk sharply rose!");
        }
        // Competitive triggers correctly after Sticky Web
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Attack fell!");
        ABILITY_POPUP(player, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");
    }
}

DOUBLE_BATTLE_TEST("Competitive is activated by Cotton Down for non-ally pokemon")
{
    GIVEN {
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_ELDEGOSS) { Ability(ABILITY_COTTON_DOWN); }
        OPPONENT(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SCRATCH, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, playerLeft);
        ABILITY_POPUP(opponentLeft, ABILITY_COTTON_DOWN);

        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Igglybuff's Speed fell!");
        ABILITY_POPUP(playerLeft, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");

        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("Igglybuff's Speed fell!");
        ABILITY_POPUP(playerRight, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");

        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        MESSAGE("The opposing Igglybuff's Speed fell!");
    } THEN {
        EXPECT_EQ(playerLeft->statStages[STAT_SPEED], DEFAULT_STAT_STAGE - 1);
        EXPECT_EQ(playerRight->statStages[STAT_SPEED], DEFAULT_STAT_STAGE - 1);
        EXPECT_EQ(opponentRight->statStages[STAT_SPEED], DEFAULT_STAT_STAGE - 1);
        EXPECT_EQ(playerLeft->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 2);
        EXPECT_EQ(playerRight->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 2);
    }
}

SINGLE_BATTLE_TEST("Competitive activates before White Herb")
{
    u32 move;

    PARAMETRIZE { move = MOVE_LEER; }
    PARAMETRIZE { move = MOVE_CONFIDE; }

    GIVEN {
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); Item(ITEM_WHITE_HERB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);

        ABILITY_POPUP(player, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");

        if (move == MOVE_LEER) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            MESSAGE("Igglybuff returned its stats to normal using its White Herb!");
        } else {
            NONE_OF {
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
                MESSAGE("Igglybuff returned its stats to normal using its White Herb!");
            }
        }
    } THEN {
        if (move == MOVE_LEER) {
            EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
            EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 2);
        } else {
            EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 1);
        }
    }
}

SINGLE_BATTLE_TEST("Competitive activates for each stat that is lowered")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TICKLE) == EFFECT_TICKLE);
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TICKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TICKLE, opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);

        MESSAGE("Igglybuff's Attack fell!");
        ABILITY_POPUP(player, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");

        MESSAGE("Igglybuff's Defense fell!");
        ABILITY_POPUP(player, ABILITY_COMPETITIVE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Igglybuff's Sp. Atk sharply rose!");

    } THEN {
        EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 4);
    }
}

SINGLE_BATTLE_TEST("Competitive doesn't activate if the pokemon lowers it's own stats")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SUPERPOWER; }
    PARAMETRIZE { move = MOVE_CLOSE_COMBAT; }
    PARAMETRIZE { move = MOVE_MAKE_IT_RAIN; }
    PARAMETRIZE { move = MOVE_SPIN_OUT; }

    GIVEN {
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_SUPERPOWER, MOVE_EFFECT_ATK_DEF_DOWN));
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_CLOSE_COMBAT, MOVE_EFFECT_DEF_SPDEF_DOWN));
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_MAKE_IT_RAIN, MOVE_EFFECT_SP_ATK_MINUS_1));
        ASSUME(MoveHasAdditionalEffectSelf(MOVE_SPIN_OUT, MOVE_EFFECT_SPD_MINUS_2));
        PLAYER(SPECIES_IGGLYBUFF) { Ability(ABILITY_COMPETITIVE); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);

        NONE_OF {
            ABILITY_POPUP(player, ABILITY_COMPETITIVE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
            MESSAGE("Igglybuff's Sp. Atk sharply rose!");
        }
    } THEN {
        if (move == MOVE_SUPERPOWER)
            EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 1);
        else
            EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}
