#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_SLEEP_TALK) == EFFECT_SLEEP_TALK);
    ASSUME(IsMoveSleepTalkBanned(MOVE_RAZOR_WIND));
    ASSUME(IsMoveSleepTalkBanned(MOVE_FLY));
    ASSUME(IsMoveSleepTalkBanned(MOVE_DIG));
}

SINGLE_BATTLE_TEST("Sleep Talk fails if not asleep")
{
    u32 status;
    PARAMETRIZE { status = STATUS1_SLEEP; }
    PARAMETRIZE { status = STATUS1_NONE; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(status); Moves(MOVE_SLEEP_TALK, MOVE_SCRATCH, MOVE_POUND, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        if (status == STATUS1_SLEEP) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
            NOT MESSAGE("But it failed!");
        }
        else {
            NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
            MESSAGE("But it failed!");
        }
    }
}

SINGLE_BATTLE_TEST("Sleep Talk works if user has Comatose")
{

    GIVEN {
        PLAYER(SPECIES_KOMALA) { Moves(MOVE_SLEEP_TALK, MOVE_SCRATCH, MOVE_POUND, MOVE_SCRATCH); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
        NOT MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Sleep Talk fails if no moves work")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); Moves(MOVE_SLEEP_TALK, MOVE_RAZOR_WIND, MOVE_FLY, MOVE_DIG); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
        MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Sleep Talk can still use moves with no PP")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); MovesWithPP({MOVE_SLEEP_TALK, 10}, {MOVE_SCRATCH, 0}, {MOVE_FLY, 10}, {MOVE_DIG, 10}); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
        NOT MESSAGE("But it failed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH);
    }
}

SINGLE_BATTLE_TEST("Sleep Talk can use moves while choiced into Sleep Talk")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_CHOICE_BAND); Status1(STATUS1_SLEEP); Moves(MOVE_SLEEP_TALK, MOVE_SCRATCH, MOVE_FLY, MOVE_DIG); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
        TURN { MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
        NOT MESSAGE("But it failed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
        NOT MESSAGE("But it failed!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH);
    }
}

SINGLE_BATTLE_TEST("Sleep Talk fails if user is taunted")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_TAUNT) == EFFECT_TAUNT);
        ASSUME(GetMoveCategory(MOVE_SLEEP_TALK) == DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); Moves(MOVE_SLEEP_TALK, MOVE_SCRATCH, MOVE_FLY, MOVE_DIG); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TAUNT); MOVE(player, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TAUNT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, player);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, player);
        }
    }
}

DOUBLE_BATTLE_TEST("Sleep Talk calls move and that move may be redirected by Lightning Rod")
{
    PASSES_RANDOMLY(1, 2, RNG_RANDOM_TARGET);
    GIVEN {
        ASSUME(GetMoveType(MOVE_SPARK) == TYPE_ELECTRIC);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); Moves(MOVE_SLEEP_TALK, MOVE_SPARK, MOVE_FLY, MOVE_DIG); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_RAICHU) { Ability(ABILITY_LIGHTNING_ROD); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SPARK, playerLeft);
        MESSAGE("The opposing Raichu's Lightning Rod took the attack!");
        ABILITY_POPUP(opponentRight, ABILITY_LIGHTNING_ROD);
    }
}

DOUBLE_BATTLE_TEST("Sleep Talk calls move and that move may be redirected by Storm Drain")
{
    PASSES_RANDOMLY(1, 2, RNG_RANDOM_TARGET);
    GIVEN {
        ASSUME(GetMoveType(MOVE_WATER_GUN) == TYPE_WATER);
        PLAYER(SPECIES_WOBBUFFET) { Status1(STATUS1_SLEEP); Moves(MOVE_SLEEP_TALK, MOVE_WATER_GUN, MOVE_FLY, MOVE_DIG); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GASTRODON) { Ability(ABILITY_STORM_DRAIN); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SLEEP_TALK); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, playerLeft);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, playerLeft);
        MESSAGE("The opposing Gastrodon's Storm Drain took the attack!");
        ABILITY_POPUP(opponentRight, ABILITY_STORM_DRAIN);
    }
}
