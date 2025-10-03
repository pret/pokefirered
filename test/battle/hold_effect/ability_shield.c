#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gItemsInfo[ITEM_ABILITY_SHIELD].holdEffect == HOLD_EFFECT_ABILITY_SHIELD);
}

SINGLE_BATTLE_TEST("Ability Shield protects against Neutralizing Gas")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        PLAYER(SPECIES_TORKOAL) { Ability(ABILITY_DROUGHT); Item(item); }
        OPPONENT(SPECIES_KOFFING) { Ability(ABILITY_NEUTRALIZING_GAS); }
    } WHEN {
        TURN { }
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_NEUTRALIZING_GAS);
        MESSAGE("Neutralizing gas filled the area!");
        if (item == ITEM_ABILITY_SHIELD) {
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            MESSAGE("Torkoal's Ability is protected by the effects of its Ability Shield!");
            ABILITY_POPUP(player, ABILITY_DROUGHT);
        } else {
            NONE_OF {
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
                MESSAGE("Torkoal's Ability is protected by the effects of its Ability Shield!");
                ABILITY_POPUP(player, ABILITY_DROUGHT);
            }
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Mold Breaker (no message)")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(GetMoveType(MOVE_EARTHQUAKE) == TYPE_GROUND);
        PLAYER(SPECIES_FLYGON) { Ability(ABILITY_LEVITATE); Item(item); }
        OPPONENT(SPECIES_EXCADRILL) { Ability(ABILITY_MOLD_BREAKER); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_EARTHQUAKE); }
    } SCENE {
        if (item == ITEM_ABILITY_SHIELD) {
            NONE_OF {
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
                MESSAGE("Flygon's Ability is protected by the effects of its Ability Shield!");
                HP_BAR(player);
            }
            ABILITY_POPUP(player, ABILITY_LEVITATE);
        } else {
            HP_BAR(player);
            NOT ABILITY_POPUP(player, ABILITY_LEVITATE);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Mycelium Might (no message)")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SPORE) == EFFECT_NON_VOLATILE_STATUS);
        ASSUME(GetMoveNonVolatileStatus(MOVE_SPORE) == MOVE_EFFECT_SLEEP);
        PLAYER(SPECIES_VIGOROTH) { Ability(ABILITY_VITAL_SPIRIT); Item(item); }
        OPPONENT(SPECIES_TOEDSCOOL) { Ability(ABILITY_MYCELIUM_MIGHT); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SPORE); }
    } SCENE {

        if (item == ITEM_ABILITY_SHIELD) {
            NONE_OF {
                ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, opponent);
                STATUS_ICON(player, sleep: TRUE);
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
                MESSAGE("Vigoroth's Ability is protected by the effects of its Ability Shield!");
            }
            ABILITY_POPUP(player, ABILITY_VITAL_SPIRIT);
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, opponent);
            STATUS_ICON(player, sleep: TRUE);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Sunsteel Strike (no message)")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(MoveIgnoresTargetAbility(MOVE_SUNSTEEL_STRIKE));
        PLAYER(SPECIES_SHEDINJA) { Ability(ABILITY_WONDER_GUARD); Item(item); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUNSTEEL_STRIKE); }
    } SCENE {
        if (item == ITEM_ABILITY_SHIELD) {
            NONE_OF {
                ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
                MESSAGE("Shedinja's Ability is protected by the effects of its Ability Shield!");
                MESSAGE("Shedinja fainted!");
            }
            ABILITY_POPUP(player, ABILITY_WONDER_GUARD);
        } else {
            MESSAGE("Shedinja fainted!");
            NOT ABILITY_POPUP(player, ABILITY_WONDER_GUARD);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects the user's ability from being suppressed by Gastro Acid")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_GASTRO_ACID) == EFFECT_GASTRO_ACID);
        PLAYER(SPECIES_BLAZIKEN) { Ability(ABILITY_SPEED_BOOST); Item(item); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_GASTRO_ACID); }
    } SCENE {
        if (item == ITEM_ABILITY_SHIELD) {
            NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_GASTRO_ACID, opponent);
            ABILITY_POPUP(player, ABILITY_SPEED_BOOST);
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_GASTRO_ACID, opponent);
            NOT ABILITY_POPUP(player, ABILITY_SPEED_BOOST);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Skill Swap")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        PLAYER(SPECIES_GYARADOS) { Ability(ABILITY_INTIMIDATE); Item(item); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SKILL_SWAP); }
    } SCENE {
        if (item == ITEM_ABILITY_SHIELD) {
            NONE_OF {
                ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
                ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
            }
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            MESSAGE("Gyarados's Ability is protected by the effects of its Ability Shield!");
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
            ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Skill Swap even if user has Klutz")
{
    u32 item;

    PARAMETRIZE { item = ITEM_ABILITY_SHIELD; }
    PARAMETRIZE { item = ITEM_NONE; }

    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SKILL_SWAP) == EFFECT_SKILL_SWAP);
        PLAYER(SPECIES_LOPUNNY) { Ability(ABILITY_KLUTZ); Item(item); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SKILL_SWAP); }
    } SCENE {
        if (item == ITEM_ABILITY_SHIELD) {
            NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, player);
            MESSAGE("Lopunny's Ability is protected by the effects of its Ability Shield!");
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
        }
    }
}

// These currently do not activate, but probably should do held item animation + message
TO_DO_BATTLE_TEST("Ability Shield prevents the user's Trace from changing its ability");
TO_DO_BATTLE_TEST("Ability Shield prevents the user's Receiver from changing its ability");
TO_DO_BATTLE_TEST("Ability Shield protects against Wandering Spirit");
TO_DO_BATTLE_TEST("Ability Shield protects against Mummy/Lingering Aroma");
