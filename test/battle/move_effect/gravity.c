#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_GRAVITY) == EFFECT_GRAVITY);
}

DOUBLE_BATTLE_TEST("Gravity cancels fly and sky drop if they are in the air")
{
    u8 visibility;
    GIVEN {
        PLAYER(SPECIES_WOBBUFFET) { Speed(100); }
        PLAYER(SPECIES_WYNAUT) { Speed(90); }
        OPPONENT(SPECIES_PIDGEY) { Speed(50); }
        OPPONENT(SPECIES_ROOKIDEE) { Speed(45); }
    } WHEN {
        TURN { MOVE(opponentLeft, MOVE_SKY_DROP, target: playerRight); MOVE(opponentRight, MOVE_FLY, target: playerLeft); }
        TURN { MOVE(playerLeft, MOVE_GRAVITY); SKIP_TURN(opponentRight); SKIP_TURN(opponentLeft); }
    } SCENE {
        // turn 1
        MESSAGE("The opposing Pidgey used Sky Drop!");
        MESSAGE("The opposing Pidgey took Wynaut into the sky!");
        ANIMATION(ANIM_TYPE_MOVE, MOVE_SKY_DROP, opponentLeft);
        MESSAGE("The opposing Rookidee used Fly!");
        MESSAGE("The opposing Rookidee flew up high!");
        // turn 2
        MESSAGE("Wobbuffet used Gravity!");
        MESSAGE("Gravity intensified!");
        MESSAGE("The opposing Pidgey fell from the sky due to the gravity!");
        MESSAGE("The opposing Rookidee fell from the sky due to the gravity!");
        MESSAGE("The opposing Pidgey can't use Sky Drop because of gravity!");
        MESSAGE("The opposing Rookidee can't use Fly because of gravity!");
    } THEN {
        // all battlers should be visible. assign to var first because expect_eq not working with bitfield address
        visibility = gBattleSpritesDataPtr->battlerData[0].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[1].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[2].invisible;
        EXPECT_EQ(visibility, 0);
        visibility = gBattleSpritesDataPtr->battlerData[3].invisible;
        EXPECT_EQ(visibility, 0);
        // ensure moveend properly recorded
        EXPECT_EQ(gLastMoves[0], MOVE_GRAVITY);
    }
}
