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

SINGLE_BATTLE_TEST("Ability Shield protects against Mold Breaker")
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
            ABILITY_POPUP(player, ABILITY_LEVITATE);
            NOT HP_BAR(player);
        } else {
            NOT ABILITY_POPUP(player, ABILITY_LEVITATE);
            HP_BAR(player);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Mycelium Might")
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
            }
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, opponent);
            STATUS_ICON(player, sleep: TRUE);
        }
    }
}

SINGLE_BATTLE_TEST("Ability Shield protects against Sunsteel Strike")
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
                MESSAGE("Shedinja fainted!");
            }
        } else {
            MESSAGE("Shedinja fainted!");
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
        } else {
            ANIMATION(ANIM_TYPE_MOVE, MOVE_SKILL_SWAP, opponent);
            ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
        }
    }
}
