#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_BEAK_BLAST) == EFFECT_BEAK_BLAST);
}

DOUBLE_BATTLE_TEST("Beak Blast's charging message is shown before other moves are used")
{
    GIVEN {
        ASSUME(GetMovePriority(MOVE_BEAK_BLAST) < 0);
        PLAYER(SPECIES_WYNAUT) { Speed(10); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(3); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_BEAK_BLAST, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, playerLeft);
        MESSAGE("Wynaut started heating up its beak!");

        MESSAGE("Wobbuffet used Celebrate!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerRight);
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentRight);
        MESSAGE("The opposing Wobbuffet used Celebrate!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, opponentLeft);

        MESSAGE("Wynaut used Beak Blast!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BEAK_BLAST, playerLeft);
        HP_BAR(opponentLeft);
    }
}

DOUBLE_BATTLE_TEST("Beak Blast burns all who make contact with the Pokémon")
{
    GIVEN {
        ASSUME(GetMovePriority(MOVE_BEAK_BLAST) < 0);
        ASSUME(MoveMakesContact(MOVE_SCRATCH));
        PLAYER(SPECIES_WYNAUT) { Speed(10); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(3); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SCRATCH, target: playerLeft); MOVE(opponentRight, MOVE_SCRATCH, target: playerLeft); MOVE(playerLeft, MOVE_BEAK_BLAST, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, playerLeft);
        MESSAGE("Wynaut started heating up its beak!");

        MESSAGE("Wobbuffet used Celebrate!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, playerRight);

        MESSAGE("The opposing Wobbuffet used Scratch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentLeft);
        HP_BAR(playerLeft);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_BRN, opponentLeft);
        MESSAGE("The opposing Wobbuffet was burned!");
        STATUS_ICON(opponentLeft, burn: TRUE);

        MESSAGE("The opposing Wobbuffet used Scratch!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponentRight);
        HP_BAR(playerLeft);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_BRN, opponentRight);
        MESSAGE("The opposing Wobbuffet was burned!");
        STATUS_ICON(opponentRight, burn: TRUE);

        MESSAGE("Wynaut used Beak Blast!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BEAK_BLAST, playerLeft);
        HP_BAR(opponentLeft);
    }
}

SINGLE_BATTLE_TEST("Beak Blast burns only when contact moves are used")
{
    enum Move move;
    bool32 burn;
    PARAMETRIZE { move = MOVE_SCRATCH; burn = TRUE; }
    PARAMETRIZE { move = MOVE_WATER_GUN; burn = FALSE; }
    PARAMETRIZE { move = MOVE_LEER; burn = FALSE; }

    GIVEN {
        ASSUME(MoveMakesContact(MOVE_SCRATCH));
        ASSUME(!MoveMakesContact(MOVE_WATER_GUN));
        ASSUME(!MoveMakesContact(MOVE_LEER));
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); MOVE(player, MOVE_BEAK_BLAST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, player);
        MESSAGE("Wobbuffet started heating up its beak!");
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);

        if (burn) {
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_BRN, opponent);
            MESSAGE("The opposing Wobbuffet was burned!");
            STATUS_ICON(opponent, burn: TRUE);
        }
        else {
            NONE_OF {
                ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_BRN, opponent);
                MESSAGE("The opposing Wobbuffet was burned!");
                STATUS_ICON(opponent, burn: TRUE);
            }
        }

        MESSAGE("Wobbuffet used Beak Blast!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BEAK_BLAST, player);
        HP_BAR(opponent);
    }
}

SINGLE_BATTLE_TEST("Beak Blast doesn't burn when charging a two turn move")
{
    u32 move;
    PARAMETRIZE { move = MOVE_BOUNCE; }
    PARAMETRIZE { move = MOVE_DIG; }

    GIVEN {
        ASSUME(MoveMakesContact(MOVE_BOUNCE));
        ASSUME(MoveMakesContact(MOVE_DIG));
        ASSUME(gBattleMoveEffects[GetMoveEffect(MOVE_BOUNCE)].twoTurnEffect);
        ASSUME(gBattleMoveEffects[GetMoveEffect(MOVE_DIG)].twoTurnEffect);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, move); MOVE(player, MOVE_BEAK_BLAST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, player);
        MESSAGE("Wobbuffet started heating up its beak!");
        ANIMATION(ANIM_TYPE_MOVE, move, opponent);

        NONE_OF {
            HP_BAR(player);
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_BRN, opponent);
            MESSAGE("The opposing Wobbuffet was burned!");
            STATUS_ICON(opponent, burn: TRUE);
        }
    }
}

SINGLE_BATTLE_TEST("Beak Blast doesn't burn fire types")
{
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_ARCANINE].types[0] == TYPE_FIRE || gSpeciesInfo[SPECIES_ARCANINE].types[1] == TYPE_FIRE);
        PLAYER(SPECIES_ARCANINE);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); MOVE(opponent, MOVE_BEAK_BLAST); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        NOT STATUS_ICON(player, burn: TRUE);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BEAK_BLAST, opponent);
    }
}

SINGLE_BATTLE_TEST("Beak Blast doesn't burn after being used")
{
    GIVEN {
        ASSUME(GetMovePriority(MOVE_COUNTER) < GetMovePriority(MOVE_BEAK_BLAST));
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_BEAK_BLAST); MOVE(player, MOVE_COUNTER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BEAK_BLAST, opponent);
        NOT STATUS_ICON(player, burn: TRUE);
    }
}

DOUBLE_BATTLE_TEST("Beak Blast doesn't burn if the target is protected")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SPIKY_SHIELD; }
    PARAMETRIZE { move = MOVE_BANEFUL_BUNKER; }
    PARAMETRIZE { move = MOVE_BURNING_BULWARK; }
    PARAMETRIZE { move = MOVE_SILK_TRAP; }

    GIVEN {
        ASSUME(GetMoveEffect(move) == EFFECT_PROTECT);
        ASSUME(GetMoveEffect(MOVE_INSTRUCT) == EFFECT_INSTRUCT);
        ASSUME(GetMovePriority(MOVE_BEAK_BLAST) > GetMovePriority(MOVE_TRICK_ROOM));
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        PLAYER(SPECIES_WYNAUT) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WYNAUT) { Speed(10); }
    } WHEN {
        TURN { MOVE(opponentLeft, move); }
        TURN { MOVE(opponentRight, MOVE_INSTRUCT, target: opponentLeft, WITH_RNG(RNG_PROTECT_FAIL, 0));
               MOVE(opponentLeft, MOVE_BEAK_BLAST, target: playerLeft);
               MOVE(playerRight, MOVE_TRICK_ROOM);
               MOVE(playerLeft, MOVE_POUND, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, move, opponentLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, playerLeft);
        if (move == MOVE_SPIKY_SHIELD) {
            HP_BAR(playerLeft);
        } else if (move == MOVE_BANEFUL_BUNKER) {
            STATUS_ICON(playerLeft, STATUS1_POISON);
        } else if (move == MOVE_BURNING_BULWARK) {
            STATUS_ICON(playerLeft, STATUS1_BURN);
        } else if (move == MOVE_SILK_TRAP) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        }
        NOT STATUS_ICON(playerLeft, STATUS1_BURN);
    }
}

DOUBLE_BATTLE_TEST("Beak Blast doesn't burn if the target is protected by Quick Guard")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_QUICK_GUARD) == EFFECT_PROTECT);
        ASSUME(GetMoveProtectMethod(MOVE_QUICK_GUARD) == PROTECT_QUICK_GUARD);
        ASSUME(GetMovePriority(MOVE_QUICK_ATTACK) > 0);
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); }
        PLAYER(SPECIES_WYNAUT) { Speed(2); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(5); }
        OPPONENT(SPECIES_WYNAUT) { Speed(10); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_BEAK_BLAST, target: playerLeft);
               MOVE(opponentRight, MOVE_QUICK_GUARD);
               MOVE(playerLeft, MOVE_QUICK_ATTACK, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_BEAK_BLAST_SETUP, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_QUICK_GUARD, opponentRight);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_QUICK_ATTACK, playerLeft);
            STATUS_ICON(playerLeft, STATUS1_BURN);
        }
    }
}

TO_DO_BATTLE_TEST("Beak Blast's charging message is shown regardless if it would've missed");
TO_DO_BATTLE_TEST("Beak Blast fails if it's forced by Encore after choosing a different move");
TO_DO_BATTLE_TEST("Bulletproof is immune to Beak Blast but not to the burn it causes");
