#include "global.h"
#include "test/battle.h"

DOUBLE_BATTLE_TEST("Symbiosis transfers its item to an ally after it consumes an item")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_ROOM_SERVICE].holdEffect == HOLD_EFFECT_ROOM_SERVICE);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_ROOM_SERVICE); }
        PLAYER(SPECIES_ORANGURU) { Ability(ABILITY_SYMBIOSIS); Item(ITEM_TOXIC_ORB); }
        OPPONENT(SPECIES_KIRLIA);
        OPPONENT(SPECIES_SHUCKLE);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_TRICK_ROOM); }
    } SCENE {
        MESSAGE("The opposing Kirlia used Trick Room!");
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Using Room Service, the Speed of Wobbuffet fell!");
        // symbiosis triggers
        ABILITY_POPUP(playerRight, ABILITY_SYMBIOSIS);
        MESSAGE("Oranguru passed its Toxic Orb to Wobbuffet through Symbiosis!");
        // end of turn, wobb gets poisoned
        MESSAGE("Wobbuffet was badly poisoned!");
        STATUS_ICON(playerLeft, STATUS1_TOXIC_POISON);
    } THEN {
        EXPECT_EQ(playerLeft->item, ITEM_TOXIC_ORB);
        EXPECT_EQ(playerRight->item, ITEM_NONE);
    }
}


DOUBLE_BATTLE_TEST("Symbiosis triggers after partners berry eaten from bug bite")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_LIECHI_BERRY].holdEffect == HOLD_EFFECT_ATTACK_UP);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIECHI_BERRY); }
        PLAYER(SPECIES_ORANGURU) { Ability(ABILITY_SYMBIOSIS); Item(ITEM_TOXIC_ORB); }
        OPPONENT(SPECIES_STARAVIA);
        OPPONENT(SPECIES_SHUCKLE);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_BUG_BITE, target: playerLeft); }
    } SCENE {
        MESSAGE("The opposing Staravia used Bug Bite!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BUG_BITE, opponentLeft);
        HP_BAR(playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponentLeft);
        MESSAGE("Using Liechi Berry, the Attack of the opposing Staravia rose!");
        // symbiosis triggers
        ABILITY_POPUP(playerRight, ABILITY_SYMBIOSIS);
        MESSAGE("Oranguru passed its Toxic Orb to Wobbuffet through Symbiosis!");
        // end of turn, wobb gets poisoned
        MESSAGE("Wobbuffet was badly poisoned!");
        STATUS_ICON(playerLeft, STATUS1_TOXIC_POISON);
    } THEN {
        EXPECT_EQ(playerLeft->item, ITEM_TOXIC_ORB);
        EXPECT_EQ(playerRight->item, ITEM_NONE);
    }
}

DOUBLE_BATTLE_TEST("Symbiosis triggers after partner bestows its item")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); Item(ITEM_FLAME_ORB); }
        PLAYER(SPECIES_ORANGURU) { Speed(75); Ability(ABILITY_SYMBIOSIS); Item(ITEM_TOXIC_ORB); }
        OPPONENT(SPECIES_STARAVIA) { Speed(50); }
        OPPONENT(SPECIES_SHUCKLE) { Speed(25); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_BESTOW, target: opponentLeft); }
    } SCENE {
        MESSAGE("Wobbuffet used Bestow!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_BESTOW, playerLeft);
        MESSAGE("The opposing Staravia received Flame Orb from Wobbuffet!");
        // symbiosis triggers
        ABILITY_POPUP(playerRight, ABILITY_SYMBIOSIS);
        MESSAGE("Oranguru passed its Toxic Orb to Wobbuffet through Symbiosis!");
        // end of turn, wobb gets poisoned
        MESSAGE("Wobbuffet was badly poisoned!");
        STATUS_ICON(playerLeft, STATUS1_TOXIC_POISON);
        // staravia gets burned
        MESSAGE("The opposing Staravia was burned!");
        STATUS_ICON(opponentLeft, STATUS1_BURN);
    } THEN {
        EXPECT_EQ(playerLeft->item, ITEM_TOXIC_ORB);
        EXPECT_EQ(playerRight->item, ITEM_NONE);
        EXPECT_EQ(opponentLeft->item, ITEM_FLAME_ORB);
    }
}

DOUBLE_BATTLE_TEST("Symbiosis triggers after partner flings its item")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); Item(ITEM_FLAME_ORB); }
        PLAYER(SPECIES_ORANGURU) { Speed(75); Ability(ABILITY_SYMBIOSIS); Item(ITEM_TOXIC_ORB); }
        OPPONENT(SPECIES_STARAVIA) { Speed(50); }
        OPPONENT(SPECIES_SHUCKLE) { Speed(25); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_FLING, target: opponentLeft); }
    } SCENE {
        MESSAGE("Wobbuffet used Fling!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FLING, playerLeft);
        MESSAGE("The opposing Staravia was burned!");
        STATUS_ICON(opponentLeft, STATUS1_BURN);
        // symbiosis triggers
        ABILITY_POPUP(playerRight, ABILITY_SYMBIOSIS);
        MESSAGE("Oranguru passed its Toxic Orb to Wobbuffet through Symbiosis!");
        // end of turn, wobb gets poisoned
        MESSAGE("Wobbuffet was badly poisoned!");
        STATUS_ICON(playerLeft, STATUS1_TOXIC_POISON);
    } THEN {
        EXPECT_EQ(playerLeft->item, ITEM_TOXIC_ORB);
        EXPECT_EQ(playerRight->item, ITEM_NONE);
    }
}

DOUBLE_BATTLE_TEST("Symbiosis transfers its item to an ally after it consumes a weakness berry")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_CHILAN_BERRY].holdEffect == HOLD_EFFECT_RESIST_BERRY);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_CHILAN_BERRY); }
        PLAYER(SPECIES_ORANGURU) { Ability(ABILITY_SYMBIOSIS); Item(ITEM_TOXIC_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_TACKLE, target: playerLeft); }
    } SCENE {
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_TACKLE, opponentLeft);
        ABILITY_POPUP(playerRight, ABILITY_SYMBIOSIS);
        STATUS_ICON(playerLeft, STATUS1_TOXIC_POISON);
    } THEN {
        EXPECT_EQ(playerLeft->item, ITEM_TOXIC_ORB);
        EXPECT_EQ(playerRight->item, ITEM_NONE);
    }
}
