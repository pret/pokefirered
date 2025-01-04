#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_SHEER_COLD) == EFFECT_OHKO);
}

SINGLE_BATTLE_TEST("Sheer Cold doesn't affect Ice-type Pokémon")
{
    GIVEN {
        ASSUME(B_SHEER_COLD_IMMUNITY >= GEN_7);
        ASSUME(gSpeciesInfo[SPECIES_GLALIE].types[0] == TYPE_ICE);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_GLALIE);
    } WHEN {
        TURN { MOVE(player, MOVE_SHEER_COLD); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SHEER_COLD, player);
        MESSAGE("It doesn't affect the opposing Glalie…");
    }
}

SINGLE_BATTLE_TEST("OHKO moves can hit semi-invulnerable mons when the user has No-Guard")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SHEER_COLD) == EFFECT_OHKO);
        PLAYER(SPECIES_WOBBUFFET) { Ability(ABILITY_NO_GUARD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FLY); }
        TURN { MOVE(player, MOVE_SHEER_COLD); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SHEER_COLD, player);
        HP_BAR(opponent, hp: 0);
    }
}

TO_DO_BATTLE_TEST("Fissure faints the target, skipping regular damage calculations")
TO_DO_BATTLE_TEST("Fissure always fails if the target has a higher level than the user")
TO_DO_BATTLE_TEST("Fissure's accuracy increases by 1% for every level the user has over the target")
TO_DO_BATTLE_TEST("Fissure's ignores non-stage accuracy modifiers") // Gravity, Wide Lens, Compound Eyes
