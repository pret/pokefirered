#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"

AI_MULTI_BATTLE_TEST("AI will only explode and kill everything on the field with Risky or Will Suicide (multi)")
{
    ASSUME(GetMoveTarget(MOVE_EXPLOSION) == TARGET_FOES_AND_ALLY);
    ASSUME(IsExplosionMove(MOVE_EXPLOSION));

    u32 aiFlags;
    enum BattlerId battler;

    PARAMETRIZE { aiFlags = 0; battler = 1; }
    PARAMETRIZE { aiFlags = 0; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 3; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(battler, aiFlags);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_OPPONENT_A(SPECIES_ELECTRODE) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
        MULTI_OPPONENT_B(SPECIES_VOLTORB) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
    } WHEN {
        if (aiFlags == 0)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_ELECTRO_BALL, target: playerLeft); }
        else
            TURN { EXPECT_MOVE(&gBattleMons[BATTLE_PARTNER(battler)], MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(&gBattleMons[battler], MOVE_EXPLOSION); }
    }
}

AI_ONE_VS_TWO_BATTLE_TEST("AI will only explode and kill everything on the field with Risky or Will Suicide (1v2)")
{
    ASSUME(GetMoveTarget(MOVE_EXPLOSION) == TARGET_FOES_AND_ALLY);
    ASSUME(IsExplosionMove(MOVE_EXPLOSION));

    u32 aiFlags;
    enum BattlerId battler;

    PARAMETRIZE { aiFlags = 0; battler = 1; }
    PARAMETRIZE { aiFlags = 0; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 3; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(battler, aiFlags);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_OPPONENT_A(SPECIES_ELECTRODE) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
        MULTI_OPPONENT_B(SPECIES_VOLTORB) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
    } WHEN {
        if (aiFlags == 0)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_ELECTRO_BALL, target: playerLeft); }
        else
            TURN { EXPECT_MOVE(&gBattleMons[BATTLE_PARTNER(battler)], MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(&gBattleMons[battler], MOVE_EXPLOSION); }
    }
}

// Used to test EXPECT_MOVE only on partner
AI_MULTI_BATTLE_TEST("AI partner makes sensible move selections in battle (multi)")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        MULTI_PLAYER(SPECIES_HAUNTER);
        MULTI_PLAYER(SPECIES_RATTATA);
        // No moves to damage opponents.
        MULTI_PARTNER(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL, MOVE_AURA_SPHERE); }
        MULTI_OPPONENT_A(SPECIES_RATTATA) { Moves(MOVE_CELEBRATE); HP(1); }
        MULTI_OPPONENT_B(SPECIES_KANGASKHAN) { Moves(MOVE_CELEBRATE); }

    } WHEN {
        TURN { MOVE(playerLeft, MOVE_AURA_SPHERE, target:opponentRight); EXPECT_MOVE(playerRight, MOVE_AURA_SPHERE, target:opponentLeft); }
    }
}

// Used to test EXPECT_MOVE only on partner
AI_TWO_VS_ONE_BATTLE_TEST("AI partner makes sensible move selections in battle (2v1)")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        MULTI_PLAYER(SPECIES_HAUNTER);
        MULTI_PLAYER(SPECIES_RATTATA);
        // No moves to damage opponents.
        MULTI_PARTNER(SPECIES_GENGAR) { Moves(MOVE_SHADOW_BALL, MOVE_AURA_SPHERE); }
        MULTI_OPPONENT_A(SPECIES_RATTATA) { Moves(MOVE_CELEBRATE); HP(1); }
        MULTI_OPPONENT_A(SPECIES_KANGASKHAN) { Moves(MOVE_CELEBRATE); }

    } WHEN {
        TURN { MOVE(playerLeft, MOVE_AURA_SPHERE, target:opponentRight); EXPECT_MOVE(playerRight, MOVE_AURA_SPHERE, target:opponentLeft); }
    }
}

AI_TWO_VS_ONE_BATTLE_TEST("Battler 3 has Battler 1 AI flags set correctly (2v1)")
{
    ASSUME(GetMoveTarget(MOVE_EXPLOSION) == TARGET_FOES_AND_ALLY);
    ASSUME(IsExplosionMove(MOVE_EXPLOSION));

    u32 aiFlags;
    enum BattlerId battler;

    PARAMETRIZE { aiFlags = 0; battler = 1; }
    PARAMETRIZE { aiFlags = 0; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_RISKY; battler = 3; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 1; }
    PARAMETRIZE { aiFlags = AI_FLAG_WILL_SUICIDE; battler = 3; }

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(battler, aiFlags);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { HP(1); }
        MULTI_OPPONENT_A(SPECIES_VOLTORB) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
        MULTI_OPPONENT_A(SPECIES_ELECTRODE) { Moves(MOVE_EXPLOSION, MOVE_ELECTRO_BALL); HP(1); }
    } WHEN {
        if (aiFlags == 0 || battler == 3)
            TURN { EXPECT_MOVE(opponentLeft, MOVE_ELECTRO_BALL, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_ELECTRO_BALL, target: playerLeft); }
        else
            TURN { EXPECT_MOVE(opponentLeft, MOVE_EXPLOSION, target: playerLeft); EXPECT_MOVE(opponentRight, MOVE_EXPLOSION); }
    }
}

AI_MULTI_BATTLE_TEST("Partner will not steal your pokemon when running out")
{

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PARTNER(SPECIES_WYNAUT) { Moves(MOVE_MEMENTO); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(playerRight, MOVE_MEMENTO, target:opponentLeft); }
        TURN {}
    } THEN {
        EXPECT_EQ(gAbsentBattlerFlags, (1u << GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)));
    }
}

AI_MULTI_BATTLE_TEST("Partner will not steal your pokemon to delay using their ace")
{

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(B_POSITION_PLAYER_RIGHT, AI_FLAG_ACE_POKEMON);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PARTNER(SPECIES_WYNAUT) { Moves(MOVE_MEMENTO); }
        MULTI_PARTNER(SPECIES_METAGROSS) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { EXPECT_MOVE(playerRight, MOVE_MEMENTO, target:opponentLeft); }
        TURN {}
    } THEN {
        EXPECT_EQ(SPECIES_METAGROSS, playerRight->species);
    }
}

AI_MULTI_BATTLE_TEST("AI opponents do not steal their partner pokemon in multi battle to delay using their ace")
{

    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(B_POSITION_OPPONENT_LEFT, AI_FLAG_ACE_POKEMON);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); HP(1); }
        MULTI_OPPONENT_A(SPECIES_VENUSAUR) { Moves(MOVE_GIGA_DRAIN); }
        MULTI_OPPONENT_B(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft); }
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft); }
    } THEN {
        EXPECT_EQ(SPECIES_VENUSAUR, opponentLeft->species);
    }
}

AI_MULTI_BATTLE_TEST("AI opponents do not steal their partner pokemon in multi battle when forced out")
{
    enum Item item;
    enum Move move;
    PARAMETRIZE { item = ITEM_EJECT_BUTTON; move = MOVE_TACKLE; }
    PARAMETRIZE { item = ITEM_EJECT_PACK; move = MOVE_TAIL_WHIP; }
    PARAMETRIZE { item = ITEM_NONE; move = MOVE_ROAR; }
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(B_POSITION_OPPONENT_LEFT, AI_FLAG_ACE_POKEMON);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Moves(MOVE_CELEBRATE); Item(item); }
        MULTI_OPPONENT_A(SPECIES_VENUSAUR) { Moves(MOVE_GIGA_DRAIN); }
        MULTI_OPPONENT_B(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, move, target: opponentLeft); }
    } THEN {
        EXPECT_EQ(SPECIES_VENUSAUR, opponentLeft->species);
    }
}

AI_MULTI_BATTLE_TEST("AI opponents do not steal their partner pokemon in multi battle when forced out 2")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        BATTLER_AI_FLAGS(B_POSITION_OPPONENT_LEFT, AI_FLAG_ACE_POKEMON);
        MULTI_PLAYER(SPECIES_WOBBUFFET) { }
        MULTI_PARTNER(SPECIES_WOBBUFFET) { }
        MULTI_OPPONENT_A(SPECIES_GOLISOPOD) { Moves(MOVE_CELEBRATE); HP(101); MaxHP(200); Ability(ABILITY_EMERGENCY_EXIT); }
        MULTI_OPPONENT_A(SPECIES_VENUSAUR) { Moves(MOVE_GIGA_DRAIN); }
        MULTI_OPPONENT_B(SPECIES_WYNAUT) { Moves(MOVE_CELEBRATE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_TACKLE, target: opponentLeft); }
    } THEN {
        EXPECT_EQ(SPECIES_VENUSAUR, opponentLeft->species);
    }
}

AI_MULTI_BATTLE_TEST("Pollen Puff: AI correctly scores moves with EFFECT_HIT_ENEMY_HEAL_ALLY as damaging opponents but not allies")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        ASSUME(GetMoveEffect(MOVE_POLLEN_PUFF) == EFFECT_HIT_ENEMY_HEAL_ALLY);
        // Speed tie so all think they are faster
        MULTI_PLAYER(SPECIES_WOBBUFFET)     { Speed(1); HP(50); Moves(MOVE_POLLEN_PUFF, MOVE_CELEBRATE); }
        MULTI_PARTNER(SPECIES_WOBBUFFET)    { Speed(1); HP(50); Moves(MOVE_POLLEN_PUFF);                 }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { Speed(1); HP(50); Moves(MOVE_POLLEN_PUFF);                 }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { Speed(1); HP(50); Moves(MOVE_POLLEN_PUFF);                 }
    } WHEN {
        TURN {
            // Targeting ally
            SCORE_EQ_VAL(opponentLeft,  MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + WEAK_EFFECT, target:opponentRight);
            SCORE_EQ_VAL(playerRight,   MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + WEAK_EFFECT, target:playerLeft);
            SCORE_EQ_VAL(opponentRight, MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + WEAK_EFFECT, target:opponentLeft);

            // Targeting opponent
            SCORE_EQ_VAL(opponentLeft,  MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:playerLeft);
            SCORE_EQ_VAL(opponentLeft,  MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:playerRight);
            SCORE_EQ_VAL(playerRight,   MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:opponentLeft);
            SCORE_EQ_VAL(playerRight,   MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:opponentRight);
            SCORE_EQ_VAL(opponentRight, MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:playerLeft);
            SCORE_EQ_VAL(opponentRight, MOVE_POLLEN_PUFF, AI_SCORE_DEFAULT + BEST_DAMAGE_MOVE + FAST_KILL, target:playerRight);
        }
    }
}
