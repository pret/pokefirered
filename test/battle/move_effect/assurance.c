#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_ASSURANCE) == EFFECT_ASSURANCE);
}

DOUBLE_BATTLE_TEST("Assurance doubles in power if False Swipe connected but didn't do any damage")
{
    s16 hits[2];

    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { HP(1); }
        PLAYER(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_ASSURANCE, target: playerRight); }
        TURN {
            MOVE(opponentLeft, MOVE_FALSE_SWIPE, target: playerLeft);
            MOVE(playerLeft, MOVE_RECOVER);
            MOVE(opponentRight, MOVE_ASSURANCE, target: playerLeft);
        }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ASSURANCE, opponentLeft);
        HP_BAR(playerRight, captureDamage: &hits[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_FALSE_SWIPE, opponentLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ASSURANCE, opponentRight);
        HP_BAR(playerLeft, captureDamage: &hits[1]);
    } THEN {
        EXPECT_MUL_EQ(hits[0], Q_4_12(2.0), hits[1]);
    }
}

SINGLE_BATTLE_TEST("Assurance doubles in power if the target has been damaged in the same turn - Life Orb")
{
    s16 hits[2];

    GIVEN {
        ASSUME(gItemsInfo[ITEM_LIFE_ORB].holdEffect == HOLD_EFFECT_LIFE_ORB);
        PLAYER(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
        OPPONENT(SPECIES_WOBBUFFET);
    } WHEN {
        TURN { MOVE(player, MOVE_CELEBRATE); MOVE(opponent, MOVE_ASSURANCE); }
        TURN { MOVE(player, MOVE_POUND); MOVE(opponent, MOVE_ASSURANCE); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_ASSURANCE, opponent);
        HP_BAR(player, captureDamage: &hits[0]);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_POUND, player);
        MESSAGE("Wobbuffet was hurt by the Life Orb!");
        HP_BAR(player, captureDamage: &hits[1]);
    } THEN {
        EXPECT_MUL_EQ(hits[0], Q_4_12(2.0), hits[1]);
    }
}

TO_DO_BATTLE_TEST("Assurance doubles in power if the target has been damaged in the same turn - Recoil");
TO_DO_BATTLE_TEST("Assurance doubles in power if the target has been damaged in the same turn - Crash");
TO_DO_BATTLE_TEST("Assurance doubles in power if the target has been damaged in the same turn - Confusion");
TO_DO_BATTLE_TEST("Assurance doubles in power if the target has been damaged in the same turn - Rocky Helmet");

