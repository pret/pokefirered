#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetItemHoldEffect(ITEM_THROAT_SPRAY) == HOLD_EFFECT_THROAT_SPRAY);
    ASSUME(IsSoundMove(MOVE_HYPER_VOICE) == TRUE);
}

DOUBLE_BATTLE_TEST("Throat Spray activates after both hits of a spread move")
{
    s16 firstHit, secondHit;

    GIVEN {
        ASSUME(GetMoveTarget(MOVE_HYPER_VOICE) == MOVE_TARGET_BOTH);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_THROAT_SPRAY); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_HYPER_VOICE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, playerLeft);
        HP_BAR(opponentLeft, captureDamage: &firstHit);
        HP_BAR(opponentRight, captureDamage: &secondHit);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, playerLeft);
    } THEN {
        EXPECT_EQ(firstHit, secondHit);
    }
}

SINGLE_BATTLE_TEST("Throat Spray increases Sp. Atk by one stage")
{
    s16 normalHit;
    s16 boostedHit;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_THROAT_SPRAY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_HYPER_VOICE); }
        TURN { MOVE(player, MOVE_HYPER_VOICE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, player);
        HP_BAR(opponent, captureDamage: &normalHit);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, player);
        HP_BAR(opponent, captureDamage: &boostedHit);
    } THEN {
        EXPECT_MUL_EQ(normalHit, Q_4_12(1.5), boostedHit);
    }
}

SINGLE_BATTLE_TEST("Throat Spray activates when a sound move is used")
{
    u32 move;

    PARAMETRIZE { move = MOVE_SWIFT; }
    PARAMETRIZE { move = MOVE_HYPER_VOICE; }

    GIVEN {
        ASSUME(IsSoundMove(MOVE_SWIFT) != IsSoundMove(MOVE_HYPER_VOICE));
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_THROAT_SPRAY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        if (move == MOVE_HYPER_VOICE)
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        else
            NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
    }
}

SINGLE_BATTLE_TEST("Throat Spray does not activate if move fails")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_THROAT_SPRAY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_PROTECT); MOVE(player, MOVE_HYPER_VOICE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PROTECT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        }
    }
}

SINGLE_BATTLE_TEST("Throat Spray does not activate if user flinches")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_THROAT_SPRAY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FAKE_OUT); MOVE(player, MOVE_HYPER_VOICE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FAKE_OUT, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
        }
    }
}

SINGLE_BATTLE_TEST("Throat Spray is not blocked by Sheer Force")
{
    GIVEN {
        PLAYER(SPECIES_NIDOKING) { Ability(ABILITY_SHEER_FORCE); Item(ITEM_THROAT_SPRAY); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_BUG_BUZZ); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BUG_BUZZ, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
    }
}
