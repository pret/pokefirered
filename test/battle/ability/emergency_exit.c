#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Emergency Exit switches out when taking 50% max-hp damage")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(262); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG); SEND_OUT(opponent, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUPER_FANG, player);
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit does not switch out when going below 50% max-HP but healed via held item back above the threshold")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET)
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(262); Item(ITEM_SITRUS_BERRY); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUPER_FANG, player);
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
        NOT ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit switches out when going below 50% max-HP but healing via held item is not enough to go back above the threshold")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET)
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(133); Item(ITEM_ORAN_BERRY); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG); SEND_OUT(opponent, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUPER_FANG, player);
        HP_BAR(opponent);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

DOUBLE_BATTLE_TEST("Only the fastest Wimp Out (Emergency Exit) user switches out")
{
    GIVEN {
        PLAYER(SPECIES_ZAPDOS) { Speed(10); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(10); }
        OPPONENT(SPECIES_WIMPOD) { Speed(1); Ability(ABILITY_WIMP_OUT); Item(ITEM_FOCUS_SASH); };
        OPPONENT(SPECIES_WIMPOD) { Speed(2); Ability(ABILITY_WIMP_OUT); Item(ITEM_FOCUS_SASH); };
        OPPONENT(SPECIES_WOBBUFFET) { Speed(10); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(10); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_HYPER_VOICE); SEND_OUT(opponentRight, 2); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HYPER_VOICE, playerLeft);
        HP_BAR(opponentLeft);
        HP_BAR(opponentRight);
        ABILITY_POPUP(opponentRight, ABILITY_WIMP_OUT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit activates when taking residual damage and falling under 50% max-hp - Burn")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(134); Status1(STATUS1_BURN); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { SEND_OUT(opponent, 1); }
    } SCENE {
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit activates when healing from under 50% max-hp and taking residual damage to under 50% max-hp - Burn")
{
    // Might fail if users set healing higher than burn damage
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AQUA_RING) == EFFECT_AQUA_RING);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(130); Status1(STATUS1_BURN); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_AQUA_RING); SEND_OUT(opponent, 1); }
    } SCENE {
        HP_BAR(opponent);
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit activates when taking residual damage and falling under 50% max-hp - Weather")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(134); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SANDSTORM); SEND_OUT(opponent, 1); }
    } SCENE {
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit activates when healing from under 50% max-hp and taking residual damage to under 50% max-hp - Sticky Barb")
{
    // Might fail if users set healing higher than sticky barb damage
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_AQUA_RING) == EFFECT_AQUA_RING);
        ASSUME(GetItemHoldEffect(ITEM_STICKY_BARB) == HOLD_EFFECT_STICKY_BARB);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(130); Item(ITEM_STICKY_BARB); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_AQUA_RING); SEND_OUT(opponent, 1); }
    } SCENE {
        HP_BAR(opponent);
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

SINGLE_BATTLE_TEST("Emergency Exit activates when taking residual damage and falling under 50% max-hp - Salt Cure")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(160); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SALT_CURE); SEND_OUT(opponent, 1); }
    } SCENE {
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    }
}

WILD_BATTLE_TEST("Emergency Exit makes the pokemon flee during wild battle")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(262); };
    } WHEN {
        TURN { MOVE(player, MOVE_SUPER_FANG);}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUPER_FANG, player);
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    } THEN {
        EXPECT_EQ(gBattleOutcome, B_OUTCOME_MON_TELEPORTED);
    }
}

WILD_BATTLE_TEST("Emergency Exit activates when taking residual damage and falling under 50% max-hp (wild battle)")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(134); Status1(STATUS1_BURN); };
    } WHEN {
        TURN { }
    } SCENE {
        HP_BAR(opponent);
        ABILITY_POPUP(opponent, ABILITY_EMERGENCY_EXIT);
    } THEN {
        EXPECT_EQ(gBattleOutcome, B_OUTCOME_MON_TELEPORTED);
    }
}

WILD_BATTLE_TEST("Emergency Exit makes the player ran during wild battle")
{
    GIVEN {
        PLAYER(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(262); };
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUPER_FANG);}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUPER_FANG, opponent);
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_EMERGENCY_EXIT);
    } THEN {
        EXPECT_EQ(gBattleOutcome, B_OUTCOME_PLAYER_TELEPORTED);
    }
}

WILD_BATTLE_TEST("Emergency Exit activates when taking residual damage and falling under 50% max-hp (wild battle player side)")
{
    GIVEN {
        PLAYER(SPECIES_GOLISOPOD) { Ability(ABILITY_EMERGENCY_EXIT); MaxHP(263); HP(134); };
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SANDSTORM);}
    } SCENE {
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_EMERGENCY_EXIT);
    } THEN {
        EXPECT_EQ(gBattleOutcome, B_OUTCOME_PLAYER_TELEPORTED);
    }
}
