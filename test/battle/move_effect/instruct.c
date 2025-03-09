#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_INSTRUCT) == EFFECT_INSTRUCT);
}

DOUBLE_BATTLE_TEST("Instruct fails if target hasn't made a move")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Instruct fails if move is banned by Instruct")
{
    GIVEN {
        ASSUME(IsMoveInstructBanned(MOVE_BIDE));
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_BIDE); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_BIDE); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BIDE, playerRight);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called move targets the target of the move picked on its last use")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_FAKE_OUT); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        HP_BAR(opponentLeft);
        NOT HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        HP_BAR(opponentLeft);
        NOT HP_BAR(opponentRight);
    }
}

DOUBLE_BATTLE_TEST("Instruct doesn't bypass sleep")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SPORE) == EFFECT_SLEEP);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_GROWL); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); MOVE(opponentLeft, MOVE_SPORE, target: playerRight); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        MESSAGE("Wobbuffet is fast asleep.");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Instruct fails if target doesn't know the last move it used")
{
    GIVEN {
        ASSUME(IsDanceMove(MOVE_DRAGON_DANCE));
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_ORICORIO) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_DRAGON_DANCE); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DANCE, opponentLeft);
        ABILITY_POPUP(playerRight, ABILITY_DANCER);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DANCE, playerRight);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DANCE, playerRight);
        }
    }
}

DOUBLE_BATTLE_TEST("Instruct-called move fails if it can only be used on the first turn but consumes PP")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FAKE_OUT) == EFFECT_FIRST_TURN_ONLY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_FAKE_OUT); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_FAKE_OUT, target: opponentLeft); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FAKE_OUT, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FAKE_OUT, playerRight);
    } THEN {
        EXPECT_EQ(playerRight->pp[3], GetMovePP(MOVE_FAKE_OUT) - 2);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called move doesn't fail if tormented")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TORMENT) == EFFECT_TORMENT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_FAKE_OUT); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_TORMENT, target: playerRight); MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TORMENT, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called status moves don't fail if holding Assault Vest")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_ASSAULT_VEST].holdEffect == HOLD_EFFECT_ASSAULT_VEST);
        ASSUME(GetMoveEffect(MOVE_TRICK) == EFFECT_TRICK);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_TRICK); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_ASSAULT_VEST); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_TRICK, target: opponentLeft); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); MOVE(opponentLeft, MOVE_TACKLE, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRICK, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRICK, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called status move fails if taunted")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TAUNT) == EFFECT_TAUNT);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_GROWL); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_GROWL); MOVE(opponentLeft, MOVE_TAUNT, target: playerRight); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, playerRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TAUNT, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_GROWL, playerRight);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        }
    } THEN {
        EXPECT_EQ(playerRight->pp[3], GetMovePP(MOVE_GROWL) - 1);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called moves fail if disabled")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_DISABLE) == EFFECT_DISABLE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_GROWL); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_TACKLE, target: opponentLeft); MOVE(opponentLeft, MOVE_DISABLE, target: playerRight); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DISABLE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerRight);
    } THEN {
        EXPECT_EQ(playerRight->pp[0], GetMovePP(MOVE_TACKLE) - 1);
    }
}

DOUBLE_BATTLE_TEST("Instruct-called moves keep their priority")
{
    GIVEN {
        ASSUME(GetMovePriority(MOVE_QUICK_ATTACK) == 1);
        ASSUME(GetMoveEffect(MOVE_PSYCHIC_TERRAIN) == EFFECT_PSYCHIC_TERRAIN);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_TACKLE, MOVE_POUND, MOVE_SCRATCH, MOVE_QUICK_ATTACK); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_QUICK_ATTACK, target: opponentLeft); MOVE(opponentLeft, MOVE_PSYCHIC_TERRAIN, target: playerRight); MOVE(playerLeft, MOVE_INSTRUCT, target: playerRight); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_QUICK_ATTACK, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PSYCHIC_TERRAIN, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_QUICK_ATTACK, playerRight);
    }
}

DOUBLE_BATTLE_TEST("Instructed move will be redirected and absorbed by Lightning Rod if it turns into an Electric Type move")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = opponentLeft; }
    PARAMETRIZE { moveTarget = opponentRight; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_PIKACHU) { Ability(ABILITY_LIGHTNING_ROD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_TACKLE, target: moveTarget);
            MOVE(opponentLeft, MOVE_PLASMA_FISTS, target: playerLeft);
            MOVE(playerRight, MOVE_INSTRUCT, target: playerLeft);
            MOVE(opponentRight, MOVE_CELEBRATE);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PLASMA_FISTS, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerRight);
        ABILITY_POPUP(opponentLeft, ABILITY_LIGHTNING_ROD);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
    }
}

DOUBLE_BATTLE_TEST("Instructed move will be redirected by Follow Me after instructed target loses Stalwart")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = opponentLeft; }
    PARAMETRIZE { moveTarget = opponentRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_FOLLOW_ME].effect == EFFECT_FOLLOW_ME);
        ASSUME(gMovesInfo[MOVE_SKILL_SWAP].effect == EFFECT_SKILL_SWAP);
        PLAYER(SPECIES_DURALUDON) { Ability(ABILITY_STALWART); }
        PLAYER(SPECIES_DURALUDON) { Ability(ABILITY_STALWART); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_TACKLE, target: moveTarget);
            MOVE(opponentLeft, MOVE_FOLLOW_ME);
            MOVE(opponentRight, MOVE_SKILL_SWAP, target: playerLeft);
            MOVE(playerRight, MOVE_INSTRUCT, target: playerLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FOLLOW_ME, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        HP_BAR(moveTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        HP_BAR(opponentLeft);
    }
}

DOUBLE_BATTLE_TEST("Instructed move will be redirected by Rage Powder after instructed target loses Grass typing")
{
    struct BattlePokemon *moveTarget = NULL;
    PARAMETRIZE { moveTarget = opponentLeft; }
    PARAMETRIZE { moveTarget = opponentRight; }
    GIVEN {
        ASSUME(gMovesInfo[MOVE_RAGE_POWDER].effect == EFFECT_FOLLOW_ME);
        ASSUME(gMovesInfo[MOVE_RAGE_POWDER].powderMove == TRUE);
        ASSUME(gMovesInfo[MOVE_SOAK].effect == EFFECT_SOAK);
        PLAYER(SPECIES_TREECKO);
        PLAYER(SPECIES_SCEPTILE);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN {
            MOVE(playerLeft, MOVE_TACKLE, target: moveTarget);
            MOVE(opponentLeft, MOVE_RAGE_POWDER);
            MOVE(opponentRight, MOVE_SOAK, target: playerLeft);
            MOVE(playerRight, MOVE_INSTRUCT, target: playerLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_RAGE_POWDER, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        HP_BAR(moveTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SOAK, opponentRight);
        MESSAGE("Treecko transformed into the Water type!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_INSTRUCT, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, playerLeft);
        HP_BAR(opponentLeft);
    }
}
