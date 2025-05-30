#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveCategory(MOVE_SCRATCH) == DAMAGE_CATEGORY_PHYSICAL);
    ASSUME(GetMoveCategory(MOVE_ROUND) == DAMAGE_CATEGORY_SPECIAL);
}

SINGLE_BATTLE_TEST("Protosynthesis boosts the highest stat")
{
    GIVEN {
        PLAYER(SPECIES_WALKING_WAKE) { Ability(ABILITY_PROTOSYNTHESIS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SUNNY_DAY); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUNNY_DAY, player);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        MESSAGE("The harsh sunlight activated Walking Wake's Protosynthesis!");
        MESSAGE("Walking Wake's Sp. Atk was heightened!");
    }
}

SINGLE_BATTLE_TEST("Protosynthesis boosts either Attack or Special Attack, not both")
{
    u16 species;
    u32 move;
    s16 damage[2];

    PARAMETRIZE { species = SPECIES_ROARING_MOON; move = MOVE_SCRATCH; }
    PARAMETRIZE { species = SPECIES_ROARING_MOON; move = MOVE_ROUND; }

    PARAMETRIZE { species = SPECIES_WALKING_WAKE; move = MOVE_SCRATCH; }
    PARAMETRIZE { species = SPECIES_WALKING_WAKE; move = MOVE_ROUND; }

    GIVEN {
        PLAYER(species) { Ability(ABILITY_PROTOSYNTHESIS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, move); }
        TURN { MOVE(opponent, MOVE_SUNNY_DAY); MOVE(player, move); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        HP_BAR(opponent, captureDamage: &damage[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUNNY_DAY, opponent);
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        HP_BAR(opponent, captureDamage: &damage[1]);
    } THEN {
        if ((move == MOVE_SCRATCH && species == SPECIES_ROARING_MOON) || (move == MOVE_ROUND && species == SPECIES_WALKING_WAKE))
            EXPECT_MUL_EQ(damage[0], Q_4_12(1.3), damage[1]);
        else
            EXPECT_EQ(damage[0], damage[1]);
    }
}

SINGLE_BATTLE_TEST("Protosynthesis ability pop up activates only once during the duration of sunny day")
{
    u16 turns;

    GIVEN {
        PLAYER(SPECIES_WALKING_WAKE) { Ability(ABILITY_PROTOSYNTHESIS); }
        OPPONENT(SPECIES_NINETALES) { Ability(ABILITY_DROUGHT); };
    } WHEN {
        for (turns = 0; turns < 5; turns++)
            TURN {}
        TURN { MOVE(opponent, MOVE_SUNNY_DAY); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        MESSAGE("The harsh sunlight activated Walking Wake's Protosynthesis!");
        MESSAGE("Walking Wake's Sp. Atk was heightened!");
        NONE_OF {
            for (turns = 0; turns < 4; turns++) {
                ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
                MESSAGE("The harsh sunlight activated Walking Wake's Protosynthesis!");
                MESSAGE("Walking Wake's Sp. Atk was heightened!");
            }
        }
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUNNY_DAY, opponent);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        MESSAGE("The harsh sunlight activated Walking Wake's Protosynthesis!");
        MESSAGE("Walking Wake's Sp. Atk was heightened!");
    }
}

SINGLE_BATTLE_TEST("Protosynthesis activates on switch-in")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_ROARING_MOON) { Ability(ABILITY_PROTOSYNTHESIS); }
        OPPONENT(SPECIES_NINETALES) { Ability(ABILITY_DROUGHT); };
    } WHEN {
        TURN { SWITCH(player, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        MESSAGE("The harsh sunlight activated Roaring Moon's Protosynthesis!");
        MESSAGE("Roaring Moon's Attack was heightened!");
    }
}

SINGLE_BATTLE_TEST("Protosynthesis prioritizes stats in the case of a tie in the following order: Atk, Def, Sp.Atk, Sp.Def, Speed")
{
    u8 stats[] = {1, 1, 1, 1, 1};

    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; stats[1] = 255; stats[0] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; stats[1] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; stats[2] = 255; }
    PARAMETRIZE { stats[4] = 255; stats[3] = 255; }
    GIVEN {
        PLAYER(SPECIES_GREAT_TUSK) { Ability(ABILITY_PROTOSYNTHESIS); Attack(stats[0]); Defense(stats[1]); SpAttack(stats[2]); SpDefense(stats[3]); Speed(stats[4]); }
        OPPONENT(SPECIES_GROUDON) { Ability(ABILITY_DROUGHT); Speed(5); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        switch(i) {
            case 0:
                MESSAGE("Great Tusk's Attack was heightened!");
                break;
            case 1:
                MESSAGE("Great Tusk's Defense was heightened!");
                break;
            case 2:
                MESSAGE("Great Tusk's Sp. Atk was heightened!");
                break;
            case 3:
                MESSAGE("Great Tusk's Sp. Def was heightened!");
                break;
        }
    }
}

SINGLE_BATTLE_TEST("Protosynthesis activates in Sun before Booster Energy")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_GREAT_TUSK) { Ability(ABILITY_PROTOSYNTHESIS); Item(ITEM_BOOSTER_ENERGY); }
        OPPONENT(SPECIES_NINETALES) { Ability(ABILITY_DROUGHT); }
    } WHEN {
        TURN { SWITCH(player, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
    } THEN {
        EXPECT_EQ(player->item, ITEM_BOOSTER_ENERGY);
    }
}

SINGLE_BATTLE_TEST("Protosynthesis doesn't activate for a transformed battler")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_GREAT_TUSK) { Ability(ABILITY_PROTOSYNTHESIS); Item(ITEM_BOOSTER_ENERGY); }
        OPPONENT(SPECIES_NINETALES) { Ability(ABILITY_DROUGHT); Item(ITEM_BOOSTER_ENERGY); }
    } WHEN {
        TURN { SWITCH(player, 1); MOVE(opponent, MOVE_TRANSFORM); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TRANSFORM, opponent);
        NOT ABILITY_POPUP(opponent, ABILITY_PROTOSYNTHESIS);
    } THEN {
        EXPECT_EQ(player->item, ITEM_BOOSTER_ENERGY);
        EXPECT_EQ(opponent->item, ITEM_BOOSTER_ENERGY);
        EXPECT_EQ(opponent->ability, ABILITY_PROTOSYNTHESIS);
    }
}

SINGLE_BATTLE_TEST("Protosynthesis activates even if the Pokémon is holding an Utility Umbrella")
{
    GIVEN {
        PLAYER(SPECIES_GREAT_TUSK) { Ability(ABILITY_PROTOSYNTHESIS); Item(ITEM_UTILITY_UMBRELLA); }
        OPPONENT(SPECIES_NINETALES) { Ability(ABILITY_DROUGHT); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_DROUGHT);
        ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
    }
}

SINGLE_BATTLE_TEST("Protosynthesis doesn't activate if Cloud Nine/Air Lock is on the field")
{
    u32 species, ability;
    PARAMETRIZE { species = SPECIES_RAYQUAZA; ability = ABILITY_AIR_LOCK; }
    PARAMETRIZE { species = SPECIES_GOLDUCK; ability = ABILITY_CLOUD_NINE; }

    GIVEN {
        PLAYER(SPECIES_GREAT_TUSK) { Ability(ABILITY_PROTOSYNTHESIS); }
        OPPONENT(species) { Ability(ability); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUNNY_DAY); }
    } SCENE {
        ABILITY_POPUP(opponent, ability);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUNNY_DAY, opponent);
        NOT ABILITY_POPUP(player, ABILITY_PROTOSYNTHESIS);
    }
}
