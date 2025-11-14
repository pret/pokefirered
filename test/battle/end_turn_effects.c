#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("End Turn Effects: First Event Block is executed correctly (double battle)")
{
    s16 healed;
    s16 damage;

    GIVEN {
        PLAYER(SPECIES_WYNAUT) { HP(100); Speed(1); }
        PLAYER(SPECIES_EKANS) { HP(100); Ability(ABILITY_SHED_SKIN); Status1(STATUS1_BURN); Speed(2); }
        OPPONENT(SPECIES_WYNAUT) { HP(100); Item(ITEM_LEFTOVERS); Speed(3); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(100); Item(ITEM_BLACK_SLUDGE); Speed(4); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_GRASSY_TERRAIN); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet is healed by the grassy terrain!");
        HP_BAR(opponentRight, captureDamage: &healed);
        HP_BAR(opponentRight, captureDamage: &damage);
        MESSAGE("The opposing Wobbuffet was hurt by the Black Sludge!");
        MESSAGE("The opposing Wynaut is healed by the grassy terrain!");
        MESSAGE("The opposing Wynaut restored a little HP using its Leftovers!");
        MESSAGE("Ekans is healed by the grassy terrain!");
        MESSAGE("Ekans's Shed Skin cured its burn problem!");
        MESSAGE("Wynaut is healed by the grassy terrain!");
    } THEN {
        EXPECT_GT(0, healed);
        EXPECT_GT(damage, 0);
    }
}


MULTI_BATTLE_TEST("End Turn Effects: First Event Block is executed correctly (multibattle)")
{
    s16 healed;
    s16 damage;

    GIVEN {
        MULTI_PLAYER(SPECIES_WYNAUT) { HP(100); Speed(1); }
        MULTI_PARTNER(SPECIES_EKANS) { HP(100); Ability(ABILITY_SHED_SKIN); Status1(STATUS1_BURN); Speed(2); }
        MULTI_OPPONENT_A(SPECIES_WYNAUT) { HP(100); Item(ITEM_LEFTOVERS); Speed(3); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { HP(100); Item(ITEM_BLACK_SLUDGE); Speed(4); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_GRASSY_TERRAIN); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet is healed by the grassy terrain!");
        HP_BAR(opponentRight, captureDamage: &healed);
        HP_BAR(opponentRight, captureDamage: &damage);
        MESSAGE("The opposing Wobbuffet was hurt by the Black Sludge!");
        MESSAGE("The opposing Wynaut is healed by the grassy terrain!");
        MESSAGE("The opposing Wynaut restored a little HP using its Leftovers!");
        MESSAGE("Ekans is healed by the grassy terrain!");
        MESSAGE("Ekans's Shed Skin cured its burn problem!");
        MESSAGE("Wynaut is healed by the grassy terrain!");
    } THEN {
        EXPECT_GT(0, healed);
        EXPECT_GT(damage, 0);
    }
}


TWO_VS_ONE_BATTLE_TEST("End Turn Effects: First Event Block is executed correctly (2v1)")
{
    s16 healed;
    s16 damage;

    GIVEN {
        MULTI_PLAYER(SPECIES_WYNAUT) { HP(100); Speed(1);}
        MULTI_PARTNER(SPECIES_EKANS) { HP(100); Ability(ABILITY_SHED_SKIN); Status1(STATUS1_BURN); Speed(2); }
        MULTI_OPPONENT_A(SPECIES_WYNAUT) { HP(100); Item(ITEM_LEFTOVERS); Speed(3); }
        MULTI_OPPONENT_A(SPECIES_WOBBUFFET) { HP(100); Item(ITEM_BLACK_SLUDGE); Speed(4); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_GRASSY_TERRAIN); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet is healed by the grassy terrain!");
        HP_BAR(opponentRight, captureDamage: &healed);
        HP_BAR(opponentRight, captureDamage: &damage);
        MESSAGE("The opposing Wobbuffet was hurt by the Black Sludge!");
        MESSAGE("The opposing Wynaut is healed by the grassy terrain!");
        MESSAGE("The opposing Wynaut restored a little HP using its Leftovers!");
        MESSAGE("Ekans is healed by the grassy terrain!");
        MESSAGE("Ekans's Shed Skin cured its burn problem!");
        MESSAGE("Wynaut is healed by the grassy terrain!");
    } THEN {
        EXPECT_GT(0, healed);
        EXPECT_GT(damage, 0);
    }
}


ONE_VS_TWO_BATTLE_TEST("End Turn Effects: First Event Block is executed correctly (1v2)")
{
    s16 healed;
    s16 damage;

    GIVEN {
        MULTI_PLAYER(SPECIES_WYNAUT) { HP(100); Speed(1);}
        MULTI_PLAYER(SPECIES_EKANS) { HP(100); Ability(ABILITY_SHED_SKIN); Status1(STATUS1_BURN); Speed(2); }
        MULTI_OPPONENT_A(SPECIES_WYNAUT) { HP(100); Item(ITEM_LEFTOVERS); Speed(3); }
        MULTI_OPPONENT_B(SPECIES_WOBBUFFET) { HP(100); Item(ITEM_BLACK_SLUDGE); Speed(4); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_GRASSY_TERRAIN); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet is healed by the grassy terrain!");
        HP_BAR(opponentRight, captureDamage: &healed);
        HP_BAR(opponentRight, captureDamage: &damage);
        MESSAGE("The opposing Wobbuffet was hurt by the Black Sludge!");
        MESSAGE("The opposing Wynaut is healed by the grassy terrain!");
        MESSAGE("The opposing Wynaut restored a little HP using its Leftovers!");
        MESSAGE("Ekans is healed by the grassy terrain!");
        MESSAGE("Ekans's Shed Skin cured its burn problem!");
        MESSAGE("Wynaut is healed by the grassy terrain!");
    } THEN {
        EXPECT_GT(0, healed);
        EXPECT_GT(damage, 0);
    }
}

