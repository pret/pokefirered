#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_SNATCH) == EFFECT_SNATCH);
    ASSUME(MoveCanBeSnatched(MOVE_SWORDS_DANCE));
    ASSUME(GetMoveEffect(MOVE_SWORDS_DANCE) == EFFECT_ATTACK_UP_2);
    ASSUME(MoveCanBeSnatched(MOVE_CELEBRATE) == FALSE);
}

SINGLE_BATTLE_TEST("Snatch steals stat-boosting moves from the opponent")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); }
        OPPONENT(SPECIES_WYNAUT) { Speed(50); }
    } WHEN {
        TURN { MOVE(player, MOVE_SNATCH); MOVE(opponent, MOVE_SWORDS_DANCE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, player);
        MESSAGE("Wobbuffet waits for a target to make a move!");
        MESSAGE("Wobbuffet snatched the opposing Wynaut's move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, player);
        MESSAGE("Wobbuffet's Attack sharply rose!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 2);
        EXPECT_EQ(opponent->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Snatch does not steal non-snatchable moves")
{
    GIVEN {
        ASSUME(MoveCanBeSnatched(MOVE_TACKLE) == FALSE);
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); }
        OPPONENT(SPECIES_WYNAUT) { Speed(50); }
    } WHEN {
        TURN { MOVE(player, MOVE_SNATCH); MOVE(opponent, MOVE_TACKLE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, player);
        MESSAGE("Wobbuffet waits for a target to make a move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponent);
        HP_BAR(player);
    }
}

DOUBLE_BATTLE_TEST("Snatch does not steal a move that was already snatched this turn (Gen 5+)")
{
    GIVEN {
        ASSUME(B_SNATCH >= GEN_5);
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); }
        PLAYER(SPECIES_WYNAUT) { Speed(90); }
        OPPONENT(SPECIES_ABRA) { Speed(80); }
        OPPONENT(SPECIES_KADABRA) { Speed(10); }
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_SNATCH);
            MOVE(playerRight, MOVE_SNATCH);
            MOVE(opponentLeft, MOVE_CELEBRATE);
            MOVE(opponentRight, MOVE_SWORDS_DANCE);
        }
    } SCENE {
        // Both players use Snatch in turn order
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, playerLeft);
        MESSAGE("Wobbuffet waits for a target to make a move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, playerRight);
        MESSAGE("Wynaut waits for a target to make a move!");
        // Opponent uses Celebrate (not snatchable)
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentLeft);
        // Slowest opponent uses Swords Dance - only the first Snatch user should steal it
        MESSAGE("Wobbuffet snatched the opposing Kadabra's move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, playerLeft);
        MESSAGE("Wobbuffet's Attack sharply rose!");
        // The second Snatch user should NOT steal the already-snatched move
        NOT MESSAGE("Wynaut snatched the opposing Kadabra's move!");
    } THEN {
        // Only playerLeft got the Attack boost
        EXPECT_EQ(playerLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 2);
        EXPECT_EQ(playerRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponentRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}

DOUBLE_BATTLE_TEST("Snatch steals from the correct target when multiple snatchable moves are used")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); }
        PLAYER(SPECIES_WYNAUT) { Speed(10); }
        OPPONENT(SPECIES_ABRA) { Speed(80); }
        OPPONENT(SPECIES_KADABRA) { Speed(50); }
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_SNATCH);
            MOVE(playerRight, MOVE_CELEBRATE);
            MOVE(opponentLeft, MOVE_SWORDS_DANCE);
            MOVE(opponentRight, MOVE_AGILITY);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, playerLeft);
        MESSAGE("Wobbuffet waits for a target to make a move!");
        // First snatchable move is Swords Dance from opponentLeft
        MESSAGE("Wobbuffet snatched the opposing Abra's move!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, playerLeft);
        MESSAGE("Wobbuffet's Attack sharply rose!");
        // Agility should NOT be snatched (Snatch was already used)
        ANIMATION(ANIM_TYPE_MOVE, MOVE_AGILITY, opponentRight);
        MESSAGE("The opposing Kadabra's Speed sharply rose!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerRight);
    } THEN {
        EXPECT_EQ(playerLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 2);
        EXPECT_EQ(opponentRight->statStages[STAT_SPEED], DEFAULT_STAT_STAGE + 2);
    }
}

SINGLE_BATTLE_TEST("Snatch fails if user moves last")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WYNAUT) { Speed(10); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CELEBRATE); MOVE(player, MOVE_SNATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, player);
    }
}

DOUBLE_BATTLE_TEST("Snatch fails when the only slower battler is a fainted ally")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); }
        PLAYER(SPECIES_WYNAUT) { HP(1); Speed(1); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(20); }
        OPPONENT(SPECIES_WYNAUT) { Speed(10); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerRight); }
        TURN {
            MOVE(opponentLeft, MOVE_CELEBRATE);
            MOVE(opponentRight, MOVE_CELEBRATE);
            MOVE(playerLeft, MOVE_SNATCH);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        MESSAGE("Wynaut fainted!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentRight);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SNATCH, playerLeft);
    }
}

TO_DO_BATTLE_TEST("Snatch does not steal moves that cannot be snatched");
TO_DO_BATTLE_TEST("Snatch can steal healing moves");
