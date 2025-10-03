#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("TODO: Write No Retreat (Move Effect) test titles")

SINGLE_BATTLE_TEST("No Retreat raises user's Atk/Def/Sp.Atk/Sp.Def/Speed unless No Retreat was already used by user")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_NO_RETREAT); }
        TURN { MOVE(player, MOVE_NO_RETREAT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_NO_RETREAT, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_NO_RETREAT, player);
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(player->statStages[STAT_SPDEF], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(player->statStages[STAT_SPEED], DEFAULT_STAT_STAGE + 1);
        bool32 escapePrevention = gBattleMons[0].volatiles.escapePrevention;
        EXPECT_EQ(escapePrevention, TRUE);
    }
}

// Question: If No Retreat is used is the mon blocking the switch out changed?
SINGLE_BATTLE_TEST("No Retreat won't fail if user is prevented from escaping")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_MEAN_LOOK);  MOVE(player, MOVE_NO_RETREAT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MEAN_LOOK, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_NO_RETREAT, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    }
}

SINGLE_BATTLE_TEST("No Retreat won't activate Protean if it fails due to already being used by the user")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_KECLEON) { Ability(ABILITY_PROTEAN); }
    } WHEN {
        TURN { MOVE(player, MOVE_NO_RETREAT); MOVE(opponent, MOVE_SKILL_SWAP); }
        TURN { MOVE(player, MOVE_NO_RETREAT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_NO_RETREAT, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_NO_RETREAT, player);
            ABILITY_POPUP(player, ABILITY_PROTEAN);
        }
    }
}
