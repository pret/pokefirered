#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Mirror Armor lowers a stat of the attacking pokemon")
{
    u16 move, statId;

    PARAMETRIZE { move = MOVE_LEER; statId = STAT_DEF; }
    PARAMETRIZE { move = MOVE_GROWL; statId = STAT_ATK; }
    PARAMETRIZE { move = MOVE_SWEET_SCENT; statId = STAT_EVASION; }
    PARAMETRIZE { move = MOVE_SAND_ATTACK; statId = STAT_ACC; }
    PARAMETRIZE { move = MOVE_CONFIDE; statId = STAT_SPATK; }
    PARAMETRIZE { move = MOVE_FAKE_TEARS; statId = STAT_SPDEF; }

    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) {Ability(ABILITY_MIRROR_ARMOR);}
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, move); }
    } SCENE {
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        switch (statId)
        {
        case STAT_DEF:
            MESSAGE("The opposing Wynaut's Defense fell!");
            break;
        case STAT_ATK:
            MESSAGE("The opposing Wynaut's Attack fell!");
            break;
        case STAT_EVASION:
            MESSAGE("The opposing Wynaut's evasiveness harshly fell!");
            break;
        case STAT_ACC:
            MESSAGE("The opposing Wynaut's accuracy fell!");
            break;
        case STAT_SPATK:
            MESSAGE("The opposing Wynaut's Sp. Atk fell!");
            break;
        case STAT_SPDEF:
            MESSAGE("The opposing Wynaut's Sp. Def harshly fell!");
            break;
        }
    } THEN {
        EXPECT_EQ(player->statStages[statId], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[statId], (statId == STAT_SPDEF || statId == STAT_EVASION) ? DEFAULT_STAT_STAGE - 2 : DEFAULT_STAT_STAGE - 1);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor triggers even if the attacking Pokemon also has Mirror Armor ability")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
        OPPONENT(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_LEER); }
    } SCENE {
        MESSAGE("The opposing Corviknight used Leer!");
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Corviknight's Defense fell!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_DEF], DEFAULT_STAT_STAGE - 1);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor doesn't lower the stats of an attacking Pokemon with the Clear Body ability")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
        OPPONENT(SPECIES_WYNAUT) { Ability(ABILITY_CLEAR_BODY); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_LEER); }
    } SCENE {
        MESSAGE("The opposing Wynaut used Leer!");
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        ABILITY_POPUP(opponent, ABILITY_CLEAR_BODY);
        MESSAGE("The opposing Wynaut's Clear Body prevents stat loss!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor lowers the Attack of Pokemon with Intimidate")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
        OPPONENT(SPECIES_GYARADOS) { Ability(ABILITY_INTIMIDATE); }
    } WHEN {
        TURN {}
    } SCENE {
        ABILITY_POPUP(opponent, ABILITY_INTIMIDATE);
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Gyarados's Attack fell!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_ATK], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_ATK], DEFAULT_STAT_STAGE - 1);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor doesn't lower the stats of an attacking Pokemon behind Substitute")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(opponent, MOVE_SUBSTITUTE); }
        TURN { MOVE(opponent, MOVE_LEER); }
    } SCENE {
        MESSAGE("The opposing Wynaut used Substitute!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SUBSTITUTE, opponent);
        MESSAGE("The opposing Wynaut used Leer!");
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
    } THEN {
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor raises the stat of an attacking Pokemon with Contrary")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) {Ability(ABILITY_MIRROR_ARMOR);}
        OPPONENT(SPECIES_SHUCKLE) {Ability(ABILITY_CONTRARY);}
    } WHEN {
        TURN { MOVE(opponent, MOVE_LEER); }
    } SCENE {
        MESSAGE("The opposing Shuckle used Leer!");
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Shuckle's Defense rose!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_DEF], DEFAULT_STAT_STAGE + 1);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor doesn't lower the stat of the attacking Pokemon if it is already at -6")
{
    GIVEN {
        PLAYER(SPECIES_CORVIKNIGHT) {Ability(ABILITY_MIRROR_ARMOR);}
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(player, MOVE_SCREECH); }
        TURN { MOVE(player, MOVE_SCREECH); }
        TURN { MOVE(player, MOVE_SCREECH); }
        TURN { MOVE(opponent, MOVE_LEER); }
    } SCENE {
        MESSAGE("Corviknight used Screech!");
        MESSAGE("Corviknight used Screech!");
        MESSAGE("Corviknight used Screech!");
        MESSAGE("The opposing Wynaut used Leer!");
        ABILITY_POPUP(player, ABILITY_MIRROR_ARMOR);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        MESSAGE("The opposing Wynaut's Defense won't go any lower!");
    } THEN {
        EXPECT_EQ(player->statStages[STAT_DEF], DEFAULT_STAT_STAGE);
        EXPECT_EQ(opponent->statStages[STAT_DEF], MIN_STAT_STAGE);
    }
}

// This behaviour needs to be verified in the actual games. Currently it's written to follow Showdown's logic.
DOUBLE_BATTLE_TEST("Mirror Armor lowers Speed of the partner Pokemon after Court Change was used by the opponent after it set up Sticky Web")
{
    KNOWN_FAILING;
    GIVEN {
        ASSUME(GetMoveEffect(MOVE_STICKY_WEB) == EFFECT_STICKY_WEB);
        ASSUME(GetMoveEffect(MOVE_COURT_CHANGE) == EFFECT_COURT_CHANGE);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_WOBBUFFET);
        PLAYER(SPECIES_CORVIKNIGHT) {Ability(ABILITY_MIRROR_ARMOR); Item(ITEM_IRON_BALL); }
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WYNAUT);
        OPPONENT(SPECIES_WYNAUT);
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_STICKY_WEB); }
        TURN { MOVE(opponentLeft, MOVE_COURT_CHANGE); }
        TURN { SWITCH(playerRight, 2);}
        TURN { }
    } SCENE {
        MESSAGE("Wobbuffet used Sticky Web!");
        MESSAGE("The opposing Wynaut used Court Change!");
        MESSAGE("The opposing Wynaut swapped the battle effects affecting each side of the field!");
        SEND_IN_MESSAGE("Corviknight");
        MESSAGE("Corviknight was caught in a sticky web!");
        ABILITY_POPUP(playerRight, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, playerLeft);
        MESSAGE("Wobbuffet's Speed fell!");
    }
}

SINGLE_BATTLE_TEST("Mirror Armor reflects Tangling Hair speed drop")
{
    GIVEN {
        PLAYER(SPECIES_DUGTRIO) { Ability(ABILITY_TANGLING_HAIR); }
        OPPONENT(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
    } WHEN {
        TURN { MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SCRATCH, opponent);
        ABILITY_POPUP(player, ABILITY_TANGLING_HAIR);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        ABILITY_POPUP(opponent, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    }
}

SINGLE_BATTLE_TEST("Mirror Armor reflects Obstruct defense drop")
{
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_CORVIKNIGHT) { Ability(ABILITY_MIRROR_ARMOR); }
    } WHEN {
        TURN { MOVE(player, MOVE_OBSTRUCT); MOVE(opponent, MOVE_SCRATCH); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_OBSTRUCT, player);
        NOT ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, opponent);
        ABILITY_POPUP(opponent, ABILITY_MIRROR_ARMOR);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_STATS_CHANGE, player);
    }
}
