#include "global.h"
#include "test/battle.h"

#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Transistor increases Electric-type move damage", s16 damage)
{
    u32 move;
    u16 ability;

    PARAMETRIZE { move = MOVE_TACKLE; ability = ABILITY_KLUTZ; }
    PARAMETRIZE { move = MOVE_TACKLE; ability = ABILITY_TRANSISTOR; }
    PARAMETRIZE { move = MOVE_WILD_CHARGE; ability = ABILITY_KLUTZ; }
    PARAMETRIZE { move = MOVE_WILD_CHARGE; ability = ABILITY_TRANSISTOR; }
    PARAMETRIZE { move = MOVE_THUNDER_SHOCK; ability = ABILITY_KLUTZ; }
    PARAMETRIZE { move = MOVE_THUNDER_SHOCK; ability = ABILITY_TRANSISTOR; }

    GIVEN {
        ASSUME(gMovesInfo[MOVE_TACKLE].type != TYPE_ELECTRIC);
        ASSUME(gMovesInfo[MOVE_WILD_CHARGE].type == TYPE_ELECTRIC);
        ASSUME(gMovesInfo[MOVE_THUNDER_SHOCK].type == TYPE_ELECTRIC);
        ASSUME(gMovesInfo[MOVE_WILD_CHARGE].category == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(gMovesInfo[MOVE_THUNDER_SHOCK].category == DAMAGE_CATEGORY_SPECIAL);
        PLAYER(SPECIES_REGIELEKI) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_EQ(results[0].damage, results[1].damage); // Tackle should be unaffected
        if (B_TRANSISTOR_BOOST >= GEN_9)
        {
            EXPECT_MUL_EQ(results[2].damage, Q_4_12(1.3), results[3].damage); // Wild Charge should be affected
            EXPECT_MUL_EQ(results[4].damage, Q_4_12(1.3), results[5].damage); // Thunder Shock should be affected
        }
        else
        {
            EXPECT_MUL_EQ(results[2].damage, Q_4_12(1.5), results[3].damage); // Wild Charge should be affected
            EXPECT_MUL_EQ(results[4].damage, Q_4_12(1.5), results[5].damage); // Thunder Shock should be affected
        }
    }
}

SINGLE_BATTLE_TEST("Transistor boosts Electric type moves by 1.5 in Gen8 and 1.3 in Gen9+", s16 damage)
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }

    GIVEN {
        ASSUME(gMovesInfo[MOVE_THUNDER_SHOCK].type == TYPE_ELECTRIC);
        PLAYER(SPECIES_REGIELEKI) { Ability(ABILITY_TRANSISTOR); }
        OPPONENT(SPECIES_KOFFING) { Ability(ability); }
    } WHEN {
        TURN { MOVE(player, MOVE_THUNDER_SHOCK); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        if (B_TRANSISTOR_BOOST >= GEN_9)
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.3), results[1].damage);
        else
            EXPECT_MUL_EQ(results[0].damage, Q_4_12(1.5), results[1].damage);
    }
}
