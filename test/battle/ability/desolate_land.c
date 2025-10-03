#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(!IsBattleMoveStatus(MOVE_WATER_GUN));
    ASSUME(GetMoveType(MOVE_WATER_GUN) == TYPE_WATER);
}

SINGLE_BATTLE_TEST("Desolate Land blocks damaging Water-type moves")
{
    GIVEN {
        PLAYER(SPECIES_GROUDON) {Item(ITEM_RED_ORB);}
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_WATER_GUN); }
        TURN { MOVE(opponent, MOVE_WATER_GUN); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Water Gun!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, opponent);
        MESSAGE("The Water-type attack evaporated in the extremely harsh sunlight!");
        NOT HP_BAR(player);
        MESSAGE("The opposing Wobbuffet used Water Gun!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_WATER_GUN, opponent);
        MESSAGE("The Water-type attack evaporated in the extremely harsh sunlight!");
        NOT HP_BAR(player);
    } THEN {
        EXPECT_EQ(player->hp, player->maxHP);
    }
}

DOUBLE_BATTLE_TEST("Desolate Land blocks damaging Water-type moves and prints the message only once with moves hitting multiple targets")
{
    GIVEN {
        ASSUME(!IsBattleMoveStatus(MOVE_SURF));
        ASSUME(GetMoveType(MOVE_SURF) == TYPE_WATER);
        ASSUME(GetMoveTarget(MOVE_SURF) == MOVE_TARGET_FOES_AND_ALLY);
        PLAYER(SPECIES_GROUDON) {Item(ITEM_RED_ORB); {Speed(5);}}
        PLAYER(SPECIES_WOBBUFFET) {Speed(5);}
        OPPONENT(SPECIES_WOBBUFFET) {Speed(10);}
        OPPONENT(SPECIES_WOBBUFFET) {Speed(8);}
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SURF); }
    } SCENE {
        MESSAGE("The opposing Wobbuffet used Surf!");
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_SURF, opponentLeft);
        MESSAGE("The Water-type attack evaporated in the extremely harsh sunlight!");
        NOT MESSAGE("The Water-type attack evaporated in the extremely harsh sunlight!");
    } THEN {
        EXPECT_EQ(playerLeft->hp, playerLeft->maxHP);
        EXPECT_EQ(playerRight->hp, playerRight->maxHP);
        EXPECT_EQ(opponentRight->hp, opponentRight->maxHP);
    }
}

SINGLE_BATTLE_TEST("Desolate Land does not block a move if Pokémon is asleep and uses a Water-type move") // Sleep/confusion/paralysis all happen before the check for primal weather
{
    GIVEN {
        PLAYER(SPECIES_GROUDON) {Item(ITEM_RED_ORB);}
        OPPONENT(SPECIES_WOBBUFFET) {Status1(STATUS1_SLEEP);}
    } WHEN {
        TURN { MOVE(opponent, MOVE_WATER_GUN); }
    } SCENE {
        NOT MESSAGE("The Water-type attack evaporated in the extremely harsh sunlight!");
        MESSAGE("The opposing Wobbuffet is fast asleep.");
    }
}

SINGLE_BATTLE_TEST("Desolate Land will not create a softlock when move in semi invulnerable position is blocked")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_GROUDON) { Item(ITEM_RED_ORB); }
    } WHEN {
        TURN { MOVE(player, MOVE_DIVE); }
        TURN { SWITCH(opponent, 1); SKIP_TURN(player); }
        TURN { MOVE(player, MOVE_CELEBRATE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_DIVE, player);
        ABILITY_POPUP(opponent, ABILITY_DESOLATE_LAND);
        NOT ANIMATION(ANIM_TYPE_MOVE, MOVE_DIVE, player);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_CELEBRATE, player);
    }
}

SINGLE_BATTLE_TEST("Desolate Land is removed immediately if user faints")
{
    GIVEN {
        PLAYER(SPECIES_GROUDON) { HP(1); Item(ITEM_RED_ORB); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponent, MOVE_POUND); SEND_OUT(player, 1); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, opponent);
        NOT MESSAGE("The sunlight is strong.");
        MESSAGE("The extremely harsh sunlight faded!");
    }
}
