#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_TAKE_HEART) == EFFECT_TAKE_HEART);
}

SINGLE_BATTLE_TEST("Take Heart increases Sp. Atk and Sp. Def by one stage")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_TAKE_HEART); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    }
}

SINGLE_BATTLE_TEST("Take Heart cures the user of all status conditions")
{
    u32 status1;
    PARAMETRIZE { status1 = STATUS1_SLEEP; }
    PARAMETRIZE { status1 = STATUS1_POISON; }
    PARAMETRIZE { status1 = STATUS1_FREEZE; }
    PARAMETRIZE { status1 = STATUS1_BURN; }
    PARAMETRIZE { status1 = STATUS1_PARALYSIS; }
    PARAMETRIZE { status1 = STATUS1_TOXIC_POISON; }
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Status1(status1); };
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_TAKE_HEART); }
    } SCENE {
        if (status1 == STATUS1_SLEEP) {
            MESSAGE("Wobbuffet is fast asleep.");
        } else if (status1 == STATUS1_FREEZE) {
            PASSES_RANDOMLY(20, 100, RNG_FROZEN);
            STATUS_ICON(player, none: TRUE);
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        } else {
            STATUS_ICON(player, none: TRUE);
            MESSAGE("Wobbuffet's status returned to normal!");
            ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        }
    }
}

SINGLE_BATTLE_TEST("Take Heart cures sleep when used by Sleep Talk")
{
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_SPORE) == EFFECT_SLEEP);
        ASSUME(GetMoveEffect(MOVE_SLEEP_TALK) == EFFECT_SLEEP_TALK);
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET) { Moves(MOVE_SLEEP_TALK, MOVE_TAKE_HEART); }
    } WHEN {
        TURN { MOVE(player, MOVE_SPORE); MOVE(opponent, MOVE_SLEEP_TALK); }
    } SCENE {
        MESSAGE("Wobbuffet used Spore!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SPORE, player);
        ANIMATION(ANIM_TYPE_STATUS, B_ANIM_STATUS_SLP, opponent);
        MESSAGE("The opposing Wobbuffet fell asleep!");
        MESSAGE("The opposing Wobbuffet used Sleep Talk!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SLEEP_TALK, opponent);
        MESSAGE("The opposing Wobbuffet used Take Heart!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TAKE_HEART, opponent);
        STATUS_ICON(opponent, none: TRUE);
        MESSAGE("The opposing Wobbuffet's status returned to normal!");
    }
}
