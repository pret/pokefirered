#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_SCREECH) == EFFECT_DEFENSE_DOWN_2);
}

SINGLE_BATTLE_TEST("Screech lowers Defense by 2 stages", s16 damage)
{
    bool32 lowerDefense;
    PARAMETRIZE { lowerDefense = FALSE; }
    PARAMETRIZE { lowerDefense = TRUE; }
    GIVEN {
        ASSUME(GetMoveCategory(MOVE_TACKLE) == DAMAGE_CATEGORY_PHYSICAL);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        if (lowerDefense) TURN { MOVE(player, MOVE_SCREECH); }
        TURN { MOVE(player, MOVE_TACKLE); }
    } SCENE {
        if (lowerDefense) {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SCREECH, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
            MESSAGE("The opposing Wobbuffet's Defense harshly fell!");
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_MUL_EQ(results[0].damage, Q_4_12(2.0), results[1].damage);
    }
}
