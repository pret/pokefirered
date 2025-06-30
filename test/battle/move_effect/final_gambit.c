#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_FINAL_GAMBIT) == EFFECT_FINAL_GAMBIT);
}

SINGLE_BATTLE_TEST("Final Gambit faints user and target")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_FINAL_GAMBIT); SEND_OUT(player, 1); SEND_OUT(opponent, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FINAL_GAMBIT, player);
        HP_BAR(opponent);
        HP_BAR(player);
    } THEN {
        EXPECT_EQ(GetMonData(&gPlayerParty[0], MON_DATA_HP), 0);
        EXPECT_EQ(GetMonData(&gEnemyParty[0], MON_DATA_HP), 0);
    }
}

SINGLE_BATTLE_TEST("Final Gambit does not faint user if target protects")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_PROTECT); MOVE(player, MOVE_FINAL_GAMBIT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PROTECT, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FINAL_GAMBIT, player);
    } THEN {
        EXPECT_NE(GetMonData(&gPlayerParty[0], MON_DATA_HP), 0);
        EXPECT_NE(GetMonData(&gEnemyParty[0], MON_DATA_HP), 0);
    }
}

SINGLE_BATTLE_TEST("Final Gambit does not faint user if attacker fails to attack")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CONFUSE_RAY) == EFFECT_CONFUSE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_CONFUSE_RAY); MOVE(player, MOVE_FINAL_GAMBIT); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CONFUSE_RAY, opponent);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FINAL_GAMBIT, player);
    } THEN {
        EXPECT_NE(GetMonData(&gPlayerParty[0], MON_DATA_HP), 0);
        EXPECT_NE(GetMonData(&gEnemyParty[0], MON_DATA_HP), 0);
    }
}

SINGLE_BATTLE_TEST("Final Gambit does not faint user if target is immune")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GASTLY);
    } WHEN {
        TURN { MOVE(player, MOVE_FINAL_GAMBIT); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FINAL_GAMBIT, player);
    } THEN {
        EXPECT_NE(GetMonData(&gPlayerParty[0], MON_DATA_HP), 0);
        EXPECT_NE(GetMonData(&gEnemyParty[0], MON_DATA_HP), 0);
    }
}
