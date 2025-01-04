#include "global.h"
#include "test/battle.h"

#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Transistor increases Electric-type attack / special attack", s16 damage)
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
        ASSUME(GetMoveType(MOVE_TACKLE) != TYPE_ELECTRIC);
        ASSUME(GetMoveType(MOVE_WILD_CHARGE) == TYPE_ELECTRIC);
        ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
        ASSUME(GetMoveCategory(MOVE_WILD_CHARGE) == DAMAGE_CATEGORY_PHYSICAL);
        ASSUME(GetMoveCategory(MOVE_THUNDER_SHOCK) == DAMAGE_CATEGORY_SPECIAL);
        PLAYER(SPECIES_REGIELEKI) { Ability(ability); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, move); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_EQ(results[0].damage, results[1].damage); // Tackle should be unaffected

        EXPECT_LT(results[2].damage, results[3].damage); // cannot test exact factor because ATK / SPATK introduces inaccuracies
        EXPECT_LT(results[4].damage, results[5].damage);
    }
}

SINGLE_BATTLE_TEST("Transistor is blocked by neutralizing gas", s16 damage)
{
    u16 ability;
    PARAMETRIZE { ability = ABILITY_NEUTRALIZING_GAS; }
    PARAMETRIZE { ability = ABILITY_LEVITATE; }

    GIVEN {
        ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
        PLAYER(SPECIES_REGIELEKI) { Ability(ABILITY_TRANSISTOR); }
        OPPONENT(SPECIES_KOFFING) { Ability(ability); }
    } WHEN {
        TURN { MOVE(player, MOVE_THUNDER_SHOCK); }
    } SCENE {
        HP_BAR(opponent, captureDamage: &results[i].damage);
    } FINALLY {
        EXPECT_LT(results[0].damage, results[1].damage); // cannot test exact factor because ATK / SPATK introduces inaccuracies
    }
}
