#include "global.h"
#include "test/battle.h"

SINGLE_BATTLE_TEST("Magician gets self-damage recoil after stealing Life Orb")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_LIFE_ORB].holdEffect == HOLD_EFFECT_LIFE_ORB);
        ASSUME(GetMoveCategory(MOVE_SCRATCH) != DAMAGE_CATEGORY_STATUS);
        PLAYER(SPECIES_DELPHOX) { Ability(ABILITY_MAGICIAN); Item(ITEM_NONE); }
        OPPONENT(SPECIES_WOBBUFFET) { Item(ITEM_LIFE_ORB); }
    } WHEN {
        TURN { MOVE(player, MOVE_SCRATCH); }
        TURN { MOVE(player, MOVE_SCRATCH); }
    } SCENE {
        // 1st turn
        MESSAGE("Delphox used Scratch!");
        ABILITY_POPUP(player, ABILITY_MAGICIAN);
        MESSAGE("Delphox stole the opposing Wobbuffet's Life Orb!");
        HP_BAR(player);
        MESSAGE("Delphox was hurt by the Life Orb!");
        // 2nd turn - Life Orb recoil happens now
        MESSAGE("Delphox used Scratch!");
        HP_BAR(player);
        MESSAGE("Delphox was hurt by the Life Orb!");
    }
}

DOUBLE_BATTLE_TEST("Magician steal the item from the fastest possible target")
{
    u32 playerRightSpeed = 0;
    u32 opponentLeftSpeed = 0;
    u32 opponentRightSpeed = 0;

    PARAMETRIZE { playerRightSpeed = 4; opponentLeftSpeed = 2; opponentRightSpeed = 3; }
    PARAMETRIZE { playerRightSpeed = 3; opponentLeftSpeed = 4; opponentRightSpeed = 2; }
    PARAMETRIZE { playerRightSpeed = 2; opponentLeftSpeed = 3; opponentRightSpeed = 4; }

    GIVEN {
        PLAYER(SPECIES_DELPHOX) { Speed(1); Ability(ABILITY_MAGICIAN); Item(ITEM_NONE); }
        PLAYER(SPECIES_WOBBUFFET) { Speed(playerRightSpeed); Item(ITEM_POKE_BALL); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(opponentLeftSpeed); Item(ITEM_GREAT_BALL); }
        OPPONENT(SPECIES_WOBBUFFET) { Speed(opponentRightSpeed); Item(ITEM_ULTRA_BALL); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_SURF); }
    } SCENE {
        ABILITY_POPUP(playerLeft, ABILITY_MAGICIAN);
    } THEN {
        if (playerRightSpeed == 4)
            EXPECT(playerLeft->item == ITEM_POKE_BALL);
        else if (opponentLeftSpeed == 4)
            EXPECT(playerLeft->item == ITEM_GREAT_BALL);
        else if (playerRightSpeed == 4)
            EXPECT(playerLeft->item == ITEM_ULTRA_BALL);
    }
}
