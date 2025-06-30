#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_FISSURE) == EFFECT_OHKO);
}

SINGLE_BATTLE_TEST("OHKO moves can hit semi-invulnerable mons when the user has No-Guard")
{
    GIVEN {
        ASSUME(GetItemHoldEffect(ITEM_FOCUS_SASH) == HOLD_EFFECT_FOCUS_SASH);
        PLAYER(SPECIES_WOBBUFFET) { Ability(ABILITY_NO_GUARD); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_FLY); }
        TURN { MOVE(player, MOVE_FISSURE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FISSURE, player);
        HP_BAR(opponent, hp: 0);
    }
}

SINGLE_BATTLE_TEST("OHKO moves can can be endured by Focus Sash")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_FOCUS_SASH); }
    } WHEN {
        TURN { MOVE(player, MOVE_FISSURE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FISSURE, player);
        HP_BAR(opponent, hp: 1);
        MESSAGE("The opposing Wobbuffet hung on using its Focus Sash!");
    }
}

SINGLE_BATTLE_TEST("OHKO moves can can be endured by Sturdy")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GEODUDE) { Ability(ABILITY_STURDY); }
    } WHEN {
        TURN { MOVE(player, MOVE_FISSURE); }
    } SCENE {
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_FISSURE, player);
        ABILITY_POPUP(opponent, ABILITY_STURDY);
    }
}

TO_DO_BATTLE_TEST("OHKO moves faints the target, skipping regular damage calculations")
TO_DO_BATTLE_TEST("OHKO moves always fails if the target has a higher level than the user")
TO_DO_BATTLE_TEST("OHKO moves's accuracy increases by 1% for every level the user has over the target")
TO_DO_BATTLE_TEST("OHKO moves's ignores non-stage accuracy modifiers") // Gravity, Wide Lens, Compound Eyes
