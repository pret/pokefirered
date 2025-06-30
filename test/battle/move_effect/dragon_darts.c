#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_DRAGON_DARTS) == EFFECT_DRAGON_DARTS);
    ASSUME(GetSpeciesType(SPECIES_CLEFAIRY, 0) == TYPE_FAIRY || GetSpeciesType(SPECIES_CLEFAIRY, 1) == TYPE_FAIRY);
}

SINGLE_BATTLE_TEST("Dragon Darts strikes twice")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_DRAGON_DARTS); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, player);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes each opponent once in a double battle")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *secondaryTarget = NULL;
    PARAMETRIZE { chosenTarget = opponentLeft; secondaryTarget = opponentRight; }
    PARAMETRIZE { chosenTarget = opponentRight; secondaryTarget = opponentLeft; }

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(chosenTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(secondaryTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes the ally twice if the target protects")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *secondaryTarget = NULL;
    PARAMETRIZE { chosenTarget = opponentLeft; secondaryTarget = opponentRight; }
    PARAMETRIZE { chosenTarget = opponentRight; secondaryTarget = opponentLeft; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(chosenTarget, MOVE_PROTECT); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_PROTECT, chosenTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(secondaryTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(secondaryTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes an opponent twice if the other one is Fairy-type")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    u32 speciesLeft, speciesRight;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; speciesLeft = SPECIES_CLEFAIRY;  speciesRight = SPECIES_WOBBUFFET; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentRight; speciesLeft = SPECIES_CLEFAIRY;  speciesRight = SPECIES_WOBBUFFET; }
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentLeft;  speciesLeft = SPECIES_WOBBUFFET; speciesRight = SPECIES_CLEFAIRY; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft;  speciesLeft = SPECIES_WOBBUFFET; speciesRight = SPECIES_CLEFAIRY; }

    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_CLEFAIRY, 0) == TYPE_FAIRY || GetSpeciesType(SPECIES_CLEFAIRY, 1) == TYPE_FAIRY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(speciesLeft);
        OPPONENT(speciesRight);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes an opponent twice if electrified and the other one has Volt Absorb")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    u32 abilityLeft, abilityRight;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentLeft;  abilityLeft = ABILITY_WATER_ABSORB; abilityRight = ABILITY_VOLT_ABSORB; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft;  abilityLeft = ABILITY_WATER_ABSORB; abilityRight = ABILITY_VOLT_ABSORB; }
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; abilityLeft = ABILITY_VOLT_ABSORB;  abilityRight = ABILITY_WATER_ABSORB; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentRight; abilityLeft = ABILITY_VOLT_ABSORB;  abilityRight = ABILITY_WATER_ABSORB; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ELECTRIFY) == EFFECT_ELECTRIFY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_LANTURN) { Ability(abilityLeft); };
        OPPONENT(SPECIES_LANTURN) { Ability(abilityRight); };
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_ELECTRIFY, target: playerLeft); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes an opponent twice if electrified and the other one has Motor Drive")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    u32 abilityLeft, abilityRight;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentLeft;  abilityLeft = ABILITY_VITAL_SPIRIT; abilityRight = ABILITY_MOTOR_DRIVE; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft;  abilityLeft = ABILITY_VITAL_SPIRIT; abilityRight = ABILITY_MOTOR_DRIVE; }
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; abilityLeft = ABILITY_MOTOR_DRIVE;  abilityRight = ABILITY_VITAL_SPIRIT; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentRight; abilityLeft = ABILITY_MOTOR_DRIVE;  abilityRight = ABILITY_VITAL_SPIRIT; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ELECTRIFY) == EFFECT_ELECTRIFY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_ELECTIVIRE) { Ability(abilityLeft); };
        OPPONENT(SPECIES_ELECTIVIRE) { Ability(abilityRight); };
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_ELECTRIFY, target: playerLeft); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes an opponent twice if the other one is in a semi-invulnerable turn")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft; }
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_FLY) == EFFECT_SEMI_INVULNERABLE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(chosenTarget, MOVE_FLY, target: playerLeft); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLY, chosenTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts is not effected by Wide Guard")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_WIDE_GUARD); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_WIDE_GUARD, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes an opponent twice if the other one is fainted")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    u32 hpLeft, hpRight;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; hpLeft = 1; hpRight = 101; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft;  hpLeft = 101; hpRight = 1; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(hpLeft); }
        OPPONENT(SPECIES_WOBBUFFET) { HP(hpRight); }
    } WHEN {
        TURN { MOVE(playerRight, MOVE_SONIC_BOOM, target: chosenTarget); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SONIC_BOOM, playerRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes left ally twice if one strike misses")
{
    struct BattlePokemon *chosenTarget = NULL;
    struct BattlePokemon *finalTarget = NULL;
    u32 itemLeft, itemRight;
    PARAMETRIZE { chosenTarget = opponentLeft;  finalTarget = opponentRight; itemLeft = ITEM_BRIGHT_POWDER;  itemRight = ITEM_NONE; }
    PARAMETRIZE { chosenTarget = opponentRight; finalTarget = opponentLeft;  itemLeft = ITEM_NONE;           itemRight = ITEM_BRIGHT_POWDER; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(itemLeft); };
        OPPONENT(SPECIES_WOBBUFFET) { Item(itemRight); };
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_DARTS, target: chosenTarget, hit: FALSE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(finalTarget);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes right ally twice if one strike misses")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_BRIGHT_POWDER); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft, hit: FALSE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts strikes will be both redirected to Follow Me user")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_CLEFAIRY, 0) == TYPE_FAIRY || GetSpeciesType(SPECIES_CLEFAIRY, 1) == TYPE_FAIRY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_FOLLOW_ME); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        MESSAGE("The Pokémon was hit 2 time(s)!");
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts fails to strike any target if under a fairy type follow me user")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_CLEFAIRY, 0) == TYPE_FAIRY || GetSpeciesType(SPECIES_CLEFAIRY, 1) == TYPE_FAIRY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_CLEFAIRY);
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_FOLLOW_ME); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
            MESSAGE("The Pokémon was hit 2 time(s)!");
        }
    }
}

DOUBLE_BATTLE_TEST("Dragon Darts fails to strike the second target if first target fainted and follow me was active")
{
    GIVEN {
        ASSUME(GetSpeciesType(SPECIES_CLEFAIRY, 0) == TYPE_FAIRY || GetSpeciesType(SPECIES_CLEFAIRY, 1) == TYPE_FAIRY);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); }
    } WHEN {
        TURN { MOVE(opponentRight, MOVE_FOLLOW_ME); MOVE(playerLeft, MOVE_DRAGON_DARTS, target: opponentLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
        HP_BAR(opponentRight);
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_DRAGON_DARTS, playerLeft);
            MESSAGE("The Pokémon was hit 2 time(s)!");
        }
    }
}
