#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_LEECH_SEED) == EFFECT_LEECH_SEED);
}

SINGLE_BATTLE_TEST("Leech Seed doesn't affect Grass-type Pokémon")
{
    PASSES_RANDOMLY(90, 100, RNG_ACCURACY);
    GIVEN {
        ASSUME(gSpeciesInfo[SPECIES_ODDISH].types[0] == TYPE_GRASS);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_ODDISH);
    } WHEN {
        TURN { MOVE(player, MOVE_LEECH_SEED); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_LEECH_SEED, player);
        MESSAGE("It doesn't affect the opposing Oddish…");
    }
}

SINGLE_BATTLE_TEST("Leech Seeded targets lose 1/8 of its max HP every turn and give it to the user")
{
    s16 damage;
    s16 healed;

    GIVEN {
        PLAYER(SPECIES_WYNAUT) { HP(1); }
        OPPONENT(SPECIES_SHELLDER);
    } WHEN {
        TURN { MOVE(player, MOVE_LEECH_SEED); }
        TURN {}
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LEECH_SEED, player);
        HP_BAR(opponent);
        HP_BAR(player);
        HP_BAR(opponent, captureDamage: &damage);
        HP_BAR(player, captureDamage: &healed);
    } THEN {
        EXPECT_MUL_EQ(damage, Q_4_12(-1), healed);
    }
}

SINGLE_BATTLE_TEST("Leech Seed recovery is prevented by Heal Block")
{
    GIVEN {
        PLAYER(SPECIES_WYNAUT) { HP(1); }
        OPPONENT(SPECIES_SHELLDER);
    } WHEN {
        TURN { MOVE(opponent, MOVE_HEAL_BLOCK); MOVE(player, MOVE_LEECH_SEED); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_HEAL_BLOCK, opponent);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_LEECH_SEED, player);
        HP_BAR(opponent);
        NOT HP_BAR(player);
    }
}

TO_DO_BATTLE_TEST("Leech Seed doesn't affect already seeded targets")
TO_DO_BATTLE_TEST("Leech Seed's effect is paused until a new battler replaces the original user's position") // Faint, can't be replaced, then revived.
TO_DO_BATTLE_TEST("Leech Seed's effect pause still prevents it from being seeded again")
TO_DO_BATTLE_TEST("Baton Pass passes Leech Seed's effect");
