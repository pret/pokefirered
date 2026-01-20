#include "global.h"
#include "test/battle.h"

static bool32 IsSpeciesMonotypeOf(u32 species, enum Type type)
{
    return GetSpeciesType(species, 0) == type && GetSpeciesType(species, 1) == type;
}

ASSUMPTIONS
{
    // Pokemon Types
    ASSUME(IsSpeciesMonotypeOf(SPECIES_EEVEE,    TYPE_NORMAL));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_MACHAMP,  TYPE_FIGHTING));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_TORNADUS, TYPE_FLYING));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_ARBOK,    TYPE_POISON));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_DUGTRIO,  TYPE_GROUND));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_SUDOWOODO,TYPE_ROCK));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_PINSIR,   TYPE_BUG));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_DUSKULL,  TYPE_GHOST));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_REGISTEEL,TYPE_STEEL));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_FLAREON,  TYPE_FIRE));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_VAPOREON, TYPE_WATER));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_LEAFEON,  TYPE_GRASS));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_JOLTEON,  TYPE_ELECTRIC));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_ESPEON,   TYPE_PSYCHIC));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_GLACEON,  TYPE_ICE));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_DRUDDIGON,TYPE_DRAGON));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_UMBREON,  TYPE_DARK));
    ASSUME(IsSpeciesMonotypeOf(SPECIES_SYLVEON,  TYPE_FAIRY));

    // Move types
    ASSUME(GetMoveType(MOVE_TACKLE)        == TYPE_NORMAL);
    ASSUME(GetMoveType(MOVE_KARATE_CHOP)   == TYPE_FIGHTING);
    ASSUME(GetMoveType(MOVE_GUST)          == TYPE_FLYING);
    ASSUME(GetMoveType(MOVE_POISON_STING)  == TYPE_POISON);
    ASSUME(GetMoveType(MOVE_MUD_SLAP)      == TYPE_GROUND);
    ASSUME(GetMoveType(MOVE_ROCK_THROW)    == TYPE_ROCK);
    ASSUME(GetMoveType(MOVE_BUG_BITE)      == TYPE_BUG);
    ASSUME(GetMoveType(MOVE_SHADOW_BALL)   == TYPE_GHOST);
    ASSUME(GetMoveType(MOVE_METAL_CLAW)    == TYPE_STEEL);
    ASSUME(GetMoveType(MOVE_EMBER)         == TYPE_FIRE);
    ASSUME(GetMoveType(MOVE_WATER_GUN)     == TYPE_WATER);
    ASSUME(GetMoveType(MOVE_VINE_WHIP)     == TYPE_GRASS);
    ASSUME(GetMoveType(MOVE_THUNDER_SHOCK) == TYPE_ELECTRIC);
    ASSUME(GetMoveType(MOVE_CONFUSION)     == TYPE_PSYCHIC);
    ASSUME(GetMoveType(MOVE_ICE_BEAM)      == TYPE_ICE);
    ASSUME(GetMoveType(MOVE_DRAGON_BREATH) == TYPE_DRAGON);
    ASSUME(GetMoveType(MOVE_BITE)          == TYPE_DARK);
    ASSUME(GetMoveType(MOVE_FAIRY_WIND)    == TYPE_FAIRY);
}

SINGLE_BATTLE_TEST("Inverse battle reverses type matchups")
{
    u32 species = SPECIES_NONE, move = MOVE_NONE;

    static const u16 monotypeMons[] = {
        SPECIES_EEVEE,
        SPECIES_MACHAMP,
        SPECIES_TORNADUS,
        SPECIES_ARBOK,
        SPECIES_DUGTRIO,
        SPECIES_SUDOWOODO,
        SPECIES_PINSIR,
        SPECIES_DUSKULL,
        SPECIES_REGISTEEL,
        SPECIES_FLAREON,
        SPECIES_VAPOREON,
        SPECIES_LEAFEON,
        SPECIES_JOLTEON,
        SPECIES_ESPEON,
        SPECIES_GLACEON,
        SPECIES_DRUDDIGON,
        SPECIES_UMBREON,
        SPECIES_SYLVEON,
    };

    static const u16 typeMoves[] = {
        MOVE_TACKLE,
        MOVE_KARATE_CHOP,
        MOVE_GUST,
        MOVE_POISON_STING,
        MOVE_MUD_SLAP,
        MOVE_ROCK_THROW,
        MOVE_BUG_BITE,
        MOVE_SHADOW_BALL,
        MOVE_METAL_CLAW,
        MOVE_EMBER,
        MOVE_WATER_GUN,
        MOVE_VINE_WHIP,
        MOVE_THUNDER_SHOCK,
        MOVE_CONFUSION,
        MOVE_ICE_BEAM,
        MOVE_DRAGON_BREATH,
        MOVE_BITE,
        MOVE_FAIRY_WIND,
    };

    for (u32 i = 0; i < ARRAY_COUNT(monotypeMons); i++)
    {
        for (u32 j = 0; j < ARRAY_COUNT(typeMoves); j++)
        {
            PARAMETRIZE { species = monotypeMons[i]; move = typeMoves[j]; }
        }
    }

    GIVEN {
        FLAG_SET(B_FLAG_INVERSE_BATTLE);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(species);
    }
    WHEN {
        TURN { MOVE(player, MOVE_WORRY_SEED); }
        TURN { MOVE(player, move); }
    }
    SCENE {
        ANIMATION(ANIM_TYPE_MOVE, move, player);
        HP_BAR(opponent);
        if (gTypeEffectivenessTable[GetMoveType(move)][GetSpeciesType(species, 0)] == Q_4_12(2))
            MESSAGE("It's not very effective…");
        if (gTypeEffectivenessTable[GetMoveType(move)][GetSpeciesType(species, 0)] == Q_4_12(0.5))
            MESSAGE("It's super effective!");
    }
}

