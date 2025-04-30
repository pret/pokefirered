#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Spectral Thief steals opponents boost before attacking", s16 damage)
{
    u32 move;
    PARAMETRIZE { move = MOVE_CELEBRATE; }
    PARAMETRIZE { move = MOVE_SWORDS_DANCE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SWORDS_DANCE) == EFFECT_ATTACK_UP_2);
        ASSUME(GetMoveEffect(MOVE_SPECTRAL_THIEF) == EFFECT_SPECTRAL_THIEF);
        PLAYER(SPECIES_REGIROCK);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (move == MOVE_CELEBRATE)
            TURN { MOVE(player, move); MOVE(opponent, MOVE_SPECTRAL_THIEF); }
        else
            TURN { MOVE(player, move); MOVE(opponent, MOVE_SPECTRAL_THIEF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        MESSAGE("The opposing Wobbuffet used Spectral Thief!");
        if (move == MOVE_SWORDS_DANCE)
            MESSAGE("The opposing Wobbuffet stole the target's boosted stats!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPECTRAL_THIEF, opponent);
        HP_BAR(player, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(2.0), results[1].damage);
    }
}

SINGLE_BATTLE_TEST("Spectral Thief can't steal opponent's boost if target is immune")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SWORDS_DANCE) == EFFECT_ATTACK_UP_2);
        ASSUME(GetMoveEffect(MOVE_SPECTRAL_THIEF) == EFFECT_SPECTRAL_THIEF);
        PLAYER(SPECIES_MEOWTH);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
            TURN { MOVE(player, MOVE_SWORDS_DANCE); MOVE(opponent, MOVE_SPECTRAL_THIEF); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SWORDS_DANCE, player);
        MESSAGE("The opposing Wobbuffet used Spectral Thief!");
        NONE_OF {
            MESSAGE("The opposing Wobbuffet stole the target's boosted stats!");
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SPECTRAL_THIEF, opponent);
        }
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE + 2);
        EXPECT_EQ(opponent->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
    }
}
