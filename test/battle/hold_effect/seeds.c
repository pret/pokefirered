#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Electric Seed raises the holder's Defense on Electric Terrain")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_ELECTRIC_SEED].holdEffect == HOLD_EFFECT_SEEDS);
        ASSUME(gItemsInfo[ITEM_ELECTRIC_SEED].holdEffectParam == HOLD_EFFECT_PARAM_ELECTRIC_TERRAIN);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_ELECTRIC_SEED); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_ELECTRIC_TERRAIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Using Electric Seed, the Defense of Wobbuffet rose!");
    }
}

SINGLE_BATTLE_TEST("Grassy Seed raises the holder's Defense on Grassy Terrain")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_GRASSY_SEED].holdEffect == HOLD_EFFECT_SEEDS);
        ASSUME(gItemsInfo[ITEM_GRASSY_SEED].holdEffectParam == HOLD_EFFECT_PARAM_GRASSY_TERRAIN);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_GRASSY_SEED); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_GRASSY_TERRAIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Using Grassy Seed, the Defense of Wobbuffet rose!");
    }
}

SINGLE_BATTLE_TEST("Misty Seed raises the holder's Sp. Defense on Misty Terrain")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_MISTY_SEED].holdEffect == HOLD_EFFECT_SEEDS);
        ASSUME(gItemsInfo[ITEM_MISTY_SEED].holdEffectParam == HOLD_EFFECT_PARAM_MISTY_TERRAIN);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_MISTY_SEED); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_MISTY_TERRAIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Using Misty Seed, the Sp. Def of Wobbuffet rose!");
    }
}

SINGLE_BATTLE_TEST("Psychic Seed raises the holder's Sp. Defense on Psychic Terrain")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_PSYCHIC_SEED].holdEffect == HOLD_EFFECT_SEEDS);
        ASSUME(gItemsInfo[ITEM_PSYCHIC_SEED].holdEffectParam == HOLD_EFFECT_PARAM_PSYCHIC_TERRAIN);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_PSYCHIC_SEED); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_PSYCHIC_TERRAIN); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("Using Psychic Seed, the Sp. Def of Wobbuffet rose!");
    }
}
