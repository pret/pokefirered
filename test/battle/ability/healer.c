#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Healer cures adjacent ally's status condition 30% of the time")
{
    u16 status;
    PARAMETRIZE { status = STATUS1_SLEEP; }
    PARAMETRIZE { status = STATUS1_POISON; }
    PARAMETRIZE { status = STATUS1_BURN; }
    // PARAMETRIZE { status = STATUS1_FREEZE; }
    PARAMETRIZE { status = STATUS1_PARALYSIS; }
    PARAMETRIZE { status = STATUS1_TOXIC_POISON; }
    PARAMETRIZE { status = STATUS1_FROSTBITE; }
    PASSES_RANDOMLY(30, 100, RNG_HEALER);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Status1(status); }
        OPPONENT(SPECIES_CHANSEY) { Ability(ABILITY_HEALER); }
    } WHEN {
        TURN { }
    } SCENE {
        MESSAGE("The opposing Chansey's Healer cured the opposing Wobbuffet's problem!");
    }
}

DOUBLE_BATTLE_TEST("Healer cures status condition before burn or poison damage is dealt")
{
    KNOWN_FAILING; // According to Bulbapedia, Healer should trigger before status damage and Wobbuffet should live
    // Source: https://bulbapedia.bulbagarden.net/wiki/Healer_(Ability)#Effect
    u16 status;
    PARAMETRIZE { status = STATUS1_POISON; }
    PARAMETRIZE { status = STATUS1_BURN; }
    PARAMETRIZE { status = STATUS1_TOXIC_POISON; }
    PARAMETRIZE { status = STATUS1_FROSTBITE; }
    PASSES_RANDOMLY(30, 100, RNG_HEALER);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { HP(1); Status1(status); }
        OPPONENT(SPECIES_CHANSEY) { Ability(ABILITY_HEALER); }
    } WHEN {
        TURN {}
    } SCENE {
        NOT {
            MESSAGE("The opposing Wobbuffet fainted!");
        }
        MESSAGE("The opposing Chansey's Healer cured Foe Wobbuffet's problem!");
    }
}

// Triple battles
TO_DO_BATTLE_TEST("Healer has a 30% chance of curing each of its ally's status conditions independently");
