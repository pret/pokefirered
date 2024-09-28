#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(gMovesInfo[MOVE_SHED_TAIL].effect == EFFECT_SHED_TAIL);
}

SINGLE_BATTLE_TEST("Shed Tail creates a Substitute at the cost of 1/2 users maximum HP and switches the user out")
{
    s16 maxHP = 0;
    s16 costHP = 0;

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SHED_TAIL); SEND_OUT(player, 1); }
    } SCENE {
        maxHP = GetMonData(&gPlayerParty[0], MON_DATA_HP);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SHED_TAIL, player);
        HP_BAR(player, captureDamage: &costHP);
        MESSAGE("Wobbuffet shed its tail to create a decoy!");
        SEND_IN_MESSAGE("Wynaut");
    }THEN {
        EXPECT_EQ(maxHP / 2, costHP);
    }
}

SINGLE_BATTLE_TEST("Shed Tail fails if the user doesn't have enough HP")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SHED_TAIL); }
    } SCENE {
        MESSAGE("It was too weak to make a SUBSTITUTE!");
    }
}

SINGLE_BATTLE_TEST("Shed Tail's HP cost can trigger a berry before the user switches out")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_SITRUS_BERRY].battleUsage == EFFECT_ITEM_RESTORE_HP);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_SITRUS_BERRY); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SHED_TAIL); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SHED_TAIL, player);
        MESSAGE("Wobbuffet's Sitrus Berry restored health!");
        SEND_IN_MESSAGE("Wynaut");
    }
}

SINGLE_BATTLE_TEST("Shed Tail fails if there are no usable pokemon left")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET)
        PLAYER(SPECIES_WYNAUT) { HP(0); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SHED_TAIL); }
    } SCENE {
        MESSAGE("Wobbuffet used Shed Tail!");
        MESSAGE("But it failed!");
    }
}

SINGLE_BATTLE_TEST("Shed Tail's HP cost doesn't trigger effects that trigger on damage taken")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_AIR_BALLOON); }
        PLAYER(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_SHED_TAIL); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SHED_TAIL, player);
        MESSAGE("Wobbuffet shed its tail to create a decoy!");
        NOT MESSAGE("Wobbuffet's Air Balloon popped!");
    }
}

AI_SINGLE_BATTLE_TEST("AI will use Shed Tail to pivot to another mon while in damage stalemate with player")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); Ability(ABILITY_RUN_AWAY); Moves(MOVE_TACKLE, MOVE_CELEBRATE); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(50); Ability(ABILITY_RUN_AWAY); Moves(MOVE_CONFUSION, MOVE_SHED_TAIL); }
        OPPONENT(SPECIES_SCIZOR) { Speed(101); Moves(MOVE_CELEBRATE, MOVE_X_SCISSOR); }
    } WHEN {
        TURN { MOVE(player, MOVE_TACKLE); EXPECT_MOVE(opponent, MOVE_CONFUSION); }
        TURN { MOVE(player, MOVE_TACKLE); EXPECT_MOVE(opponent, MOVE_SHED_TAIL); }
    }
}
