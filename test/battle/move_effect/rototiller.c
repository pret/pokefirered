#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_ROTOTILLER) == EFFECT_ROTOTILLER);
}

DOUBLE_BATTLE_TEST("Rototiller boosts Attack and Special Attack of all Grass types on the field")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_TANGELA, 0) == TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_SNIVY, 0) == TYPE_GRASS);
        PLAYER(SPECIES_TANGELA);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_SNIVY);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerRight, MOVE_ROTOTILLER); MOVE(playerLeft, MOVE_CELEBRATE); MOVE(opponentLeft, MOVE_CELEBRATE); MOVE(opponentRight, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROTOTILLER, playerRight);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentRight);
    } THEN {
        EXPECT_EQ(playerLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(playerLeft->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(opponentLeft->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(opponentLeft->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(playerRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(playerRight->statStages[STAT_SPATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponentRight->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponentRight->statStages[STAT_SPATK], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Rototiller fails if there are no valid targets")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) != TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 1) != TYPE_GRASS);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_ROTOTILLER); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ROTOTILLER, player);
        MESSAGE("Wobbuffet used Rototiller!");
        MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Rototiller doesn't affect Pokémon that are semi-invulnerable")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_TANGELA, 0) == TYPE_GRASS);
        ASSUME(GetMoveEffect(MOVE_DIG) == EFFECT_SEMI_INVULNERABLE);
        PLAYER(SPECIES_TANGELA);
        OPPONENT(SPECIES_TANGELA);
    } WHEN {
        TURN { MOVE(opponent, MOVE_DIG); MOVE(player, MOVE_ROTOTILLER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DIG, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ROTOTILLER, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("It won't have any effect on the opposing Tangela!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE + 1);
        EXPECT_EQ(opponent->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_SPATK], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Rototiller fails if the only valid target is semi-invulnerable")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_TANGELA, 0) == TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) != TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 1) != TYPE_GRASS);
        ASSUME(GetMoveEffect(MOVE_DIG) == EFFECT_SEMI_INVULNERABLE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_TANGELA);
    } WHEN {
        TURN { MOVE(opponent, MOVE_DIG); MOVE(player, MOVE_ROTOTILLER); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DIG, opponent);
        MESSAGE("Wobbuffet used Rototiller!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_ROTOTILLER, player);
        MESSAGE("But it failed!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(player->statStages[STAT_SPATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_SPATK], DEFAULT_STAT_STAGE);
    }
}

AI_DOUBLE_BATTLE_TEST("AI uses Rototiller")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_TANGELA, 0) == TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 0) != TYPE_GRASS);
        ASSUME(GetSpeciesType(SPECIES_WOBBUFFET, 1) != TYPE_GRASS);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_POUND, MOVE_CELEBRATE); }
        PLAYER(SPECIES_WOBBUFFET) { Moves(MOVE_POUND, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_TANGELA) { Moves(MOVE_ROTOTILLER, MOVE_POUND); }
        OPPONENT(SPECIES_TANGELA);
    } WHEN {
        TURN {  EXPECT_MOVE(opponentLeft, MOVE_ROTOTILLER); }
    }
}
