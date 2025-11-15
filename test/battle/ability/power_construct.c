#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("TODO: Write Power Construct (Ability) test titles")

SINGLE_BATTLE_TEST("Power Construct switches Zygarde's form when HP is below half")
{
    u16 baseSpecies;
    PARAMETRIZE { baseSpecies = SPECIES_ZYGARDE_10_POWER_CONSTRUCT; }
    PARAMETRIZE { baseSpecies = SPECIES_ZYGARDE_50_POWER_CONSTRUCT; }

    GIVEN {
        PLAYER(baseSpecies)
        {
            Ability(ABILITY_POWER_CONSTRUCT);
            HP((GetMonData(&PLAYER_PARTY[0], MON_DATA_MAX_HP) / 2) + 1);
        }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        MESSAGE("You sense the presence of many!");
        ABILITY_POPUP(player, ABILITY_POWER_CONSTRUCT);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_POWER_CONSTRUCT, player);
    } THEN {
        EXPECT_EQ(player->species, SPECIES_ZYGARDE_COMPLETE);
    }
}

WILD_BATTLE_TEST("Power Construct Zygarde reverts to its original form upon catching")
{
    u16 baseSpecies;
    PARAMETRIZE { baseSpecies = SPECIES_ZYGARDE_10_POWER_CONSTRUCT; }
    PARAMETRIZE { baseSpecies = SPECIES_ZYGARDE_50_POWER_CONSTRUCT; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(baseSpecies)
        {
            Ability(ABILITY_POWER_CONSTRUCT);
            HP((GetMonData(&OPPONENT_PARTY[0], MON_DATA_MAX_HP) / 2) + 1);
        }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { USE_ITEM(player, ITEM_MASTER_BALL); }
    } SCENE {
        // Turn 1
        MESSAGE("You sense the presence of many!");
        ABILITY_POPUP(opponent, ABILITY_POWER_CONSTRUCT);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_POWER_CONSTRUCT, opponent);

        // Turn 2
        ANIMATION(ANIM_TYPE_SPECIAL, B_ANIM_BALL_THROW, player);
    } THEN {
        EXPECT_EQ(GetMonData(&gPlayerParty[1], MON_DATA_SPECIES), baseSpecies);
    }
}
