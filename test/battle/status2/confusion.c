#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Confusion adds a 50/33% chance to hit self with 40 power")
{
    s16 damage[2];
    u32 genConfig, pctChance;

    PARAMETRIZE { genConfig = GEN_6; pctChance = 50; }
    PARAMETRIZE { genConfig = GEN_7; pctChance = 33; }
    PASSES_RANDOMLY(pctChance, 100, RNG_CONFUSION);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CONFUSION_SELF_DMG_CHANCE, genConfig);
        ASSUME(GetMovePower(MOVE_TACKLE) == 40);
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
    u32 genConfig, pctChance;

    PARAMETRIZE { genConfig = GEN_6; pctChance = 50; }
    PARAMETRIZE { genConfig = GEN_7; pctChance = 33; }
    PASSES_RANDOMLY(pctChance, 100, RNG_CONFUSION);
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_CONFUSION_SELF_DMG_CHANCE, genConfig);
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
