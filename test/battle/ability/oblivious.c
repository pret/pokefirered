#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Oblivious prevents Infatuation")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_ATTRACT) == EFFECT_ATTRACT);
        PLAYER(SPECIES_SLOWPOKE) { Ability(ABILITY_OBLIVIOUS); Gender(MON_MALE); }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_ATTRACT); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
        NONE_OF { ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_INFATUATION, player); }
        MESSAGE("It doesn't affect Slowpoke…");
    }
}

SINGLE_BATTLE_TEST("Oblivious prevents Captivate")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_CAPTIVATE) == EFFECT_CAPTIVATE);
        PLAYER(SPECIES_SLOWPOKE) { Ability(ABILITY_OBLIVIOUS); Gender(MON_MALE); }
        OPPONENT(SPECIES_WOBBUFFET) { Gender(MON_FEMALE); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_CAPTIVATE); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
        NONE_OF { ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player); }
        MESSAGE("It doesn't affect Slowpoke…");
    }
}

SINGLE_BATTLE_TEST("Oblivious prevents Taunt (Gen6+)")
{
    u32 gen = 0;
    PARAMETRIZE { gen = GEN_5; }
    PARAMETRIZE { gen = GEN_6; }
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_OBLIVIOUS_TAUNT, gen);
        ASSUME(GetMoveEffect(MOVE_TAUNT) == EFFECT_TAUNT);
        PLAYER(SPECIES_SLOWPOKE) { Ability(ABILITY_OBLIVIOUS); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_TAUNT); }
        TURN { MOVE(player, MOVE_SPORE, allowed: gen == GEN_6); }
    } SCENE {
        if (gen == GEN_6) {
            NONE_OF { ANIMATION(ANIM_TYPE_MOVE, MOVE_TAUNT, opponent); }
            ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
            MESSAGE("It doesn't affect Slowpoke…");
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, player);
            ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_SLP, opponent);
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_TAUNT, opponent);
            NONE_OF {
                ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
                MESSAGE("It doesn't affect Slowpoke…");
                ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, player);
                ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_SLP, opponent);
            }
        }
    }
}

SINGLE_BATTLE_TEST("Oblivious doesn't prevent Intimidate (Gen3-7)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_UPDATED_INTIMIDATE, GEN_7);
        PLAYER(SPECIES_SLOWPOKE) { Ability(ABILITY_OBLIVIOUS); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_EKANS) { Ability(ABILITY_INTIMIDATE); }
    } WHEN {
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
        NONE_OF {
            ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
            MESSAGE("Slowpoke's Oblivious prevents stat loss!");
        }
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        MESSAGE("The opposing Ekans's Intimidate cuts Slowpoke's Attack!");
    }
}

SINGLE_BATTLE_TEST("Oblivious prevents Intimidate (Gen8+)")
{
    GIVEN {
        WITH_CONFIG(GEN_CONFIG_UPDATED_INTIMIDATE, GEN_8);
        PLAYER(SPECIES_SLOWPOKE) { Ability(ABILITY_OBLIVIOUS); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_EKANS) { Ability(ABILITY_INTIMIDATE); }
    } WHEN {
        TURN { SWITCH(opponent, 1); }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
        ABILITY_POPUP(player, ABILITY_OBLIVIOUS);
        NONE_OF { ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player); }
        MESSAGE("Slowpoke's Oblivious prevents stat loss!");
    }
}
