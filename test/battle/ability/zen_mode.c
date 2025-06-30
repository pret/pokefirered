#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Zen Mode switches Darmanitan's form when HP is half or less at the end of the turn")
{
    u16 standardSpecies, zenSpecies;
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_STANDARD;          zenSpecies = SPECIES_DARMANITAN_ZEN; }
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_GALAR_STANDARD; zenSpecies = SPECIES_DARMANITAN_GALAR_ZEN; }

    GIVEN {
        ASSUME(GetSpeciesBaseHP(standardSpecies) == 105);
        ASSUME(GetSpeciesBaseHP(zenSpecies) == 105);
        PLAYER(standardSpecies)
        {
            Ability(ABILITY_ZEN_MODE);
            HP((GetMonData(&PLAYER_PARTY[0], MON_DATA_MAX_HP) / 2) + 1);
        }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
            TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        MESSAGE("Darmanitan used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Scratch!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_ZEN_MODE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_FORM_CHANGE, player);
    } THEN {
        ASSUME(player->hp <= player->maxHP / 2);
        EXPECT_EQ(player->species, zenSpecies);
    }
}

SINGLE_BATTLE_TEST("Zen Mode switches Darmanitan's form when HP is half or less before the first turn")
{
    u16 standardSpecies, zenSpecies;
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_STANDARD;          zenSpecies = SPECIES_DARMANITAN_ZEN; }
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_GALAR_STANDARD; zenSpecies = SPECIES_DARMANITAN_GALAR_ZEN; }

    GIVEN {
        ASSUME(GetSpeciesBaseHP(standardSpecies) == 105);
        ASSUME(GetSpeciesBaseHP(zenSpecies) == 105);
        PLAYER(standardSpecies)
        {
            Ability(ABILITY_ZEN_MODE);
            HP(GetMonData(&PLAYER_PARTY[0], MON_DATA_MAX_HP) / 2);
        }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_CELEBRATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_ZEN_MODE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_FORM_CHANGE, player);
        MESSAGE("Darmanitan used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Celebrate!");
    } THEN {
        EXPECT_LE(player->hp, player->maxHP / 2);
        EXPECT_EQ(player->species, zenSpecies);
    }
}

SINGLE_BATTLE_TEST("Zen Mode switches Darmanitan's form when HP is healed above half")
{
    u16 standardSpecies, zenSpecies;
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_STANDARD;          zenSpecies = SPECIES_DARMANITAN_ZEN; }
    PARAMETRIZE { standardSpecies = SPECIES_DARMANITAN_GALAR_STANDARD;    zenSpecies = SPECIES_DARMANITAN_GALAR_ZEN; }

    GIVEN {
        ASSUME(GetSpeciesBaseHP(standardSpecies) == 105);
        ASSUME(GetSpeciesBaseHP(zenSpecies) == 105);
        PLAYER(standardSpecies)
        {
            Ability(ABILITY_ZEN_MODE);
            HP(GetMonData(&PLAYER_PARTY[0], MON_DATA_MAX_HP) / 2);
        }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_HEAL_PULSE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_ZEN_MODE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_FORM_CHANGE, player);
        MESSAGE("Darmanitan used Celebrate!");
        MESSAGE("The opposing Wobbuffet used Heal Pulse!");
        HP_BAR(player);
        ABILITY_POPUP(player, ABILITY_ZEN_MODE);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_FORM_CHANGE, player);
    } THEN {
        EXPECT_GT(player->hp, player->maxHP / 2);
        EXPECT_EQ(player->species, standardSpecies);
    }
}
