#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Confusion adds a 50/33% chance to hit self with 40 power")
{
    s16 damage[2];

    ASSUME(GetMovePower(MOVE_TACKLE) == 40);

    PASSES_RANDOMLY(B_CONFUSION_SELF_DMG_CHANCE >= GEN_7 ? 33 : 50, 100, RNG_CONFUSION);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(1); };
        OPPONENT(SPECIES_WOBBUFFET) { Speed(2); };
    } WHEN {
        TURN { MOVE(opponent, MOVE_TACKLE, WITH_RNG(RNG_DAMAGE_MODIFIER, 0)); MOVE(player, MOVE_CONFUSE_RAY); }
        TURN;
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponent);
        HP_BAR(player, captureDamage: &damage[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CONFUSE_RAY, player);
        MESSAGE("The opposing Wobbuffet became confused!");
        MESSAGE("The opposing Wobbuffet is confused!");
        MESSAGE("It hurt itself in its confusion!");
        HP_BAR(opponent, captureDamage: &damage[1]);
    } THEN {
        EXPECT_EQ(damage[0], damage[1]);
    }
}

SINGLE_BATTLE_TEST("Confusion self hit does not consume Gems")
{
    PASSES_RANDOMLY(B_CONFUSION_SELF_DMG_CHANCE >= GEN_7 ? 33 : 50, 100, RNG_CONFUSION);
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_NORMAL_GEM); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_CONFUSE_RAY); MOVE(player, MOVE_TACKLE); }
    } SCENE {
        NONE_OF {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, player);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            MESSAGE("Normal Gem strengthened Wobbuffet's power!");
        }
        MESSAGE("It hurt itself in its confusion!");
    }
}
